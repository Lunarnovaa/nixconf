{pkgs, ...}: {
  fonts = {
    enableDefaultPackages = false;
    packages = with pkgs; [
      # Latin fonts
      roboto-serif
      inter
      (nerdfonts.override {fonts = ["FiraCode"];})

      # CJK fonts
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif

      # Emoji
      noto-fonts-color-emoji

      # Microsoft fonts for fallback
      corefonts
      vistafonts
    ];
    fontconfig = {
      defaultFonts = {
        serif = [
          "Roboto Serif"
          "Noto Serif CJK SC"

          "corefonts"
          "vistafonts"
        ];

        sansSerif = [
          "Inter"
          "Noto Sans CJK SC"

          "corefonts"
          "vistafonts"
        ];

        monospace = [
          "Fira Code Nerdfont"
          "Noto Sans Mono CJK SC"

          "corefonts"
          "vistafonts"
        ];
        emoji = [
          "Noto Color Emoji"
        ];
      };
    };
  };

  # Add support for typing Pinyin -> Hanzi
  i18n.inputMethod = {
    enabled = "fcitx5";
    fcitx5.waylandFrontend = true;
    fcitx5.addons = with pkgs; [
      rime-data
      fcitx5-rime
      fcitx5-gtk
      fcitx5-configtool #if having issues with qt compatibility, run fcitx5-config-qt
      fcitx5-chinese-addons
      fcitx5-mozc
    ];
  };
}
