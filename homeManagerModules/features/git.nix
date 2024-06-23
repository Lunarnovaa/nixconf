{inputs, ... }: {
  programs.git = {
    enable = true;
    userEmail = "auraboreal@proton.me";
    userName = "lunarnovaa";
    extraConfig.init.defaultBranch = "main";
  };
}