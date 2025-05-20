{ pkgs, config, lib, ... }:

{
  programs.kitty = {
    enable = true;
    font = {
      name = lib.mkForce "FiraCode Nerd Font";
      size = lib.mkForce 20;
    };

    settings = {
      confirm_os_window_close = 0;
      enable_audio_bell = false;
      window_padding_width = 0;
      background_blur = 5;
      
      cursor_shape = "beam";
      cursor_trail = 1;
      cursor_trail_decay = "0.1 0.25";
      cursor_trail_start_threshold = 2;
      cursor_blink_interval = "0.5 linear ease-in-out";

    };

  };
}
