{ outputs, ... }:

{
  imports = [
    # Hardware config
    ./boot-loader.nix
    ./hardware-configuration.nix
    ./printing.nix
    ./sound.nix
    ./networking.nix

    # NixOS system config
    ./environment.nix
    ./fonts.nix
    ./insecure-pkgs.nix
    ./input-method.nix
    ./nix-features.nix
    ./no-packages.nix
    ./desktop-environment.nix
    ./virtualisation.nix

    # Window Manager
    ./windowmanager/leftwm.nix
    ./windowmanager/niri.nix
    ./windowmanager/sway.nix
    ./windowmanager/river.nix

    # Services
    ./services/blueman.nix
    ./services/flatpak.nix
    ./services/playetctld.nix
    ./services/udev.nix
    ./services/openssh.nix

    # Programs
    ./programs/fish.nix
    ./programs/git.nix
    ./programs/steam.nix

    ./nix-ld.nix

    ./xdg.nix
    ./xorg.nix
    ./users.nix
    ./tlp.nix # Power management
  ];

  nixpkgs = {
    overlays = [ outputs.overlays.custom-packages ];

    # Configure your nixpkgs instance
    config = { allowUnfree = true; };
  };

  # Set your time zone.
  time.timeZone = "Asia/Ho_Chi_Minh";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  programs.light.enable = true;

  services.gvfs.enable = true; # Mount, trash, and other functionalities

  system.stateVersion = "25.05";
}
