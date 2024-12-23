{
  lib,
  pkgs,
  ...
}: let
  toINI = lib.generators.toINI {};
in {
  homes.lunarnova = {
    packages = with pkgs; [git];
    files.".config/git/config".text = toINI {
      user = {
        email = "35857948+Lunarnovaa@users.noreply.github.com";
        name = "lunarnovaa";
      };
      init.defaultBranch = "main";
    };
  };
}
