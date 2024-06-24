{
  inputs,
  lib,
  config,
  pkgs,
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
    programs.starship = {
      enable = true;
      enableZshIntegration = true;

      settings = {
        add_newline = false;
        character = {
          success_symbol = "[>](bold green)";
          error_symbol = "[x](bold red)";
          vimcmd_symbol = "[<](bold green)";
        };
        git_commit = {
          tag_symbol = " tag ";
        };
        git_status = {
          ahead = ">";
          behind = "<";
          diverged = "<>";
          renamed = "r";
          deleted = "x";
        };
        git_branch = {
          symbol = "git ";
        };
        memory_usage = {
          symbol = "memory ";
        };
        nix_shell = {
          symbol = "nix ";
        };
        os.symbols = {
          NixOS = "nix ";
        };
        package = {
          symbol = "pkg ";
        };
        rust = {
          symbol = "rs ";
        };
        status = {
          symbol = "[x](bold red) ";
        };
      };
    };
  };
}
