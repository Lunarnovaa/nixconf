{
  pkgs,
  theme,
  ...
}: let
  inherit (theme) fonts;
  inherit (builtins) concatLists;

  fallbackPackages = with pkgs; [
    corefonts
    vistafonts
  ];
  fallbackFonts = [
    "corefonts"
    "vistafonts"
  ];
in {
  fonts = {
    enableDefaultPackages = false;
    packages = concatLists [
      [
        fonts.monospace.package
        fonts.sans.package
        fonts.serif.package
        fonts.emoji.package
        fonts.cjk.sans.package
        fonts.cjk.serif.package
      ]
      fallbackPackages
    ];
    fontconfig = {
      defaultFonts = {
        serif = concatLists [
          [
            fonts.serif.name
            fonts.cjk.serif.name
          ]
          fallbackFonts
        ];

        sansSerif = concatLists [
          [
            fonts.sans.name
            fonts.cjk.sans.name
          ]
          fallbackFonts
        ];

        monospace = concatLists [
          [
            fonts.monospace.name
            fonts.cjk.serif.name
          ]
          fallbackFonts
        ];
        emoji = [
          fonts.emoji.name
        ];
      };
    };
  };
}
