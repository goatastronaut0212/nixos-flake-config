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

      system = "x86_64-linux";

      unstable-pkgs = import nixpkgs-unstable {
        inherit system;
        config.allowUnfree = true;
      };
    in {
      nixosConfigurations = {
        nixos-dell = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs unstable-pkgs system; };

          modules = [
            # My configuration
            ./nixos/configuration.nix
          ];
        };
      };
    };
}
