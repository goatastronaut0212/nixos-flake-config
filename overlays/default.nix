{ inputs, ... }:

{
  unstable-packages = final: prev: {
    unstable = import inputs.nixpkgs-unstable {
      system = final.system;
      config.allowUnfree = true;
    };
  };

  #flake-packages = final: prev: {
    # Veloren
  #  inherit (inputs.veloren.packages."${final.system}") veloren-voxygen;
  #};

  custom-packages = final: prev: {
    ibus = prev.ibus.overrideAttrs { withWayland = true; };

    linux-firmware = prev.linux-firmware.overrideAttrs {
      compressFirmware = false;

      installPhase = ''
        mkdir -p $out/lib/firmware/intel
        mkdir -p $out/lib/firmware/i915
        mkdir -p $out/lib/firmware/rtl_nic
        install iwlwifi-QuZ-a0-jf-b0-72.ucode $out/lib/firmware
        install i915/tgl_dmc_ver2_12.bin $out/lib/firmware/i915
        install intel/ibt-19-0-0.sfi $out/lib/firmware/intel
        install intel/ibt-19-0-0.ddc $out/lib/firmware/intel
        install rtl_nic/rtl8168h-2.fw $out/lib/firmware/rtl_nic
      '';
    };
  };
}
