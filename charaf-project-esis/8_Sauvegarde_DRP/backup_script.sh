#!/bin/bash
# CONFIGURATION
BACKUP_DIR="/home/chasky/charaf-project-esis/8_Sauvegarde_DRP/backups"
DATE=$(date +%Y%m%d_%H%M%S)
FILE="digitalbank_backup_$DATE.sql"

# 1. Création du dossier s'il n'existe pas
mkdir -p $BACKUP_DIR

echo "--- 💾 DÉMARRAGE SAUVEGARDE AUTOMATIQUE ---"

# 2. Sauvegarde de la base (Dump)
# On utilise sudo -u postgres pour ne pas avoir de problème de mot de passe
sudo -u postgres pg_dump digitalbank_restored > $BACKUP_DIR/$FILE

# 3. Compression du fichier (.gz)
gzip $BACKUP_DIR/$FILE

# 4. Suppression des sauvegardes vieilles de plus de 30 jours (Nettoyage)
find $BACKUP_DIR -type f -mtime +30 -delete

echo "✅ Sauvegarde terminée avec succès !"
echo "📁 Fichier créé : $BACKUP_DIR/$FILE.gz"
