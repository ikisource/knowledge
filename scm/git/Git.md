# Git

## Les branches

Créer la branche `fixbug`

```
git branch fixbug
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

Annuler un merge

```
git merge –abort
```

Supprimer le fichier `.classpath` sur le repository distant

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

La commande git fetch va récupérer toutes les données des commits effectués sur la branche courante qui n'existent pas encore dans votre version en local. Ces données seront stockées dans le répertoire de travail local mais ne seront pas fusionnées avec votre branche locale. Si vous souhaitez fusionner ces données pour que votre branche soit à jour, vous devez utiliser ensuite la commande git merge.

git pull = git fetch + git merge


## Liens

[git-scm](https://git-scm.com/book/fr/v2/Les-bases-de-Git-D%C3%A9marrer-un-d%C3%A9p%C3%B4t-Git)

[Introduction à GIT](https://perso.liris.cnrs.fr/pierre-antoine.champin/enseignement/intro-git/)








