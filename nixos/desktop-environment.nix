{
  services.xserver = {
    displayManager = {
      startx.enable = false;
    };
  };
  services = {
    desktopManager.plasma6.enable = true;
    displayManager.sddm.enable = true;
  };
}
