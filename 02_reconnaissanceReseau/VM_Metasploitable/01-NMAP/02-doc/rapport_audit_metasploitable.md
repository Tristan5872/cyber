# 🧾 Rapport d'audit – Analyse du réseau et des services exposés

**Date du scan :** 30 mai 2025  
**Outils utilisés :** Nmap 7.95  
**Cible principale :** 10.0.10.2 (Metasploitable 2)

---

## 1. 🌐 Découverte réseau

### Commande exécutée :
```bash
nmap --reason -sn -oN metasploitable_scanPing.txt 10.0.10.0/24
```

[Résultat Brut](../01-brut/metasploitable_scanPing.txt)

### Résumé :
- **Plage IP scannée :** 10.0.10.0/24
- **Nombre d’hôtes détectés :** 2

### Hôtes actifs :
| IP          | Réponse             | Adresse MAC              | Informations complémentaires      |
|-------------|---------------------|---------------------------|------------------------------------|
| 10.0.10.1   | localhost-response  | *(non affichée)*         | Probablement la passerelle         |
| 10.0.10.2   | ARP (1.1 ms)        | 08:00:27:32:E4:1F         | Machine virtuelle (VirtualBox)     |

---

## 2. 🔍 Découverte des ports ouverts – Metasploitable 2 (10.0.10.2)

### Commande exécutée :
```bash
nmap --reason -v -sS -p- -T3 -oN metasploitable_scanPortsOuverts.txt 10.0.10.2
```

### Résumé :
- **Hôte cible :** 10.0.10.2
- **Nombre de ports ouverts :** 30
- **Type de scan :** TCP SYN (stealth)
- **Services non identifiés :** 3

---

## 3. 🔍 Scan des services et de l'OS

```bash
sudo nmap -p$(cat ports.txt) -sV -O 10.0.10.2 -oN metasploitable_scanServiceOS.txt
```

### Résumé :
- **Hôte cible :** 10.0.10.2
- **Analyse des 30 ports ouverts :** [lien vers ports.txt](../../../Outils/ports.txt)
- **Type de scan :** TCP SYN (stealth) ==> via sudo
- **Identification de services inconnus :** 3

## 4. 🔥 Analyse de vulnérabilités

```bash
sudo nmap -vv -sV -p$(cat ports.txt) --script vuln --script-timeout 30s 10.0.10.2 -oN metaploitable_scanVuln.txt
```
L'ajout d'un Timeout peut s'avérer nécessaire dans les cas suivants :
- Plusieurs services vulnérables sont présents (comme dans Metasploitable 2),
- Le port/service ne répond pas ou ralentit la détection,
- Le script attend une réponse qui ne vient jamais (timeout),
- Beaucoup de ports sont scannés à la fois.

### Résumé
- **Hôte cible :** 10.0.10.2
- **Analyse des 30 ports ouverts :** [lien vers ports.txt](../../../Outils/ports.txt)
- **Type de scan :** TCP SYN (stealth) ==> via sudo
- **Scripts utilisés:** `vuln`