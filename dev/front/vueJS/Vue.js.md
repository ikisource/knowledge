# Vue.js

Vue.js (aussi appelé plus simplement Vue), est un framework JavaScript open-source utilisé pour construire des
interfaces utilisateur et des applications web monopages. Vue a été créé par Evan You et est maintenu par lui et le
reste des membres actifs de l'équipe principale travaillant sur le projet et son écosystème.

## Modèle MVVM

Le modèle MVVM permet de séparer de manière nette la logique métier et la logique de présentation d’une application de
son interface utilisateur (IU). Le maintien d’une séparation nette entre la logique d’application et l’IU permet de
résoudre de nombreux problèmes de développement et de faciliter le test, la maintenance ainsi que l’évolution d’une
application.

Il existe trois composants principaux dans le modèle MVVM : le modèle, la vue et le modèle de vue. Chacun sert un
objectif distinct. Le diagramme ci-dessous montre les relations entre les trois composants.

![](images/mvvm-pattern.png)

La vue « connaît » le modèle de vue, et le modèle de vue « connaît » le modèle, mais le modèle ignore l’existence du
modèle de vue et le modèle de vue ignore l’existence de la vue.

### Modèle

Les classes de modèle sont des classes non visuelles qui encapsulent les données de l’application. Ainsi, le modèle peut
être considéré comme une représentation du modèle de domaine de l’application, qui comprend généralement un modèle de
données avec une logique métier et une logique de validation.

### Vue

La vue est chargée de définir la structure, la disposition et l’apparence de ce que l’utilisateur voit à l’écran.

### Vue-Model

Le modèle de vue implémente des propriétés et des commandes avec lesquelles la vue peut effectuer une liaison aux
données. Il notifie la vue de tout changement d’état via des événements de notification de changement. Les propriétés et
les commandes fournies par le modèle de vue définissent la fonctionnalité à offrir par l’IU, mais la vue détermine la
façon dont cette fonctionnalité doit être affichée.

## Utiliser Vue.js via le CDN

`<script src="https://unpkg.com/vue@3/dist/vue.global.js"></script>`

```
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Projet 1-01</title>
    <script src="https://unpkg.com/vue@3/dist/vue.global.js"></script>
</head>
<body>
    <div id="app"></div>
    <script>
        const app = Vue.createApp({
            template: `<h2>Première application Vue 3</h2>
                       <p>... en trois minutes chrono !</p>`
        });
        app.mount('#app');
    </script>
</body>
</html>
```

## Propriété calculée

```
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Squelette</title>
    <script src="https://unpkg.com/vue@3/dist/vue.global.js"></script>
</head>
<body>
    <div id="app">
        {{calcul}}
     </div>
    <script>
        const app = Vue.createApp({
            data() {
                return {
                    d:15
                }
            },
            computed : {
                calcul() {
                    return this.d
                }
            }
        });
        app.mount('#app');

    </script>
</body>
</html>
```

## Binding

```
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Projet 1-06</title>
    <script src="https://unpkg.com/vue@3/dist/vue.global.js"></script>
</head>
<body>
    <div id="app">
        <img v-bind:src=url alt="">
     </div>
    <script>
        const app = Vue.createApp({
            data() {
                return {
                    url:'https://vuejs.org/images/logo.png'
                }
            }
        });
        app.mount('#app');

    </script>
</body>
</html>
```

`<img v-bind:src=url alt="">` ou `<img :src=url alt="">`

Exercice : afficher le prénom, le nom et l'age d'une personne puis changer son age au bout de 3 s.

```
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Projet1-09</title>
    <script src="https://unpkg.com/vue@3/dist/vue.global.js"></script>
</head>
<body>
    <div id="app">
        <p>Prénom : <span v-text="person.firstName"></span></p>
        <p>Nom : <span v-text="person.lastName"></span></p>
        <p>Age : <span v-text="person.age"></span></p>
     </div>
    <script>
        const app = Vue.createApp({
            data() {
                return {
                    person: {
                        firstName:'John',
                        lastName:'Doe',
                        age:25
                    }
                }
            }
        });
        const viewModel = app.mount('#app');
        setTimeout(() => {
            viewModel.person.age = 28;
        }, 3000);
    </script>
</body>
</html>
```

## vue cli

### Installer vue cli

```
npm install -g @vue/cli
```
Vérifier la version : `vue --version`

Créer un projet : ` `

Lancer le projet : `npm run serve`










