{
  services.xserver = {
    displayManager = {
      startx.enable = false;
      sddm.enable = true;
    };
  };
  services.desktopManager.plasma6.enable = true;
}
