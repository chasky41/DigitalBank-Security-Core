import time
import random
import datetime

print("--- 🤖 ROBOT SENTINELLE DIGITALBANK (Watchdog v1.0) ---")
print("✅ Connexion à la base de données établie.")
print("👀 Surveillance des flux en temps réel active...")
print("-----------------------------------------------------")

# Simulation d'une boucle infinie de surveillance
try:
    while True:
        # On attend 3 secondes entre chaque scan
        time.sleep(3)
        
        timestamp = datetime.datetime.now().strftime("%H:%M:%S")
        
        # Simulation : 20% de chance de détecter une anomalie
        chance = random.randint(1, 100)
        
        if chance > 80:
            # SCÉNARIO 1 : Attaque Brute Force
            ip_source = f"45.123.{random.randint(1,255)}.{random.randint(1,255)}"
            print(f"[{timestamp}] ⚠️  ALERTE SÉCURITÉ : Tentatives de connexion multiples !")
            print(f"    -> Source : {ip_source}")
            print(f"    -> Action Automatique : IP ajoutée à la Blacklist Firewall [OK]")
            print(f"    -> Notification : Envoyée au canal #Security-Ops")
            print("-----------------------------------------------------")
            
        elif chance < 10:
            # SCÉNARIO 2 : Transaction Élevée
            amount = random.randint(5000, 20000)
            print(f"[{timestamp}] 💰 INFO : Grosse transaction détectée ({amount}€)")
            print(f"    -> Action : Vérification IA demandée...")
            print(f"    -> Statut : En attente de validation humaine.")
            print("-----------------------------------------------------")
            
        else:
            # Tout va bien
            print(f"[{timestamp}] ✅ Scan terminé. RAS. Système stable.", end="\r")

except KeyboardInterrupt:
    print("\n🛑 Arrêt du robot par l'administrateur.")
