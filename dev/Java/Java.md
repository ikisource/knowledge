# Java

### Surcharger une méthode
La surcharge d’une méthode ou d’un constructeur permet de définir plusieurs fois une même méthode/constructeur avec des arguments différents.

## jshell
REPL (READ EVALUATE PRINTL LOOP)

Exemple 1

```
jshell> Integer.parseInt("20")
$2 ==> 20
```

Exemple 2

```
jshell> Integer.parseInt("")
|  Exception java.lang.NumberFormatException: For input string: ""
|        at NumberFormatException.forInputString (NumberFormatException.java:68)
|        at Integer.parseInt (Integer.java:662)
|        at Integer.parseInt (Integer.java:770)
|        at (#3:1)
```

## Initialisateur d'instance

```
public class Person {

	private long dateCreation = System.currentTimeMillis();
	private String nom;
	private static Integer number;

	{
		// ceci est un bloc non statique  

	}

	static {
		// ceci est un bloc statique  
		number = 12;
	}

	public Person() {
		this.nom = "indéfini";
	}

	public Person(String nom) {
		this.nom = nom;
	}
}
```

## StackWalker

## ProcessHandle


