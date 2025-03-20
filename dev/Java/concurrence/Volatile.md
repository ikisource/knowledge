# volatile

Afin de comprendre son utilité, analysons le fonctionnement de deux threads qui partagent le même champ. Supposons que 
ces deux threads T1 et T2 soient en train de s'exécuter au même moment, sur deux processeurs différents, ou deux cœurs 
différents d'un même processeur. Cette situation était peut-être rare il y a quelques années, mais avec le temps, elle 
devient de plus en plus fréquente. Si l'on n'y prend pas garde, et si l'on ne fait rien pour l'empêcher, chacun de nos 
deux threads peut choisir de copier la valeur de ce champ localement à son processeur, par exemple dans un registre.

`volatile` est un mot clé du langage Java, qui peut être utilisé de différentes manières.

Ce mot-clé ne peut se poser que sur un champ.

Le mot-clé volatile en Java est utilisé pour indiquer qu'une variable peut être modifiée par plusieurs threads.

Visibilité : Lorsqu'une variable est déclarée comme volatile, cela garantit que les modifications apportées à cette 
variable par un thread sont immédiatement visibles par tous les autres threads. Cela est particulièrement important dans
les applications multithreads pour éviter les problèmes de visibilité des variables partagées.

Atomicité : volatile est approprié pour les opérations atomiques sur des variables primitives

Pas de Synchronisation : volatile ne fournit pas de synchronisation. Il ne garantit pas l'exclusivité mutuelle (mutex).
Pour des opérations complexes ou des séquences d'opérations, vous devrez utiliser des mécanismes de synchronisation 
comme synchronized, ReentrantLock, ou les classes de java.util.concurrent.

Si on pose le champ `volatile` sur un type wrapper comme un Integer par exemple :
```
private volatile Integer count = 0;

public void increment() {
    // Crée un nouvel objet Integer et met à jour la référence
    count = count + 1;
}
```

Visibilité : volatile garantit que les modifications apportées à la référence de l'objet count sont visibles par tous 
les threads.

Immuabilité : Les objets de type wrapper comme Integer sont immuables. Pour modifier la valeur, vous devez créer un 
nouvel objet et mettre à jour la référence.

Atomicité : L'opération count = count + 1 n'est pas atomique. Elle implique plusieurs étapes (lecture de count, création
d'un nouvel objet Integer, mise à jour de la référence). Cela peut entraîner des problèmes de concurrence si plusieurs 
threads exécutent cette opération simultanément.

L'utilisation de volatile avec des types wrapper comme Integer garantit la visibilité des modifications apportées à la
référence de l'objet. Cependant, il est important de noter que les opérations sur ces objets ne sont pas atomiques. Pour
garantir l'atomicité et la cohérence des opérations, vous devrez utiliser des mécanismes de synchronisation comme 
synchronized, ReentrantLock, ou les classes de java.util.concurrent.

La synchronisation garantit à la fois l'atomicité et la visibilité, alors que la volatilité ne garantit que la visibilité. 