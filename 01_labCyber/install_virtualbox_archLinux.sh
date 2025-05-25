#!/bin/bash

# Couleurs pour l'affichage
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

function info() { echo -e "${GREEN}[INFO]${NC} $1"; }
function warning() { echo -e "${YELLOW}[WARN]${NC} $1"; }
function error() { echo -e "${RED}[ERROR]${NC} $1"; }
function pause() { read -p "Appuyez sur [Entrée] pour continuer..."; }

info "Mise à jour des dépôts..."
sudo pacman -Syu --noconfirm || { error "Échec mise à jour"; exit 1; }

info "Installation de VirtualBox et des modules nécessaires..."
sudo pacman -S --noconfirm virtualbox virtualbox-host-modules-arch linux-headers || { error "Erreur installation VirtualBox"; exit 1; }

info "Ajout de l'utilisateur $USER au groupe vboxusers..."
sudo usermod -aG vboxusers "$USER" || { error "Erreur ajout groupe"; exit 1; }

warning "Redémarrez la session ou le système pour appliquer les changements de groupe."
pause

info "Installation terminée pour Arch Linux."