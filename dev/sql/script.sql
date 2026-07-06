DROP TABLE IF EXISTS utilisateur;
CREATE TABLE utilisateur (
                             id SERIAL PRIMARY KEY,
                             prenom VARCHAR(100)
);

DROP TABLE IF EXISTS commande;
CREATE TABLE commande (
                             id SERIAL PRIMARY KEY,
                             date_achat date,
                             num_facture integer
);

