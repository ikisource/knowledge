# Mots-clé

## synchronised
`synchronized` est un mot-clé utilisé pour contrôler l'accès à une section critique de code, garantissant ainsi que seul
un thread peut exécuter cette section à la fois.

## volatile
Ce mot-clé ne peut se poser que sur un champ.

Le mot-clé `volatile` en Java est utilisé pour indiquer qu'une variable peut être modifiée par plusieurs threads.
Lorsqu'une variable est déclarée comme volatile, cela garantit que les modifications apportées à cette variable par
un thread sont immédiatement visibles par tous les autres threads. Cela est particulièrement important dans les
applications multithreads pour éviter les problèmes de visibilité des variables partagées.

# Concepts

## Atomicité
Une opération atomique est une opération composée éventuellement de plusieurs actions, qui se déroule sans pouvoir être 
interrompue, en particulier par un autre thread.

## Collections concurrentes
Les problèmes de concurrence d'accès ne se posent pas que pour les champs de type primitif ou objet. Ils se posent de 
façon également aiguë lorsque l'on manipule des collections et des tables de hachage. C'est la raison pour laquelle 
l'API Concurrent propose plusieurs implémentations de List, de Set et de Map, à la fois thread-safe et performantes.

L'API Java nous offre déjà quelques solutions pour construire des collections thread-safe . Les classes Vector et
Hashtable sont synchronisées, et la classe Collections expose plusieurs méthodes pour créer des collections
synchronisées, par enveloppement de ces collections et synchronisation des accès. Malheureusement ces classes ne sont
pas suffisantes pour traiter de façon atomique des problèmes simples.

## Deadlock
Une mauvaise gestion de la synchronisation entre blocs peut mener à une situation de blocage total d'une application,
appelée deadlock.

Comment Éviter les Deadlocks
- Ordre d'Acquisition des Verrous : Assurez-vous que tous les threads acquièrent les verrous dans le même ordre.
- Temps d'Attente Limité : Utilisez des mécanismes comme tryLock avec un temps d'attente pour éviter de rester bloqué
indéfiniment.
- Détection de Deadlock : Implémentez des mécanismes pour détecter et récupérer des deadlocks, comme des timeouts ou des
vérifications périodiques.


## exclusivité mutuelle (mutex)
## visibilité
## sémaphore

# Méthodes

## interrupt
La méthode interrupt de la classe Thread en Java est utilisée pour interrompre un thread. Lorsqu'un thread est
interrompu, son état d'interruption est défini, ce qui peut être utilisé pour signaler au thread qu'il devrait
arrêter ce qu'il est en train de faire et terminer proprement.
- À l'intérieur du thread : Utilisez Thread.currentThread().isInterrupted() pour vérifier si le thread actuel a été 
interrompu.
- À l'extérieur du thread : Utilisez thread.isInterrupted() pour vérifier si un autre thread a été interrompu.

## join
En Java, la méthode join de la classe Thread est utilisée pour faire en sorte qu'un thread attende la fin
de l'exécution d'un autre thread. Lorsqu'un thread appelle la méthode join sur un autre thread, il se met en pause
jusqu'à ce que le thread sur lequel join a été appelé termine son exécution.
La méthode join est particulièrement utile lorsque vous avez besoin de synchroniser l'exécution de plusieurs threads,
par exemple, lorsque vous devez vous assurer qu'un thread termine certaines tâches avant qu'un autre thread ne commence.

## yield
La méthode yield de la classe Thread en Java est utilisée pour suggérer au planificateur de threads (thread scheduler)
de donner une chance à d'autres threads de même priorité ou plus élevée de s'exécuter. Cependant, il est important
de noter que yield est une suggestion et non une garantie.
Le planificateur de threads peut ignorer cette suggestion et continuer à exécuter le thread courant.

Amélioration de la Réactivité : yield peut être utilisé pour améliorer la réactivité d'une application en permettant à
d'autres threads de progresser.
- Pas de Garantie : yield est une suggestion et non une garantie. Le planificateur de threads peut choisir d'ignorer
cette suggestion.
- Pas de Changement de Priorité : yield ne change pas la priorité du thread. Il ne fait que suggérer au planificateur de
donner une chance à d'autres threads de s'exécuter.

# wait

# Classes

## Thread

## Classes atomiques

### AtomicInteger
La méthode incrementAndGet incrémente l'entier stocké dans l'instance d'AtomicInteger de façon atomique.
Utiliser ce genre de classe est plus rapide que d'utiliser une synchronisation.

Il faut noter que les classes du type Atomic* ne sont pas faites pour remplacer les classes enveloppe des types de base 
(Integer, Float, etc...). Notamment ces classes ne surchargent pas la méthode equals() et ne sont pas Comparable.
On ne peut donc raisonnablement pas les utiliser comme clé dans des tables de hachage.

## Collections concurrentes

### CopyOnWriteArrayList, CopyOnWriteArraySet
Deux classes sont apportées par l'API Concurrent, implémentation respectivement de List et de Set : CopyOnWriteArrayList
et CopyOnWriteArraySet. L'implémentation CopyOnWriteArrayList apporte deux opérations supplémentaires à List, qui sont 
atomiques : addIfAbsent(T t) et addAllAbstent(Collection<? extends E> collection). Ces deux classes peuvent être 
utilisées en concurrence d'accès. On peut itérer dessus sans risque qu'une exception de type 
ConcurrentModificationException soit jetée. Ces deux collections sont construites sur des tableaux d'objets, qui sont 
recopiés intégralement à chaque fois qu'une modification est effectuée. Seul le changement de tableau (qui n'est qu'un 
jeu de pointeurs) est synchronisé. Toutes les opérations de lecture sont effectuées sur un unique tableau, en lecture 
seule, qui ne pose donc aucun problème de modification concurrente. Ces deux classes ne sont donc pas utilisables dans 
tous les cas. Les lectures sont très performantes, mais les écritures très peu performantes. Les bons cas sont donc ceux
dans lesquels les lectures sont beaucoup plus fréquentes que les modifications, et pour les collections qui ne sont pas 
trop volumineuses.

## Tables de hachage concurrentes

### ConcurrentHashMap
ConcurrentHashMap<K, V> autorise autant de lectures que l'on veut, et ces lectures sont non-bloquantes.
Les itérateurs construits sur cette table ne jettent pas de ConcurrentModificationException. En revanche,
les opérations de modifications sont contrôlées. Lors de la construction de cette table, on peut lui 
passer un paramètre, concurrencyLevel (la valeur par défaut est 16), qui règle certains éléments internes
de la table. Le but est de réduire les goulets d'étranglement, tout en conservant la sécurité des opérations 
concurrentes.

## Extension de SortedSet et SortedMap

###  ConcurrentSkipListSet, ConcurrentSkipListMap
L'API Concurrent nous donne également deux implémentations de ces interfaces, qui, rappelons-le, permettent de conserver
les éléments enregistrés triés. Les deux implémentations fournies sont ConcurrentSkipListSet<K, V> et 
ConcurrentSkipListMap<K, V>. De la même façon que les autres classes, elles sont optimisées pour les accès en lecture,
notamment pour être non-bloquantes. 











