## <p align="center">  Ma configuration Hyprland</p>

### Post-install:
```bash
sudo pacman -S fastfetsh nvtop btop wl-clipboard neovim unzip git \
                bash-completion intel-media-driver libva-utils bluez  \
                bluez-utils blueman mpv brightnessctl inxi  foot \
                man-db man-pages-fr pavucontrol hypridle hyprlock hyprpaper tumbler  ffmpegthumbnailer
```
- Installer yay:
```bash
pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg -si
```

- en mode insertion Appuyez sur Ctrl + V, puis tapez uF303.  logo archlinux


*  définir des raccourcis pour prendre des captures d'écran il faut installer hyprshot avec yay :

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
* Pour ajouter l'aperçu des photos miniatures dans Thunar, suivez ces étapes :

### Étape 1 : Installer les paquets nécessaires
Assurez-vous d'avoir installé les paquets suivants, qui sont nécessaires pour générer des vignettes pour les images :

```bash
sudo pacman -S tumbler  ffmpegthumbnailer
```

### Étape 2 : Configurer Thunar

    1. Ouvrir Thunar.
    2. Allez dans le menu Édition et sélectionnez Préférences.
    3. Dans l'onglet Affichage, recherchez l'option Afficher les miniatures.
    4. Changez le paramètre pour qu'il soit réglé sur Toujours ou selon votre préférence (par exemple, Fichiers locaux seulement).

### Étape 3 : Redémarrer Thunar


