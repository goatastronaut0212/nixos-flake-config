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
      pkgs.unstable.vscode
      pkgs.jetbrains.idea-community-src
      pkgs.jetbrains.pycharm-community-src
      pkgs.obs-studio
      pkgs.temporal

      # Language
      pkgs.unstable.go
      pkgs.openjdk21
      pkgs.nodejs

      # Games
      pkgs.antimicrox
      pkgs.unstable.luanti
      pkgs.prismlauncher

      # Internet
      pkgs.unstable.caprine
      pkgs.legcord
      pkgs.element-desktop  # Matrix client
      pkgs.firefox
      pkgs.microsoft-edge
      pkgs.transmission_4-gtk
      pkgs.unstable.protonvpn-gui

      # Media player
      pkgs.cmus
      pkgs.kid3
      pkgs.vlc

      # Tools
      pkgs.gnome-network-displays
      pkgs.jq
      pkgs.pulsemixer
      remotegamepad

      # Ricing tools
      inputs.eww.packages."${system}".default
      pkgs.fastfetch    # System info terminal
      pkgs.fuzzel
      inputs.ghostty.packages."${system}".default
      pkgs.lsd          # ls written in Rust with icons
      pkgs.rofi
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
