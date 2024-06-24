{ inputs, pkgs, lib, config, ... }:

 let 
    startupScript = pkgs.pkgs.writeShellScriptBin "start" ''
    ${pkgs.waybar}/bin/waybar'';

#WALLPAPER IS VERY TEMP LOL
  in {
        wayland.windowManager.hyprland = {
          enable = true;
          settings = {
            exec-once = ''${startupScript}/bin/start'';
            #MONITORS
            monitor = [ 
            "HDMI-A-1, 1920x1080, 0x0, 1"
            "DP-4, 1920x1080, -1920x0, 1"
            ];

            #KEY BINDINGS
            "$mod" = "SUPER";
            bindm = [
              #mouse movements
              "ALT, mouse:272, movewindow"
              "ALT, mouse:273, resizewindow"
            ];
            bind = [
              ", Print, exec, hyprshot -m region" #take a screenshot
              "$mod, Q, exec, kitty"
              "$mod, W, exec, firefox"
              "$mod, P, exec, tofi-drun | xargs hyprctl dispatch exec --"
              "$mod, C, killactive,"
            ];



            input = {
              kb_layout = "us";
              kb_variant = "colemak";
              follow_mouse = 1;
              sensitivity = -.8;
            };
          };
        };
		programs = {
			kitty.enable = true;
			mako.enable = true;
			tofi.enable = true;
		};
		
    }

