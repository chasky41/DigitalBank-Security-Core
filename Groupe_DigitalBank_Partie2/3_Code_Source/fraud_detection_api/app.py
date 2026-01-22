from flask import Flask, request, jsonify
import pandas as pd
from sklearn.ensemble import RandomForestClassifier
import datetime

app = Flask(__name__)

print("--- 🏦 DIGITALBANK SECURITY API v2.0 ---")
print("⏳ Initialisation du modèle IA...")

# 1. ENTRAINEMENT AU DÉMARRAGE
try:
    df = pd.read_csv('sample_transactions.csv')
    X = df[['amount', 'hour_of_day']]
    y = df['is_fraud']
    model = RandomForestClassifier(n_estimators=50, random_state=42)
    model.fit(X, y)
    print("✅ Modèle IA chargé et opérationnel.")
except Exception as e:
    print(f"❌ Erreur critique IA : {e}")
    model = None

@app.route('/detect', methods=['POST'])
def detect_fraud():
    data = request.json
    amount = data.get('amount', 0)
    hour = data.get('hour', 12)
    location = data.get('location', 'Unknown')

    # RÈGLE 1 : Montant extrême (>10k)
    if amount > 10000:
        return jsonify({"action": "BLOCK", "reason": "Montant critique", "score": 1.0})

    # RÈGLE 2 : IA
    if model:
        prediction = model.predict([[amount, hour]])[0]
        if prediction == 1:
             return jsonify({"action": "BLOCK", "reason": "IA Detection", "score": 0.95})

    return jsonify({"action": "ALLOW", "reason": "Safe", "score": 0.0})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
