# Open/closed principle

*Principe ouvert/fermé* — le **O** de l'acronyme **SOLID**.

## Définition

> Les entités logicielles (classes, modules, fonctions) doivent être ouvertes à l'extension, mais fermées à la modification.

*(Citation originale : « Software entities should be open for extension, but closed for modification. »)*

- **Créateur** : Bertrand Meyer.
- **Date d'apparition** : 1988, dans *Object-Oriented Software Construction*. Le principe a ensuite été repris et reformulé par Robert C. Martin dans les années 1990, puis intégré à l'acronyme SOLID (Michael Feathers, vers 2004).

Deux lectures coexistent :
- **Version Meyer** : on étend une classe existante par **héritage**, la classe d'origine restant intacte.
- **Version Martin (dite « polymorphique »)** : on dépend d'**abstractions** (interfaces) ; ajouter un comportement revient à ajouter une implémentation, sans toucher au code client. C'est cette version qui prévaut aujourd'hui.

**Ouvert à l'extension** : on peut ajouter un nouveau comportement.
**Fermé à la modification** : sans rouvrir le code déjà écrit, testé et livré.

## Objectif

- **Ajouter des fonctionnalités sans risque de régression** sur le code existant, déjà testé et en production.
- **Éviter les cascades de `if`/`switch`** qui grossissent à chaque nouveau cas et deviennent illisibles.
- **Isoler la variabilité** derrière une abstraction stable : le code client ne connaît que l'interface.
- **Permettre le travail en parallèle** : ajouter une implémentation ne crée pas de conflit avec les autres équipes.
- **Faciliter les tests** : chaque extension se teste isolément, sans retester tout le reste.

## Exemple (ce qu'il faut faire)

Le calcul de l'aire dépend d'une abstraction. Ajouter une forme = ajouter une classe, sans toucher à `AreaCalculator`.

```java
public interface Shape {

    Double area();
}
```

```java
public class Rectangle implements Shape {

    private final Double width;
    private final Double height;

    public Rectangle(Double width, Double height) {
        this.width = width;
        this.height = height;
    }

    @Override
    public Double area() {
        return width * height;
    }
}
```

```java
public class Circle implements Shape {

    private final Double radius;

    public Circle(Double radius) {
        this.radius = radius;
    }

    @Override
    public Double area() {
        return Math.PI * radius * radius;
    }
}
```

```java
// Cette classe est FERMÉE à la modification : elle ne changera plus jamais
public class AreaCalculator {

    public Double totalArea(List<Shape> shapes) {
        return shapes.stream()
                .mapToDouble(Shape::area)
                .sum();
    }
}
```

Nouveau besoin : gérer les triangles. On **ajoute** une classe, on ne **modifie** rien.

```java
public class Triangle implements Shape {

    private final Double base;
    private final Double height;

    public Triangle(Double base, Double height) {
        this.base = base;
        this.height = height;
    }

    @Override
    public Double area() {
        return base * height / 2;
    }
}
```

`AreaCalculator` n'a pas été rouvert, ni recompilé conceptuellement, ni retesté : le système est **ouvert à l'extension** (nouvelle forme) et **fermé à la modification**.

## Contre exemple (ce qu'il ne faut pas faire)

Le calcul dépend du **type concret** : chaque nouvelle forme oblige à rouvrir `AreaCalculator`.

```java
public class Rectangle {

    public Double width;
    public Double height;
}
```

```java
public class Circle {

    public Double radius;
}
```

```java
public class AreaCalculator {

    public Double totalArea(List<Object> shapes) {

        Double total = 0.0;

        for (Object shape : shapes) {

            // Raison de rouvrir la classe n°1
            if (shape instanceof Rectangle) {
                Rectangle rectangle = (Rectangle) shape;
                total += rectangle.width * rectangle.height;
            }
            // Raison de rouvrir la classe n°2
            else if (shape instanceof Circle) {
                Circle circle = (Circle) shape;
                total += Math.PI * circle.radius * circle.radius;
            }
            // ... et un else if de plus à chaque nouvelle forme
        }
        return total;
    }
}
```

Les problèmes :
- Chaque nouvelle forme impose de **modifier une classe déjà testée et livrée** : risque de régression.
- La chaîne de `if`/`instanceof` grossit indéfiniment et devient illisible.
- Le même `switch` sur le type se retrouve dupliqué partout ailleurs (calcul du périmètre, affichage, sérialisation…), et il faut penser à tous les mettre à jour.
- Oublier un cas ne provoque aucune erreur de compilation : le bug est silencieux.
