# Adapter design pattern

It allows objects with incompatible interfaces to work together.

The example will adapt a legacy FahrenheitTemperature class to work with a system that expects temperatures in degrees Celsius

The existing class with an incompatible interface (Temperature in Fahrenheit)
```
public class FahrenheitTemperature {

    private double temperature;

    public FahrenheitTemperature(double temperature) {
        this.temperature = temperature;
    }

    public double getTemperatureInFahrenheit() {
        return temperature;
    }
}
```

The interface expected by the client (Temperature in Celsius)
```
interface CelsiusTemperature {
    double getTemperatureInCelsius();
}
```

The adapter : converts Fahrenheit temperature to Celsius
```
class FahrenheitToCelsiusAdapter implements CelsiusTemperature {

    private FahrenheitTemperature fahrenheitTemperature;

    public FahrenheitToCelsiusAdapter(FahrenheitTemperature fahrenheitTemperature) {
        this.fahrenheitTemperature = fahrenheitTemperature;
    }

    @Override
    public double getTemperatureInCelsius() {
        return (fahrenheitTemperature.getTemperatureInFahrenheit() - 32) * 5/9;
    }
}
```

// Client code
```
FahrenheitTemperature fahrenheitTemp = new FahrenheitTemperature(68.0);
CelsiusTemperature celsiusAdapter = new FahrenheitToCelsiusAdapter(fahrenheitTemp);
double temperature = celsiusAdapter.getTemperatureInCelsius();
```


