{ pkgs, ... }:

{
  xdg.portal = {
    xdgOpenUsePortal = true;
    enable = true;
    wlr.enable = true;
    config.common.default = [ "gtk" ];
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
    ];
  };
}
