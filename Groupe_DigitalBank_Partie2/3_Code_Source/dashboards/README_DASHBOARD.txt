DASHBOARD DE MONITORING & SÉCURITÉ

TYPE : Metabase (Docker)
VERSION : Latest
PORT ACCÈS : http://localhost:3000

----------------------------------------------------------
POURQUOI PAS DE CODE SOURCE ?
Le dashboard est configuré via l'interface graphique de Metabase.
Toute la configuration (graphiques, connexions BDD) est stockée
dans la base de données interne du conteneur Docker.

CONTENU DES VUES :
1. Vue "Analyste Sécurité" : Carte des transactions frauduleuses.
2. Vue "Service Client" : Recherche historique client.
3. Vue "Monitoring" : État du serveur et Alertes Watchdog.

POUR LANCER LE DASHBOARD :
commande : sudo docker start metabase
----------------------------------------------------------
