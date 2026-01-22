import pandas as pd

print("--- 🕵️‍♂️ ANALYSEUR DE LOGS DIGITALBANK ---")

try:
    # Lecture du fichier de logs
    # On utilise le nom exact du fichier que tu viens de créer
    df = pd.read_csv('auth_logs_20251201-20251208.log', 
                     sep=' \| ', engine='python', 
                     names=['time', 'ip', 'user', 'action', 'status'],
                     skiprows=1)

    # On cherche ceux qui ont échoué (FAILED)
    echecs = df[df['status'].str.contains('FAILED')]
    
    # On compte qui a échoué le plus souvent
    suspects = echecs['ip'].value_counts()

    print("\n🚨 ALERTE : IP SUSPECTES DÉTECTÉES")
    print(suspects.head(3))
    
    # On crée le fichier CSV de preuve
    suspects.to_csv('ips_suspectes.csv')
    print("\n✅ Fichier de preuve 'ips_suspectes.csv' généré.")

except Exception as e:
    print(f"Erreur : {e}")
