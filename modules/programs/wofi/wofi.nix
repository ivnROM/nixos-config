{ pkgs, config, lib, ... }:

{
  programs.wofi = {
    enable = true;

    settings = {
    };
    #    style = lib.mkForce ./style.css;
  };

  # scripts
  home.packages = [
    (pkgs.writeShellScriptBin "wofi-launcher" ''
      choice=$(echo -e "Zen\nNemo\nSalir" | ${pkgs.wofi}/bin/wofi --dmenu --prompt "Apps")
      case "$choice" in
        Zen) exec zen;;
        Nemo) exec nemo;;
        Salir) exit ;;
        *) exit ;;
        esac
    '') 
  ];
}
