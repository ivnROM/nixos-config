{pkgs, config, inputs, lib, ... }:

let 
  tofiSettings = "${pkgs.tofi}/bin/tofi";
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
      auto-accept-single = "true";

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
      #pkexec env WAYLAND_DISPLAY=$WAYLAND_DISPLAY XDG_RUNTIME_DIR=$XDG_RUNTIME_DIR ${pkgs.kitty}/bin/kitty vim "$file"
      ${pkgs.kitty}/bin/kitty -e bash -c "sudo vim '$file'"
    '')

    (pkgs.writeShellScriptBin "tofi-opennotes" ''
      file=$(find ${config.home.homeDirectory}/Notes -iname "*md" | ${tofiSettings})
      [ -z "$file" ] && exit 0

      ${pkgs.kitty}/bin/kitty bash -c "vim '$file'"
    '')

    # (pkgs.writeShellScriptBin "bemenu-runapps" ''
    #   file=$(find /etc/profiles/per-user/$USER "*nix" | ${pkgs.bemenu}/bin/bemenu -b)
    #   [ -z "$file" ] && exit 0
    #   #pkexec env WAYLAND_DISPLAY=$WAYLAND_DISPLAY XDG_RUNTIME_DIR=$XDG_RUNTIME_DIR ${pkgs.kitty}/bin/kitty vim "$file"
    #   ${pkgs.kitty}/bin/kitty -e bash -c "sudo vim '$file'"
    # '')
  ];

}
