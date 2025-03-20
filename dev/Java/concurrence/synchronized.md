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

La synchronisation garantit à la fois l'atomicité et la visibilité, alors que la volatilité ne garantit que la 
visibilité.

## Bonnes pratiques

- Ne pas exposer les verrous de synchronisation
L'objet paramètre d'un bloc synchronized ne devrait jamais être exposé. En particulier, synchroniser un bloc sur this ou
sur la classe englobante est une très mauvaise idée. Le plus souvent, n'importe quel autre objet de l'application pourra
obtenir une référence sur cet objet de synchronisation, et s'il lui vient la mauvaise idée de l'utiliser pour 
synchroniser d'autres blocs, des situations de deadlock pourront arriver. Il faut également se rappeler que les chaînes 
de caractères sont traitées de façon particulière par le compilateur. Ne jamais tenter de synchroniser un bloc en 
utilisant une chaîne de caractères est un principe absolu.

- Documenter parfaitement les stratégies de synchronisation
Si l'objet de synchronisation est un champ privé de la classe qui possède ce bloc, alors il faut parfaitement documenter
le fait que l'appel de certaines méthodes est synchronisé. Cela pourra prévenir les utilisateurs de ces méthodes, et 
éviter des situations de deadlock.

## Remarque
L'API Concurrent propose de nombreuses techniques qui rendent la synchronisation inutile :

- les variables atomiques ;
- les collections non-bloquantes et thread-safe ;
- les objets de synchronisation explicites, qui permettent de rendre la main quand l'acquisition d'un verrou prend trop 
de temps.
