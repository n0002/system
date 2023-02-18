# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware.nix
    
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";

  networking.hostName = "katsuragi"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/New_York";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.utf8";

  #Firmware
  services.fwupd.enable = true;

  #Bluetooth 
  hardware.bluetooth = {
    # enable = true;
    package = pkgs.bluezFull;
    # bluetooth not turned on by default
    powerOnBoot = false;
  };

  #services.blueman.enable = true;

  services.auto-cpufreq.enable = true;
  services.thermald.enable = true;
  
  # services.auto-cpufreq.enable = true;
  
  services.tlp = { 
  enable = lib.mkForce false;
  settings = {
    PCIE_ASPM_ON_BAT = "powersupersave";
    RUNTIME_PM_ON_AC= "on";
    CPU_SCALING_GOVERNOR_ON_AC = "powersave";
    CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
  };
};

# Enable the X11 windowing system.
services.xserver.enable = true;

services.xserver.displayManager.gdm.wayland = true;
services.xserver.displayManager.gdm.enable= true;

services.xserver.displayManager.defaultSession = "hyprland";
services.xserver.libinput.enable = true;

services.xserver.desktopManager.xfce.enable = true;
programs.sway.enable = true;
# services.xserver.windowManager.qtile = {
# enable = true;
# };

# Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  
  hardware.pulseaudio.enable = lib.mkForce false;
  # Enable sound with pipewire.
   # sound.enable = true;
  # hardware.pulseaudio.enable = true;

  security.rtkit.enable = true;
  
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;

  
    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  security.polkit.enable = true;


  xdg.portal.wlr.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.n = {
    isNormalUser = true;
    description = "n";
    extraGroups = [ "libvirtd" "networkmanager" "wheel" "audio" ];
    
    # packages = with pkgs; [
    # ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  virtualisation.libvirtd.enable = true;
  
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    psmisc
    exfat
    fzf
    discord-canary
    brave
    ffmpeg
    ntfs3g
    grim
    sway-contrib.grimshot
    slurp
    # python310
    # python310Packages.pip
    blueberry
    swaybg
    mako
    autotiling
    wayland
    wayland-scanner
    swayidle
    wl-clipboard
    wlr-randr
    wayland-utils
    virt-manager
    wayland-protocols
    xwayland
    qt6.qtwayland
    glfw-wayland
    wdisplays
    bluez-tools
    brightnessctl

    # audio packages
    pavucontrol
    wireplumber
    alsa-utils
    alsa-lib
  ];



  nixpkgs.overlays = [
    (self: super: {
      waybar = super.waybar.overrideAttrs (oldAttrs: {
        mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
      });
    })
  ];
  
  
    security.pam.loginLimits = [{
    domain = "*";
    type = "soft";
    item = "nofile";
    value = "262144";
  }];

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
  system.stateVersion = "22.05"; # Did you read the comment?

  nix = {
     settings = {
      auto-optimise-store = true;
      experimental-features = ["nix-command" "flakes"];

      # for direnv GC roots
      keep-derivations = true;
      keep-outputs = true;
        };
        };
		}
