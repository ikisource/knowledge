# Architecture

## Communication synchrone
La communication synchrone est un mode de communication où les parties impliquées (par exemple, deux processus, deux 
threads, ou deux systèmes) doivent être synchronisées dans le temps pour échanger des informations. Cela signifie que 
l'émetteur et le récepteur doivent être actifs et prêts à communiquer simultanément. 

Quelques caractéristiques clés de la communication synchrone :
- Synchronisation temporelle : les deux parties doivent être disponibles en même temps pour que la communication ait lieu
- Blocage : dans une communication synchrone, l'émetteur est souvent bloqué jusqu'à ce que le récepteur ait reçu le message.
- Fiabilité : La communication synchrone est souvent plus fiable car elle garantit que les messages sont reçus dans
l'ordre et que chaque message est traité avant que le suivant ne soit envoyé

## Communication asynchrone
La communication synchrone est un mode de communication où les parties impliquées (par exemple, deux processus, deux 
threads, ou deux systèmes) n'ont pas besoin d'être synchronisées dans le temps pour échanger des informations. Cela 
signifie que l'émetteur peut envoyer un message sans attendre que le récepteur soit prêt à le recevoir, et le récepteur
peut traiter le message à son propre rythme.

Quelques caractéristiques clés de la Communication Asynchrone :

- Non-Blocage : l'émetteur n'est pas bloqué après avoir envoyé un message. Il peut continuer son exécution sans attendre
une réponse ou une confirmation de réception.
- Indépendance Temporelle : les parties impliquées dans la communication n'ont pas besoin d'être actives simultanément.
L'émetteur peut envoyer des messages même si le récepteur n'est pas prêt à les recevoir immédiatement.
- Flexibilité : la communication asynchrone permet une meilleure utilisation des ressources, car les processus peuvent
continuer à fonctionner pendant que les messages sont en transit ou en attente de traitement.
- Complexité de Gestion : la gestion des messages et des erreurs peut être plus complexe, car il n'y a pas de garantie
que les messages seront reçus ou traités dans un ordre spécifique.

### Choix entre synchrone ou asynchrone

#### Exigences de Performance
- Synchrone : Si votre application nécessite des réponses immédiates et que les délais de réponse sont critiques, la 
communication synchrone peut être plus appropriée. Elle garantit que chaque requête est traitée avant que la suivante
ne soit envoyée.
- Asynchrone : Si votre application peut tolérer des délais de réponse et que vous souhaitez maximiser l'utilisation des
ressources, la communication asynchrone est souvent préférable. Elle permet aux processus de continuer à fonctionner 
pendant que les messages sont en transit ou en attente de traitement.

#### Complexité de Gestion
- Synchrone : la communication synchrone est généralement plus simple à implémenter et à déboguer, car elle suit un flux
de contrôle linéaire. Cependant, elle peut entraîner des blocages si une partie de la communication est lente ou indisponible.
- Asynchrone : la communication asynchrone peut être plus complexe à gérer, car elle nécessite de gérer les états des 
messages, les callbacks, et les erreurs potentielles. Cependant, elle offre une plus grande flexibilité et peut 
améliorer la réactivité de votre application.

#### Ordre des Messages
- Synchrone : si l'ordre des messages est crucial pour votre application, la communication synchrone garantit que les 
messages sont traités dans l'ordre où ils sont envoyés.
- Asynchrone : dans une communication asynchrone, l'ordre des messages n'est pas garanti. Si l'ordre est important, vous
devrez implémenter des mécanismes supplémentaires pour gérer cela.

### Scalabilité
- Synchrone : la communication synchrone peut être moins scalable, surtout dans les systèmes distribués où les délais de
réseau peuvent varier. Les processus peuvent être bloqués en attente de réponses, ce qui peut limiter la scalabilité.
- Asynchrone : la communication asynchrone est souvent plus scalable, car elle permet aux processus de continuer à 
fonctionner sans attendre les réponses. Cela peut être particulièrement avantageux dans les systèmes distribués.

### Réactivité
- Synchrone : si votre application nécessite une réactivité immédiate et que chaque requête doit être traitée avant la 
suivante, la communication synchrone est appropriée.
- Asynchrone : si votre application peut traiter les requêtes de manière indépendante et que la réactivité immédiate 
n'est pas critique, la communication asynchrone peut offrir une meilleure réactivité globale en permettant aux 
processus de continuer à fonctionner pendant que les messages sont en transit.

### Consommation de Ressources
- Synchrone : la communication synchrone peut entraîner une consommation inefficace des ressources, car les processus 
peuvent être bloqués en attente de réponses.
- Asynchrone : la communication asynchrone permet une meilleure utilisation des ressources, car les processus peuvent 
continuer à fonctionner pendant que les messages sont en transit ou en attente de traitement.




