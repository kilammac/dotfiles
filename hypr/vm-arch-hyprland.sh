#!/bin/bash

# Fonction pour trouver le premier workspace libre
find_free_workspace() {
  # Obtenir la liste des workspaces occupés
  occupied_workspaces=$(hyprctl workspaces | grep "workspace ID" | awk '{print $3}')

  # Commencer à 1 et chercher le premier workspace disponible
  workspace=1
  while echo "$occupied_workspaces" | grep -q "^$workspace$"; do
    workspace=$((workspace + 1))
  done

  echo $workspace
}

# Trouver le premier workspace libre
free_workspace=$(find_free_workspace)

# Passer au workspace libre
hyprctl dispatch workspace $free_workspace

# Lancer virt-manager pour gérer les VMs

virsh -c qemu:///system start archlinux-hyprland
virt-viewer --connect qemu:///system -a archlinux-hyprland &
# Attendre que virt-manager soit lancé
sleep 2

# Appliquer WindowRoleV2 pour gérer la fenêtre
# Cette partie dépend de comment vous utilisez WindowRoleV2 avec Hyprland
# Par exemple, on peut définir des règles spécifiques pour les fenêtres de virt-manager
hyprctl keyword windowrulev2 "workspace $free_workspace,class:^(virt-viewer)$"
