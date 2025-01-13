
# Domain-Driven Design Vite fait

Un résumé de Domain Driven Design d’Eric Evans

## Domaine
- La première nécessité pour le domaine est qu’il soit cohérent, avec des termes fixés et aucune contradiction.
- Chaque domaine doit avoir une frontière clairement délimitée, et les liaisons entre domaines doivent être définies avec précision.

## Entité (Entity)
Une entité est un objet du domaine qui possède une identité propre. Une entité est amenée à changer d'état dans le temps
elle n'est donc pas immuable.

Une entité ne doit pas être anémique c'est à dire constituée uniquement de ses propriétés et des ses accesseurs mais
elle doit contenir des règles métier; il est d'ailleurs souhaitable de remplacer les setters par de véritables fonctions métier

## Objet valeur (Value Object)
Une value type peut être transformée en Value Object (exemple : BigDecimal se transforme en la classe Amount)

## Les modules

- Les modules devraient avoir des interfaces bien définies auxquelles accèdent d’autres modules
- Les modules et leurs noms doivent donner un aperçu du domaine

## Les aggrégats
Un Agrégat est un groupe d’objets associés qui sont considérés comme un tout unique vis-à-vis des modifications de données

Chaque Agrégat a une racine. La racine est une Entité, et c’est le seul objet accessible de l’extérieur.

## Les entrepôts
L’Entrepôt est capable de conserver des références vers des objets.

## Refactoring
- Un design rigide résiste au refactoring


## Contexte borné (bounded context)

- Il n’y a pas de formule mathématique pour diviser un gros modèle en modèles plus petits.
- Essayez de placer dans le même modèle les éléments qui sont liés, et qui forment un concept naturel.
- Un modèle doit être assez petit pour pouvoir être assigné à une seule équipe.
- Un Contexte borné n’est pas un Module.
- Il y a un prix à payer pour avoir des modèles multiples. On doit définir les frontières et les relations entre les différents modèles.
  Cela demande du travail en plus et un effort de conception supplémentaire, et il y aura peut-être des traductions à faire entre les
  modèles.
- Chaque Contexte borné doit avoir un nom qui fait partie du Langage omniprésent.
- 
### Identifier les bounded context
- un terme contenant la syllable 'tion' ou un 'ing' est candidat à un bounded context (exemple: réservation des place, tarification)
- Les Personae(exemples : Julie, marketing, direction, marketing) peuvent aider à identifer les bounded context
- Les synonymes et termes à sens multiple peuvent également aider à identifer les bounded context

## Spécifications

- Invariants de domaine de type prédicat
- Valide un objet domaine avec isSatisfiedBy()
- Modélise une règle de gestion
- Configurable

## Patterns

### Pattern stratégiques

### Pattern tactiques

