{...}: {
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
        enable = true;
      };
    };
  };
}
