{pkgs, ...}: {
  fonts = {
    enableDefaultPackages = false;
    packages = with pkgs; [
      # Latin fonts
      roboto-serif
      inter
      nerd-fonts.fira-code

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
}
