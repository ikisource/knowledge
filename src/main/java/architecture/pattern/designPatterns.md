# Patrons de conception ou design patterns

# Principles SOLID

### Responsabilité unique (Single responsibility principle)
Une classe, une fonction ou une méthode doit avoir une et une seule responsabilité.

### Ouvert/fermé (Open/closed principle)
Une entité applicative (classe, fonction, module ...) doit être ouverte à l'extension, mais fermée à la modification.

En pratique, le principe ouvert/fermé s'appuie sur l'utilisation de l'abstraction et du polymorphisme.

### Substitution de Liskov (Liskov substitution principle)
Une instance de type T doit pouvoir être remplacée par une instance de type G, tel que G sous-type de T, sans que cela ne modifie la cohérence du programme.

### Ségrégation des interfaces (Interface segregation principle)
Préférer plusieurs interfaces spécifiques pour chaque client plutôt qu'une seule interface générale.

Le principe de ségrégation des interfaces est une bonne pratique de la programmation orientée objet, qui stipule qu'aucun client ne devrait dépendre de méthodes qu'il n'utilise pas.
Il faut donc diviser les interfaces volumineuses en plus petites plus spécifiques, de sorte que les clients n'ont accès qu'aux méthodes intéressantes pour eux. Ces interfaces rétrécies sont également appelés interfaces de rôle.

Tout ceci est destiné à maintenir un système à couplage faible, donc plus facile à refactoriser.


### Inversion des dépendances (Dependency inversion principle)
Il faut dépendre des abstractions, pas des implémentations