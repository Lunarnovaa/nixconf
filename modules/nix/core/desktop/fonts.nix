{
  pkgs,
  config,
  ...
}: {
  # Configurating Fonts including support for Hanzi
  fonts = {
    enableDefaultPackages = false;
    packages = builtins.attrValues {
      inherit
        (pkgs)
        inter
        ubuntu_font_family #ubuntu-monospace
        
        roboto-serif
        noto-fonts-cjk-sans
        noto-fonts-cjk-serif
        ;
    };
    fontconfig = {
      defaultFonts = {
        serif = ["Noto Serif CJK SC" "Roboto Serif"];
        sansSerif = ["Noto Sans CJK SC" "Inter"];
        monospace = ["Noto Sans Mono CJK SC" "Ubuntu Monospace"];
      };
    };
  };

  # Adding support for typing Pinyin -> Hanzi
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
