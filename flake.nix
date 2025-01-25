{
  description = "lunarnova's nixos flake";

  inputs = {
    # pkgs

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    niqspkgs = {
      # used for bibata-hyprcursors
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
      inputs.astal.follows = "astal";
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

    # shelfware

    basix = {
      url = "github:notashelf/basix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-parts.follows = "flake-parts";
      inputs.flake-compat.follows = "flake-compat";
    };

    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.systems.follows = "systems";
      inputs.flake-utils.follows = "flake-utils";
      inputs.flake-parts.follows = "flake-parts";
    };

    ioshelfka = {
      url = "github:notashelf/ioshelfka";
      inputs.nixpkgs.follows = "nixpkgs";
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
      nix-minecraft.nixosModules.minecraft-servers
      hyprland.nixosModules.default
    ];

    inherit (builtins) concatLists;
  in {
    # define the formatter to be run on 'nix fmt'
    formatter.${system} = pkgs.alejandra;

    nixosConfigurations = {
      polaris = nixpkgs.lib.nixosSystem {
        inherit specialArgs;
        modules = concatLists [
          moduleInputs
          [
            ./modules.nix
            ./hosts/polaris/configuration.nix
          ]
        ];
      };
      procyon = nixpkgs.lib.nixosSystem {
        inherit specialArgs;
        modules = concatLists [
          moduleInputs
          [
            ./modules.nix
            ./hosts/procyon/configuration.nix
            inputs.nixos-hardware.nixosModules.framework-13-7040-amd
          ]
        ];
      };
    };
    # ags derivation for typescript
    packages.${system}.lags = inputs.ags.lib.bundle {
      inherit pkgs;
      src = ./modules/desktop/hyprland/astal/src;
      name = "lags";
      entry = "app.ts";
      gtk4 = true;

      extraPackages = let
        ags-pkgs = with inputs.ags.packages.${system}; [
          hyprland
          wireplumber
          network
        ];
        nix-pkgs = with pkgs; [
          pwvucontrol
          blueberry
        ];
      in
        concatLists [
          ags-pkgs
          nix-pkgs
        ];
    };
    devShells.${system}.lags = pkgs.mkShell {
      buildInputs = [
        (inputs.ags.packages.${system}.default.override {
          extraPackages = let
            ags-pkgs = with inputs.ags.packages.${system}; [
              hyprland
              wireplumber
              network
            ];
            nix-pkgs = with pkgs; [
              pwvucontrol
              blueberry
            ];
          in
            concatLists [
              ags-pkgs
              nix-pkgs
            ];
        })
      ];
    };
  };
}
