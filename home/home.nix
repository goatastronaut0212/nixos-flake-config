{
  home = {
    username = "goatastronaut0212";
    homeDirectory = "/home/goatastronaut0212";

    stateVersion = "25.05";
  };

  imports = [
    ./cursor.nix
  ];

  programs.home-manager.enable = true;

  systemd.user.startServices = "sd-switch";
}
