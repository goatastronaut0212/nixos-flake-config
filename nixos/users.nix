{ pkgs, unstable-pkgs, inputs, system, ... }:

#let
#  remotegamepad = pkgs.callPackage ../pkgs/remotegamepad.nix {};
#in
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
      # Development
      pkgs.code-cursor
      pkgs.dbeaver-bin
      pkgs.drawio
      pkgs.krita
      inputs.nixvim.packages."${system}".default

      # Games
      pkgs.prismlauncher

      # Internet
      pkgs.brave
      unstable-pkgs.caprine
      pkgs.legcord
      pkgs.element-desktop  # Matrix client
      pkgs.qutebrowser
      unstable-pkgs.protonvpn-gui

      # Media player
      pkgs.cmus
      pkgs.kid3

      # Tools
      pkgs.bc
      pkgs.bottom
      pkgs.flameshot
      pkgs.foot
      inputs.ghostty.packages.${system}.default
      pkgs.jq
      pkgs.pulsemixer
      pkgs.rofi
      pkgs.pavucontrol
      pkgs.networkmanagerapplet
      pkgs.nwg-look
      pkgs.mako
      pkgs.pcmanfm-qt
      pkgs.swaybg
      #remotegamepad

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
}
