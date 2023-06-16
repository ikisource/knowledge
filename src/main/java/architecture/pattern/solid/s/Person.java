package architecture.pattern.solid.s;

import java.time.LocalDate;

public class Person {

	private String name;
	private String birthdate;
	private int size;
	private int weigth;

	public String getName() {
		return name;
	}

	boolean isBirthday() {
		
		LocalDate now = LocalDate.now();
		LocalDate birthday = LocalDate.parse(birthdate);
		
		return now.getMonth().equals(birthday.getMonth())
				&& now.getDayOfMonth() == birthday.getDayOfMonth();
	}

	// should be in a class responsible for health
	int imc() {
		return weigth / (size * size);
	}
}
