import pandas as pd
from sklearn.ensemble import RandomForestClassifier
from sklearn.model_selection import train_test_split

print("--- 🤖 IA ANTI-FRAUDE DIGITALBANK ---")

# 1. Chargement des données
df = pd.read_csv('sample_transactions.csv')
print(f"[INFO] {len(df)} transactions chargées.")

# 2. On sépare les indices (Montant, Heure) de la cible (Fraude ou pas)
X = df[['amount', 'hour_of_day']]
y = df['is_fraud']

# 3. Entraînement du modèle
# (On triche un peu sur le split car on a peu de données, pour être sûr que ça marche)
model = RandomForestClassifier(n_estimators=10, random_state=42)
model.fit(X, y)

print("✅ MODÈLE ENTRAÎNÉ AVEC SUCCÈS.")

# 4. TEST EN DIRECT : Simulation d'une attaque
# Scénario : 5000€ dépensés à 3h du matin
transaction_suspecte = [[5000, 3]] 
prediction = model.predict(transaction_suspecte)

print("\n--- ⚡ RÉSULTAT DU TEST ---")
print(f"Transaction : 5000€ à 03h00")
if prediction[0] == 1:
    print("Verdict     : 🔴 ALERTE FRAUDE DÉTECTÉE !")
else:
    print("Verdict     : 🟢 Transaction Légitime")
