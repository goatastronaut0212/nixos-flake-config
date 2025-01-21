{
  home = {
    username = "astronaut";
    homeDirectory = "/home/astronaut";

    stateVersion = "24.11";
  };

  imports = [
    ./cursor.nix
  ];

  programs.home-manager.enable = true;

  systemd.user.startServices = "sd-switch";
}
