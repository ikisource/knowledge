# Dependency inversion principle

*Principe d'inversion des dépendances* — le **D** de l'acronyme **SOLID**.

## Définition

> A. Les modules de haut niveau ne doivent pas dépendre des modules de bas niveau. Les deux doivent dépendre d'abstractions.
> B. Les abstractions ne doivent pas dépendre des détails. Les détails doivent dépendre des abstractions.

*(Citation originale : « High-level modules should not depend on low-level modules. Both should depend on abstractions. Abstractions should not depend on details. Details should depend on abstractions. »)*

- **Créateur** : Robert C. Martin (« Uncle Bob »).
- **Date d'apparition** : 1996, dans l'article *The Dependency Inversion Principle* publié dans le *C++ Report*. Repris dans *Agile Software Development, Principles, Patterns, and Practices* (2002). L'acronyme SOLID a été proposé par Michael Feathers vers 2004.

**Ce qui est « inversé »** : dans une conception classique, le flux de dépendance suit le flux d'exécution (le métier appelle la base, donc le métier dépend de la base). Avec ce principe, on **inverse la dépendance** : l'abstraction (l'interface) appartient au **module de haut niveau**, et c'est le module de bas niveau (le détail technique) qui l'implémente. La flèche de dépendance pointe désormais **vers le métier**.

À ne pas confondre :
- **Inversion des dépendances** : le principe de conception (dépendre d'abstractions).
- **Inversion de contrôle** (*Inversion of Control*, IoC) : le schéma général où c'est le cadriciel (*framework*) qui appelle votre code.
- **Injection de dépendances** (*Dependency Injection*, DI) : la technique concrète (par constructeur, par accesseur…) qui permet d'appliquer le principe.

C'est le principe fondateur des architectures **hexagonale**, **en oignon** et **Clean Architecture**.

## Objectif

- **Protéger le métier des choix techniques** : changer de base de données, de broker ou de framework ne doit pas toucher aux règles métier.
- **Rendre le code testable** : on injecte un bouchon (*mock*, *fake*) à la place de l'infrastructure réelle, sans base ni réseau.
- **Retarder les décisions techniques** : le métier se développe avant même de savoir quelle base sera utilisée.
- **Découpler les modules** et permettre leur remplacement ou leur réutilisation indépendante.
- **Faire pointer les dépendances vers le stable** : le métier change lentement, la technique change vite ; c'est donc la technique qui doit dépendre du métier, pas l'inverse.

## Exemple (ce qu'il faut faire)

L'abstraction `OrderRepository` est **définie par le métier** (haut niveau) et **implémentée par la technique** (bas niveau). La dépendance est inversée.

```java
// Module de HAUT NIVEAU : il définit le contrat dont IL a besoin
public interface OrderRepository {

    void save(Order order);
}
```

```java
// Module de HAUT NIVEAU : la règle métier, sans aucune dépendance technique
public class OrderService {

    private final OrderRepository repository;
    private final Notifier notifier;

    // Injection par constructeur : les dépendances sont fournies de l'extérieur
    public OrderService(OrderRepository repository, Notifier notifier) {
        this.repository = repository;
        this.notifier = notifier;
    }

    public void placeOrder(Order order) {

        order.validate();
        repository.save(order);
        notifier.notify(order);
    }
}
```

```java
// Module de BAS NIVEAU : le DÉTAIL dépend de l'ABSTRACTION
public class PostgresOrderRepository implements OrderRepository {

    @Override
    public void save(Order order) {
        // INSERT INTO orders ...
    }
}
```

```java
public interface Notifier {

    void notify(Order order);
}
```

```java
// Autre DÉTAIL, autre implémentation
public class EmailNotifier implements Notifier {

    @Override
    public void notify(Order order) {
        // SMTP ...
    }
}
```

```java
// Le câblage se fait au point d'entrée (ou par un conteneur d'injection)
public class Application {

    public static void main(String[] args) {

        OrderRepository repository = new PostgresOrderRepository();
        Notifier notifier = new EmailNotifier();

        OrderService service = new OrderService(repository, notifier);
        service.placeOrder(new Order());
    }
}
```

Le test devient trivial, sans base ni serveur SMTP :

```java
public class OrderServiceTest {

    @Test
    public void should_save_the_order() {

        InMemoryOrderRepository repository = new InMemoryOrderRepository();
        FakeNotifier notifier = new FakeNotifier();

        new OrderService(repository, notifier).placeOrder(new Order());

        assertThat(repository.count()).isEqualTo(1);
    }
}
```

Passer de PostgreSQL à MongoDB, ou de l'e-mail au SMS : on **ajoute une implémentation**, `OrderService` n'est pas touché.

## Contre exemple (ce qu'il ne faut pas faire)

Le module de haut niveau instancie lui-même ses dépendances de bas niveau : la flèche de dépendance pointe du métier vers la technique.

```java
public class OrderService {

    // Le métier dépend d'un DÉTAIL technique concret
    private final PostgresOrderRepository repository = new PostgresOrderRepository();
    private final EmailNotifier notifier = new EmailNotifier();

    public void placeOrder(Order order) {

        order.validate();
        repository.save(order);   // couplage direct à PostgreSQL
        notifier.notify(order);   // couplage direct à SMTP
    }
}
```

```java
public class PostgresOrderRepository {

    public void save(Order order) {
        // Connexion JDBC en dur, INSERT INTO orders ...
    }
}
```

Les problèmes :
- **Impossible à tester unitairement** : instancier `OrderService` ouvre une connexion PostgreSQL et un canal SMTP. Il faut une base et un serveur de mail pour tester une simple règle métier.
- **Changer de technologie impose de modifier le métier** : passer à MongoDB, c'est rouvrir `OrderService`, qui n'a pourtant rien à voir avec le stockage.
- **Le `new` en dur** interdit toute substitution : aucun bouchon, aucune implémentation alternative.
- **La règle métier est polluée** par les préoccupations d'infrastructure : elle n'est plus réutilisable dans un autre contexte (batch, API, ligne de commande).
- Le métier, qui devrait être la partie la plus **stable** du système, dépend de la partie la plus **instable**.
