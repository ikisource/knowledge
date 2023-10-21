package architecture.pattern.solid.s;

import java.time.LocalDate;

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

    // Body Mass Index (should be in a class responsible for health)
    int bmi() {
        return weigth / (size * size);
    }

    Boolean isMassiveObese() {
        return bmi() > 40;
    }

    public int getSize() {
        return size;
    }

    public int getWeigth() {
        return weigth;
    }
}
