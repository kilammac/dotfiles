Arch Linux Configuration Guide
Table of Contents




   [Automated Installation](#automated)

<a name="manual"></a>
Manual Installation
1. Core Packages
```bash

sudo pacman -S --needed --noconfirm dunst firefox chromium neovim zsh tmux \ ntfs-3g unzip ripgrep gvfs-mtp net-tools mtpfs fastfetch usbutils udisks2 \ udiskie acpi dhcpcd fzf zip mpv pacman-contrib cronie brightnessctl thunar \ tumbler transmission-gtk nvtop man-db eza slurp grim chafa yazi ffmpeg p7zip jq \ poppler fd fzf zoxide imagemagick unrar vi fish kitty papirus-icon-theme rsync \ obs-studio feh tree gcc gdb make valgrind clang curl
```

2. Email Client
```bash

sudo pacman -S --noconfirm thunderbird
```

3. Hyprland Components
```bash

sudo pacman -S --noconfirm wl-clipboard waybar hyprpaper hyprlock
```

4. Network Configuration
```bash

sudo systemctl enable --now dhcpcd.service
```

5. Development Tools
```bash

# Node.js and Docker
sudo pacman -S --noconfirm nodejs npm docker docker-compose
sudo systemctl enable --now docker
sudo usermod -aG docker $USER
```

System reboot required after this step
6. Bluetooth Support
```bash

sudo pacman -S --noconfirm bluez bluez-utils blueberry
sudo systemctl enable --now bluetooth
```

7. Hardware Firmware
```bash

sudo pacman -S --noconfirm linux-firmware linux-firmware-marvell linux-firmware-qlogic linux linux-headers amd-ucode
```

8. NVIDIA Drivers (If Applicable)
```bash

sudo pacman -S --noconfirm nvidia nvidia-utils nvidia-settings nvidia-dkms
sudo sed -i 's/GRUB_CMDLINE_LINUX_DEFAULT="/& nvidia_drm.modeset=1/' /etc/default/grub
sudo grub-mkconfig -o /boot/grub/grub.cfg
```

9. Media Codecs
```bash

sudo pacman -S --noconfirm alsa-utils alsa-plugins alsa-lib alsa-firmware a52dec faac faad2 flac jasper lame libdca libdv libmad libmpeg2 libtheora libvorbis libxv wavpack x264 xvidcore vlc pavucontrol pamixer
```

10. AUR Helper (yay)
```bash

git clone https://aur.archlinux.org/yay.git
cd yay && makepkg -si --noconfirm && cd ..
```

11. Snap Package Support
```bash

yay -S --noconfirm snapd
sudo systemctl enable --now snapd.socket
sudo ln -s /var/lib/snapd/snap /snap
```

12. Zsh Customization
```bash

# Powerlevel10k Theme
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k

# Plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

# Activate Configuration
sed -i 's/^plugins=.*/plugins=(git zsh-syntax-highlighting zsh-autosuggestions)/' ~/.zshrc
```

13. Fish Shell Setup
```bash

chsh -s $(which fish)
curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
fisher install jethrokuan/tide
```

14. Tmux Configuration
```bash

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

15. Themes and Fonts
```bash

# Fonts
sudo cp -r Fonts_used/* /usr/share/fonts/

# Themes
sudo cp -r Juno-ocean /usr/share/themes/
sudo cp -r kora-green /usr/share/icons/

# Wallpapers
mkdir -p ~/Pictures/wallpapers/
cp -r Wallpaper/* ~/Pictures/wallpapers/
```

16. System Optimization
```bash

# ZRAM Configuration
echo '[zram0]' | sudo tee /etc/systemd/zram-generator.conf
echo 'zram-size = ram' | sudo tee -a /etc/systemd/zram-generator.conf
sudo systemctl start systemd-zram-setup@zram0

# Pacman Improvements
sudo sed -i 's/^#Color/Color/; s/^#ParallelDownloads.*/ParallelDownloads = 5/' /etc/pacman.conf
```

17. Security Configuration
```bash

# Firewall
sudo pacman -S --noconfirm ufw
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow 22/tcp
sudo ufw enable

# Security Tools
sudo pacman -S --noconfirm apparmor fail2ban aide firejail
sudo systemctl enable --now apparmor fail2ban aide.timer firejail
```
<a name="automated"></a>
Automated Installation 

```bash

wget https://example.com/install_arch.sh
chmod +x install_arch.sh
sudo ./install_arch.sh
```
   [Manual Installation](#manual)

