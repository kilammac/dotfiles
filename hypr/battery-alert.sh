#!/bin/bash

# Chemin vers le fichier son (changez-le selon votre système)
ALERT_SOUND="/usr/share/sounds/freedesktop/stereo/alarm-clock-elapsed.oga"

# Seuil d'alerte (en pourcentage)
WARNING_LEVEL=20
CRITICAL_LEVEL=10

# Vérifie l'état de la batterie toutes les 30 secondes
while true; do
  # Récupère les informations de la batterie
  battery_info=$(upower -i $(upower -e | grep battery) | grep -E "state|percentage" | awk '{print $2}')
  battery_state=$(echo "$battery_info" | head -n1)
  battery_percent=$(echo "$battery_info" | tail -n1 | sed 's/%//')

  # Si la batterie est en décharge et sous les seuils
  if [ "$battery_state" = "discharging" ]; then
    if [ "$battery_percent" -le $CRITICAL_LEVEL ]; then
      # Alerte critique
      notify-send -u critical "Batterie très faible !" "Il ne reste que $battery_percent% de batterie. Branchez immédiatement !"
      paplay "$ALERT_SOUND"
    elif [ "$battery_percent" -le $WARNING_LEVEL ]; then
      # Alerte warning
      notify-send -u normal "Batterie faible" "Il ne reste que $battery_percent% de batterie. Pensez à brancher."
      paplay "$ALERT_SOUND"
    fi
  fi

  # Vérifie toutes les 30 secondes
  sleep 30
done

