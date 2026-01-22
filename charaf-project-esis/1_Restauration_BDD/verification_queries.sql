-- PREUVE DE RESTAURATION
-- 1. Nombre de clients (Doit être 10)
SELECT COUNT(*) FROM customers;

-- 2. Nombre de transactions (Doit être ~10 ou 30)
SELECT COUNT(*) FROM transactions;

-- 3. Top clients actifs
SELECT c.first_name, COUNT(t.transaction_id) as nb_transactions
FROM customers c
JOIN accounts a ON c.customer_id = a.customer_id
JOIN transactions t ON a.account_id = t.account_id
GROUP BY c.first_name
ORDER BY nb_transactions DESC;

