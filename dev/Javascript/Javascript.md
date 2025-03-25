# Javascript

## Les variables

### Déclaration avec 'var'

- Portée de fonction : Les variables déclarées avec var ont une portée de fonction. Cela signifie qu'elles sont
  accessibles dans toute la fonction dans laquelle elles sont déclarées, même si elles sont déclarées à l'intérieur d'un
  bloc (comme une boucle for ou une condition if).
- Hoisting : Les déclarations de variables avec var sont "hoisted" (remontées) au début de leur portée. Cela signifie
  que la déclaration est déplacée en haut de la fonction ou du script, mais l'initialisation reste à l'endroit où elle
  est écrite.

```
function example() {
    console.log(x); // undefined (signifie plutôt non initialisé)
    var x = 10;
    console.log(x); // 10
}
```

Les variables déclarées avec var peuvent être réinitialisées dans la même portée.

```
var x = 10;
var x = 20; // Réinitialisation valide
console.log(x); // 20
```

### Déclaration avec 'let'

- Portée de bloc : Les variables déclarées avec let ont une portée de bloc. Cela signifie qu'elles sont accessibles
  uniquement dans le bloc (par exemple, une boucle for ou une condition if) dans lequel elles sont déclarées.
- Hoisting : Les déclarations de variables avec let sont également "hoisted", mais elles ne sont pas initialisées.
  Accéder à une variable let avant sa déclaration entraîne une ReferenceError.

### Différences de portée entre var et let

Lorsqu’on utilise la syntaxe let pour définir une variable à l’intérieur d’une fonction en JavaScript, la variable va
avoir une portée dite « de bloc » : la variable sera accessible dans le bloc dans lequel elle a été définie et dans les
blocs que le bloc contient.

En revanche, en définissant une variable avec le mot clef var dans une fonction, la variable aura une portée élargie
puisque cette variable sera alors accessible dans tous les blocs de la fonction.

```
function portee() {
  let x = 1;
  var y = 2;

  if (true) {
    let x = 5;
    var y = 10; // même variable qu'au dessus, y passe de la valeur 2 à 10
    console.log("x dans bloc if = " + x);
    console.log("y dans bloc if = " + y);
  }
  console.log("x en dehors du bloc if = " + x);
  console.log("y en dehors du bloc if = " + y);
}
portee();
```

Affichage dans la console :

x dans bloc if = 5  
y dans bloc if = 10  
x en dehors du bloc if = 1  
y en dehors du bloc if = 10

```
function example() {
    console.log(x); // ReferenceError: Cannot access 'x' before initialization
    let x = 10;
    console.log(x); // 10
}
```

Les variables déclarées avec let ne peuvent pas être réinitialisées dans la même portée.

```
let x = 10;
let x = 20; // SyntaxError: Identifier 'x' has already been declared
```

Exemple Comparatif var / let

```
function varExample() {
  if (true) {
    var x = 10;
  }
  console.log(x); // 10 (accessible en dehors du bloc)
}
function letExample() {
  if (true) {
    let y = 20;
  }
  console.log(y); // ReferenceError: y is not defined (non accessible en dehors du bloc)
}
```

### Déclaration d'une constante

```
const prenom = "Olivier";
console.log(prenom); // affiche 'Olivier' dans la console
prenom = "Paul"; // non autorisé (Uncaught TypeError: invalid assignment to const 'prenom')
```

### Variables de type chaîne de caractères

```
var prenom = "Olivier"
var prenom = 'Olivier'
var phrase = "Je m'appelle Olivier." // ça marche aussi avec des guillements simples
var phrase = 'Je m\'appelle Olivier.' // échappement du caractère de fermeture de la chaine
```

#### Concaténation de chaînes de caractères

```
var chaine1 = "Hello";
var chaine2 = chaine1 + " world !";
console.log(chaine2); // affiche 'Hello world !'
var chaine3 = `${chaine1} world !`;  // autre façon de concaténer, utile si le nombre de concaténations est élevé.
console.log(chaine2); // affiche 'Hello world !'
```

## Les types de données

```
let string = "chaîne de caractères";
let number = 24;
let boolean = false;
let array = ["A", "B", "C"];
let object = {
    prenom : "Olivier",
    age : 34,
    ville : "Biarritz"
}
let arbre; // affiche 'undefined' dans la console
```

## Les opérateurs

```
let addition = 14 + 5;
console.log(addition); // affiche 19

let subtraction = 14 - 4;
console.log(subtraction); // affiche 10

let division = 12 / 3;
console.log(division); // affiche 4

let division2 = 10 / 4;
console.log(division2); // affiche 2.5

let multiplication = 15 * 4;
console.log(multiplication); // affiche 60

let powerOf = 2 ** 3;
console.log(powerOf); // affiche 8

let modulo = 10 % 4;
console.log(modulo); // affiche 2
```

### Les opérateurs d'affectation

#### Opérateur ++

```
let total = 10;
total++;
console.log(total); // affiche 11
```

#### Opérateur --

```
let total = 10;
total--;
console.log(total); // affiche 9
```

#### Opérateur +=

```
let total = 10;
total += 5;
console.log(total); // affiche 15
```

#### Opérateur -=

```
let total = 10;
total -= 2;
console.log(total); // affiche 8
```

#### Opérateur *=

```
let total = 10;
total *= 2;
console.log(total); // affiche 20
```

#### Opérateur /=

```
let total = 10;
total /= 4;
console.log(total); // affiche 2.5
```

## Structures de contrôle

### Structure if

```
let x = 2;
let y = 5;
if (x > y) {
  alert("x > y");
} else {
  alert("y > x");
}
```

### Tester l'existence d'une variable

```
if (x) {  // test l'existence de la variable 'x'
  console.log("x existe.");
}
```

### Tester l'égalité de deux variables en type et valeur (===)

```
let x = 2;
let y = 5;
if (x = y) {  // ne teste pas l'égalité mais on affecte le contenu de y à x
  console.log(x); // affiche 5
}
```

```
let x = 2;
let y = 5;
if (x === y) { // teste l'égalité de type et de valeur de x et y
  console.log("x et y égaux");
} else {
  console.log("pas égaux"); // cette ligne est affichée
}
```

### Tester l'égalité de deux variables en valeur (==)

```
let x = 2;
let y = "2";
if (x == y) { // teste l'égalité de valeurs de x et y
  console.log("x et y ont la même valeur"); // cette ligne est affichée
} else {
  console.log("x et y n'ont pas la même valeur");
}
```

### Opérateurs logiques

#### Opérateur ET

Lorsqu’il est utilisé avec des valeurs booléennes, renvoie true si toutes les comparaisons sont évaluées à true ou false
sinon

```
let x = 2;
let y = 10;
if (x < y && x > 1) {
  console.log("condition vraie"); // est affichée
}
```

#### Opérateur OU

Lorsqu’il est utilisé avec des valeurs booléennes, renvoie true si au moins l’une des comparaisons est évaluée à true ou
false sinon

```
let x = 2;
let y = 10;
if (x < y || x > 3) {
  console.log("condition vraie"); // est affichée car x < y est vrai
}
```

#### Opérateur NOT

Renvoie false si une comparaison est évaluée à true ou renvoie true dans le cas contraire

```
let boolean = false;
if (!boolean) {
  console.log("condition vraie"); // est affichée
}
```

## Les fonctions

```
function doSomething() {
  console.log("Je fais un truc");
}
doSomething(); // appel de la fonction
```

```
function multiplication(a, b) {
  console.log(a + " * " + b + " = " + a * b);
}
multiplication(2, 10);
```

### Lambda Expressions

```
const addition = (a, b) => {
  return a + b;
};
console.log(addition(2, 10));
```

## La portée des variables

La portée d’une variable désigne l’espace du script dans laquelle elle va être accessible.
En JavaScript, il n’existe que deux espaces de portée différents :

- l’espace global
- l’espace local

Pour rester très simple, l’espace global désigne l’entièreté d’un script à l’exception de l’intérieur de nos fonctions.
L’espace local désigne, à l’inverse, l’espace dans une fonction.

Une variable définie dans l’espace global d’un script va être accessible à travers tout le script, même depuis une
fonction. En revanche, une variable définie dans une fonction n’est accessible que dans cette même fonction et ne peut
pas être manipulée depuis l’espace global du script.

## Le DOM

Le Document Object Model est une interface de programmation qui permet à des scripts d'examiner et de modifier le
contenu du navigateur Web. Par le DOM, la composition d'un document HTML est représentée sous forme d'un jeu d'objets -
lesquels peuvent représenter une fenêtre, une phrase ou un style, par exemple - reliés selon une structure en arbre.




