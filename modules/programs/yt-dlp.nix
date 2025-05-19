{ pkgs, config, lib, ... }:

{
  programs.yt-dlp = {
    enable = true;
    settings = {
      embed-thumbnail = true;
    };
  extraConfig = ''
      --extract-audio
      --audio-format mp3
      --audio-quality 0
      --embed-metadata
      --embed-thumbnail
      --add-metadata
      --metadata-from-title "%(artist)s - %(title)s"
      --output "%(artist)s - %(title)s.%(ext)s"
    '';
  };
}
