# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;  # Utilise le dernier noyau stable
  # Set your time zone.
  time.timeZone = "Africa/Algiers";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "fr_FR.UTF-8";
    LC_IDENTIFICATION = "fr_FR.UTF-8";
    LC_MEASUREMENT = "fr_FR.UTF-8";
    LC_MONETARY = "fr_FR.UTF-8";
    LC_NAME = "fr_FR.UTF-8";
    LC_NUMERIC = "fr_FR.UTF-8";
    LC_PAPER = "fr_FR.UTF-8";
    LC_TELEPHONE = "fr_FR.UTF-8";
    LC_TIME = "fr_FR.UTF-8";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = false;

  #hardware.nvidia.modesetting.enable = true;
  
  # Enable the GNOME Desktop Environment.
  #services.xserver.displayManager.gdm.enable = true;
  services.xserver.displayManager.gdm = {
  enable = true;
  wayland= true;
};
  services.xserver.desktopManager.gnome.enable = true;
  
  # Activer Wayland
  # programs.sway.enable = true;  # Si vous choisissez Sway
  # security.polkit.enable = true;  # Nécessaire pour certains outils GNOME/KDE

# Désactiver le pilote open-source "nouveau"
  boot.blacklistedKernelModules = [ "nouveau" ];

# Activer les pilotes Intel (iGPU) et NVIDIA (dGPU)
  hardware.graphics = {
    enable = true;
    #driSupport = true;            # Accélération 3D
    #driSupport32Bit = true;       # Pour les applications 32-bit (Steam, Wine)
    extraPackages = with pkgs; [
      intel-media-driver         # Décodage vidéo Intel (QuickSync)
      vaapiIntel                 # API VA-API pour Intel
      libvdpau-va-gl             # Bridge VA-API → VDPAU (pour NVIDIA)
      nvidia-vaapi-driver        # Accélération vidéo pour NVIDIA
    ];
    };

    # Pilotes NVIDIA (dGPU - dédié)
  hardware.nvidia = {
    modesetting.enable = true;  # Nécessaire pour Wayland
    powerManagement.enable = true;
    open = false;               # Désactive Nouveau (pilote open-source)
    nvidiaSettings = true;      # Pour `nvidia-settings`
    package = config.boot.kernelPackages.nvidiaPackages.stable;

    # Configuration Prime (GPU hybride Intel + NVIDIA)
    prime = {
      sync.enable = true;       # Synchronisation optimale (si supporté)
      intelBusId = "PCI:00:02:0"; # Remplacer par `lspci | grep VGA`
      nvidiaBusId = "PCI:01:00:0"; # Remplacer par `lspci | grep NVIDIA`
    };
  };

    environment.sessionVariables = {
  # Pour Firefox, MPV, etc.
  LIBVA_DRIVER_NAME = "iHD";                   # Intel
  VDPAU_DRIVER = "nvidia";                     # NVIDIA
  GBM_BACKEND = "nvidia-drm";                  # Nécessaire pour Wayland + NVIDIA
  __GLX_VENDOR_LIBRARY_NAME = "nvidia";        # Forcer NVIDIA pour OpenGL
  NVD_BACKEND = "direct";                      # Décodage vidéo NVIDIA

  # Pour les apps Electron (Discord, VSCode)
  NIXOS_OZONE_WL = "1";

  # Pour Firefox/Chromium
  MOZ_ENABLE_WAYLAND = "1";
  EGL_PLATFORM = "wayland";
};

 # hyprland
  programs.hyprland = {
    enable = true;
    xwayland.enable = false;  # Désactiver Xwayland (100% Wayland)
  };
 

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.kilam = {
    isNormalUser = true;
    description = "kilam";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
    #  thunderbird
    ];
  };

  # Install firefox.
  programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  #  wget
     fastfetch
     neovim
     btop
     waybar
     wofi
     grim
     slurp
     wl-clipboard
     kitty
     inxi
     pciutils
     nvtop
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
    services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?

}
