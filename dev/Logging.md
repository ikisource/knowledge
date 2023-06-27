# logback
https://www.baeldung.com/logback

## hiérarchie
Tous les loggers héritent du logger "ROOT".
Les loggers sont hiérarchisés.
par exemple le logger défini dans le package com.sample.foo hérite du logger défini dans le package com.sample

root logger log au niveau DEBUG par défaut.


## log paramétré
log.info("Current count is {}", count); => Current count is 4

# rechargement de la configuration
<configuration scan="true">

# coloration
%highlight(%-5level) pour afficher les niveau de log avec des couleurs différentes (ERROR en rouge)

# additivity
Loggers are hierarchical, and any message sent to a logger will be sent to all its ancestors by default. You can disable this behavior by setting additivity=false

