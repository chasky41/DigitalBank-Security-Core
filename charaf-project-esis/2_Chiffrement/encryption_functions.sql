-- INSTALLATION ET CHIFFREMENT
-- 1. On active l'outil de crypto
CREATE EXTENSION IF NOT EXISTS pgcrypto;

-- 2. Fonction de chiffrement
CREATE OR REPLACE FUNCTION encrypt_card_number(card_number TEXT)
RETURNS TEXT AS $$
BEGIN
    RETURN encode(encrypt(card_number::bytea, 'CleSecreteExam2026', 'aes'), 'base64');
END;
$$ LANGUAGE plpgsql;

-- 3. On chiffre les données
UPDATE cards SET card_number = encrypt_card_number(card_number);

-- 4. PREUVE : On vérifie que c'est illisible
SELECT card_id, card_number FROM cards LIMIT 5;

