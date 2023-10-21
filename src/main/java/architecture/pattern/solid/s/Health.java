package architecture.pattern.solid.s;

public class Health {

    private Person person;

    public int imc() {
        return person.getWeigth() / (person.getSize() * person.getSize());
    }

    public Boolean isMassiveObese() {
        return person.bmi() > 40;
    }
}
