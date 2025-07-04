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
        unstable-pkgs.code-cursor
        unstable-pkgs.protonvpn-gui
        unstable-pkgs.legcord
      ] ++ [
        inputs.nixvim.packages."${system}".default
      ];
    };
    astronaut = {
    isNormalUser = true;
    description = "astronaut";
    extraGroups = [
      "audio"
      "docker"
      "input"
      "libvirtd"
      "networkmanager"
      "video"
      "postgres"
      "wheel"
    ];
    packages = [
      # Development
      pkgs.bruno
      unstable-pkgs.code-cursor
      pkgs.dbeaver-bin
      pkgs.drawio
      pkgs.joplin-desktop
      pkgs.krita

      # Internet
      pkgs.brave
      pkgs.legcord
      pkgs.element-desktop  # Matrix client
      pkgs.qutebrowser
      unstable-pkgs.protonvpn-gui

      # Media player
      pkgs.cmus
      pkgs.kid3
      pkgs.vlc

      # Tools
      pkgs.alacritty
      pkgs.bc
      pkgs.bottom
      pkgs.flameshot
      pkgs.foot
      pkgs.jq
      pkgs.pulsemixer
      pkgs.networkmanagerapplet
      pkgs.nwg-look
      pkgs.mako
      pkgs.pcmanfm-qt
      pkgs.swww               # Image
      pkgs.xwayland-satellite # For Xorg apps in niri

      # Ricing tools
      inputs.ags.packages."${system}".agsFull
      pkgs.fastfetch    # System info terminal
      pkgs.fuzzel
      pkgs.lsd          # ls written in Rust with icons
      pkgs.rofi
      pkgs.papirus-icon-theme
      pkgs.powerline-go # for status in fish shell
      pkgs.waybar
      pkgs.wezterm

      # Neovim setup
      pkgs.ripgrep

      # Windows
      pkgs.wineWowPackages.stable
    ];
    };
  };
}
