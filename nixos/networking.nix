{
  networking = {
    enableIPv6 = true;
    hostName = "nixos";
    firewall = {
      enable = true;
      allowedTCPPorts = [ 8080 ];
      allowedUDPPorts = [ 8080 ];
    };
    wireless.iwd.enable = true;
    networkmanager.wifi.backend = "iwd";
  };
}
