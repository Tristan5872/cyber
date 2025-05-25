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
if sudo dnf update -y; then
    info "Mise à jour réussie"
else
    error "Impossible de mettre à jour les dépôts."
    exit 1
fi

info "Installation des paquets nécessaires (kernel-devel, kernel-headers, gcc, make, perl, wget)..."
if sudo dnf install -y kernel-devel kernel-headers gcc make perl wget epel-release; then
    info "Paquets installés."
else
    error "Erreur lors de l'installation des paquets requis."
    exit 1
fi

info "Ajout du dépôt officiel VirtualBox..."
rhel_version=$(rpm -E %{rhel})
if [ "$rhel_version" -ge 9 ]; then
    repo_url="https://download.virtualbox.org/virtualbox/rpm/el/virtualbox.repo"
else
    repo_url="https://download.virtualbox.org/virtualbox/rpm/el/virtualbox.repo"
fi

if [ -f /etc/yum.repos.d/virtualbox.repo ]; then
    warning "Le dépôt VirtualBox est déjà présent."
else
    sudo wget $repo_url -O /etc/yum.repos.d/virtualbox.repo
    info "Dépôt ajouté."
fi

info "Installation des dépendances pour VirtualBox (Qt)..."
if sudo dnf install -y qt5-qtx11extras; then
    info "Qt5 installé."
else
    warning "Qt5 non installé, ce n'est peut-être pas bloquant selon votre environnement."
fi

info "Installation de VirtualBox 7.0..."
if sudo dnf install -y VirtualBox-7.0; then
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
sudo dnf clean all

info "Nettoyage des logs et fichiers temporaires..."
sudo journalctl --vacuum-time=3d
sudo rm -rf /tmp/*

info "Installation terminée. VirtualBox est prêt à être utilisé."