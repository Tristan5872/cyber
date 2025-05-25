# 01-NMAP

Ce dossier contient tous les fichiers relatifs aux scans réalisés avec **Nmap**, un outil de reconnaissance réseau puissant.

## Organisation des sous-dossiers

- **01-brut/** : Contient les fichiers bruts générés directement par Nmap au format texte (`.txt`).  
  Exemple : `nmap_all.txt`, `nmap_tcp_syn.txt`.

- **02-rapports/** : Contient les rapports en format Markdown (`.md`) générés à partir des fichiers bruts, plus lisibles et commentés.

- **03-pdf/** : Contient les mêmes rapports que dans `02-rapports`, mais convertis en PDF pour une meilleure portabilité.

- **04-Doc/** : Contient la documentation, guides, notes sur les scans, explications sur les options Nmap utilisées, fichiers `.md` et `.pdf`.

- **05-outils/** : Contient les scripts, outils et automatisations (bash, python, etc.) liés à Nmap pour faciliter les scans, le parsing ou le reporting.

## Utilisation

1. Lancer les scans Nmap et enregistrer les sorties dans `01-brut/`.
2. Traiter les fichiers bruts pour générer des rapports markdown dans `02-rapports/`.
3. Convertir les rapports markdown en PDF dans `03-pdf/`.
4. Consulter la documentation dans `04-Doc/` pour comprendre les options utilisées.
5. Utiliser ou développer des scripts dans `05-outils/` pour automatiser ou étendre les capacités.

---

**Note :** Ce dossier est organisé pour faciliter la traçabilité des données et le travail collaboratif en cybersécurité.

