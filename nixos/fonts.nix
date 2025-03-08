{ pkgs, ... }:

{
  fonts.packages = with pkgs; [
    barlow
    font-awesome
    nerd-fonts.iosevka
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
  ];
}
