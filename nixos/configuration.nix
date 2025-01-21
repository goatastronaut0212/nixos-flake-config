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
    ./desktop-environment.nix
    ./environment.nix
    ./fonts.nix
    ./insecure-pkgs.nix
    ./input-method.nix
    ./nix-features.nix
    ./no-packages.nix
    #./steam.nix
    ./qtile.nix

    # Programs and services
    ./flatpak.nix
    ./services/nm-applet.nix

    ./fish.nix

    ./git.nix

    ./nix-ld.nix

    ./openssh.nix

    ./virtualisation.nix
    ./xdg.nix
    ./xorg.nix

    ./users.nix

    ./tlp.nix # Power management

    # Containers
    ./docker.nix
  ];

  nixpkgs = {
    # Add overlays here
    overlays =
      [ outputs.overlays.unstable-packages outputs.overlays.custom-packages ];

    # Configure your nixpkgs instance
    config = { allowUnfree = true; };
  };

  # Set your time zone.
  time.timeZone = "Asia/Ho_Chi_Minh";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.utf8";

  # Enable blueman for bluetooth
  services.blueman.enable = false;

  programs.light.enable = true;

  services.gvfs.enable = true; # Mount, trash, and other functionalities

  system.stateVersion = "24.11";

  services.teamviewer.enable = true;
}
