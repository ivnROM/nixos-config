{ pkgs, config, lib, ... }:

{
  stylix.targets.yazi.enable = true;

  programs.yazi = {
    enable = true;
    enableBashIntegration = true;
    shellWrapperName = "y";
    keymap = {
      mgr = {
        prepend_keymap = [
          {
            on   = "!";
            for  = "unix";
            run  = "shell \"$SHELL\" --block";
            desc = "Open $SHELL here";
          }
        ];
      };
    };
    settings = {
      opener = {
        read = [
          {
            run = "okular \"$@\"";
            orphan = true;
            for = "unix";
          }
        ];
      };
      open = {
        append_rules = [
          {
            name = "*.pdf";
            use = "read";
          }
        ];
      };
    };
  };
}
