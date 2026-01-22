-- --- 🛡️ SYSTÈME D'AUDIT ET DE TRAÇABILITÉ ---

-- 1. Création de la table des logs (La boîte noire)
DROP TABLE IF EXISTS audit_logs;
CREATE TABLE audit_logs (
    log_id SERIAL PRIMARY KEY,
    user_id TEXT,           -- Qui a fait l'action ?
    action VARCHAR(50),     -- QUOI ? (UPDATE, DELETE...)
    table_name VARCHAR(50), -- OÙ ? (Comptes, Clients...)
    query_text TEXT,        -- La commande exacte
    timestamp TIMESTAMP DEFAULT NOW()
);

-- 2. La fonction Espionne (Le Trigger)
CREATE OR REPLACE FUNCTION log_audit_action()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO audit_logs (user_id, action, table_name, query_text)
    VALUES (
        current_user,       -- L'utilisateur connecté (ex: admin_user)
        TG_OP,              -- L'opération détectée
        TG_TABLE_NAME,      -- La table touchée
        current_query()     -- La preuve
    );
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- 3. Installation des pièges sur les COMPTES
DROP TRIGGER IF EXISTS audit_accounts_changes ON accounts;
CREATE TRIGGER audit_accounts_changes
AFTER UPDATE OR DELETE ON accounts
FOR EACH ROW EXECUTE FUNCTION log_audit_action();

-- 4. Installation des pièges sur les CLIENTS
DROP TRIGGER IF EXISTS audit_customers_changes ON customers;
CREATE TRIGGER audit_customers_changes
AFTER UPDATE OR DELETE ON customers
FOR EACH ROW EXECUTE FUNCTION log_audit_action();

-- 5. TEST DE PREUVE : On simule une modification suspecte
-- On change le solde du compte 1 (Fraude interne)
UPDATE accounts SET balance = balance + 999999 WHERE account_id = 1;

-- 6. AFFICHAGE DES PREUVES
SELECT * FROM audit_logs ORDER BY timestamp DESC LIMIT 5;
