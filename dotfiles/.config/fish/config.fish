set -l end (printf "\e[0m")
set -Ux LESS_TERMCAP_mb (set_color --bold brred)
set -Ux LESS_TERMCAP_md (set_color --bold 5fafd7)  # Light blue.
set -Ux LESS_TERMCAP_me $end
set -Ux LESS_TERMCAP_so (set_color --reverse --bold ffdb4d)  # Bright yellow.
set -Ux LESS_TERMCAP_se $end
set -Ux LESS_TERMCAP_us (set_color --underline 9eff96)  # Light green.
set -Ux LESS_TERMCAP_ue $end
