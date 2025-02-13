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
    ./windowmanager/sway.nix
    ./windowmanager/qtile.nix

    # Programs and services
    ./flatpak.nix
    ./steam.nix
    ./services/blueman.nix
    ./services/playetctld.nix

    ./fish.nix

    ./git.nix

    #./nix-ld.nix

    ./openssh.nix
    ./xdg.nix
    ./xorg.nix
    ./users.nix
    ./tlp.nix # Power management
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

  programs.light.enable = true;

  services.gvfs.enable = true; # Mount, trash, and other functionalities

  system.stateVersion = "24.11";
}
