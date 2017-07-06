#!/bin/bash

function get_opt() {
   local option=$1
   local default_value=$2
   local option_value="$(tmux show-option -gqv "$option")"

   if [ -z "$option_value" ]; then
      echo "$default_value"
   else
      echo "$option_value"
   fi
}

function set_opt() {
   local option=$1
   local value=$2
   tmux set-option -gq "$option" "$value"
}

function set_win_opt() {
   local option=$1
   local value=$2
   tmux set-window-option -gq "$option" "$value"
}

# default statusbar colors
set_opt status-bg black #base02
set_opt status-fg yellow #yellow
set_opt status-attr default

# default window title colors
set_win_opt window-status-fg brightblue #base0
set_win_opt window-status-bg default
#set_win_opt window-status-attr dim

# active window title colors
set_win_opt window-status-current-fg brightred #orange
set_win_opt window-status-current-bg default
#set_win_opt window-status-current-attr bright

# pane border
set_opt pane-border-fg black #base02
set_opt pane-active-border-fg brightgreen #base01

# message text
set_opt message-bg black #base02
set_opt message-fg brightred #orange

# pane number display
set_opt display-panes-active-colour blue #blue
set_opt display-panes-colour brightred #orange

# clock
set_win_opt clock-mode-colour green #green


set_opt "status" "on"
set_opt "status-justify" "left"

set_opt "status-left-length" "100"
set_opt "status-right-length" "100"
set_opt "status-right-attr" "none"

set_opt "message-command-fg" "brightred"
set_opt "message-command-bg" "black"

set_opt "status-attr" "none"
set_opt "status-left-attr" "none"
set_win_opt "window-status-attr" "none"

set_win_opt "window-status-activity-bg" "black"
set_win_opt "window-status-activity-fg" "black"
set_win_opt "window-status-activity-attr" "none"

set_win_opt "window-status-separator" ""

set_opt "@prefix_highlight_fg" "black"
set_opt "@prefix_highlight_bg" "brightred"
set_opt "@prefix_highlight_copy_mode_attr" "fg=black,bg=brightred"
set_opt "@prefix_highlight_output_prefix" "  "

status_widgets=$(get "@solarized_powerline_widgets")
time_format=$(get "@solarized_powerline_time_format" "%R")
date_format=$(get "@solarized_powerline_date_format" "%d/%m/%Y")
date_time_seperator=$(get "@solarized_powerline_date_time_seperator" "")

set_opt"status-right" "#[fg=white,bg=black,nounderscore,noitalics]\
  ${time_format} ${date_time_seperator} ${date_format} \
  #[fg=visual_grey,bg=black]\
  #[fg=visual_grey,bg=visual_grey]\
  #[fg=white, bg=visual_grey]${status_widgets}\
  #[fg=green,bg=visual_grey,nobold,nounderscore,noitalics]\
  #[fg=black,bg=green,bold] #h #[fg=yellow, bg=green]\
  #[fg=red,bg=yellow]"
set_opt"status-left" "#[fg=visual_grey,bg=green,bold] #S \
  #{prefix_highlight}#[fg=green,bg=visual_grey,nobold,nounderscore,noitalics]"

set_opt"window-status-format" "#[fg=black,bg=black,nobold,nounderscore,noitalics]\
  #[fg=white,bg=black] #I  #W \
  #[fg=black,bg=black,nobold,nounderscore,noitalics]"
set_opt"window-status-current-format" \
  "#[fg=black,bg=visual_grey,nobold,nounderscore,noitalics]\
  #[fg=white,bg=visual_grey,nobold] #I  #W \
  #[fg=visual_grey,bg=black,nobold,nounderscore,noitalics]"
