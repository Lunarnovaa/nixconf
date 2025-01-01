{
  description = "lunarnova's nixos flake";

  inputs = {
    # pkgs

    nixpkgs.follows = "nixos-cosmic/nixpkgs";

    niqspkgs = {
      url = "github:diniamo/niqspkgs";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.systems.follows = "systems";
      inputs.lix.follows = "";
      inputs.flake-parts.follows = "flake-parts";
    };

    # system infra

    nixos-hardware.url = "github:NixOS/nixos-hardware/master"; #no nixpkgs necessary

    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.systems.follows = "systems";
      # stop agenix from importing home-manager and darwin
      inputs.home-manager.follows = "";
      inputs.darwin.follows = "";
    };

    # desktop stuff

    hyprland.url = "github:hyprwm/Hyprland";

    astal = {
      url = "github:aylur/astal";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    ags = {
      url = "github:aylur/ags";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-cosmic.url = "github:lilyinstarlight/nixos-cosmic";

    basix = {
      url = "github:notashelf/basix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-parts.follows = "flake-parts";
      inputs.flake-compat.follows = "flake-compat";
    };

    # module specific stuff

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

    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.systems.follows = "systems";
      inputs.flake-utils.follows = "flake-utils";
      inputs.flake-parts.follows = "flake-parts";
    };

    # hjem business

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

    # input unification

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

    systems = {
      # If you ever get a non x86-64 host, adjust accordingly
      url = "github:nix-systems/x86_64-linux";
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
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};

    moduleInputs = with inputs; [
      agenix.nixosModules.default
      hjem.nixosModules.default
      hjem-rum.nixosModules.default
      spicetify-nix.nixosModules.default
      nvf.nixosModules.default
      nixos-cosmic.nixosModules.default
      nix-minecraft.nixosModules.minecraft-servers
    ];
  in {
    # define the formatter to be run on 'nix fmt'
    formatter.${system} = pkgs.alejandra;

    nixosConfigurations = {
      polaris = nixpkgs.lib.nixosSystem {
        inherit specialArgs;
        modules = builtins.concatLists [
          [
            ./hosts/polaris/configuration.nix
            ./modules/default.nix
          ]
          moduleInputs
        ];
      };
      procyon = nixpkgs.lib.nixosSystem {
        inherit specialArgs;
        modules = builtins.concatLists [
          [
            ./hosts/procyon/configuration.nix
            ./modules/default.nix
            inputs.nixos-hardware.nixosModules.framework-13-7040-amd
          ]
          moduleInputs
        ];
      };
    };
    # ags derivation for typescript
    packages.${system}.ags = inputs.ags.lib.bundle {
      inherit pkgs;
      src = ./modules/desktop/hyprland/astal/app;
      name = "lag-shell";
      entry = "app.ts";
      gtk4 = true;

      extraPackages = [
      ];
    };
    devShells.${system} = {

    };
  };
}
