# Projet Reconnaissance Réseau - Semaine 2

## Contexte du projet

Ce projet s'inscrit dans le cadre d’une semaine dédiée à la **reconnaissance réseau** dans un cursus en cybersécurité / réseaux.

L’objectif est d’apprendre à utiliser différents outils de scan et d’énumération pour analyser des systèmes cibles — ici une machine virtuelle vulnérable **Metasploitable** et une machine d'entreprise **Windows 10**.

---

## Objectifs pédagogiques

- Maîtriser les techniques de reconnaissance réseau essentielles pour un audit de sécurité.
- Apprendre à effectuer des scans TCP et UDP avancés avec **Nmap**.
- Découvrir la détection du système d’exploitation distant grâce à Nmap.
- Utiliser des outils complémentaires comme **enum4linux**, **WhatWeb** et **Nikto** pour approfondir la collecte d’informations.
- Savoir organiser, documenter et rapporter ses résultats efficacement.

---

## Outils utilisés

- **Nmap** : scanner réseau multifonction permettant la découverte d’hôtes, la détection de ports ouverts, versions de services et OS.
- **enum4linux** : outil d’énumération SMB pour collecter informations utilisateurs, partages, etc.
- **WhatWeb** : identification des technologies utilisées par les sites web cibles.
- **Nikto** : scanner de vulnérabilités web.

---

## Organisation des dossiers

Les résultats sont classés par outil dans des sous-dossiers, chacun contenant plusieurs sous-catégories :

<span style="color:blue; font-weight:bold;">VM_Metasploitable/</span>  
├── <span style="color:red;">01-NMAP/</span>  
│   ├── <span style="color:green;">01-brut/</span>  
│   │   └── <span style="color:black;">README.md</span>  
│   ├── <span style="color:green;">02-rapports/</span>  
│   │   └── <span style="color:black;">README.md</span>  
│   ├── <span style="color:green;">03-pdf/</span>  
│   │   └── <span style="color:black;">README.md</span>  
│   ├── <span style="color:green;">04-Doc/</span>  
│   │   └── <span style="color:black;">README.md</span>  
│   ├── <span style="color:green;">05-outils/</span>  
│   │   └── <span style="color:black;">README.md</span>  
│   └── <span style="color:black;">README.md</span>  
├── <span style="color:red;">02-enum4linux/</span>  
├── <span style="color:red;">03-whatweb/</span>  
├── <span style="color:red;">04-nikto/</span>  
└── <span style="color:black;">README.md</span>  

<span style="color:blue; font-weight:bold;">VM_Windows/</span>  
├── <span style="color:red;">01-NMAP/</span>  
├── <span style="color:red;">02-enum4linux/</span>  
├── <span style="color:red;">03-whatweb/</span>  
├── <span style="color:red;">04-nikto/</span>  
└── <span style="color:black;">README.md</span>  

...

<span style="font-style: italic;"># D’autres VM peuvent être ajoutées ici, en suivant cette même structure</span>

# D’autres VM peuvent être ajoutées ici, en suivant cette même structure

## Livrable attendu

Un audit complet des machines **Metasploitable** et **Windows 10** réalisé avec les outils cités, comprenant :

- Les fichiers de sortie bruts.
- Des rapports clairs et détaillés au format Markdown.
- Des rapports PDF prêts à être remis.
- Une documentation expliquant les méthodes, commandes et observations.
- Les scripts et autres outils utilisés.