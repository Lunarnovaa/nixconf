{...}: let 
in {
  programs.nh = {
    enable = true;
    flake = ../../../.;
    clean = {
      enable = true;
      dates = "weekly";
      extraArgs = "--keep 5 --keep-since 2d";
    };
  };
}