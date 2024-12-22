{lib,pkgs,...}: {
  homes.lunarnova = {
    packages = with pkgs; [ git ];
    files.".config/git/config".text = (lib.generators.toINI {} {
      user = {
        email = "35857948+Lunarnovaa@users.noreply.github.com";
        name = "lunarnovaa";
      };
      init.defaultBranch = "main";
    });
  };
}
