{
  services.xserver = {
    desktopManager.gnome = {
      enable = true;
    };
    displayManager.gdm.enable = true;
    windowManager.awesome.enable = true;
  };
  programs.hyprland.enable = true;
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
