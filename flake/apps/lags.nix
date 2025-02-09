{inputs, ...}: {
  perSystem = {
    inputs',
    system,
    pkgs,
    ...
  }: let
    inherit (builtins) concatLists;

    astalPackages = with inputs'.ags.packages; [
      hyprland
      wireplumber
      network
      bluetooth
      battery
    ];
    nixPackages = with pkgs; [
      pwvucontrol
      blueberry
    ];
    extraPackages = concatLists [
      astalPackages
      nixPackages
    ];
  in {
    # ags derivation for typescript
    packages.lags = inputs.ags.lib.bundle {
      src = ../modules/desktop/hyprland/astal/src;
      inherit pkgs;
      name = "lags";
      entry = "app.ts";
      gtk4 = true;

      inherit extraPackages;
    };
    devShells.${system}.lags = pkgs.mkShell {
      buildInputs = [
        (inputs'.ags.packages.default.override {
          inherit extraPackages;
        })
      ];
    };
  };
}
