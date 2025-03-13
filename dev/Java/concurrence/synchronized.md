# synchronized

`synchronized` est un mot clé du langage Java, qui peut être utilisé de différentes manières.

`synchronized` est utilisée pour contrôler l'accès à une section critique de code, garantissant ainsi que seul
un thread peut exécuter cette section à la fois.

Le mot clé synchronized peut être utilisé :
- sur une méthode d'instance

Les méthodes d'instance sont synchronisées sur l'instance de la classe possédant la méthode, ce qui signifie qu'un seul
thread par instance de la classe peut exécuter cette méthode.

- sur une méthode statique

Ces méthodes statiques sont synchronisées sur l'objet Class associé à la classe. Comme il n'existe qu'un seul objet 
Class par JVM pour chaque classe, un seul thread peut s'exécuter à l'intérieur d'une méthode statique synchronisée par
classe, indépendamment du nombre d'instances qu'elle possède.

- sur un bloc de code

Parfois on ne veut pas synchroniser la méthode entière mais seulement quelques instructions. On peut le faire en 
synchronisant un bloc d'instructions.

Lorsque vous synchronisez un bloc de code, vous devez spécifier un objet qui servira de moniteur (ou verrou) pour cette
synchronisation.

```synchronized (monitor)```

Objet Moniteur : L'objet passé en argument à synchronized doit être accessible par tous les threads qui doivent être
synchronisés. Choisissez un objet approprié pour la synchronisation, souvent un objet immuable ou une instance spécifique

    