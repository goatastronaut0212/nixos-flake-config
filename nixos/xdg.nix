{ pkgs, ... }:

{
  xdg.portal = {
    xdgOpenUsePortal = true;
    enable = true;
    #wlr.enable = true;
    #extraPortals = [
    #  pkgs.xdg-desktop-portal-wlr
    #];
  };
}
