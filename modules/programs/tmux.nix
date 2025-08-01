{ config, pkgs, lib, ...}:

{
  programs.tmux = {
  enable = true;
  mouse = true;
  baseIndex = 1;
  extraConfig = ''
    set-option -g prefix C-a
    unbind C-b
    bind C-a send-prefix

    # Pane navigation
    bind -n M-h select-pane -L
    bind -n M-j select-pane -D
    bind -n M-k select-pane -U
    bind -n M-l select-pane -R

    bind -n M-H previous-window
    bind -n M-L next-window

    # Session navigation
    bind -n M-J switch-client -p
    bind -n M-K switch-client -n

    # Kill pane / window
    bind -n M-x kill-pane
    bind -n M-X kill-window

    # Create / rename window
    bind -n M-c new-window
    bind -n M-, command-prompt -I "#W" "rename-window '%%'"
    bind -n M-$ command-prompt -I "#S" "rename-session '%%'"

    # Splits
    bind -n M-n split-window -h
    bind -n M-v split-window -v

    # Floating nnn (fake float)
    bind -n M-e split-window -v -p 40 -c "#{pane_current_path}" "nnn; tmux kill-pane"

    # Resize with arrows
    bind -n M-Left resize-pane -L 3
    bind -n M-Right resize-pane -R 3
    bind -n M-Up resize-pane -U 3
    bind -n M-Down resize-pane -D 3

    # htop floating
    bind -n M-t split-window -v -p 40 -c "#{pane_current_path}" "htop; tmux kill-pane"

    # Layout main-vertical
    bind M-4 select-layout main-vertical
    bind -n M-O select-pane -t :.+
    bind -n M-z resize-pane -Z
    bind -n M-f resize-pane -Z
  '';
  };
}
