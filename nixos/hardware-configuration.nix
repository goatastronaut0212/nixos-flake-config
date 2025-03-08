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
    { device = "/dev/disk/by-uuid/09910999-c1e5-4794-a6ea-1338ef1711aa";
      fsType = "ext4";
    };

  fileSystems."/efi" =
    { device = "/dev/disk/by-uuid/EDC4-E848";
      fsType = "vfat";
      options = [ "fmask=0022" "dmask=0022" ];
    };

  swapDevices =
    [ { device = "/dev/disk/by-uuid/18a9c5f4-657d-4f91-8da1-9080f8e8526d"; }
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
