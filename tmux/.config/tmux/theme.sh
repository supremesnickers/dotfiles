# base16 tomorrow night
base01='#282a2e'
base03='#969896'

set -g status-left-length 32
set -g status-right-length 150
set -g status-interval 5

# statusbar on top
set-option -g status-position bottom

# default statusbar colors
set-option -g status-style fg=brightblack,bg=default

set-window-option -g window-status-style fg=$base03
set-window-option -g window-status-format " #I #W"

# active window title colors
set-window-option -g window-status-current-style fg=brightred
set-window-option -g window-status-current-format " #I #[bold]#W"

# pane border colors
set-window-option -g pane-active-border-style fg=white
set-window-option -g pane-border-style fg='#222222'

# message text
set-option -g message-style fg=brightblue

# pane number display
set-option -g display-panes-active-colour brightblue
set-option -g display-panes-colour $base01

# clock
set-window-option -g clock-mode-colour brightblue

# prefix highlight
set -g @prefix_highlight_show_copy_mode 'on'
set -g @prefix_highlight_fg 'black'

tm_session_name="#[default,bg=default,fg=brightblue] (#S) "
set -g status-left "$tm_session_name"

tm_tunes="#[fg=brightcyan] #(osascript -l JavaScript ~/dotfiles/tmux/.config/tmux/tunes.js)"
# tm_battery="#[fg=$base0F,bg=$base00] ♥ #(battery)"
tm_date="#[default,fg=white] %R"
tm_host="#[fg=brightyellow,bg=default] #h "

set -g status-right "#{prefix_highlight} $tm_tunes $tm_battery $tm_date $tm_host"
