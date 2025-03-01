{
  services.xserver = {
    displayManager.startx.enable = true;
  };
  programs.hyprland.enable = true;
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
