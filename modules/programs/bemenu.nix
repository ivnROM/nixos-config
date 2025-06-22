{pkgs, config, inputs, lib, ... }:

{
  stylix.targets.bemenu.alternate = true;


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
      file=$(find /etc/nixos -iname "*nix" | ${pkgs.bemenu}/bin/bemenu -b)
      [ -z "$file" ] && exit 0
      #pkexec env WAYLAND_DISPLAY=$WAYLAND_DISPLAY XDG_RUNTIME_DIR=$XDG_RUNTIME_DIR ${pkgs.kitty}/bin/kitty vim "$file"
      ${pkgs.kitty}/bin/kitty -e bash -c "sudo vim '$file'"
    '')

    # (pkgs.writeShellScriptBin "bemenu-runapps" ''
    #   file=$(find /etc/profiles/per-user/$USER "*nix" | ${pkgs.bemenu}/bin/bemenu -b)
    #   [ -z "$file" ] && exit 0
    #   #pkexec env WAYLAND_DISPLAY=$WAYLAND_DISPLAY XDG_RUNTIME_DIR=$XDG_RUNTIME_DIR ${pkgs.kitty}/bin/kitty vim "$file"
    #   ${pkgs.kitty}/bin/kitty -e bash -c "sudo vim '$file'"
    # '')
  ];

}
