# Liskov substitution principle

*Principe de substitution de Liskov* — le **L** de l'acronyme **SOLID**.

## Définition

> Si S est un sous-type de T, alors tout objet de type T doit pouvoir être remplacé par un objet de type S sans altérer le comportement attendu du programme.

*(Citation originale : « If S is a subtype of T, then objects of type T may be replaced with objects of type S without altering any of the desirable properties of the program. »)*

- **Créatrice** : Barbara Liskov.
- **Date d'apparition** : 1987, lors de sa conférence *Data Abstraction and Hierarchy* (OOPSLA). Le principe a été formalisé avec Jeannette Wing en 1994 dans l'article *A Behavioral Notion of Subtyping*. Il a ensuite été intégré à l'acronyme SOLID par Michael Feathers (vers 2004) à partir des travaux de Robert C. Martin.

Autrement dit : un sous-type doit respecter le **contrat** de son type parent, pas seulement sa signature. Concrètement, une sous-classe :
- ne doit **pas renforcer les préconditions** (elle ne peut pas exiger plus que le parent) ;
- ne doit **pas affaiblir les postconditions** (elle doit garantir au moins autant que le parent) ;
- doit **préserver les invariants** du parent ;
- ne doit **pas lever de nouvelles exceptions** imprévues par le parent.

Le compilateur vérifie la syntaxe de l'héritage ; **seul le développeur peut vérifier la sémantique**.

## Objectif

- **Garantir la fiabilité du polymorphisme** : le code client peut manipuler une abstraction sans jamais avoir à connaître le type réel.
- **Éliminer les `instanceof` et les tests de type** dans le code client, qui sont le symptôme d'une hiérarchie cassée.
- **Rendre l'Open/Closed applicable** : sans substituabilité fiable, on ne peut pas étendre par ajout d'implémentations.
- **Éviter les surprises à l'exécution** (comportement inattendu, `UnsupportedOperationException`).
- **Assurer la réutilisabilité des tests** : les tests écrits contre le type parent doivent passer pour tous ses sous-types.

## Exemple (ce qu'il faut faire)

On modélise ce que les formes **font** réellement, sans forcer une relation d'héritage que le comportement ne supporte pas. Le rectangle et le carré sont immuables et partagent une abstraction honnête.

```java
public interface Shape {

    Integer area();
}
```

```java
public class Rectangle implements Shape {

    private final Integer width;
    private final Integer height;

    public Rectangle(Integer width, Integer height) {
        this.width = width;
        this.height = height;
    }

    @Override
    public Integer area() {
        return width * height;
    }
}
```

```java
public class Square implements Shape {

    private final Integer side;

    public Square(Integer side) {
        this.side = side;
    }

    @Override
    public Integer area() {
        return side * side;
    }
}
```

```java
// Le client fonctionne avec N'IMPORTE QUEL Shape, sans jamais tester le type réel
public class Client {

    public static void print(Shape shape) {
        System.out.println("Area = " + shape.area());
    }

    public static void main(String[] args) {

        print(new Rectangle(5, 4)); // Area = 20
        print(new Square(5));       // Area = 25
    }
}
```

Le contrat de `Shape` (« je sais calculer mon aire ») est honoré à l'identique par tous les sous-types : ils sont **substituables**.

## Contre exemple (ce qu'il ne faut pas faire)

Le cas d'école : « un carré **est un** rectangle » est vrai en géométrie, mais **faux en objet**, car un carré ne peut pas respecter le contrat comportemental d'un rectangle mutable.

```java
public class Rectangle {

    protected Integer width;
    protected Integer height;

    public void setWidth(Integer width) {
        this.width = width;
    }

    public void setHeight(Integer height) {
        this.height = height;
    }

    public Integer area() {
        return width * height;
    }
}
```

```java
public class Square extends Rectangle {

    // Le carré doit préserver son invariant : width == height
    // ... et pour cela il CASSE la postcondition de Rectangle
    @Override
    public void setWidth(Integer width) {
        this.width = width;
        this.height = width; // effet de bord non prévu par le contrat du parent
    }

    @Override
    public void setHeight(Integer height) {
        this.width = height; // effet de bord non prévu par le contrat du parent
        this.height = height;
    }
}
```

```java
public class Client {

    // Ce test passe pour Rectangle, mais ÉCHOUE pour Square
    public static void resizeAndCheck(Rectangle rectangle) {

        rectangle.setWidth(5);
        rectangle.setHeight(4);

        // Postcondition légitime du contrat de Rectangle : l'aire vaut 20
        assert rectangle.area() == 20 : "Aire attendue 20, obtenue " + rectangle.area();
    }

    public static void main(String[] args) {

        resizeAndCheck(new Rectangle()); // OK   : 5 * 4 = 20
        resizeAndCheck(new Square());    // ÉCHEC : 4 * 4 = 16
    }
}
```

Les problèmes :
- `Square` n'est **pas substituable** à `Rectangle` : le code client qui fonctionnait se met à produire un résultat faux.
- Le client est poussé à écrire des `if (rectangle instanceof Square)`, ce qui viole du même coup l'Open/Closed.
- Autre symptôme fréquent de violation : une sous-classe qui neutralise une méthode héritée.

```java
public class ReadOnlyList extends ArrayList<String> {

    @Override
    public boolean add(String element) {
        throw new UnsupportedOperationException("Liste en lecture seule");
    }
}
```

Ici la sous-classe **retire** une capacité promise par le parent : tout code qui reçoit une `List` et appelle `add()` plante à l'exécution.
