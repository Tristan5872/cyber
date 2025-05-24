# Tuto de création du Labo Cyber


## Prérequis
Tout d'abord, il y a trois installations à faire :
- Avoir VirtualBox
- Avoir une Machine Virtuelle Kali Linux [Installation Kali](https://cdimage.kali.org/kali-2025.1c/kali-linux-2025.1c-virtualbox-amd64.7z)
- Avoir une Machine Virtuelle Metasploitable2 [Installation Metasploitable2](https://sourceforge.net/projects/metasploitable2/)

**Pour Installer VirtualBox :**
Il faut avoir installé le fichier **install_virtualbox.sh** et lancer ces commandes dans le même répertoire (où se trouve le fichier d'installation)

```
sudo chmod +x install_virtualbox.sh
sudo bash install_virtualbox.sh 
```

## <red>Mise en place et Configuration</red>

### 1. Importer les VM dans VirtualBox

- Ouvre VirtualBox.
- Clique sur **Machine > Ajouter**.
- Navigue vers le dossier où tu as téléchargé ou extrait la VM Kali Linux (`.ova`, `.vbox` ou `.vdi`).
- Sélectionne la VM et valide pour l’importer.
- Répète pour Metasploitable2.

---

### 2. Configurer le réseau interne dans VirtualBox

- Crée un réseau interne nommé `Labo1` :  
  VirtualBox > Fichier > Préférences > Réseau > Réseaux internes > Ajouter `Labo1`.
- Dans les paramètres de chaque VM (Kali et Metasploitable2) :  
  - Onglet Réseau > Activer la carte réseau 1 > Mode Réseau : **Réseau interne** > Nom : `Labo1`.
- Cette configuration isole les VM dans un réseau privé accessible uniquement par elles.

---

### 3. Configurer les IP statiques dans les VM

- Connecte-toi à chaque VM.
- Modifie la configuration réseau (exemple pour Debian/Ubuntu dans `/etc/network/interfaces`) pour définir une IP statique :

  ```bash
  auto eth0
  iface eth0 inet static
      address 10.0.10.X
      netmask 255.255.255.0
      gateway 10.0.10.1
      dns-nameservers 8.8.8.8 8.8.4.4
