# Interface segregation principle

*Principe de ségrégation des interfaces* — le **I** de l'acronyme **SOLID**.

## Définition

> Aucun client ne devrait être contraint de dépendre de méthodes qu'il n'utilise pas.

*(Citation originale : « Clients should not be forced to depend upon interfaces that they do not use. »)*

- **Créateur** : Robert C. Martin (« Uncle Bob »).
- **Date d'apparition** : vers 1996, formulé lors d'une mission de conseil chez **Xerox** sur le logiciel de leur nouveau système d'imprimante : une unique classe `Job` gigantesque servait tous les clients (impression, agrafage, télécopie…), et la moindre modification imposait de tout recompiler et redéployer. Le principe a été publié dans ses articles sur les principes de conception, puis dans *Agile Software Development, Principles, Patterns, and Practices* (2002). L'acronyme SOLID a été proposé par Michael Feathers vers 2004.

Il vaut mieux **plusieurs interfaces petites et spécifiques à un rôle** (*role interfaces*) qu'une seule interface généraliste et obèse (*fat interface*).

## Objectif

- **Éviter les implémentations vides** ou les `throw new UnsupportedOperationException()` (ce qui viole du même coup Liskov).
- **Réduire le couplage** : un client ne doit être impacté que par les changements qui le concernent réellement.
- **Limiter les recompilations et redéploiements en cascade** — le problème d'origine chez Xerox.
- **Clarifier les contrats** : le nom de l'interface décrit un rôle précis, pas un fourre-tout.
- **Faciliter les tests** : un bouchon (*mock*) d'une petite interface se crée en quelques lignes.

## Exemple (ce qu'il faut faire)

Des interfaces découpées par **rôle**. Chaque classe n'implémente que ce qu'elle sait réellement faire, chaque client ne dépend que de ce dont il a besoin.

```java
public interface Workable {

    void work();
}
```

```java
public interface Eatable {

    void eat();
}
```

```java
public interface Sleepable {

    void sleep();
}
```

```java
public class HumanWorker implements Workable, Eatable, Sleepable {

    @Override
    public void work() {
        System.out.println("Je travaille");
    }

    @Override
    public void eat() {
        System.out.println("Je déjeune");
    }

    @Override
    public void sleep() {
        System.out.println("Je dors");
    }
}
```

```java
// Le robot n'implémente QUE ce qu'il sait faire : aucune méthode vide
public class RobotWorker implements Workable {

    @Override
    public void work() {
        System.out.println("Je travaille");
    }
}
```

```java
// Ce client ne dépend QUE du rôle dont il a besoin
public class ProductionLine {

    public void run(List<Workable> workers) {
        workers.forEach(Workable::work);
    }
}
```

```java
public class Client {

    public static void main(String[] args) {

        ProductionLine line = new ProductionLine();
        line.run(List.of(new HumanWorker(), new RobotWorker()));
    }
}
```

Ajouter une méthode à `Eatable` n'impacte ni `RobotWorker`, ni `ProductionLine` : ils n'en dépendent pas.

## Contre exemple (ce qu'il ne faut pas faire)

Une interface obèse (*fat interface*) que tous les implémentants doivent subir intégralement.

```java
public interface Worker {

    void work();
    void eat();
    void sleep();
    void takeVacation();
}
```

```java
public class HumanWorker implements Worker {

    @Override
    public void work() {
        System.out.println("Je travaille");
    }

    @Override
    public void eat() {
        System.out.println("Je déjeune");
    }

    @Override
    public void sleep() {
        System.out.println("Je dors");
    }

    @Override
    public void takeVacation() {
        System.out.println("Je pars en congés");
    }
}
```

```java
public class RobotWorker implements Worker {

    @Override
    public void work() {
        System.out.println("Je travaille");
    }

    // Un robot ne mange pas : implémentation vide, mensonge sur le contrat
    @Override
    public void eat() {
        // rien à faire...
    }

    // Un robot ne dort pas
    @Override
    public void sleep() {
        // rien à faire...
    }

    // Un robot ne prend pas de congés : le contrat est ouvertement cassé
    @Override
    public void takeVacation() {
        throw new UnsupportedOperationException("Un robot ne prend pas de congés");
    }
}
```

Les problèmes :
- `RobotWorker` est **forcé de dépendre de méthodes qu'il n'utilise pas** : implémentations vides ou exceptions.
- Le corps vide est un **mensonge** : le client croit avoir déclenché une action, il ne s'est rien passé.
- L'`UnsupportedOperationException` **viole Liskov** : `RobotWorker` n'est plus substituable à `Worker`.
- Ajouter une méthode `receiveSalary()` à `Worker` oblige à **modifier et recompiler tous les implémentants**, y compris ceux que ça ne concerne pas.
- Un client qui n'a besoin que de `work()` traîne malgré tout une dépendance vers `eat()`, `sleep()` et `takeVacation()`.
