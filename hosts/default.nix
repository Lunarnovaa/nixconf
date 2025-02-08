{
  inputs,
  self,
  withSystem,
  ...
}: let
  inherit (self) lib;
  inherit (inputs.nixpkgs.lib) nixosSystem;
  inherit (lib.extendedLib.importers) mkModuleList;

  default = {
    profiles = [
      "gaming"
      "workstation"
    ];
    desktop = ["hyprland"];
  };
in {
  flake.nixosConfigurations = {
    polaris = withSystem "x86_64-linux" ({self', ...}:
      nixosSystem {
        specialArgs = {
          inherit lib inputs self';
        };
        modules = mkModuleList {
          hostName = "polaris";

          inherit (default) profiles desktop;
        };
      });
    procyon = withSystem "x86_64-linux" ({self', ...}:
      nixosSystem {
        specialArgs = {
          inherit lib inputs self';
        };
        modules = mkModuleList {
          hostName = "procyon";

          inherit (default) profiles desktop;

          specialImports = [inputs.nixos-hardware.nixosModules.framework-13-7040-amd];
        };
      });
  };
}
