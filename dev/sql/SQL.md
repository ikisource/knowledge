# SQL

# Exemple de modèle

## **1.1. Table `utilisateur`**
   id | nom          | email               | date_inscription |
 |----|--------------|---------------------|------------------|
 | 1  | Alice Dupont | alice@example.com   | 2023-01-15       |
 | 2  | Bob Martin   | bob@example.com     | 2023-02-20       |
 | 3  | Charlie Lee  | charlie@example.com | 2023-03-10       |
 | 4  | David Kim     | david@example.com    | 2023-04-05     |

## **1.2. Table `produit`**
 | id | nom            | prix   | categorie    |
 |----|----------------|--------|--------------|
 | 1  | iPhone 13      | 899.99 | Électronique |
 | 2  | T-shirt coton  | 19.99  | Vêtements    |
 | 3  | Livre SQL      | 29.99  | Livres       |
 | 4  | Robot culinaire| 199.99 | Maison       |

## **1.3. Table `commande`**
 | id | utilisateur_id | produit_id | quantite | date_commande       | statut   |
 |----|----------------|------------|----------|---------------------|----------|
 | 1  | 1              | 1          | 1        | 2023-05-10 14:30:00 | livrée   |
 | 2  | 1              | 3          | 1        | 2023-05-10 14:30:00 | livrée   |
 | 3  | 2              | 4          | 1        | 2023-06-15 09:45:00 | livrée   |
 | 4  | 3              | 2          | 2        | 2023-07-20 16:45:00 | en cours |
 | 5  | 1              | 3          | 1        | 2023-08-05 11:20:00 | annulée  |

