{lib}: {
  # Taken from https://github.com/nix-community/home-manager
  # toHyprconf is available under the MIT License.

  toHyprconf = {
    attrs,
    indentLevel ? 0,
    importantPrefixes ? ["$"],
  }: let
    inherit
      (lib)
      all
      concatMapStringsSep
      concatStrings
      concatStringsSep
      filterAttrs
      foldl
      generators
      hasPrefix
      isAttrs
      isList
      mapAttrsToList
      replicate
      ;

    initialIndent = concatStrings (replicate indentLevel "  ");

    toHyprconf' = indent: attrs: let
      sections =
        filterAttrs (n: v: isAttrs v || (isList v && all isAttrs v)) attrs;

      mkSection = n: attrs:
        if lib.isList attrs
        then (concatMapStringsSep "\n" (a: mkSection n a) attrs)
        else ''
          ${indent}${n} {
          ${toHyprconf' "  ${indent}" attrs}${indent}}
        '';

      mkFields = generators.toKeyValue {
        listsAsDuplicateKeys = true;
        inherit indent;
      };

      allFields =
        filterAttrs (n: v: !(isAttrs v || (isList v && all isAttrs v)))
        attrs;

      isImportantField = n: _:
        foldl (acc: prev:
          if hasPrefix prev n
          then true
          else acc)
        false
        importantPrefixes;

      importantFields = filterAttrs isImportantField allFields;

      fields =
        builtins.removeAttrs allFields
        (mapAttrsToList (n: _: n) importantFields);
    in
      mkFields importantFields
      + concatStringsSep "\n" (mapAttrsToList mkSection sections)
      + mkFields fields;
  in
    toHyprconf' initialIndent attrs;

  # Partially taken from https://github.com/nix-community/home-manager
  # the function itself is available under the MIT License.
  toSwaylockConf = {attrs}: let
    inherit (lib) concatStrings mapAttrsToList;
  in
    concatStrings (mapAttrsToList (n: v:
      if v == false
      then ""
      else
        (
          if v == true
          then n
          else n + "=" + builtins.toString v
        )
        + "\n")
    attrs);

  # toGtk3Ini , formatGtk2Option , and finalGtk2Text are all taken from https://github.com/nix-community/home-manager, with some minor modifications to their function.
  # All of the gtk generator functions are available under the MIT License.
  gtk = let
    inherit (lib) generators isBool boolToString mapAttrsToList concatMapStrings isString escape;
    formatGtk2Option = n: v: let
      v' =
        if isBool v
        then boolToString v
        else if isString v
        then ''"${v}"''
        else toString v;
    in "${escape ["="] n} = ${v'}";
  in {
    toGtk3Ini = generators.toINI {
      mkKeyValue = key: value: let
        value' =
          if isBool value
          then boolToString value
          else toString value;
      in "${escape ["="] key}=${value'}";
    };
    formatGtk2Option = n: v: let
      v' =
        if isBool v
        then boolToString v
        else if isString v
        then ''"${v}"''
        else toString v;
    in "${escape ["="] n} = ${v'}";
    finalGtk2Text = {attrs}: concatMapStrings (l: l + "\n") (mapAttrsToList formatGtk2Option attrs);
  };
}
