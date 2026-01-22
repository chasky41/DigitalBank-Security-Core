#!/bin/bash
echo "--- 🛡️ CONFIGURATION DE LA SÉCURITÉ RÉSEAU (UFW) ---"

# 1. On remet tout à zéro (Reset) pour être propre
echo "[1/5] Réinitialisation des règles..."
sudo ufw reset

# 2. On ferme toutes les portes par défaut (Sécurité maximale)
echo "[2/5] Blocage de tout le trafic entrant..."
sudo ufw default deny incoming

# 3. On ouvre seulement ce qui est nécessaire
echo "[3/5] Ouverture des services vitaux..."
sudo ufw allow ssh          # Pour l'administration à distance
sudo ufw allow 5432/tcp     # Pour la Base de Données PostgreSQL
sudo ufw allow 5000/tcp     # Pour notre API Anti-Fraude (Python)
sudo ufw allow 3000/tcp     # Pour le Dashboard (Metabase)

# 4. On active le Pare-feu
echo "[4/5] Activation du Pare-feu..."
# On force le "oui" pour ne pas avoir à taper entrée
echo "y" | sudo ufw enable

# 5. On affiche le résultat (Preuve)
echo "[5/5] VÉRIFICATION DU STATUT :"
sudo ufw status verbose
