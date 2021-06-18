# Programs I forget:
abbr -g mdv mdcat
abbr -g cloc tokei
abbr -g top htop  # or ytop!
abbr -g xxd hexd
abbr -g tz timedatectl

# Abbreviations
abbr -g cl clear
abbr -g ca cargo
abbr -g cm chezmoi

# cd
abbr -g c1 'cd ..'
abbr -g c2 'cd ../..'
abbr -g c3 'cd ../../..'
abbr -g c4 'cd ../../../..'
abbr -g c5 'cd ../../../../..'
abbr -g c6 'cd ../../../../../..'
abbr -g c 'cd ..'
abbr -g c. 'cd ..'

# Adding arguments
abbr -g df 'df -h'
abbr -g funced 'funced --save'
abbr -g lt 'll -snew'  # exa sorted by date; newest last
abbr -g perm 'stat -f "%A %N"'
abbr -g root 'sudo -u root (which fish)'
abbr -g s 'sudo systemctl restart'
abbr -g x 'chmod +x'
abbr -g xrdb_merge 'xrdb -merge -I$HOME ~/.Xresources'
abbr -g xclip 'xclip -selection clipboard'
abbr -g info 'info --vi-keys'

# miktex stuff
abbr -g mpm 'sudo mpm --admin --verbose'
abbr -g initexmf 'sudo initexmf --admin --verbose'

# Git
abbr -g gr 'cd (git-repo-root)' # git root
abbr -g gst 'git status'
abbr -g gp 'git pull'
abbr -g gpu 'git push'
abbr -g gd 'git diff HEAD'
abbr -g gdt 'git diff (git-tracking-branch) HEAD'
abbr -g gco 'git checkout'
abbr -g gc 'git commit'
abbr -g gg 'git graph'
abbr -g gl 'git log --stat --graph'
abbr -g gsw 'git switch'
