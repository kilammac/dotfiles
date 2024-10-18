## <p align="center">  Ma configuration Hyprland</p>

### Post-install:
```bash
sudo pacman -S fastfetsh nvtop btop wl-clipboard neovim unzip git \
                bash-completion intel-media-driver libva-utils bluez  \
                bluez-utils blueman mpv brightnessctl inxi  foot \
                man-db man-pages-fr pavucontrol 
```

```bash
pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg -si
```

- en mode insertion Appuyez sur Ctrl + V, puis tapez uF303.  logo archlinux


*  définir des raccourcis pour prendre des captures d'écran :

```text
# Prendre une capture d'écran d'une fenêtre
bind = $mainMod, PRINT, exec, hyprshot -m region

# Prendre une capture d'écran de l'écran entier
bind = ,PRINT, exec, hyprshot -m output

# Prendre une capture d'écran d'une région
# bind = $shiftMod, PRINT, exec, hyprshot -m window
```

+ Désactivation des règles udev
Pour forcer GDM à utiliser Wayland au lieu de Xorg, vous pouvez créer un lien
 symbolique pour annuler les règles udev qui pourraient causer des conflits :

```bash
sudo ln -s /dev/null /etc/udev/rules.d/61-gdm.rules
```
