# Scans effectués sur la VM Windows depuis la machine Kali Linux

## 1. Détection du réseau
Pour simuler un maximum une vraie reconnaissance réseau. J'ai commencé par faire un scan complet du réseau afin de voir les hôtes en ligne (dont Windows 10)

```bash
nmap -sn 10.0.10.0/24 -oN nmap_windows_ping.txt
```

<u>**Résultat :**</u>
[lien vers le Résultat](../01-brut/nmap_windows_ping.txt)

On peut y voir qu'il y a bien 3 machines (en comptant la Kali Linux) sur le réseau labo1 (10.0.10.0/24) en .2 et .3

## 2. Scan général de la machine de la machine

```bash
nmap --reason -sS -T2 -f -source-port 80 -Pn -A -oN nmap_windows_all.txt 10.0.10.3
```

<u>**Résultat :**</u>
[lien vers le Résultat](../01-brut/nmap_windows_all.txt)

En résumé, après l'envoi d'un **paquet SYN** (tentative d'intialisation TCP), sur les **1000 ports observés** (par défaut sur nmap sauf si précisions au préalable) on a ces infos :

### 📌 Récapitulatif
- **Hôte en ligne** : 10.0.10.3
- **997 ports TCP filtrés** : aucune réponse reçue (probablement filtrés par un pare-feu)
- **3 ports TCP ouverts** : ont répondu avec un paquet **SYN-ACK**
- **Adresse MAC** : 08:00:27:52:DC:1F (VirtualBox NIC - PCS Systemtechnik/Oracle)
- **Système d'exploitation détecté** : *Microsoft Windows 10* (plus probable)
- **Distance réseau** : 1 HOP (machine située sur le même réseau local ou proche)

---

### 🛠️ Détails des ports ouverts

| Port | Statut | Service                  | Version                        |
|------|--------|--------------------------|--------------------------------|
| 135  | Ouvert | msrpc                    | Microsoft Windows RPC          |
| 139  | Ouvert | netbios-ssn              | Microsoft Windows netbios-ssn  |
| 445  | Ouvert | microsoft-ds (probable)  | Aucun détail                   |

---

### 📜 Résultats des scripts Nmap


#### Définition :
***SMB (Server Message Block)** : C’est un protocole réseau principalement utilisé pour le partage de fichiers, d’imprimantes, et d’autres ressources sur un réseau local, surtout dans les environnements Windows.*

***Signature SMB** : C’est une mesure de sécurité visant à garantir que les messages SMB n’ont pas été modifiés en transit.*

---

#### 🔹 smb2-time
| Clé        | Valeur              |
|------------|---------------------|
| date       | 2025-05-28T15:32:59 |
| start_date | N/A                 |

##### Explication du script :
Il interroge le serveur SMB (ici via SMBv2) pour obtenir :

- La date et l'heure système du serveur cible.
- La date de démarrage du système (si disponible).

##### Utilité :

- Vérifie si l’heure du système est synchronisée.

- Peut donner une indication sur l’uptime de la machine.

- Peut être utilisé pour corréler des logs dans une analyse forensic.

---

#### 🔹 nbstat
| Champ            | Valeur                                                                 |
|------------------|------------------------------------------------------------------------|
| Nom NetBIOS      | WINDOWS10ENTREP                                                        |
| Utilisateur      | <unknown>                                                              |
| Adresse MAC      | 08:00:27:52:dc:1f (VirtualBox NIC)                                     |

##### Explication du script :
Il utilise le protocole NetBIOS (ancien système de noms sur les réseaux Windows) pour obtenir :

- Le nom NetBIOS de la machine.

- L’utilisateur connecté (si visible).

- L’adresse MAC de la carte réseau.

##### Utilité :

- Identifier une machine sur un réseau local par son nom Windows.

- Vérifier s’il y a un utilisateur connecté.

- Obtenir l'adresse MAC et vérifier que la machine tourne sur du physique ou du virtuel.

---

### 🔹 smb2-security-mode
| Détail                    | Valeur                          |
|---------------------------|---------------------------------|
| Mode SMB 2                | 3:1:1                           |
| Signature des messages    | Activée mais **non requise**   |

##### Explication du script :
Ce script interroge le service SMB (versions 2 et 3) sur la machine distante afin de déterminer son mode de sécurité, plus précisément les paramètres de signature des messages SMB, pour obtenir

- Si la signature SMB est activée : les paquets SMB peuvent être signés pour garantir leur intégrité.

- Si elle est obligatoire : le client est forcé de signer les messages, sinon la connexion est refusée.

##### Utilité :
- Évaluer la résistance de la machine aux attaques Man-in-the-Middle (MITM) sur le protocole SMB.

- Identifier une mauvaise configuration réseau qui affaiblit la sécurité.

- Fournir un indice sur les pratiques de sécurité de l’administrateur système.

---

### ❗ **Faille de sécurité** : 
Le fait que la signature SMB soit activée mais non requise rend ce système vulnérable aux attaques de type *Man-in-the-Middle*.



# 3.