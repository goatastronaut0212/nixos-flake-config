{
  services.xserver = {
    displayManager.startx.enable = true;
  };
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;
  programs.hyprland.enable = true;
  programs.sway.enable = true;
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
