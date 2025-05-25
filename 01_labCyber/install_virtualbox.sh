#!/bin/bash

# Couleurs pour l'affichage
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

function info() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

function warning() {
    echo -e "${YELLOW}[WARN]${NC} $1"
}

function error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

function pause() {
    read -p "Appuyez sur [Entrée] pour continuer..."
}

info "Mise à jour des dépôts..."
if sudo apt update; then
    info "Mise à jour réussie"
else
    error "Impossible de mettre à jour les dépôts."
    exit 1
fi

info "Installation des paquets nécessaires (dkms, build-essential, linux-headers, wget)..."
if sudo apt install -y dkms build-essential linux-headers-$(uname -r) wget; then
    info "Paquets installés."
else
    error "Erreur lors de l'installation des paquets requis."
    exit 1
fi

info "Ajout des clés GPG Oracle VirtualBox..."
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add - || { error "Échec de l'ajout de la clé 2016"; exit 1; }
wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add - || { error "Échec de l'ajout de la clé principale"; exit 1; }

info "Ajout du dépôt VirtualBox officiel..."
dist_codename=$(lsb_release -cs)
repo_line="deb [arch=amd64] https://download.virtualbox.org/virtualbox/debian $dist_codename contrib"
if grep -q "^$repo_line" /etc/apt/sources.list.d/virtualbox.list 2>/dev/null; then
    warning "Le dépôt VirtualBox est déjà présent."
else
    echo "$repo_line" | sudo tee /etc/apt/sources.list.d/virtualbox.list > /dev/null
    info "Dépôt ajouté."
fi

info "Mise à jour des dépôts (2ème fois)..."
if sudo apt update; then
    info "Mise à jour réussie."
else
    error "Impossible de mettre à jour les dépôts."
    exit 1
fi

info "Installation de VirtualBox 7.0..."
if sudo apt install -y virtualbox-7.0; then
    info "VirtualBox installé avec succès."
else
    error "Erreur lors de l'installation de VirtualBox."
    exit 1
fi

info "Ajout de l'utilisateur $USER au groupe vboxusers..."
if sudo usermod -aG vboxusers "$USER"; then
    info "Utilisateur ajouté au groupe vboxusers."
else
    error "Impossible d'ajouter l'utilisateur au groupe."
    exit 1
fi

echo
warning "Il faudra redémarrer la session ou le système pour que l'ajout au groupe prenne effet."
pause

info "Nettoyage des paquets inutiles et cache..."
sudo apt clean
sudo apt autoremove -y
sudo apt --fix-broken install -y

info "Nettoyage des logs et fichiers temporaires..."
sudo journalctl --vacuum-time=3d
sudo rm -rf /tmp/*

info "Installation terminée. VirtualBox est prêt à être utilisé."

