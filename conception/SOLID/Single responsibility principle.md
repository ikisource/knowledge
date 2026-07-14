# Single responsibility principle

*Principe de responsabilité unique* — le **S** de l'acronyme **SOLID**.

## Définition

> Une classe ne devrait avoir qu'une seule raison de changer.

*(Citation originale : « A class should have only one reason to change. »)*

- **Créateur** : Robert C. Martin (« Uncle Bob »).
- **Date d'apparition** : formulé à la fin des années 1990 dans ses articles sur les principes de conception orientée objet, puis publié dans *Agile Software Development, Principles, Patterns, and Practices* (2002). L'acronyme SOLID, qui regroupe ce principe avec quatre autres, a été proposé par Michael Feathers vers 2004.

La « responsabilité » n'est pas une action, c'est une **raison de changer**, c'est-à-dire un acteur (métier, technique, organisationnel) susceptible de demander une évolution du code. Robert C. Martin a d'ailleurs reformulé plus tard le principe ainsi : *« Un module ne devrait être responsable que devant un seul et unique acteur. »*

## Objectif

- **Limiter l'impact des changements** : une modification demandée par un acteur ne doit pas déstabiliser le code utilisé par un autre acteur.
- **Éviter le couplage accidentel** entre des préoccupations qui n'ont pas de rapport (règles métier, persistance, présentation, journalisation…).
- **Faciliter les tests** : une classe avec une seule responsabilité a peu de dépendances et se teste unitairement sans infrastructure.
- **Améliorer la lisibilité et la réutilisabilité** : le nom de la classe décrit exactement ce qu'elle fait.
- **Réduire les risques de régression** et les conflits lors des modifications simultanées par plusieurs développeurs.

## Exemple (ce qu'il faut faire)

Chaque classe a une seule raison de changer : la règle de calcul, le format de rapport, l'accès à la base.

```java
// Responsabilité : porter les données du domaine
public class Employee {

    private final String name;
    private final Integer hoursWorked;
    private final Double hourlyRate;

    public Employee(String name, Integer hoursWorked, Double hourlyRate) {
        this.name = name;
        this.hoursWorked = hoursWorked;
        this.hourlyRate = hourlyRate;
    }

    public String getName() {
        return name;
    }

    public Integer getHoursWorked() {
        return hoursWorked;
    }

    public Double getHourlyRate() {
        return hourlyRate;
    }
}
```

```java
// Responsabilité : la règle de calcul du salaire (acteur : le service financier)
public class PayCalculator {

    public Double calculatePay(Employee employee) {
        return employee.getHoursWorked() * employee.getHourlyRate();
    }
}
```

```java
// Responsabilité : la mise en forme du rapport (acteur : le service RH)
public class EmployeeReporter {

    public String report(Employee employee, Double pay) {
        return employee.getName() + " : " + pay + " €";
    }
}
```

```java
// Responsabilité : la persistance (acteur : les architectes / DBA)
public class EmployeeRepository {

    public void save(Employee employee) {
        // INSERT INTO employee ...
    }
}
```

```java
public class Client {

    public static void main(String[] args) {

        Employee employee = new Employee("Alice", 35, 42.0);

        PayCalculator calculator = new PayCalculator();
        EmployeeReporter reporter = new EmployeeReporter();
        EmployeeRepository repository = new EmployeeRepository();

        Double pay = calculator.calculatePay(employee);
        System.out.println(reporter.report(employee, pay));
        repository.save(employee);
    }
}
```

Un changement de la formule de calcul ne touche que `PayCalculator`. Un changement du format du rapport ne touche que `EmployeeReporter`. Un changement de base de données ne touche que `EmployeeRepository`.

## Contre exemple (ce qu'il ne faut pas faire)

Une classe « fourre-tout » qui répond à trois acteurs différents : elle a trois raisons de changer.

```java
public class Employee {

    private String name;
    private Integer hoursWorked;
    private Double hourlyRate;

    public Employee(String name, Integer hoursWorked, Double hourlyRate) {
        this.name = name;
        this.hoursWorked = hoursWorked;
        this.hourlyRate = hourlyRate;
    }

    // Raison de changer n°1 : les règles du service financier
    public Double calculatePay() {
        return hoursWorked * hourlyRate;
    }

    // Raison de changer n°2 : le format demandé par le service RH
    public String report() {
        return name + " : " + calculatePay() + " €";
    }

    // Raison de changer n°3 : la technologie de persistance
    public void save() {
        // Connexion JDBC, INSERT INTO employee ...
    }
}
```

Les problèmes :
- Le service RH demande un rapport en PDF → on modifie `Employee`, et on risque de casser le calcul du salaire utilisé par la paie.
- Le passage de JDBC à JPA → on modifie `Employee`, qui est pourtant une classe de domaine.
- La classe est impossible à tester unitairement sans base de données.
- Les développeurs de trois équipes différentes modifient le même fichier : conflits garantis.
