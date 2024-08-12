{
  pkgs,
  inputs,
  config,
  lib,
  ...
}: {
  options = {
    xremap.enable =
      lib.mkEnableOption "enables xremap";
  };

  config = lib.mkIf config.xremap.enable {
    services.xremap = {
      withKDE = true;
      mouse = true;

      yamlConfig =
        /*
        yaml
        */
        ''
          virtual_modifiers:
            - CapsLock
          keymap:
            - remap:
                CapsLock-i: Up
                CapsLock-j: Left
                CapsLock-k: Down
                CapsLock-l: Right

                CapsLock-z: Undo
                CapsLock-x: Cut
                CapsLock-c: Copy
                CapsLock-v: Paste

                CapsLock-g: Backspace

                CapsLock-esc: SHIFT-KEY_GRAVE

                #CapsLock-BTN_1: BTN_2

        '';
    };
  };
}
