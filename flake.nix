{
  description = "My workstation and desktop flake";

  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-24.11";
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
    in {
      # Custom packages and modifications, exported as overlays
      overlays = import ./overlays { inherit inputs pkgs system; };

      # NixOS configuration
      nixosConfigurations = {
        nixos-dell = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs system; };

          modules = [
            # My configuration
            ./nixos/configuration.nix
          ];
        };
      };
    };
}
