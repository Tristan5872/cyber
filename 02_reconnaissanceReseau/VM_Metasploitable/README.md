# VM_Metasploitable

Ce dossier représente l'environnement de travail associé à une machine virtuelle spécifique (Windows ou Metasploitable). 

Il contient les résultats et outils de reconnaissance et d'énumération réseau effectués sur la machine cible correspondante.

---

## Organisation générale

Chaque dossier VM contient des sous-dossiers dédiés à différents outils de reconnaissance, notamment :

- **01-NMAP** : Scans réseau détaillés réalisés avec Nmap.
- **02-enum4linux** : Énumération SMB et informations réseau issues d’enum4linux.
- **03-whatweb** : Détection des technologies web via WhatWeb.
- **04-nikto** : Analyse des vulnérabilités web avec Nikto.

Chaque dossier d’outil est organisé selon une structure identique avec :

- `01-brut/` : fichiers bruts des scans.
- `02-Doc/` : documentation et guides.
- `03-outils/` : scripts et outils liés.

---

## Objectifs

- **Centraliser** toutes les données et résultats de reconnaissance liés à la VM cible.
- **Faciliter** la lecture, l’analyse et la production de rapports exploitables.
- **Structurer** les travaux pour une bonne traçabilité dans un projet de cybersécurité.
- **Automatiser** les tâches grâce aux scripts dans les sous-dossiers `03-outils/`.

---

## Conseils d’utilisation

- Commencer par remplir les dossiers `01-brut/` avec les sorties directes des outils.
- Compléter et consulter la documentation dans `02-Doc/`.
- Utiliser les scripts dans `03-outils/` pour automatiser les étapes répétitives.
- Maintenir une organisation identique pour toutes les VM afin de faciliter la comparaison et la gestion multi-cibles.