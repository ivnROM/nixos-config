{ pkgs, config, lib, ... }:

{
  programs.zellij = {
    enable = true;
    enableBashIntegration = true;
    settings = {
      keybinds = {
        normal = {
          "Alt-." = "NewPaneRight";
          "Alt-," = "NewPaneRight";
          "Alt-h" = "MoveFocusLeft";
          "Alt-l" = "MoveFocusRight";
          "Alt-k" = "MoveFocusUp";
          "Alt-j" = "MoveFocusDown";
        };
      };
    };
  };
}
