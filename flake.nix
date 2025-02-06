{
  description = "lunarnova's nixos flake";

  outputs = inputs:
    inputs.flake-parts.lib.mkFlake {inherit inputs;} {
      # This outputs format is heavily inspired by NotAShelf/nyx

      imports = [
        ./flake
        ./hosts
      ];

      # Systems for which the flake will be built is made relative
      # of the systems flake input (referenced from NotAShelf/nyx)
      systems = import inputs.systems;
    };

  inputs = {
    ## Systems is a fancy flake to unify the systems ##
    ## for which the flake and its inputs are built. ##

    systems = {
      # Currently only use x86_64-linux :)
      url = "github:nix-systems/x86_64-linux";
    };

    ## package inputs ##

    # use the unstable branch
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # used for bibata-hyprcursors
    niqspkgs = {
      url = "github:diniamo/niqspkgs";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.systems.follows = "systems";
      inputs.lix.follows = "";
      inputs.flake-parts.follows = "flake-parts";
    };

    ## system infrastructure ##

    # used for my laptop
    nixos-hardware.url = "github:NixOS/nixos-hardware/master"; #no nixpkgs necessary

    # secrets management
    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.systems.follows = "systems";
      # stop agenix from importing home-manager and darwin
      inputs.home-manager.follows = "";
      inputs.darwin.follows = "";
    };

    # modularizing my flake
    flake-parts = {
      url = "github:hercules-ci/flake-parts";
    };

    ## desktop stuff ##

    # hyprland flake
    hyprland.url = "github:hyprwm/Hyprland/04ac46c54357278fc68f0a95d26347ea0db99496"; #v0.47.0
    # couple quick notes:
    # i use hyprland releases to make it easier to monitor breaking changes. hyprland moves pretty fast and i don't care too much about hyprland's bleeding edge.
    # no input follows because hyprland uses a cache

    # astal, a library for aylur's shell
    astal = {
      url = "github:aylur/astal";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # ags, a scaffolding for using astal with typescript
    ags = {
      url = "github:aylur/ags";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.astal.follows = "astal";
    };

    ## module specific stuff ##

    # a spotify ricer
    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-compat.follows = "flake-compat";
    };

    # minecraft server configured with nix and ran as a service
    nix-minecraft = {
      url = "github:Infinidoge/nix-minecraft";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-utils.follows = "flake-utils";
      inputs.flake-compat.follows = "flake-compat";
    };

    ## shelfware ##

    # base16 palettes in nix
    basix = {
      url = "github:notashelf/basix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-parts.follows = "flake-parts";
      inputs.flake-compat.follows = "flake-compat";
    };

    # not a vim flake / neovim flake / pick your other poison
    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.systems.follows = "systems";
      inputs.flake-utils.follows = "flake-utils";
      inputs.flake-parts.follows = "flake-parts";
    };

    # modified iosevka builds
    ioshelfka = {
      url = "github:notashelf/ioshelfka";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    ## hjem business ##

    # hjem, a replacement for home-manager's tooling
    hjem = {
      url = "github:feel-co/hjem";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # i use a local version for dogfeeding
    hjem-rum = {
      #url = "github:/hjem-rum/";
      url = "path:/home/lunarnova/snug/hjem-rum";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.hjem.follows = "hjem";
    };

    ## input unification, both added to
    flake-utils = {
      url = "github:numtide/flake-utils";
      inputs.systems.follows = "systems";
    };

    flake-compat = {
      url = "github:edolstra/flake-compat";
    };
  };
}
