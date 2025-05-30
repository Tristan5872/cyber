# 🧾 Rapport d'audit – Analyse du réseau et des services exposés

**Date du scan :** 30 mai 2025  
**Outils utilisés :** Nmap 7.95  
**Cible principale :** 10.0.10.2 (Metasploitable 2)

----------------------------------------------------------------------------------------------------------------------------------------------------------

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

----------------------------------------------------------------------------------------------------------------------------------------------------------

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

----------------------------------------------------------------------------------------------------------------------------------------------------------

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

----------------------------------------------------------------------------------------------------------------------------------------------------------

### 🔓 Ports ouverts et services associés :

| Port     | Service        | Brève description                         |
|----------|----------------|-------------------------------------------|
| 21/tcp   | ftp            | Transfert de fichiers                     |
| 22/tcp   | ssh            | Connexion sécurisée à distance            |
| 23/tcp   | telnet         | Connexion à distance non chiffrée         |
| 25/tcp   | smtp           | Envoi d’emails                            |
| 53/tcp   | domain         | Résolution DNS                            |
| 80/tcp   | http           | Serveur web non sécurisé                  |
| 111/tcp  | rpcbind        | Service d’enregistrement RPC              |
| 139/tcp  | netbios-ssn    | Partage de fichiers Windows               |
| 445/tcp  | microsoft-ds   | Partage de fichiers Windows (SMB)         |
| 512/tcp  | exec           | Exécution de commandes à distance         |
| 513/tcp  | login          | Authentification à distance (BSD)         |
| 514/tcp  | shell          | Shell distant (non sécurisé)              |
| 1099/tcp | rmiregistry    | Java RMI Registry                         |
| 1524/tcp | ingreslock     | Port Ingres (souvent utilisé en CTF)      |
| 2049/tcp | nfs            | Partage de fichiers (NFS)                 |
| 2121/tcp | ccproxy-ftp    | FTP Proxy                                 |
| 3306/tcp | mysql          | Base de données MySQL                     |
| 3632/tcp | distccd        | Compilation distribuée (souvent vulnérable) |
| 5432/tcp | postgresql     | Base de données PostgreSQL                |
| 5900/tcp | vnc            | Bureau à distance                         |
| 6000/tcp | X11            | Interface graphique distante              |
| 6667/tcp | irc            | Chat IRC                                  |
| 6697/tcp | ircs-u         | IRC chiffré SSL                           |
| 8009/tcp | ajp13          | Apache JServ Protocol (Tomcat)            |
| 8180/tcp | unknown        | Port inconnu, souvent HTTP alternatif     |
| 8787/tcp | msgsrvr        | Messagerie                                |
| 41797/tcp| crestron-ctps  | Automatisation/AV (Crestron)              |
| 49076/tcp| unknown        | Non identifié                             |
| 52749/tcp| unknown        | Non identifié                             |
| 59807/tcp| unknown        | Non identifié                             |