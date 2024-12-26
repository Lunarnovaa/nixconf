{pkgs, ...}: {

  environment.variables.QT_STYLE_OVERRIDE = "Catppuccin-Macchiato-Dark";

  homes.lunarnova.packages = [(pkgs.catppuccin-kde.override {

        flavour = ["macchiato"];
        accents = ["red"];
      })];
}
