## Installer un lanceur

Les lanceurs se trouvent dans les répertoires
* `~/.local/share/applications`
* `/usr/share/applications`

Exemple avec le lanceur de DBeaver

Créer le ficher `dbeaver.desktop` dans le répertoire `~/.local/share/applications`

```
[Desktop Entry]
Encoding=UTF-8
Version=1.0
Type=Application
Name=DBeaver
Icon=/opt/dbeaver/dbeaver.png
Path=/opt/dbeaver/
Exec=/opt/dbeaver/dbeaver
StartupNotify=false
Name[fr_FR]=DBeaver
```

Afficher les applications (carré à 9 points en bas à droite)

Chercher DBeaver et faire clic droit "Ajouter aux favoris"