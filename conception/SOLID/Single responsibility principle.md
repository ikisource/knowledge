# Single responsibility principle

A class should have only one reason to change.  
To be more precise a class should be responsible to one, and only one actor. (Robert C. Martin)

```
public class Person {

    private String name;
    private String birthdate;
    private int size;
    private int weigth;

    boolean isBirthday() {

        LocalDate now = LocalDate.now();
        LocalDate birthday = LocalDate.parse(birthdate);

        return now.getMonth().equals(birthday.getMonth())
                && now.getDayOfMonth() == birthday.getDayOfMonth();
    }

    // Body Mass Index
    int bmi() {
        return weigth / (size * size);
    }

    Boolean isMassiveObese() {
        return bmi() > 40;
    }
}
```
The class Person has two responsibilities : holding data and intrinsic methods, and managing health concerns

Put the health in another class 
```
public class Health {

    private Person person;

    public int imc() {
        return person.getWeigth() / (person.getSize() * person.getSize());
    }

    public Boolean isMassiveObese() {
        return person.bmi() > 40;
    }
}
```

## Benefits
- low coupling
- testability is better
- readability is better
- decrease conflict merges


