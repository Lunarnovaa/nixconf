{
  inputs,
  lib,
  config,
  ...
}: {
  config = lib.mkIf config.fastfetch.enable {
    programs.fastfetch = {
      enable = true;
      settings = {
        logo = {
          source = "nixos";
          padding = {
            right = 1;
          };
        };
        display = {
          size = {
            binaryPrefix = "si";
          };
          color = "green";
          separator = ": ";
        };
        modules = [
          {
            type = "os";
            key = "OS";
          }
          {
            type = "kernel";
            key = "Kernel";
          }
          {
            type = "gpu";
            key = "GPU";
          }
          {
            type = "cpu";
            key = "CPU";
          }
          {
            type = "memory";
            key = "Memory";
            format = "{2}"; #just total
          }
          "break"
          {
            type = "de";
            key = "DE";
          }
          {
            type = "wm";
            key = "WM";
          }
          {
            type = "terminal";
            key = "Terminal";
          }
          {
            type = "theme";
            key = "Theme";
          }
          {
            type = "icons";
            key = "Icons";
          }
          "break"
          {
            type = "datetime";
            key = "Date";
            format = "{3}-{11}-{1}";
          }
          {
            type = "datetime";
            key = "Time";
            format = "{14}:{17}";
          }
          {
            type = "uptime";
            key = "Uptime";
          }
          "break"
          "colors"
        ];
      };
    };
  };
}
