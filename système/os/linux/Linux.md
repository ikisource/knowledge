# lister les fichiers ouverts

```
lsof -i -P
```

# lister les stats réseau

```
nstat
```

# Définir les alternatives Java avec update-alternatives

## Lister les alternatives

```
sudo update-alternatives --config java
```

## Ajouter une alternative

```
sudo update-alternatives --install /usr/bin/java java /opt/java-21/bin/java 1
```

Cinq arguments:

`--install` permet de spécifier que l'on souhaite ajouter une alternative    
`/usr/bin/java` définit l'adresse du lien  
`java` nomme l'alternative  
`/opt/java-21/bin/java` définit l'emplacement de exécutable Java  
`1` définit la priorité

## Changer le groupe et l'utilisateur d'un fichier

```
sudo chown nouvelutilisateur:nouveaugroupe monfichier.txt

```



