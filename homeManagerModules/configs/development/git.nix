{
  inputs,
  lib,
  config,
  ...
}: {
  options = {
    development.enable =
      lib.mkEnableOption "enables development";
  };

  config = lib.mkIf config.development.enable {
    programs.git = {
      enable = true;
      userEmail = "35857948+Lunarnovaa@users.noreply.github.com";
      userName = "lunarnovaa";
      extraConfig.init.defaultBranch = "main";
    };
  };
}
