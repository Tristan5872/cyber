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
| IP        | Réponse            | Adresse MAC       | Informations complémentaires   |
| --------- | ------------------ | ----------------- | ------------------------------ |
| 10.0.10.1 | localhost-response | *(non affichée)*  | Probablement la passerelle     |
| 10.0.10.2 | ARP (1.1 ms)       | 08:00:27:32:E4:1F | Machine virtuelle (VirtualBox) |

---

## 2. 🔍 Découverte des ports ouverts – Metasploitable 2 (10.0.10.2)

### Commande exécutée :
```bash
nmap --reason -v -sS -p- -T3 -oN metasploitable_scanPortsOuverts.txt 10.0.10.2
```
[Résultat brutes](../01-brut/metasploitable_scanPortsOuverts.txt)

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

[Résultat brutes](../01-brut/metasploitable_scanServiceOS.txt)

### Résumé :
- **Hôte cible :** 10.0.10.2
- **Analyse des 30 ports ouverts :** [lien vers ports.txt](../../../Outils/ports.txt)
- **Type de scan :** TCP SYN (stealth) ==> via sudo
- **Identification de services inconnus :** 3

---

## 4. 🔥 Analyse de vulnérabilités

```bash
sudo nmap -vv -sV -p$(cat ports.txt) --script vuln --script-timeout 30s 10.0.10.2 -oN metaploitable_scanVuln.txt
```

[Résultat brutes](../01-brut/metaploitable_scanVuln.txt)

<i>L'ajout d'un Timeout peut s'avérer nécessaire dans les cas suivants :
- Plusieurs services vulnérables sont présents (comme dans Metasploitable 2),
- Le port/service ne répond pas ou ralentit la détection,
- Le script attend une réponse qui ne vient jamais (timeout),
- Beaucoup de ports sont scannés à la fois.</i>

### Résumé
- **Hôte cible :** 10.0.10.2
- **Analyse des 30 ports ouverts :** [lien vers ports.txt](../../../Outils/ports.txt)
- **Type de scan :** TCP SYN (stealth) ==> via sudo
- **Scripts utilisés:** `vuln`

### Vulnérabilités détectées (4)

#### PORT 21 :
| Service | CVE | Vulnérabilité | Risques | Seuil de danger |
| --- | --- | --- | --- | --- |
| FTP | CVE-2011-2523 | Backdoor dans VSFTPD 2.3.4 | Exécution d'un shell root via un port caché (prise de contrôle totale) | Critique |

**description :**  
Backdoor dans VSFTPD 2.3.4 : Cette vulnérabilité affecte le serveur FTP VSFTPD (Very Secure FTP Daemon) version 2.3.4. Une porte dérobée (backdoor) avait été introduite dans le code source après une compromission du dépôt officiel. Lorsqu’un utilisateur tentait de se connecter avec un nom d’utilisateur contenant un smiley `:)`, le service ouvrait une shell root sur le port TCP 6200. Cette faille permettait une prise de contrôle complète du système. Elle ne résulte pas d’une erreur de programmation mais d’un acte malveillant.

**Référence :**  
Vulnérabilité : https://nvd.nist.gov/vuln/detail/CVE-2011-2523  
Service : https://fr.wikipedia.org/wiki/File_Transfer_Protocol

---

#### PORT 1099 :
| Service | CVE | Vulnérabilité | Risques | Seuil de danger |
| --- | --- | --- | --- | --- |
| java RMI | N/A | Chargement de classes à distance (RCE) | Exécution de code arbitraire à distance | Élevé |

**description :**  
Exécution de code à distance via Java RMI : Cette vulnérabilité affecte le service Java RMI (Remote Method Invocation) lorsque celui-ci est mal configuré, notamment en autorisant le chargement de classes depuis des URL distantes. Dans ce contexte, un attaquant peut enregistrer un objet malveillant pointant vers une classe hébergée sur un serveur externe. Le service cible télécharge alors cette classe et l’exécute, entraînant une exécution de code arbitraire à distance (RCE). Bien que ce comportement soit lié à la conception même de RMI, il constitue une faille sérieuse lorsque le registre (rmiregistry) est exposé sur le réseau sans restriction. Cette vulnérabilité a été exploitée dès les années 2010, et a été largement utilisée dans des outils comme Metasploit. Elle souligne les dangers d’un usage non sécurisé des mécanismes de sérialisation et de chargement dynamique en Java.

**Référence :**  
Vulnérabilité : https://www.vaadata.com/blog/fr/rce-remote-code-execution-exploitations-et-bonnes-pratiques-securite/  
Service : https://fr.wikipedia.org/wiki/Java_Remote_Method_Invocation

---

#### PORT 3632 :
| Service | CVE | Vulnérabilité | Risques | Seuil de danger |
| --- | --- | --- | --- | --- |
| distccd | CVE-2004-2687 | Exécution de commandes à distance | Permet l’exécution de commandes arbitraires via une mauvaise configuration du daemon distccd v1 | Élevé |

**description :**  
La vulnérabilité CVE-2004-2687 affecte le daemon distccd version 3.1 et antérieures. Due à une configuration faible, elle permet à un attaquant d’exécuter des commandes arbitraires à distance sur le système vulnérable. Le service expose une interface réseau sans contrôle d’accès strict, ouvrant la porte à une compromission complète. La CVSS v2 est élevée (9.3) reflétant la gravité du risque.

**Référence :**  
Vulnérabilité : https://nvd.nist.gov/vuln/detail/CVE-2004-2687  
Service : https://distcc.github.io/security.html

---

#### PORT 5432 :
| Service | CVE | Vulnérabilité | Risques | Seuil de danger |
| --- | --- | --- | --- | --- |
| postgresql | N/A | Faible force des groupes Diffie-Hellman | Vulnérabilité TLS : les groupes Diffie-Hellman utilisés sont faibles, exposant à une écoute passive | Moyen |

**description :**  
Certains services PostgreSQL (versions 8.3.x) utilisent des groupes Diffie-Hellman insuffisamment robustes pour les échanges TLS, ce qui peut permettre à un attaquant passif d’écouter les communications chiffrées. Cette vulnérabilité ne permet pas d’exécuter du code, mais compromet la confidentialité des données échangées.

**Référence :**  
Vulnérabilité : https://weakdh.org/  
Service : https://www.postgresql.org/docs/8.3/runtime-config-connection.html#RUNTIME-CONFIG-CONNECTION-SSL