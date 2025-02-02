{
  inputs,
  self,
  
  ...
}: let
  inherit (self) lib;
  specialArgs = {
    inherit inputs lib;
  };
  inherit (lib.extendedLib.importers) mkModuleList;

  moduleDir = ../modules;
in {
  flake.nixosConfigurations = {
    polaris = inputs.nixpkgs.lib.nixosSystem {
      inherit specialArgs;
      modules = mkModuleList {
        hostModule = ./polaris;
        inherit moduleDir;
        profiles = [
          "gaming"
          "workstation"
        ];
        desktop = ["hyprland"];
      };
    };
    procyon = inputs.nixpkgs.lib.nixosSystem {
      inherit specialArgs;
      modules = mkModuleList {
        inherit moduleDir;
        hostName = "procyon";
        profiles = [
          "gaming"
          "workstation"
        ];
        desktop = ["hyprland"];
        specialImports = [inputs.nixos-hardware.nixosModules.framework-13-7040-amd];
      };
    };
  };
}
