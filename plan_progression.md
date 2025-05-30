
# 🛡️ Plan de progression cybersécurité – 3 mois

## 🎯 Objectif final

À la fin des 3 mois, j'aurais :
- Un **lab complet**
- Des **scripts utiles en Python/Bash**
- Plusieurs **rapports de tests de vulnérabilité**
- Des **write-ups de CTF**
- Un **portfolio en ligne**

---

## 🔽 Mois 1 – Mise en place & fondamentaux

### 🗓️ Semaine 1 : Création du lab initial
- Installer VirtualBox
- Créer un réseau interne
- Installer **Kali Linux** (attaquante) et **Metasploitable 2** (vulnérable)
- Documenter le lab (PDF + Markdown)

**📌 Livrable :**
> Lab cybersécurité opérationnel avec Kali + Metasploitable – prêt pour les phases d’attaque et de reconnaissance

---

### 🗓️ Semaine 2 : Reconnaissance réseau
- Nmap : scans TCP, UDP, OS detection
- enum4linux, whatweb, nikto sur **Metasploitable**
- Rapport d’audit réseau

**📌 Livrable :**
> Audit de **Metasploitable** avec outils de reconnaissance

---

### 🗓️ Semaine 3 : Exploitation basique
- Utiliser Metasploit (vsftpd, samba, etc.)
- Comprendre payloads, reverse shell, post-exploitation simple
- Extraction info système/utilisateur

**📌 Livrable :**
> Exploitation réussie d’un service vulnérable + post-exploitation basique

---

### 🗓️ Semaine 4 : Scripts en Python
- Scanner de ports avec `socket`, `threading`
- Extracteur de bannière
- Export vers fichier + README

**📌 Livrable :**
> Scripts de reconnaissance réseau en Python

---

## 🧪 Mois 2 – Sécurisation, analyse, et ajout Windows

### 🗓️ Semaine 5 : fail2ban et génération de logs
- Installer/configurer fail2ban (serveur SSH)
- Générer des attaques via `Hydra`
- Analyse des logs de blocage

**📌 Livrable :**
> Rapport de protection brute-force SSH avec fail2ban

---

### 🗓️ Semaine 6 : Installation Windows 10 & audit Linux
- **Installer et intégrer la VM Windows 10 dans le lab**
  - Réseau interne
  - Création utilisateur “victime”
  - Activation SMB ou RDP (pour tests à venir)
- Créer un script Bash/Python d’audit Linux
- Comparer avec Lynis

**📌 Livrable :**
> VM Windows ajoutée + script d’audit Linux personnalisé

---

### 🗓️ Semaine 7 : Analyse réseau + simulation Windows
- Capturer session HTTP sur Metasploitable
- Observer requêtes, DNS, TCP handshake
- **Lancer et observer quelques connexions Windows dans Wireshark**
  - SMB, RDP, ou HTTP (navigateur)

**📌 Livrable :**
> Analyse Wireshark d’une attaque et d’un trafic Windows courant

---

### 🗓️ Semaine 8 : Premier CTF complet
- TryHackMe “Mr Robot” ou autre box débutant
- Write-up avec étapes claires

**📌 Livrable :**
> Write-up clair d’un CTF – découverte, exploitation, post-exploitation

---

## 🧱 Mois 3 – Post-exploitation, détection, portfolio

### 🗓️ Semaine 9 : Post-exploitation sur Windows
- Utiliser Metasploit pour viser **la VM Windows 10**
- Extraire les utilisateurs, hash Windows, services actifs
- Optionnel : Mimikatz, `net user`, `schtasks`, persistance

**📌 Livrable :**
> Rapport de post-exploitation sur Windows 10 avec démonstration

---

### 🗓️ Semaine 10 : Honeypot & pare-feu
- Installer **Cowrie** (honeypot SSH)
- Analyser commandes des attaquants
- Configurer `iptables` ou `nftables`
  - SSH restreint, ports bloqués, politique DROP

**📌 Livrable :**
> Cowrie en place + politique de pare-feu fonctionnelle

---

### 🗓️ Semaine 11 : Portfolio en ligne
- GitHub Pages ou site statique
- Contenu organisé :
  - Screenshots, rapports, scripts
  - Version anglaise
  - README propres

**📌 Livrable :**
> Portfolio cybersécurité v1 – en ligne et structuré

---

### 🗓️ Semaine 12 : Projet libre ou 2e CTF
- Choisir un CTF ou approfondir une technique (ex : persistance sur Windows)
- Créer un **rapport plus poussé**
- Relecture et publication finale du portfolio

**📌 Livrable :**
> Rapport final bonus + version propre du portfolio