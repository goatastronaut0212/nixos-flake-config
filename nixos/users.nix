{ pkgs, inputs, system, ... }:

let
  remotegamepad = pkgs.callPackage ../pkgs/remotegamepad.nix {};
in
{
  users.users.astronaut = {
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
      # Container development
      pkgs.awscli2
      pkgs.kubernetes-helm
      pkgs.kubectl

      # Development
      pkgs.code-cursor
      pkgs.blender
      pkgs.dbeaver-bin
      pkgs.libreoffice
      pkgs.krita
      inputs.nixvim.packages."${system}".default
      pkgs.obs-studio
      pkgs.temporal

      # Language
      pkgs.go
      pkgs.openjdk21
      pkgs.nodejs

      # Games
      pkgs.antimicrox
      pkgs.prismlauncher

      # Internet
      pkgs.brave
      pkgs.legcord
      pkgs.element-desktop  # Matrix client
      pkgs.microsoft-edge
      pkgs.transmission_4-gtk
      pkgs.protonvpn-gui
      pkgs.qutebrowser

      # Media player
      pkgs.cmus
      pkgs.kid3
      pkgs.vlc

      # Tools
      pkgs.bc
      pkgs.gnome-network-displays
      pkgs.jq
      pkgs.pcmanfm-qt
      pkgs.pulsemixer
      remotegamepad

      # Ricing tools
      inputs.eww.packages."${system}".default
      pkgs.fastfetch    # System info terminal
      pkgs.fuzzel
      pkgs.lsd          # ls written in Rust with icons
      pkgs.rofi
      pkgs.papirus-icon-theme
      pkgs.powerline-go # for status in fish shell
      pkgs.wezterm

      # Neovim setup
      pkgs.ripgrep
      pkgs.xclip        # Clipping

      # Windows
      pkgs.wineWowPackages.stable
    ];
  };
}
