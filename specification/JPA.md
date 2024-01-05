# JPA

## annotations de l'entité

@Access : permet de fixer la façon dont l'entity manager va lire et écrire les valeurs des champs de cette classe.
Cette annotation ne prend qu'un seul attribut, qui ne peut prendre que deux valeurs : AccessType.FIELD et AccessType.PROPERTY

## annotations des champs
D'une façon générale, les champs d'une classe sont automatiquement associés à des colonnes en base, dans la table de l'entité

###  @Column
columnDefinition : permet de donner, en SQL, le code de création d'une colonne. Cet attribut est à utiliser avec précautions, dans la mesure où il impose d'écrire du code SQL natif dans le code Java


## Opérations sur les entités

### PERSIST
Cette opération a pour effet de rendre une entité persistante. Si cette entité est déjà persistante, alors cette opération n'a aucun effet.
Rendre une entité persistante consiste à l'écrire en base sur le prochain commit de la transaction dans laquelle on se trouve. 

### REMOVE
L'opération REMOVE a pour effet de rendre une entité non persistante.
Si cette entité est déjà non persistante, alors cette opération n'a aucun effet.
Une entité rendue non persistante sera effacée de la base sur le prochain commit de la transaction dans laquelle on se trouve.

### REFRESH
L'opération REFRESH ne s'applique qu'aux entités persistantes. Si l'entité passée en paramètre n'est pas persistante, alors une exception de type IllegalArgumentException est générée.
L'opération REFRESH a pour effet de synchroniser l'état d'une entité avec son état en base.
Si les champs d'une entité ont été modifiés dans la transaction courante, ces modifications seront donc effacées par cette opération.
Si l'entité a été modifiée en base, alors ces modifications seront prises en compte lors d'un REFRESH.

### DETACH
Une opération DETACH sur une entité persistante a pour effet de la détacher de l' entity manager qui la gère.
Cette entité persistante ne sera donc pas prise en compte lors du prochain commit de la transaction dans laquelle on se trouve.

### MERGE
Une opération MERGE sur une entité persistante attache cette entité à l' entity manager courant.
On utilise cette opération pour associer une entité à un autre entity manager que celui qui a été utilisé pour la créer ou la lire.
Un opération MERGE sur une entité qui a été effacée (opération REMOVE) génère une exception de type IllegalArgumentException. 


## Initialize lazy associations

https://thorben-janssen.com/5-ways-to-initialize-lazy-relations-and-when-to-use-them/

1. Call a method on the mapped relation
```
Order order = this.em.find(Order.class, orderId);
order.getItems().size(); // note : order.getItems() does not work
```

2. Fetch Join in JPQL
```
Query q = this.em.createQuery("SELECT o FROM Order o JOIN FETCH o.items i WHERE o.id = :id");
q.setParameter("id", orderId);
newOrder = (Order) q.getSingleResult();
```
3. Fetch Join in Criteria API
```
CriteriaBuilder cb = em.getCriteriaBuilder();
CriteriaQuery q = cb.createQuery(Order.class);
Root o = q.from(Order.class);
o.fetch("items", JoinType.INNER);
q.select(o);
q.where(cb.equal(o.get("id"), orderId));
Order order = (Order)this.em.createQuery(q).getSingleResult();
```
4. Named Entity Graph
```
@Entity
@NamedEntityGraph(name = "graph.Order.items",
attributeNodes = @NamedAttributeNode("items"))
public class Order implements Serializable { ... }
```

## Entity Graph

### fetch graph
It loads eagerly only those attributes indicated in the entity graph.
It means, if the entity has more attributes mapped as EAGER but not indicated as part of the Entity Graph, those attributes will be loaded in a LAZY way.

### load graph
It keeps the existing fetch type already mapped in the entity.
It only modifies to EAGER those fields indicated in the entity graph.

## N + 1 query problem
For each entity, JPA will execute an extra query to get the association of the entity, therefore accessing the database N + 1 times.

## Contexte de persistance

## Session
Session is a persistence context that represents a conversation between an application and the database.

## Transaction

## liens
[Spring Data JPA](https://docs.spring.io/spring-data/jpa/docs/current/api/org/springframework/data/jpa/repository/JpaRepository.html)
[Hibernate could not initialize proxy – no Session](https://www.baeldung.com/hibernate-initialize-proxy-exception)
[JPA Entity Graph](https://www.baeldung.com/jpa-entity-graph)




