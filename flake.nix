{
  description = "My workstation and desktop flake";

  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-24.11";
    };

    nixpkgs-unstable = {
      url = "github:nixos/nixpkgs/nixos-unstable";
    };

    ghostty = {
      url = "github:ghostty-org/ghostty?ref=3f7c3afaf947280bd2852626ff4599c02d9fb07e";
    };

    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    ibus-bamboo = {
      url = "github:BambooEngine/ibus-bamboo";
    };

    nixvim = {
      url = "github:goatastronaut0212/nixvim-flake-config";
    };
  };

  outputs = {
    self,
    nixpkgs,
    nixpkgs-unstable,
    ghostty,
    home-manager,
    ibus-bamboo,
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
        nixos = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs system; };

          modules = [
            # My configuration
            ./nixos/configuration.nix

            home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                extraSpecialArgs = { inherit inputs outputs; };
                users.astronaut = import ./home/home.nix;
              };
            }
          ];
        };
      };
    };
}
