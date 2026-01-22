-- --- 🕵️ CONFORMITÉ RGPD : ANONYMISATION DES DONNÉES ---

-- 1. On supprime la vue si elle existe déjà (pour éviter les erreurs)
DROP VIEW IF EXISTS customers_rgpd_view;

-- 2. Création de la vue anonymisée
-- On garde la 1ère lettre du prénom, on masque le nom et l'email.
CREATE VIEW customers_rgpd_view AS
SELECT 
    customer_id,
    LEFT(first_name, 1) || '****' AS prenom_masque,
    'NOM_CONFIDENTIEL' AS nom_masque,
    '*****@****.com' AS email_masque
FROM customers;

-- 3. PREUVE : Affichage des données anonymisées
SELECT * FROM customers_rgpd_view LIMIT 5;
