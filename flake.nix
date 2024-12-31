{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.follows = "nixos-cosmic/nixpkgs";

    # If you ever get a non x86-64 host, adjust accordingly
    systems = {
      url = "github:nix-systems/x86_64-linux";
    };

    hjem = {
      url = "github:feel-co/hjem";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hjem-rum = {
      #url = "github:/hjem-rum/";
      url = "path:/home/lunarnova/snug/hjem-rum";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.hjem.follows = "hjem";
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

    nixos-cosmic.url = "github:lilyinstarlight/nixos-cosmic";

    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.systems.follows = "systems";
      # stop agenix from importing home-manager and darwin
      inputs.home-manager.follows = "";
      inputs.darwin.follows = "";
    };

    niqspkgs = {
      url = "github:diniamo/niqspkgs";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.systems.follows = "systems";
      inputs.lix.follows = "lix-module";
      inputs.flake-parts.follows = "flake-parts";
    };

    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.systems.follows = "systems";
      inputs.flake-utils.follows = "flake-utils";
      inputs.flake-parts.follows = "flake-parts";
    };

    basix = {
      url = "github:notashelf/basix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-parts.follows = "flake-parts";
      inputs.flake-compat.follows = "flake-compat";
    };

    # these inputs exist for other inputs to follow to reduce redundancies
    flake-utils = {
      url = "github:numtide/flake-utils";
      inputs.systems.follows = "systems";
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
    extended-lib = nixpkgs.lib.extend (final: prev: import ./lib/default.nix {lib = prev;});
    specialArgs = {
      inherit inputs;
      lib = extended-lib;
    };
  in {
    nixosConfigurations = {
      polaris = nixpkgs.lib.nixosSystem {
        inherit specialArgs;
        modules = [
          ./hosts/polaris/configuration.nix
          ./modules/default.nix
          #inputs.lix-module.nixosModules.default
          inputs.agenix.nixosModules.default
          inputs.hjem.nixosModules.default
          inputs.hjem-rum.nixosModules.default
          inputs.spicetify-nix.nixosModules.default
          inputs.nvf.nixosModules.default
          inputs.nixos-cosmic.nixosModules.default

          inputs.nix-minecraft.nixosModules.minecraft-servers
        ];
      };
      procyon = nixpkgs.lib.nixosSystem {
        inherit specialArgs;
        modules = [
          ./hosts/procyon/configuration.nix
          ./modules/default.nix
          #inputs.lix-module.nixosModules.default
          inputs.nixos-hardware.nixosModules.framework-13-7040-amd
          inputs.agenix.nixosModules.default
          inputs.hjem.nixosModules.default
          inputs.spicetify-nix.nixosModules.default

          inputs.nix-minecraft.nixosModules.minecraft-servers
        ];
      };
    };
  };
}
