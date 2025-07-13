{ pkgs, unstable-pkgs, inputs, system, ... }:

{
  users.users = {
    goatastronaut0212 = {
      isNormalUser = true;
      description = "goatatronaut0212";
      extraGroups = [
        "audio"
        "docker"
        "input"
        "libvirtd"
        "networkmanager"
        "video"
        "wheel"
      ];
      packages = [
        # Development
        pkgs.bruno
        pkgs.dbeaver-bin
        pkgs.drawio
        pkgs.joplin-desktop
        pkgs.libreoffice
        pkgs.obs-studio

        # Icons
        pkgs.papirus-icon-theme

        # Internet
        pkgs.brave
        pkgs.microsoft-edge       # Microsoft proprietary browser
        pkgs.qutebrowser          # vim web qtwebengine browser

        # Tools
        pkgs.bottom               # terminal system tool
        pkgs.cmus                 # Music terminal
        pkgs.fastfetch            # Fetch system tools
        pkgs.fuzzel               # Menu
        pkgs.lsd                  # ls with icons
        pkgs.pavucontrol          # Audio control
        pkgs.pcmanfm-qt           # File manager
        pkgs.powerline-go         # Powerline with icons
        pkgs.mako                 # Wayland notification
        pkgs.networkmanagerapplet # Network manager tray
        pkgs.nwg-look             # GTK apperance settings
        pkgs.swww                 # Image
        pkgs.waybar               # Wayland status bar
        pkgs.wezterm              # Terminal
        pkgs.xwayland-satellite   # For Xorg apps in niri
      ] ++ [
        unstable-pkgs.code-cursor-fhs
        unstable-pkgs.protonvpn-gui
        unstable-pkgs.legcord
      ] ++ [
        inputs.nixvim.packages."${system}".default
      ];
    };
  };
}
