# PostgreSQL

## Se connecter à Postgresql

```
sudo -u postgres psql
```

## Créer un utilisateur

```
CREATE USER <user> WITH PASSWORD <password>;
```
ex : CREATE USER commerce WITH PASSWORD 'commerce';


## Créer une nouvelle base

```
CREATE DATABASE <ma_base>;
```
ex: CREATE DATABASE commerce OWNER commerce;

## Se connecter à une base

```
\connect <database_name>
```

## Afficher les tables

```\dt```

## Aficher les utilisateurs
```
SELECT usename AS utilisateur FROM pg_user;
```

