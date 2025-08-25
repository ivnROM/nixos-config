{pkgs, config, inputs, lib, ... }:

let 
  bemenuSettings = "${pkgs.bemenu}/bin/bemenu -l 5 down --auto-select -c -W 0.3";
  editor = config.home.sessionVariables.EDITOR;
in {

  stylix.targets.bemenu.enable = true;
  stylix.targets.bemenu.alternate = true;
  stylix.targets.bemenu.fontSize = 80;


  programs.bemenu = {
    enable = true;
    settings = {
      binding = "vim";
      ignorecase = "true";
    };
  };

  # scripts ( VER COMO NO HARDCODEAR EL EDITOR )
  home.packages = [
    (pkgs.writeShellScriptBin "bemenu-openconfig" ''
      file=$(find /etc/nixos -iname "*nix" | ${bemenuSettings})
      [ -z "$file" ] && exit 0
      #pkexec env WAYLAND_DISPLAY=$WAYLAND_DISPLAY XDG_RUNTIME_DIR=$XDG_RUNTIME_DIR ${editor} vim "$file"
      ${editor} -e bash -c "sudo vim '$file'"
    '')

    (pkgs.writeShellScriptBin "bemenu-opennotes" ''
      file=$(find ${config.home.homeDirectory}/Notes -iname "*md" | ${bemenuSettings})
      [ -z "$file" ] && exit 0

      ${editor} bash -c "vim $file"
    '')

    # (pkgs.writeShellScriptBin "bemenu-runapps" ''
    #   file=$(find /etc/profiles/per-user/$USER "*nix" | ${pkgs.bemenu}/bin/bemenu -b)
    #   [ -z "$file" ] && exit 0
    #   #pkexec env WAYLAND_DISPLAY=$WAYLAND_DISPLAY XDG_RUNTIME_DIR=$XDG_RUNTIME_DIR ${editor)g vim "$file"
    #   ${editor)g -e bash -c "sudo vim '$file'"
    # '')
  ];

}
