package architecture.pattern.builder;

public class PersonBuilder {

    private static Person person;

    public static Person firstname(String firstname) {
        person.setFirstname(firstname);
        return person;
    }

    public static Person lastname(String lastname) {
        person.setLastname(lastname);
        return person;
    }

    public static Person build() {
        return person;
    }
}
