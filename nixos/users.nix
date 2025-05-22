{ pkgs, inputs, system, ... }:

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
      pkgs.legcord
      pkgs.element-desktop  # Matrix client
      pkgs.microsoft-edge
      pkgs.qutebrowser

      # Media player
      pkgs.cmus
      pkgs.kid3

      # Tools
      pkgs.bc
      pkgs.foot
      pkgs.jq
      pkgs.pulsemixer
      pkgs.rofi
      pkgs.pavucontrol
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
