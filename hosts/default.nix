{
  inputs,
  self,
  ...
}: let
  inherit (self) lib;
  inherit (inputs.nixpkgs.lib) nixosSystem;
  inherit (lib.extendedLib.importers) mkModuleList;

  specialArgs = {
    inherit inputs lib;
  };

  default = {
    profiles = [
      "gaming"
      "workstation"
    ];
    desktop = ["hyprland"];
  };
in {
  flake.nixosConfigurations = {
    polaris = nixosSystem {
      inherit specialArgs;
      modules = mkModuleList {
        hostName = "polaris";

        inherit (default) profiles desktop;
      };
    };
    procyon = nixosSystem {
      inherit specialArgs;
      modules = mkModuleList {
        hostName = "procyon";

        inherit (default) profiles desktop;

        specialImports = [inputs.nixos-hardware.nixosModules.framework-13-7040-amd];
      };
    };
  };
}
