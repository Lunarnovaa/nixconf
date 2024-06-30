{
  inputs,
  lib,
  config,
  ...
}: {
  options = {
    git.enable =
      lib.mkEnableOption "enables git";
  };

  config = lib.mkIf config.git.enable {
    programs.git = {
      enable = true;
      userEmail = "35857948+Lunarnovaa@users.noreply.github.com";
      userName = "lunarnovaa";
      extraConfig.init.defaultBranch = "main";
    };
  };
}
