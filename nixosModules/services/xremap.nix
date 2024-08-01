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
            CapsLock-e: Up
            CapsLock-h: Left
            CapsLock-n: Down
            CapsLock-i: Right
            CapsLock-z: Undo
            CapsLock-x: Cut
            CapsLock-c: Copy
            CapsLock-v: Paste
    '';
  };
}
