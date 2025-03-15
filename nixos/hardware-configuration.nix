{ lib, pkgs, ... }:

{
  boot = {
    initrd = {
      availableKernelModules =
        [ "xhci_pci" "ahci" "nvme" "usbhid" "usb_storage" "sd_mod" ];
      kernelModules = [ ];
    };
    kernelModules = [ "kvm-intel" "ath9k_htc" ];
    extraModulePackages = [ ];
    extraModprobeConfig = ''
      options kvm_intel nested=1
      options kvm_intel emulate_invalid_guest_state=0
      options kvm ignore_msrs=1
    '';
  };

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/e2db87c4-80eb-4633-b792-4faeb32b688a";
      fsType = "ext4";
    };

  fileSystems."/efi" =
    { device = "/dev/disk/by-uuid/89DD-E643";
      fsType = "vfat";
      options = [ "fmask=0022" "dmask=0022" ];
    };

  swapDevices =
    [ { device = "/dev/disk/by-uuid/c48bb07b-ac48-4e3f-aed6-141709373a8d"; }
    ];

  networking.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";

  # Firmware and hardware
  hardware = {
    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };

    enableRedistributableFirmware = false;
    enableAllFirmware = false;
    firmware = with pkgs; [ linux-firmware ];
    graphics = {
      enable = true;
      enable32Bit = true;
    };
  };
  services.xserver.videoDrivers = [ "modesetting" ];
}
