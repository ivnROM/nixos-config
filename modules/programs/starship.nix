{ config, pkgs, ... }:

{
  programs.starship = {
    enable = true;

    # Cargar configuración desde un archivo TOML separado (opcional)
    settings = {
      format = "$directory$git_branch$git_status$cmd_duration$line_break$character";
      right_format = "$time";

      # Prompt character
      character = {
        success_symbol = "[➜](bold green)";
        error_symbol = "[✗](bold red)";
      };

      # Módulo de duración del comando anterior
      cmd_duration = {
        min_time = 500;
        format = "took [$duration]($style) ";
        style = "yellow";
      };

      # Directorio actual
      directory = {
        truncation_length = 3;
        truncate_to_repo = false;
        style = "blue";
      };

      # Rama de git
      git_branch = {
        format = "[$branch]($style) ";
        style = "purple";
      };

      # Estado del repo git
      git_status = {
        format = "[$all_status]($style)";
        style = "red";
      };

      # Módulo de hora (útil en right_prompt)
      time = {
        disabled = false;
        format = "[$time]($style)";
        time_format = "%H:%M";
        style = "dimmed white";
      };
    };
  };
}

