# Docker

## Présentation de Docker
Docker est un conteneur d’application. Il a pour rôle principal d’isoler une application.

https://www.docker.com/

https://hub.docker.com/

Un conteneur ne peut pas contenir d’OS.


## Installer Docker sous Ubuntu
https://docs.docker.com/engine/install/ubuntu/

```
sudo apt-get update
sudo apt-get install ca-certificates curl gnupg
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```

## Verify that the Docker Engine installation is successful by running the hello-world image.
```
sudo docker run hello-world
```

## Pull the latest image of postgres

```docker pull postgres```

## Pull a specific version of postgres
```docker pull postgres:14.5```

## Run postgres
```docker run --name postgres -e POSTGRES_USER=javajpa -e POSTGRES_PASSWORD=javajpa -e POSTGRES_DB=javajpa -p 5455:5432 -d postgres```

## enter docker instance of postgres
docker exec -it d573 bash

## Lancer postgres
psql -U postgres

### create schema javajpa

## Voir les images téléchargées
```
docker images
```

## Lister les conteneurs

Lister les conteneurs actifs
```
docker ps
```

## Lister tous les conteneurs
```
docker ps -a
```

## Arrêter un conteneur
```
docker stop <4 premiers caractère de l’id ou nom>
```

##  Supprimer un conteneur
```
docker rm <4 premiers caractère de l’id ou nom>
```

## Supprimer une image
```
docker rmi <nom image>
```

## Mapper les ports
Si on ne mappe pas les ports, l’application qui s’exécute à l’intérieur de docker est inaccessible depuis l’extérieur du conteneur.

## Lancer nginx en mappant le port interne docker (80) sur le port externe 8082
```
docker run -d -p 8082:80 nginx
```

## Pour accéder à nginx depuis la machine hébergeant docker
```
localhost:8082
```

## Exécuter une commande dans un conteneur (EXEC)
Par exemple on démarre un conteneur mySQL

```docker run --name my-mysql -e MYSQL_ROOT_PASSWORD=root -d mysql```

Ensuite on exécute la commande mysql

```docker exec -it my-mysql --password```

Si on veut ouvrir une session bash

```docker exec -it my-mysql bash```

## Mapper des volumes
Au démarrage, par exemple pour mysql:
docker run -v /opt/dir:/var/lib/mysql mysql

Attacher un docker
docker attach <docker id>

Logs
docker logs <id ou name>

Exposer l’API REST de Docker
Éditer le fichier /lib/systemd/system/docker.service
Ajouter à la ligne qui commence par ExecStart
l’argument -H=tcp://0.0.0.0:2375
Relancer le démon docker : systemctl daemon-reload
Relancer le service docker : service docker restart
Tester avec : curl http://localhost:2375/images/json


Dockerfile
Exemple : projet docker1
api REST /about sur le port 8080
FROM openjdk:17
# Default location for Spring Boot application working Tomcat directories
VOLUME /tmp

# Add executable springboot fat jar to image
ADD ./build/libs/docker1-0.0.1-SNAPSHOT.jar /docker1.jar

CMD ["java", "-jar", "/docker1.jar"]

# docker internal port to be exposed
EXPOSE 8080

Construire l’image
Projet docker1 : api REST /about sur le port 8080

Construire le bootJar
gradlew bootJar

Créer l’image :
docker build -t docker1 .

Réseau
Il existe trois modes réseau :
• bridge (par défaut)


    • none
    • host
commande pour lister les network :
docker network ls
NETWORK ID     NAME      DRIVER    SCOPE
338d07e0318a   bridge    bridge    local
c2fbe53670ba   host      host      local
312e808a62f8   none      null      local

Inspecter un conteneur
Permet d’avoir des informations détaillées sur le container.
docker inspect <id ou nom>




docker compose
Pour gérer plusieurs containers
S’appuie sur un descripteur de déploiement au format YAML

Installer docker-compose
apt-get install docker-compose

