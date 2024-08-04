{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    zsh.enable =
      lib.mkEnableOption "enables zsh";
  };

  config = lib.mkIf config.zsh.enable {
    programs.zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;

      shellAliases = {
        ll = "ls -l";
        ndev = "nix develop --command zsh";
        nbuild = "pushd ~/nixbuild && ndev";
      };

      history.size = 10000;
      history.ignoreAllDups = true;
      history.path = "$HOME/.zsh_history";
      history.ignorePatterns = ["rm *" "pkill *" "cp *"];

      oh-my-zsh = {
        enable = true;
        plugins = [
          "git"
          "colemak"
          "colored-man-pages"
          "colorize"
          "rust"
          "sudo"
          "vscode"
        ];
      };
    };
  };
}
