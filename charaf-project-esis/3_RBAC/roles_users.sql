-- GESTION DES RÔLES
-- 1. Nettoyage (au cas où on relance)
DROP USER IF EXISTS admin_user;
DROP USER IF EXISTS analyst_user;
DROP USER IF EXISTS app_user;

-- 2. Création des utilisateurs avec mots de passe
CREATE USER admin_user WITH PASSWORD 'Admin123!';
CREATE USER analyst_user WITH PASSWORD 'Analyst123!';
CREATE USER app_user WITH PASSWORD 'App123!';

-- 3. Attribution des droits (Admin = Tout, Analyst = Lecture seule)
GRANT ALL PRIVILEGES ON DATABASE digitalbank_restored TO admin_user;
GRANT CONNECT ON DATABASE digitalbank_restored TO analyst_user;
GRANT SELECT ON ALL TABLES IN SCHEMA public TO analyst_user;

-- 4. PREUVE : Liste des rôles
\du
