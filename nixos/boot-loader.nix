{
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
    efi.efiSysMountPoint = "/efi";
  };

  boot.supportedFilesystems = [ "ntfs" ];
}
