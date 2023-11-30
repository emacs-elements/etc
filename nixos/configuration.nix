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

  # Mount External Drives

  # Supported file types
  
  # boot.supportedFilesystems = [ "ext4" "vfat" ];
  # boot.initrd.supportedFilesystems = [ "ext4" "vfat" ];

  # fileSystems."/data" =
  # { device = "/dev/disk/by-uuid/d2a55801-08e9-4bad-b905-4c83d7e76ad0";
  #   fsType = "ext4";
  # };

  # fileSystems."/boot" =
  # { device = "/dev/disk/by-uuid/AF9C-DF7D";
  #   fsType = "vfat";
  #   options = [ "rw" "data=ordered" "relatime" ];
  # };

  # fileSystems."/mnt/wdblack" = {
  #   device = "/dev/disk/by-uuid/d2a55801-08e9-4bad-b905-4c83d7e76ad0";
  #   fsType = "ext4";
  #   options = [ "defaults" ];
  # };
  
  # fileSystems."/mnt/wdblack" = {
  #   device = "/dev/sda1";
  #   fsType = "ext4"; # Use the actual filesystem type of /dev/sda1, replace if it's not ext4
  #   options = [ "defaults" ]; # Add necessary mount options, 'defaults' is a placeholder
  #   # Add any other required options or attributes if needed
  # };

  # services.devmon.enable = true;
  # services.gvfs.enable = true;
  # services.udisks2.enable = true;

  # Set your time zone.
  time.timeZone = "Africa/Johannesburg";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_ZA.UTF-8";

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable emacsclient as default editor
  # services.emacs.defaultEditor = true;
  # services.emacs.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  # services.xserver.desktopManager.xfce.enable = true;
  # services.xserver.displayManager.sddm.enable = true;
  # services.xserver.desktopManager.plasma5.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  services.gnome.games.enable = false;
  services.gnome.core-developer-tools.enable = true;

  # Logon automatically

  # services.xserver.displayManager.autoLogin.enable = true;
  # services.xserver.displayManager.autoLogin.user = "tan";

  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  # Installing flatpak

  # xdg.portal = {
  #   enable = true;
  #   extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  # };
  services.flatpak.enable = true;

  # Enable app images
  # boot.kernelModules = [ "fuse" ];
  # security.wrappers.fusermount.source = "${pkgs.fuse}/bin/fusermount";

# Enabling docker service
  virtualisation.docker.enable = true;

# Open ssh server
  services.openssh.enable = true;
  # Enable CUPS to print documents.
  services.printing.enable = true;

#   hardware.printers = {
#   ensurePrinters = [
#     {
#       name = "Brother_HL_L2360D_series";
#       location = "Home";
#       deviceUri = "usb://Dell/1250c%20Color%20Printer?serial=YNP023240";
#       model = "Dell-1250c.ppd.gz";
#       ppdOptions = {
#         PageSize = "A4";
#       };
#     }
#   ];
# };

services.printing.drivers = [ pkgs.brlaser ];

  # Enable sound with pipewire.
  sound.enable = true;
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
  users.users.tan = {
    isNormalUser = true;
    description = "Raoul Comninos";
    extraGroups = [ "networkmanager" "wheel" "docker" "vboxusers"];
    packages = with pkgs; [
      # kate
    #  thunderbird
    ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Install Virtualbox

   virtualisation.virtualbox.host.enable = true;
   users.extraGroups.vboxusers.members = [ "tan" ];
   virtualisation.virtualbox.host.enableExtensionPack = true;
   virtualisation.virtualbox.guest.enable = true;
   virtualisation.virtualbox.guest.x11 = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # emacs29-gtk3
    # etcher
    # gnome-shell-extension-gtk4-desktop-icons-ng-ding
    # gnomeExtensions.clipboard-indicator-2
    # pkgs.gnomeExtensions.dash-to-panel
    # xdg-desktop-portal-gtk
    # (import /home/tan/emacs.nix { inherit pkgs; })    
    appimage-run
    autoPatchelfHook
    brlaser
    cargo
    clipgrab
    distrobox
    ed
    espeak-classic
    fdupes
    ffmpeg_6
    firefox-esr
    flameshot
    fontconfig
    libgccjit
    git
    gnome.dconf-editor
    gnome.gnome-disk-utility
    gnome.gnome-tweaks
    google-chrome
    gparted
    hunspell
    hunspellDicts.en-us
    imagemagick
    jre_minimal
    k3b
    killall
    libnotify
    masterpdfeditor
    microcodeIntel
    mpv
    neovim
    ntfs3g
    okular
    openssh
    rar
    ripgrep
    rlwrap
    rustc
    sublime4
    tesseract
    unzip
    vim
    vscode
    wget
    openai-whisper
    xclip
    xfce.xfce4-pulseaudio-plugin
    xournalpp
    ];

  security.sudo.wheelNeedsPassword = false;

  fonts.fonts = with pkgs; [
  corefonts
  dejavu_fonts
  hack-font
  jetbrains-mono
  roboto-mono
  ubuntu_font_family
  unifont
  ];

  # services.emacs.enable = true;
  # services.emacs.package = import /home/tan/emacs.nix { pkgs = pkgs; };
  # services.emacs.defaultEditor = true;

  # Firewall enable
  
  networking.firewall.enable = true;

  # Allow appimages

  # boot.binfmt.registrations.appimage = {
  #   wrapInterpreterInShell = false;
  #   interpreter = "${pkgs.appimage-run}/bin/appimage-run";
  #   recognitionType = "magic";
  #   offset = 0;
  #   mask = ''\xff\xff\xff\xff\x00\x00\x00\x00\xff\xff\xff'';
  #   magicOrExtension = ''\x7fELF....AI\x02'';
  # };
  
  # Intel

  hardware.cpu.intel.updateMicrocode = true;
  
# security.sudo.configFile = ''
#   Defaults env_reset
#   root ALL=(ALL:ALL) ALL
#   %wheel ALL=(ALL) ALL

#   # Your custom rule
#   tan ALL=(ALL) NOPASSWD: ALL
# '';

  nixpkgs.config.permittedInsecurePackages = [
    "openssl-1.1.1w"
    "4kvideodownloader"
    "masterpdfeditor"
  ];

  # Automatic Updates

  system.autoUpgrade.enable = true;
  system.autoUpgrade.allowReboot = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

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
  system.stateVersion = "23.05"; # Did you read the comment?


}
