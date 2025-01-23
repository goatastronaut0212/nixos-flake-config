{
  networking = {
    enableIPv6 = true;
    hostName = "nixos";
    firewall = {
      enable = true;
      allowedTCPPorts = [ 8080 ];
      allowedUDPPorts = [ 8080 ];
    };
    networkmanager = {
      enable = true;
      dns = "none";
    };
    useDHCP = false;
    dhcpcd.enable = false;
    nameservers = [
      "1.1.1.1"
      "1.0.0.1"
      "8.8.8.8"
      "8.8.4.4"
    ];
  };
}
