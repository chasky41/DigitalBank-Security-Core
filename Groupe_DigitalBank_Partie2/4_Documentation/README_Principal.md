# 🏦 PLATEFORME DE SÉCURITÉ DIGITALBANK (Partie 2)

## 📋 Présentation
Suite à la cyberattaque du 15 décembre 2025, nous avons développé une plateforme "DevSecOps" pour sécuriser et monitorer les transactions bancaires en temps réel.

## 🏗️ Architecture Technique
- **Backend API** : Python Flask + Scikit-Learn (IA Random Forest).
- **Base de Données** : PostgreSQL 14 (Chiffrement AES-256 + Audit Logs).
- **Visualization** : Metabase (Docker).
- **Automatisation** : Script Python Watchdog (Indépendant du Cloud).

## 🚀 Guide de Démarrage Rapide

### 1. Prérequis
- Linux / Kali
- Docker & Docker Compose
- Python 3 + Pip

### 2. Installation
```bash
# Lancer la base de données (si pas active)
sudo systemctl start postgresql

# Lancer le Dashboard
sudo docker start metabase

# Lancer l'API de détection
python3 ../3_Code_Source/fraud_detection_api/app.py
