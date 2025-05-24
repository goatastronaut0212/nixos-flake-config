{
  description = "My workstation and desktop flake";

  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-25.05";
    };

    nixpkgs-unstable = {
      url = "github:nixos/nixpkgs/nixos-unstable";
    };

    ags = {
      url = "github:aylur/ags";
    };

    nixvim = {
      url = "github:goatastronaut0212/nixvim-flake-config";
    };
  };

  outputs = {
    self,
    nixpkgs,
    nixpkgs-unstable,
    ags,
    nixvim
  }@inputs:
    let
      inherit (self) outputs;

      # Config settings
      system = "x86_64-linux";

      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };

      unstable-pkgs = import nixpkgs-unstable {
        inherit system;
        config.allowUnfree = true;
      };
    in {
      # Custom packages and modifications, exported as overlays
      overlays = import ./overlays { inherit inputs pkgs unstable-pkgs system; };

      # NixOS configuration
      nixosConfigurations = {
        nixos-dell = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs pkgs unstable-pkgs system; };

          modules = [
            # My configuration
            ./nixos/configuration.nix
          ];
        };
      };
    };
}
