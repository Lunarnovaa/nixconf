{inputs, lib, config, ... }: {
  
  options = {
    git.enable =
      lib.mkEnableOption "enables git";
    };
  
  config = lib.mkIf config.git.enable {
    programs.git = {
      enable = true;
      userEmail = "auraboreal@proton.me";
      userName = "lunarnovaa";
      extraConfig.init.defaultBranch = "main";
    };
  };
}