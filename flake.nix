{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    hjem = {
      url = "github:feel-co/hjem";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    lix-module = {
      url = "https://git.lix.systems/lix-project/nixos-module/archive/2.91.1-1.tar.gz";
      inputs.flake-utils.follows = "flake-utils";
    };

    nixos-hardware.url = "github:NixOS/nixos-hardware/master"; #no nixpkgs necessary

    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-compat.follows = "flake-compat";
    };

    nix-minecraft = {
      url = "github:Infinidoge/nix-minecraft";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-utils.follows = "flake-utils";
      inputs.flake-compat.follows = "flake-compat";
    };

    hyprland.url = "github:hyprwm/Hyprland";

    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };

    niqspkgs = {
      url = "github:diniamo/niqspkgs";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.lix.follows = "lix-module";
      inputs.flake-parts.follows = "flake-parts";
    };

    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-utils.follows = "flake-utils";
      inputs.flake-parts.follows = "flake-parts";
    };

    # these inputs exist for other inputs to follow to reduce redundancies
    flake-utils = {
      url = "github:numtide/flake-utils";
    };

    flake-compat = {
      url = "github:edolstra/flake-compat";
    };

    flake-parts = {
      url = "github:hercules-ci/flake-parts";
    };
  };

  outputs = {
    self,
    nixpkgs,
    ...
  } @ inputs: let
    extended-lib = nixpkgs.lib.extend (final: prev: import ./modules/lib/toHyprconf.nix { lib = prev; });
    system = "x86.64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    nixosConfigurations = {
      polaris = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs;
          lib = extended-lib;  
        };
        modules = [
          ./hosts/polaris/configuration.nix
          ./modules/default.nix
          inputs.home-manager.nixosModules.default
          #inputs.lix-module.nixosModules.default
          inputs.agenix.nixosModules.default
          inputs.hjem.nixosModules.default
          inputs.spicetify-nix.nixosModules.default
          inputs.nvf.nixosModules.default

          inputs.nix-minecraft.nixosModules.minecraft-servers
        ];
      };
      procyon = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          ./hosts/procyon/configuration.nix
          ./modules/default.nix
          inputs.home-manager.nixosModules.default
          #inputs.lix-module.nixosModules.default
          inputs.nixos-hardware.nixosModules.framework-13-7040-amd
          inputs.agenix.nixosModules.default
          inputs.hjem.nixosModules.default
          inputs.spicetify-nix.nixosModules.default

          inputs.nix-minecraft.nixosModules.minecraft-servers
        ];
      };
    };
    homeManagerModules.default = ./modules/hm;
  };
}
