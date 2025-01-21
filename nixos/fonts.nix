{ pkgs, ... }:

{
  fonts.packages = with pkgs; [
    barlow
    font-awesome
    (nerdfonts.override { fonts = [ "CascadiaCode" "JetBrainsMono" "Terminus" "Iosevka" ]; })
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
  ];
}
