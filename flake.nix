{
  description = "lunarnova's nixos flake";

  outputs = inputs:
    inputs.flake-parts.lib.mkFlake {inherit inputs;} {
      # This outputs format is heavily inspired by NotAShelf/nyx

      debug = true;
      imports = [./flake];

      # Systems for which the flake will be built is made relative
      # of the systems flake input (referenced from NotAShelf/nyx)
      systems = import inputs.systems;
    };

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

    # system infrastructure

    nixos-hardware.url = "github:NixOS/nixos-hardware/master"; #no nixpkgs necessary

    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.systems.follows = "systems";
      # stop agenix from importing home-manager and darwin
      inputs.home-manager.follows = "";
      inputs.darwin.follows = "";
    };

    flake-parts = {
      url = "github:hercules-ci/flake-parts";
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

    systems = {
      # If you ever get a non x86-64 host, adjust accordingly
      url = "github:nix-systems/x86_64-linux";
    };
  };
}
