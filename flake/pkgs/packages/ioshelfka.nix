{
  pkgs ? import <nixpkgs> {},
  lib ? pkgs.lib,
  version ? "v0.1.3",
  nerd ? true,
  type ? "Mono",
}: let
  inherit (pkgs) fetchurl stdenv;
  inherit (lib.strings) concatStrings optionalString;

  name = concatStrings [
    "Ioshelfka"
    type
    (optionalString nerd "Nerd")
  ];
in
  stdenv.mkDerivation {
    pname = "ioshelfka";
    inherit version;

    src = fetchurl {
      # note: if url is changed, so too must hash be
      url = "https://github.com/NotAShelf/Ioshelfka/releases/download/${version}/${name}.zip";
      sha256 = "08asdzan247m5cginjk5wr1cnc5idhn50i5fva7hhb3qisx3hmys";
    };

    sourceRoot = ".";

    nativeBuildInputs = with pkgs; [
      unzip
    ];

    installPhase = let
      installBase = "install -Dm644 result/share/fonts/truetype/*.ttf -t $out/share/fonts/truetype";
      installNerd = "install -Dm644 result/share/fonts/truetype/NerdFonts/NerdFonts/IoshelfkaMono/*.ttf -t $out/share/fonts/truetype/NerdFonts/NerdFonts/IoshelfkaMono";
    in ''
      runHook preInstall

      ${
        if nerd
        then ''
          ${installBase}
          ${installNerd}
        ''
        else installBase
      }

      runHook postInstall
    '';

    meta = {
      description = "Ioshelfka font.";
    };
  }
