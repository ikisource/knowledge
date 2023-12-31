# Git

## Les branches

Créer la branche `fixbug`
```
git branch fixbug
```
Créer une branche à partir d'un commit
```
git branch <branch> <commit hash>
```


Lister les branches locales
```
git branch
```

Lister les branches distantes

```
git branch -r
```
Fusionner la branche `fixbug` sur master

```
git checkout master
git merge fixbug
```

Supprimer la branche locale `fixbug`

```
git branch -d fixbug
```

Supprimer la branche distante `fixbug`

```
git push origin --delete fixbug
```

## Merge de deux branches

https://codeur-pro.fr/difference-entre-git-merge-et-git-rebase/
https://www.youtube.com/watch?v=E0xhJLJxgaY

La commande git merge permet de ramener les modifications d’une branche qui à bifurqué de la branche courante.
Voici un exemple ici avec master et develop.

Pour réaliser un merge, il faut:

1. Se placer sur la branche de destination. C’est à dire, la branche qui va recevoir les modifications d’une autre branche: git checkout [nom_branche]
2. Puis utiliser la commande: git merge [branche_a_merge]

Il existe deux cas de figure pour le merge

### Commit de merge

Si les deux branches possèdent des commits propres, alors, git est obligé de faire un commit de merge pour avoir l’historique des deux branche.
Donc, le commit de merge possède deux parents.

![](/home/olivier/dev/knowledge/scm/git/merge.png)

merge de `develop` sur `master`
```
git checkout master
git pull
git merge develop
```

un commit de merge est alors créé pour permettre d’avoir dans master, les commits de master avant le merge et les commits de develop.
On note ici que G a alors deux parents (D et 2)

Le commit de merge permet de reverser les modifications d’une branche vers une autre tout en laissant l’historique explicite.
La branche reversée sera toujours présente dans l’historique et ainsi il sera toujours possible de voir :

- Depuis quel commit la branche est partie
- Quels commits ont étés fait dans cette branche
- Quand les deux branches ont été mergées

### Le fast-forward

Si l’historique entre les deux branches est linéaire, alors un simple fast-forward est appliqué.
Cela signifie que la branche de destination va remonter les commits pour venir au même niveau que la branche à merger.
Cela n’entraîne donc pas la création d’un commit de merge.
![](/home/olivier/dev/knowledge/scm/git/fast-forward.png)

## Faire un rebase d’une branche

### Rebase simple

La commande git rebase permet de rebase une branche sur une autre. Cela consiste à déplacer le point de départ de la première à la suite de la seconde:

1. Se déplacer sur la branche à rebase: git checkout
2. Utiliser la commande git rebase

Attention: les deux branches doivent avoir au moins un commit en commun (ancêtre commun)
![](/home/olivier/dev/knowledge/scm/git/rebase.png)

rebase de la branche develop sur la branche master
```
git checkout develop
git pull
git rebase master
```
On se retrouve alors avec la branche develop qui part de master mais depuis le commit D au lieu du commit B initialement.

### Rebase + fast-forward

Le rebase d’une branche sur une autre amène les deux branches dans une situation de fast-forward.
Il est alors possible de les merges sans faire de commit de merge.
![](/home/olivier/dev/knowledge/scm/git/rebase fast-forward.png)
à la suite du rebase précédent, on souhaite merge develop dans master

    git checkout master
    git merge develop

Un fast-forward est alors appliqué entre nos deux branches.

## Annuler un merge

```
git merge –-abort
```

## Supprimer le fichier `.classpath` sur le repository distant

```
git rm --cached .classpath
git commit -m ‘delete remote file’
git push
```

## Les logs

Historique des validations

```
git log
git log -p -2
git log --stat
git log --pretty=oneline
```

## Annuler des actions

Ajouter un fichier oublié au dernier commit

```
git commit --amend
git commit -m 'validation initiale'
git add fichier_oublie
git commit --amend
```

Désindexer le fichier `file1`

```
git reset HEAD file1
```

Réinitialiser le fichier `file1`

```
git checkout -- file.txt
```

## pull et fetch

La commande git fetch va récupérer toutes les données des commits effectués sur la branche courante qui n'existent pas encore dans votre version en local.
Ces données seront stockées dans le répertoire de travail local mais ne seront pas fusionnées avec votre branche locale.
Si vous souhaitez fusionner ces données pour que votre branche soit à jour, vous devez utiliser ensuite la commande git merge.

git pull = git fetch + git merge

## Supprimer un commit
```
git reset --hard <commit hash>
```

## Liens

[git-scm](https://git-scm.com/book/fr/v2/Les-bases-de-Git-D%C3%A9marrer-un-d%C3%A9p%C3%B4t-Git)

[Introduction à GIT](https://perso.liris.cnrs.fr/pierre-antoine.champin/enseignement/intro-git/)

Maîtrisez le développement collaboratif de logiciel avec Git https://gitlab.rennes.ariadnext.com/Doc-Control/icheckit4u-server-backend/-/pipelines

https://git-scm.com/docs/git-merge




