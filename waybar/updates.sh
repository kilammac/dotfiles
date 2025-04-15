#!/bin/bash

# Vérifie les mises à jour Pacman
pacman_updates=$(checkupdates 2>/dev/null | wc -l)

# Vérifie les mises à jour AUR via yay
yay_updates=$(yay -Qua 2>/dev/null | wc -l)

# Calcule le total des mises à jour
total=$((pacman_updates + yay_updates))

# Si le total est supérieur à 0, montre le nombre de mises à jour
if [ "$total" -gt 0 ]; then
  echo "{\"text\": \"$total\", \"tooltip\": \"Pacman: $pacman_updates, AUR: $yay_updates\", \"class\": \"updates-available\"}"
else
  echo "{\"text\": \"0\", \"tooltip\": \"Le système est à jour\", \"class\": \"updates-none\"}"
fi
