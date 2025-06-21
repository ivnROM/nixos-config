{ pkgs, config, lib, ... }:

{
  programs.zellij = {
    enable = true;
    enableBashIntegration = true;
    settings = {
      simplified_ui = true;
      pane_frames = false;
      hide_session_name = true;
      show_startup_tips = false;
    };
  };
}
