{
  pkgs,
  inputs,
  ...
}: {
  services.xremap = {
    withX11 = true;
    userName = "lunarnova";

    yamlConfig = ''
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
    '';
  };
}