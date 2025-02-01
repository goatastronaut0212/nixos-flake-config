{ pkgs, ... }:

{
  xdg.portal = {
    xdgOpenUsePortal = true;
    enable = true;
    wlr.enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal-wlr
    ];
  };
}
