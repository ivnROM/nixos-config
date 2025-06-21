{pkgs, config, inputs, lib, ... }:
{
  stylix.targets.bemenu.alternate = true;


  programs.bemenu = {
    enable = true;

    settings = {
      binding = "vim";
      ignorecase = "true";
      #bottom = "true";
    };
  };

  # scripts ( VER COMO NO HARDCODEAR EL EDITOR )
  home.packages = [
    (pkgs.writeShellScriptBin "bemenu-openconfig" ''


      file=$(find /etc/nixos -iname "*nix" | ${pkgs.bemenu}/bin/bemenu)
      [ -z "$file" ] && exit 0
      #pkexec env WAYLAND_DISPLAY=$WAYLAND_DISPLAY XDG_RUNTIME_DIR=$XDG_RUNTIME_DIR ${pkgs.kitty}/bin/kitty vim "$file"
      ${pkgs.kitty}/bin/kitty -e bash -c "sudo vim '$file'"
    '')
  ];

}
