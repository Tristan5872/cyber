
# 🌐 Cours Réseau Express : TCP, UDP & Types de Paquets

---

## 🔹 1. Protocole TCP (Transmission Control Protocol)

### 📌 Caractéristiques
- Orienté **connexion**
- Fiable : garantit la livraison des données
- Utilise un **handshake à 3 étapes**

### 🔄 Handshake TCP (3-Way Handshake)
1. Client → Serveur : `SYN`
2. Serveur → Client : `SYN-ACK`
3. Client → Serveur : `ACK`

👉 Une fois la connexion établie, les données peuvent circuler.

### 📤 Terminaison de connexion
- `FIN` : demande de fermeture propre
- `RST` : fermeture brutale (reset)

---

## 🔹 2. Protocole UDP (User Datagram Protocol)

### 📌 Caractéristiques
- **Sans connexion**
- **Rapide** mais **non fiable**
- Pas de garantie de livraison
- Utilisé pour : DNS, VoIP, SNMP, DHCP, etc.

### 📬 Pas de handshake
- Envoi direct des données sans vérification

---

## 🔹 3. Types de paquets TCP utiles en scan

### ✅ SYN
- Sert à initier une connexion
- Utilisé dans le **SYN scan** (`nmap -sS`)

### ✅ ACK
- Sert à confirmer la réception
- Utilisé dans les scans **ACK** pour détecter les pare-feux (`nmap -sA`)

### ✅ FIN
- Demande de fermeture douce d’une connexion
- Utilisé dans les **FIN scans** (`nmap -sF`)

### ✅ RST
- Réinitialise brutalement une connexion

### ✅ Null
- Paquet **sans flag**
- Utilisé dans les **Null scans** (`nmap -sN`) pour tester la réaction du pare-feu

### ✅ Xmas
- Paquet avec les flags **FIN**, **PSH** et **URG** activés
- Utilisé dans les **Xmas scans** (`nmap -sX`) pour détecter les OS vulnérables

---

## 🧠 Résumé des types de scan furtifs TCP

| Type de scan | Drapeaux utilisés | Objectif principal |
|--------------|-------------------|--------------------|
| SYN (`nmap -sS`)  | SYN               | Scan rapide & discret |
| ACK (`nmap -sA`)  | ACK               | Détection de filtres pare-feux |
| FIN (`nmap -sF`)  | FIN               | Furtif, contourne certains IDS |
| NULL (`nmap -sN`) | Aucun             | Contourne pare-feux obsolètes |
| Xmas (`nmap -sX`) | FIN, PSH, URG     | Furtif, reconnaissance OS |
| Connect (`nmap -sT`) | SYN, SYN-ACK, ACK | Connexion complète (détectable) |

---

## 📌 En résumé

- **TCP** : fiable, mais plus lent (avec contrôle)
- **UDP** : rapide, mais sans garantie
- Les **drapeaux TCP** sont utilisés par Nmap pour tester la réaction des hôtes
- Les **scans furtifs** exploitent les comportements variables des systèmes

<img src=../ressources/TCP_UDP.png>