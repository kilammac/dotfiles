#!/bin/bash
# Sauvegardez ce script comme ~/.config/waybar/power-menu.sh
# N'oubliez pas de le rendre exécutable avec : chmod +x ~/.config/waybar/power-menu.sh



choice=$(echo -e "🔐 Verrouiller\n👋 Se déconnecter\n🔄 Redémarrer\n🔴 Éteindre" | fuzzel -d -w 20 -l 4 -p 'Menu système: ' --font="Noto Color Emoji:size=14,Noto Sans:size=12")

case "$choice" in
    "🔐 Verrouiller")
        swaylock
        ;;
    "👋 Se déconnecter")
        swaymsg exit
        ;;
    "🔄 Redémarrer")
        systemctl reboot
        ;;
    "🔴 Éteindre")
        systemctl poweroff
        ;;
esac
