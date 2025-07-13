{
  description = "My workstation and desktop flake";

  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-25.05";
    };

    nixpkgs-unstable = {
      url = "github:nixos/nixpkgs/nixos-unstable";
    };

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
    };

    nixvim = {
      url = "github:goatastronaut0212/nixvim-flake-config";
    };
  };

  outputs = {
    self,
    nixpkgs,
    nixpkgs-unstable,
    home-manager,
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
      overlays = import ./overlays;

      nixosConfigurations = {
        nixos-dell = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs unstable-pkgs system; };

          modules = [
            # My configuration
            ./nixos/configuration.nix

            home-manager.nixosModules.home-manager {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.goatastronaut0212 = import ./home/home.nix;
            }
          ];
        };
      };
    };
}
