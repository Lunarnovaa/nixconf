{
  inputs,
  self,
  lib,
  ...
}: let
  specialArgs = {
    inherit inputs;
    inherit (self) lib;
  };
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
  inherit (lib.extendedLib.importers) mkModuleList;

  moduleDir = ../modules;
in {
  flake.nixosConfigurations = {
    polaris = inputs.nixpkgs.lib.nixosSystem {
      inherit specialArgs;
      modules = mkModuleList {
        inherit moduleDir;
        programs = [

        ];
        desktop = [
          "hyprland"
          "theme"
        ];
      };
      /*modules = concatLists [
        moduleInputs
        [
          ../modules.nix
          ../hosts/polaris/configuration.nix
        ]
      ];*/
    };
    procyon = inputs.nixpkgs.lib.nixosSystem {
      inherit specialArgs;
      modules = concatLists [
        moduleInputs
        [
          ../modules.nix
          ../hosts/procyon/configuration.nix
          inputs.nixos-hardware.nixosModules.framework-13-7040-amd
        ]
      ];
    };
  };
}
