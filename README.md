*  définir des raccourcis pour prendre des captures d'écran :

```text
# Prendre une capture d'écran d'une fenêtre
bind = $mainMod, PRINT, exec, hyprshot -m window

# Prendre une capture d'écran de l'écran entier
bind = PRINT, exec, hyprshot -m output

# Prendre une capture d'écran d'une région
bind = $shiftMod, PRINT, exec, hyprshot -m region
```
