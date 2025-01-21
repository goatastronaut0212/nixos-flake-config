{ pkgs, ... }:

{
  services.xserver.desktopManager.mate = {
    enable = true;
  };

  environment.mate.excludePackages = [
    pkgs.mate.mate-terminal
    pkgs.mate.pluma
  ];
}
