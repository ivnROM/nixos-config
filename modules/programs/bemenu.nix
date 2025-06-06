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
    file=$(
      find /etc/nixos \
        \( -path /etc/nixos/.git -o -path /etc/nixos/assets \) -prune -o \
        -type f \
        ! -path /etc/nixos/README.md \
        -print |
      ${pkgs.bemenu}/bin/bemenu --prompt "open config:"
    )

    [ -z "$file" ] && exit 0
    sudo -E -u ${config.home.username} ${pkgs.neovim}/bin/nvim "$file"
    '')
  ];

}
