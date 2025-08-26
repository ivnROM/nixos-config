{pkgs, config, inputs, lib, ... }:

let 
  tofiSettings = "${pkgs.tofi}/bin/tofi";
  editor = config.home.sessionVariables.EDITOR;

in
{

  stylix.targets.tofi.enable = true;

  programs.tofi = {
    enable = true;
    settings = {
      font-size = lib.mkForce 16;
      anchor = "center";
      height = "20%";
      width = "40%";
      scale = "true";
      history = "true";

      ascii-input="true";
      fuzzy-match = "true";
      auto-accept-single = "false";

      result-spacing = 5;

      outline-width=0;
      border-width=0;
      corner-radius=1;
      prompt-text="";
      prompt-padding=25;
      hide-cursor=true;
    };
  };

  # scripts ( VER COMO NO HARDCODEAR EL EDITOR )
  home.packages = [
    (pkgs.writeShellScriptBin "tofi-openconfig" ''
      file=$(find /etc/nixos -iname "*nix" | ${tofiSettings})
      [ -z "$file" ] && exit 0
      {pkgs.foot}/bin/foot bash -c "sudo vim '$file'"
    '')

    (pkgs.writeShellScriptBin "tofi-opennotes" ''
      directory="${config.home.homeDirectory}/Notes"
      file=$(find $directory -iname "*md" | ${tofiSettings})
      [ -z "$file" ] && exit 0

      {pkgs.foot}/bin/foot bash -c "vim \"$directory/$file\""
    '')

    (pkgs.writeShellScriptBin "tofi-openlauncher" ''
      app="$(${pkgs.tofi}/bin/tofi-drun)"
      exec $app
    '')
  ];

}
