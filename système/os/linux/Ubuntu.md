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

# Ubuntu

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

# Le micro ne fonctionne pas
Il faut choisir l'option "duplex stéréo analogique" dans la section audio interne de l'onglet configuration de PulseAudio

# Le bluetooth ne fonctionne plus
La catégorie bluetooth n'apparaît plus dans la configuration système.
https://wiki.archlinux.org/title/Bluetooth_headset#Configuration_via_CLI
En ligne de commande
$ bluetoothctl
[bluetooth]# power on
[bluetooth]# agent on
[bluetooth]# default-agent
[bluetooth]# scan on
Device 78:5E:A2:C1:69:D9 WONDERBOOM 3
[bluetooth]# pair 78:5E:A2:C1:69:D9
Pairing successful
[bluetooth]# connect 78:5E:A2:C1:69:D9
[bluetooth]# trust 78:5E:A2:C1:69:D9

Installation de l'application graphique bluedevil
https://wiki.archlinux.org/title/bluetooth#Graphical
sudo apt-get install bluedevil
La catégorie bluetooth réapparaît dans la configuration !

si l'erreur suivante apparaît lors de la connection "Failed to connect: org.bluez.Error.Failed br-connection-create-socket"
c'est parce ce qu'un autre appareil est déjà connecté.

## Je n'arrive pas redémarrer le bluetooth
Je n'ai pas encore identifier la commande efficace. Essayer la prochaine fois parmi les commandes suivantes :
sudo service bluetooth restart|start|stop|status
rfkill block bluetooth
rfkill unblock bluetooth
sudo modprobe -r btusb && sudo modprobe btusb

# Lister les ports
sudo netstat -tunlp






