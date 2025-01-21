{ pkgs, ... }:

{
  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  hardware.pulseaudio.support32Bit = true;    ## If compatibility with 32-bit applications is desired.
  hardware.pulseaudio.package = pkgs.pulseaudioFull;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    wireplumber.enable = true;
  };

  # NoiseTorch minimize voice environment
  programs.noisetorch.enable = true;
}
