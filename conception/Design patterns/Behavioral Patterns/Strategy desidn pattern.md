# Strategy design pattern

It enables selecting an algorithm at runtime.

![](/home/olivier/dev/knowledge/conception/Design patterns/images/Strategy.png)

```
public interface BrakeBehavior {
    
    public void brake();
}
```

```
public class Brake implements BrakeBehavior {
    
    public void brake() {
        System.out.println("Simple Brake applied");
    }
}
```

```
public class BrakeWithABS implements BrakeBehavior {

    public void brake() {
        System.out.println("Brake with ABS applied");
    }
}
```

/* Client that can use the algorithms above interchangeably */
```
public abstract class Car {

    private BrakeBehavior brakeBehavior;

    public Car(BrakeBehavior brakeBehavior) {
      this.brakeBehavior = brakeBehavior;
    }

    public void applyBrake() {
        brakeBehavior.brake();
    }

    public void setBrakeBehavior(BrakeBehavior brakeType) {
        this.brakeBehavior = brakeType;
    }
}
```

```
/* Client 1 uses one algorithm (Brake) in the constructor */
public class Lada extends Car {

    public Lada() {
        super(new Brake());
    }
}
```

```
/* Client 2 uses another algorithm (BrakeWithABS) in the constructor */
public class SUV extends Car {

    public SUV() {
        super(new BrakeWithABS());
    }
}
```

```
/* Using the Car example */
public class CarExample {

    public static void main(final String[] arguments) {
    
    Car lada = new Lada();
    lada.applyBrake();  // This will invoke class "Brake"

        Car suvCar = new SUV();
        suvCar.applyBrake();    // This will invoke class "BrakeWithABS"

        // set brake behavior dynamically
        suvCar.setBrakeBehavior( new Brake() ); // don't want to use ABS
        suvCar.applyBrake();    // This will invoke class "Brake"
    }
}
```

# Benefits

- Flexibility and Extensibility
- Dynamic Behavior
