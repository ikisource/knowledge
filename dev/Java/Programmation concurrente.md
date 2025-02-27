# Programmation concurrente

## Concurrence
La concurrence fait référence à la capacité d'un système à gérer plusieurs tâches simultanément. Les tâches 
concurrentes peuvent être exécutées en parallèle ou en alternance, mais elles progressent de manière indépendante.

Exemple : Deux threads exécutant des tâches différentes dans une application multithreadée.

## Parallèle

Le parallélisme fait référence à l'exécution simultanée de plusieurs tâches sur plusieurs unités de
traitement (cœurs de processeur, par exemple). Les tâches parallèles sont exécutées en même temps.

Exemple : Une application qui divise une tâche en plusieurs sous-tâches exécutées simultanément sur plusieurs cœurs de 
processeur.

### Concurrence vs Parallélisme
- Concurrence : Avec un seul thread, vous pouvez avoir de la concurrence en alternant entre plusieurs tâches
(par exemple, en utilisant des coroutines ou des générateurs), mais les tâches ne sont pas exécutées simultanément.
- Parallélisme : Le parallélisme nécessite plusieurs unités d'exécution (threads ou processus) pour exécuter des tâches
en même temps.

## Thread
Un thread est une unité d'exécution séquentielle. Il ne peut exécuter qu'une seule tâche à la fois.

## Multi-thread
Le multi-threading est une technique où plusieurs threads (unités d'exécution légères) sont utilisés pour exécuter des
tâches concurrentes au sein d'un même processus. Chaque thread peut être exécuté en parallèle ou en alternance.

Exemple : Une application Java utilisant plusieurs threads pour gérer des connexions réseau simultanées.

## Bloquant
Une opération bloquante est une opération qui empêche l'exécution d'autres opérations jusqu'à ce qu'elle soit terminée. 
Le thread ou le processus est mis en attente jusqu'à ce que l'opération soit complétée.

Exemple : Une lecture de fichier bloquante où le programme attend que les données soient lues avant de continuer.

## Non bloquant
Une opération non bloquante permet au thread ou au processus de continuer son exécution sans attendre que l'opération 
soit terminée. L'opération peut être complétée plus tard, souvent via un callback ou un événement.

Exemple : Une lecture de fichier non bloquante où le programme continue son exécution pendant que les données sont lues 
en arrière-plan.

## Synchrone
Dans une communication ou une opération synchrone, les parties impliquées doivent être synchronisées dans le temps.
L'émetteur attend que le récepteur soit prêt avant d'envoyer un message, et le récepteur traite le message immédiatement.

Exemple : Un appel de fonction où le programme attend que la fonction retourne un résultat avant de continuer.

## Asynchrone
Dans une communication ou une opération asynchrone, les parties impliquées ne sont pas synchronisées dans le temps.
L'émetteur peut envoyer un message sans attendre que le récepteur soit prêt, et le récepteur traite le message à son
propre rythme.

Exemple : Un appel de fonction asynchrone où le programme continue son exécution sans attendre que la fonction retourne 
un résultat.
