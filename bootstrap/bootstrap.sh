#! /usr/bin/env bash

green="$(echo -e "\e[92m")"
bold="$(echo -e "\e[1m")"
reset="$(echo -e "\e[0m")"

function announce_clone() { # REPO DIRECTORY
    if [[ ! -d $2 ]]
    then
        echo "${green}Cloning $1 into $2$reset"
        true
    else
        echo "$bold$2 already exists; skipping cloning $1$reset"
        false
    fi
}

function has_cmd() { # CMD TASK
    if command -v "$1" >/dev/null
    then
        if [[ -n "$2" ]]
        then
            echo "${green}Found command $1; proceeding to $2$reset"
        fi
        true
    else
        if [[ -n "$2" ]]
        then
            echo "${bold}Command $1 not found; skipping $2$reset"
        fi
        false
    fi
}

function bootstrap() {
    if announce_clone dotfiles ~/.dotfiles
    then
        git clone https://github.com/9999years/dotfiles.git ~/.dotfiles
        if has_cmd just "Linking dotfiles"
        then
            pushd ~/.dotfiles || exit
            just
            popd || exit

            if has_cmd fish && fish --command='type -q fisher'
            then
                echo "${green}Installing fish shell fisher plugins$reset"
                fish --command=fisher
            else
                echo "${bold}'fish' not found or 'fisher' not found within fish; skipping fisher install$reset"
            fi
        fi
    fi

    if announce_clone "tpm (https://github.com/tmux-plugins/tpm)" ~/.tmux/plugins/tpm
    then
        mkdir -p ~/.tmux/plugins
        git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    fi

    if announce_clone "vimfiles (for neovim)" ~/.config/nvim
    then
        git clone https://github.com/9999years/vimfiles.git ~/.config/nvim
        if [[ ! -e ~/.nvim ]]
        then
            echo "${green}Creating a symbolic link from ~/.nvim to ~/.config/nvim$reset"
            ln -s ./.config/nvim ~/.nvim
        fi

        if has_cmd nvim "installing vim plugins"
        then
            nvim '+PlugInstall' '+:qa'
        fi
    fi

    case "$(uname -a)" in
        *NixOS*)
            if announce_clone "nix-config" ~/nix-config
            then
                git clone https://github.com/9999years/nix-config.git ~/nix-config
            fi
            ;;
        *)
            echo "${bold}Not on NixOS; not cloning ~/nix-config$reset"
            ;;
    esac
}

bootstrap
