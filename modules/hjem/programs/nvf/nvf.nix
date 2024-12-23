{
  lib,
  config,
  ...
}: let
  inherit (lib) mkIf;
  inherit (config.profiles) workstation;
in {
  config = mkIf workstation.apps.nvf {
    programs.nvf = {
      enable = true;

      settings.vim = {
        viAlias = true;
        vimAlias = true;

        theme = {
          enable = true;
          name = "catppuccin";
          style = "macchiato";
        };

        globals = {
          mapleader = " ";
          maplocalleader = " ";
        };

        options = {
          number = true;
          relativenumber = true;
          mouse = "a";
          showmode = false;
        };

        filetree.neo-tree = {
          enable = true;
        };
        git = {
          enable = true;
        };
        autopairs = {
          nvim-autopairs.enable = true;
        };
      };
    };
  };
}
