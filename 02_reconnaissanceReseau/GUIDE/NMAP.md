
# 🛠️ Cours Complet Nmap (Hors NSE)

---

## 🔍 1. Introduction

**Nmap** (Network Mapper) est un outil de scanner réseau utilisé pour la découverte d'hôtes et de services sur un réseau.

---

## ⚙️ 2. Types de Scan TCP/UDP

[Voir le cours sur les protocoles TCP/UDP](../GUIDE/Protocol_TCP-UDP.md)

### 🔹 Scan TCP SYN (demi-ouvert) – rapide et discret
```bash
sudo nmap -sS <IP>
```

### 🔹 Scan TCP connect() – pour utilisateurs non-root
```bash
nmap -sT <IP>
```

### 🔹 Scan UDP – lent mais important
```bash
sudo nmap -sU <IP>
```

### 🔹 Scan TCP ACK – pour repérer les filtres pare-feu
```bash
sudo nmap -sA <IP>
```

### 🔹 Scan TCP Null, FIN, Xmas – furtivité contre pare-feu
```bash
nmap -sN <IP>
nmap -sF <IP>
nmap -sX <IP>
```

### 🔹 Scan Idle (zombie) – anonymat total
```bash
sudo nmap -sI <IP_zombie> <IP_cible>
```
Le scan idle utilise un ordinateur « zombie » dont le numéro de paquet IP (IP ID) augmente à chaque message qu’il envoie.

**Exemple :**

    1. Avant le scan, le zombie a un numéro IP ID à 1000.

    2. Tu envoies un faux message à la cible en faisant croire que ça vient du zombie.

    3. Si le port de la cible est ouvert, elle répond au zombie, qui envoie alors un message en plus, et son IP ID passe à 1001.

    4. Si le port est fermé, le zombie n’envoie rien et son IP ID reste à 1000.

En comparant ces numéros, tu sais si le port est ouvert ou fermé, sans que la cible sache que c’est toi qui fais le scan.

### 🔹 Scan TCP Maimon – variante peu connue
```bash
nmap -sM <IP>
```

---

## 🌐 3. Découverte d’Hôtes (Host Discovery)

### 🔸 Ping ICMP
```bash
nmap -sn <IP>
```

### 🔸 Ping TCP (sur un port)
```bash
nmap -PS80 <IP>
```

### 🔸 Ping UDP
```bash
nmap -PU53 <IP>
```

### 🔸 Pas de ping (utile si ICMP est bloqué)
```bash
nmap -Pn <IP>
```

---

## 📦 4. Scan de Ports

### 🔹 Ports par défaut
1000 ports les plus courants (par défaut)

### 🔹 Tous les ports
```bash
nmap -p- <IP>
```

### 🔹 Plages personnalisées
```bash
nmap -p 1-1024,3306,8080 <IP>
```

---

## 🎯 5. Ciblage & Filtres

### 🔸 Fichier d’IP (multi-scan)
```bash
nmap -iL targets.txt
```

### 🔸 Exclure des hôtes
```bash
nmap --exclude 192.168.1.5,192.168.1.10
```

### 🔸 Liste des cibles résolues (sans scan)
```bash
nmap -sL <IP_range>
```

---

## 🚀 6. Optimisation & Timing

### 🔹 Vitesse du scan
```bash
nmap -T<0-5>
```

- T0 : Paranoïaque (furtif)
- T4 : Rapide (idéal en LAN)
- T5 : Insane (risque de détection élevé)

### 🔹 Réduction des retransmissions
```bash
nmap --max-retries 2
```

### 🔹 Timeout par port
```bash
nmap --host-timeout 60m
```

---

## 🕵️ 7. Furtivité & Contournement IDS

### 🔸 Fragmentation de paquets
```bash
nmap -f <IP>
```

### 🔸 Source port falsifié (ex: DNS)
```bash
sudo nmap --source-port 53 <IP>
```

### 🔸 Longueur de paquet aléatoire
```bash
nmap --data-length 50 <IP>
```

### 🔸 IP Spoofing (scan limité)
```bash
nmap -S <FAUSSE_IP> <IP_CIBLE>
```

---

## 📁 8. Sortie & Reporting

### 🔹 Sortie normale
```bash
nmap -oN resultat.txt <IP>
```

### 🔹 Sortie XML / grep / tous formats
```bash
nmap -oX result.xml -oG result.gnmap -oA full_result <IP>
```

---

## 📋 9. Stratégies de Scan

### 🔸 Stratégie Recon Standard (bruyante)
1. `nmap -sS -Pn -T4`
2. `nmap -sU --top-ports 100`
3. `nmap -sV -O -Pn`
4. `nmap -p- -sS`
5. `nmap -A`

### 🔸 Stratégie furtive
1. `nmap -sS -T0 --scan-delay 5s`
2. `nmap -sF -f --data-length 50`

### 🔸 Scan large (multi-cibles)
```bash
nmap -iL liste_ips.txt -T4 -oA multi_resultats
```

---

## 🧼 10. Post-Scan

### 🔹 Nettoyage fichiers
```bash
rm *.nmap *.xml *.gnmap *.txt
```

### 🔹 Organisation
- `reconnaissance/`
- `tcp_udp/`
- `resultats_bruts/`
- `analyses/`

---

## ⚠️ 11. Bonnes pratiques & erreurs fréquentes

- Ne jamais scanner sans autorisation
- Ne pas abuser des scans UDP (très longs)
- Toujours lire les messages d'erreur Nmap
- Comparer les scans dans le temps (`ndiff`)
- Ne pas se fier uniquement à un type de scan