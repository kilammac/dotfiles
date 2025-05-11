

# Post-Installation Arch Linux minimal

Documentation pour l'installation des paquets listés dans `list.txt`, classés par catégories.  

- `yay` est installé pour les paquets AUR  
Pour installer yay :
```bash

sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay-bin.git && cd yay-bin && makepkg -si
```
---

## 📦 Paquets Officiels (via `pacman`)

### Système de base
``` 
sudo pacman -S --needed base base-devel linux linux-firmware linux-headers  man-db man-pages-fr dmidecode bash-completion git
```

Utilitaires système
```bash
sudo pacman -S --needed acpi acpid brightnessctl thermald tlp powertop udisks2 udiskie zram-generator reflector btop htop nvtop inxi
```

Interface Hyprland (WM)
```bash

sudo pacman -S --needed hyprland hypridle hyprlock hyprpaper  waybar xdg-desktop-portal-hyprland fuzzel foot wl-clipboard alacritty mako polkit-kde-agent libappindicator-gtk3  libnotify
```

Multimédia et audio
```bash

sudo pacman -S --needed mpv pavucontrol pipewire pipewire-alsa pipewire-jack pipewire-pulse wireplumber libpulse gst-plugin-pipewire intel-media-driver libva libva-utils sof-firmware
```

Réseau et Bluetooth
```bash

sudo pacman -S --needed networkmanager openssh blueman bluez bluez-utils dnsmasq bridge-utils nftables iptables-nft openbsd-netcat nss-mdns
```

Développement
```bash

sudo pacman -S --needed  neovim go nodejs npm pnpm expac jq ripgrep fd fzf
```

Outils CLI
```bash

sudo pacman -S --needed  fastfetch  yazi zoxide unzip dosfstools exfatprogs ntfs-3g pacman-contrib wget himalaya
```

Bureautique et Fonts
```bash

sudo pacman -S --needed noto-fonts noto-fonts-cjk noto-fonts-emoji ttf-dejavu ttf-droid ttf-fira-code ttf-font-awesome ttf-jetbrains-mono ttf-jetbrains-mono-nerd ttf-liberation ttf-meslo-nerd ttf-ubuntu-font-family otf-overpass poppler ghostwriter imagemagick
```

Virtualisation KVM
```bash

sudo pacman -S --needed qemu-full virt-manager virt-viewer libguestfs edk2-ovmf swtpm slirp4netns vde2 dnsmasq
```

Applications Firefox podman a la place de docker
```bash

sudo pacman -S --needed firefox firefox-i18n-fr flatpak  podman 
```

🚀 Paquets AUR (via yay)
Navigateurs et GUI
```bash

yay -S --needed  rofi-lbonn-wayland-git zen-browser-bin podman-compose hyprshot
```


🔄 Activer les services :

``` bash

sudo systemctl enable NetworkManager bluetooth thermald tlp 
```


Configurer Fish Shell (optionnel) :
```bash

chsh -s $(which fish)
```

## astuce:
 - dans vim en mode insertion Appuyez sur Ctrl + V, puis tapez uF303. logo archlinux

