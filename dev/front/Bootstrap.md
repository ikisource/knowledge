# Questions
- Le fichier bootstrap.min.css suffit-il ? A quoi servent les autres fichiers CSS ?
- Comment rechercher une classe dans le site bootstrap ?
- Existe-t-il des éditeurs CSS wysiwyg ?

# Sources

https://www.pierre-giraud.com/bootstrap-apprendre-cours/

# A trier

- Bootstrap utilise la propriété ```z-index``` pour définir quel composant doit apparaitre au-dessus de quel autre dans
  le cas où on en insèrerait plusieurs dans une même page
- lorsqu’on utilise Bootstrap il est toujours conseillé de définir un élément conteneur avec ```class="container"```
  ou ```class="container-fluid"``` qui servira de conteneur générique et dans lequel on placera tout le contenu HTML de
  notre body.
- Pour définir une nouvelle ligne de grille, on va utiliser la classe ```.row```.
- La classe ```bg-info``` ajoute un fond bleu à l'élément

# Présentation

C'est un framework créé par twitter en 2011 qui gère des CSS

gère le responsive
on utilise des classes

## Comment utiliser Bootstrap

1. Télécharger les fichiers Bootstrap (CSS et JavaScript) sur le site https://getbootstrap.com/ puis les lier à nos
   fichiers HTML comme n’importe quel autre fichier CSS et JavaScript ;

2. Utiliser un CDN (Content Delivery Network ou réseau de distribution de contenu) et inclure le lien vers les fichiers
   dans nos fichiers HTML.

3. Dépendances webjars : https://www.baeldung.com/maven-webjars

## Classes container

### Container

La largeur par défaut d’un conteneur défini avec ```.container``` est égale à 100% de l’espace disponible.

### Container-fluid

La classe ```.container-fluid``` permet de définir un conteneur de taille fluide, c’est-à-dire un conteneur dont la
taille va changer en même temps que celle de la fenêtre de vos visiteurs.

Un conteneur défini avec .container-fluid occupera toujours 100% de la largeur disponible.

## Grille

Les grilles Bootstrap sont basées sur le flexbox et une grille va toujours être composée de 12 colonnes de base.

Pour chaque nouvelle ligne, on va pouvoir décider du nombre de colonnes dont la ligne va disposer à partir des 12 de
base grâce à des classes ```.col-*```.
Ici, il est important de bien comprendre que les grilles Bootstrap disposent automatiquement toujours de 12 colonnes de
base qui sont définies implicitement.
On va ensuite pouvoir « grouper » certaines de ces 12 colonnes de base ensemble dans chaque ligne pour former de
nouvelles colonnes personnalisées.

* Les lignes (```.row```) doivent être placées dans des conteneurs (.container ou .container-fluid)
* Les lignes ne doivent être utilisées que pour contenir des colonnes et, de façon réciproque, les éléments disposés
  avec des classes ```.col``` doivent absolument être des enfants directs des éléments portant des classes ```.row```.

### Création d’une grille avec des colonnes de tailles différentes

On va pouvoir faire cela en indiquant le nombre de colonnes de base que doit occuper chaque colonne qu’on va créer dans
la ligne.

En passant une classe ```.col-1``` à un élément, on indique qu’on souhaite créer une colonne d’une taille équivalente à
celle d’une colonne de base des grilles Bootstrap.
En passant ```.col-2``` on va créer une colonne qui va occuper l’espace de deux colonnes de base, etc...

Dans le cas où on essaie de créer des colonnes dans une ligne en utilisant plus de 12 colonnes de base, alors les
colonnes personnalisées ne rentrant pas dans la ligne iront se positionner en dessous des précédentes (elles iront se
positionner à la ligne).

### Colonnes

Chaque colonne personnalisée créée avec ```.col``` va par défaut posséder un padding gauche et droit qu’on appelle
également des « gouttières » et qui sert à espacer les contenus des différentes colonnes créées.

On va pouvoir supprimer le padding des colonnes ```.col``` et la margin des éléments ```.row``` en appliquant la
classe ```.no-gutters``` à l’élément représentant la ligne.

#### Une ligne de 3 colonnes qui vont occuper la même largeur

```
<div class="row">
    <!--La classe bg-info ajoute un fond bleu à l'élément-->
    <div class="col bg-info">1er élément</div>
    <!--La classe bg-warning ajoute un fond jaune à l'élément-->
    <div class="col bg-warning">2è élément</div>
    <!--La classe bg-success ajoute un fond vert à l'élément-->
    <div class="col bg-success">3è élément</div>
</div>
```

#### Création d’une grille avec des colonnes de tailles différentes

```
<div class="container">
    <div class="row">
        <!--Occupe 2 colonnes-->
        <div class="col-2 bg-info">1er élément</div>
        <!--Occupe 4 colonnes-->
        <div class="col-4 bg-warning">2è élément</div>
        <!--Occupe 6 colonnes-->
        <div class="col-6 bg-success">3è élément</div>
    </div>
</div>
```

#### Définir automatiquement la largeur des colonnes en fonction de leur contenu
```
<div class="col-auto col-md bg-warning">Elément de ligne n°2</div>
```
### Gérer l’alignement vertical des colonnes dans une ligne
Pour aligner toutes les colonnes en même temps par rapport à une ligne, nous allons appliquer les classes ```.align-items-*``` à nos lignes.
Nous pouvons choisir parmi trois classes qui représentent trois positions différentes :

    .align-items-start : les colonnes seront alignées en début (en haut) de la ligne ;
    .align-items-center : les colonnes vont être alignées au centre de la ligne ;
    .align-items-end : les colonnes seront alignées en fin (en bas) de la ligne.

Pour aligner chaque colonne individuellement, nous allons cette fois-ci plutôt utiliser les classes ```.align-self-*``` qu’on va utiliser avec chaque élément cette fois-ci.
Là encore, nous pouvons choisir parmi trois classes :

    .align-self-start : la colonne sera alignée en début (en haut) de la ligne ;
    .align-self-center : la colonne va être alignée au centre de la ligne ;
    .align-self-end : la colonne sera alignée en fin (en bas) de la ligne.

### Gérer l’alignement horizontal des colonnes dans une ligne
On va pouvoir aligner horizontalement nos colonnes dans la ligne grâce aux classes ```.justify-content-*``` qu’on va devoir appliquer à la ligne en soi.
Nous allons pouvoir utiliser les classes suivantes :

    .justify-content-start : les colonnes vont se positionner en début de ligne (à gauche par défaut) ;
    .justify-content-center : les colonnes vont se positionner au milieu de la ligne ;
    .justify-content-end : les colonnes vont se positionner en fin de ligne (à droite par défaut) ;
    .justify-content-around : les colonnes vont être réparties équitablement dans la ligne. Chaque colonne va posséder le même écart à droite et à gauche, même celles situées contre les bords de la ligne (l’espacement entre le bord de la ligne et la première / dernière colonnes sera donc deux fois plus petit que l’espacement entre deux colonne) ;
    .justify-content-between : les colonnes vont être réparties équitablement dans la ligne. La première colonne va être collée contre le début de la ligne et la dernière va être collée contre la fin de celle-ci.

### Supprimer les gouttières ou padding entre les colonnes
classe `.no-gutters`

### Renvoyer des colonnes à la ligne
Nous allons pouvoir forcer le renvoi de colonnes à la ligne en utilisant un hack qui consiste à insérer un élément avec une largeur de 100% à l’endroit où l’on souhaite renvoyer les colonnes à la ligne.
Pour cela, nous utiliserons généralement un div entre nos colonnes ainsi que les classes relatives aux dimensions Bootstrap (en l’occurence ici la classe `.w-100`)

### Gérer l’ordre d’affichage des colonnes
Les classes Bootstrap .order-* vont nous permettre de modifier l’ordre visuel de notre contenu.
Nous allons ainsi pouvoir choisir dans quel ordre doit apparaitre notre contenu en passant une classe `.order-1`, `.order-2`… `.order-12` 
à chacun de nos éléments représentant nos colonnes et qui va déterminer l’ordre d’affichage visuel de celles-ci dans la ligne.

Le principe est simple : une colonne avec une classe `.order-*` possédant un chiffre plus petit s’affichera avant une colonne avec une classe `.order-*` possédant un chiffre plus grand.
> différence de comportement par rapport au tutoriel : les colonnes dont l'ordre n'est pas spécifié n'apparaissent pas en premier

### Imbriquer des lignes les unes dans les autres
Pour créer des designs complexes, on va également pouvoir imbriquer des lignes dans d’autres lignes ou plus exactement imbriquer des lignes dans des colonnes. Cela va nous permettre d’avoir en quelques sortes plusieurs « niveaux de grilles ».

Pour faire cela, il va suffire d’ajouter un ou plusieurs éléments avec des classes `.row` comme enfant direct d’un élément portant une classe de type `.col-*`. 

### Sélecteurs éléments et sélecteurs de classes
Pour utiliser Bootstrap de manière optimale, il faut avant tout bien comprendre que le CSS défini dans ce framework peut être divisé en deux parties distinctes : une partie « sélecteurs de classe » et une partie « sélecteur d’éléments ».

La partie « sélecteurs d’éléments » se base sur un fichier nommé Reboot qui est lui-même inspiré d’un autre fichier nommé Normalize.
L’intention derrière ce fichier est de normaliser le comportement de certains éléments HTML en leur appliquant des styles de base afin d’avoir un comportement cohérent d’un navigateur à l’autre.
Les styles définis via les sélecteurs éléments sont automatiquement appliqués à nos éléments dès qu’on utilise Bootstrap.

La partie « sélecteurs de classes » définit un ensemble de classes qu’on va pouvoir utiliser pour styliser notre contenu HTML, en incluant les attributs class HTML relatifs aux sélecteurs associés.
Les styles liés à un sélecteur de classe ne sont appliqués à un élément que si on décide d’ajouter un attribut class de même nom à cet élément.

