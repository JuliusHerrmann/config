# User specific environment
typeset -U PATH path
PATH="$HOME/.local/bin:$HOME/bin:$PATH:/home/julius/Flutter/flutter/bin"
export PATH="$HOME/Documents/scripts:$HOME/.symfony/bin:$PATH"
export PATH

# User specific aliases and functions
alias ls="ls --color=auto"
alias ip="ip -c"
alias lsa="ls -A"
alias lsc="ls -lah"
alias ..="cd .."
alias .2="cd ../.."
alias .3="cd ../../.."
alias .4="cd ../../../.."
alias .5="cd ../../../../.."
alias v=nvim
alias r=ranger
# get external ip
alias exip='curl ipinfo.io/ip'
alias mpv="devour mpv"
alias sxiv="devour sxiv"
alias zathura="devour zathura"
alias weather="curl v2.wttr.in/${1:-Saarbrücken}\?lang=de --silent | less -S -R -#3"
alias sx="startx"
alias sudo="sudo "
alias tablet="sudo python ~/Documents/reMarkable/rmTabletDriver/tabletDriver.py remarkable"
alias clip="xclip -selection clipboard"
# the only really needed alias
alias 🤌="sudo "
# for easy dotfile management
alias config='/usr/bin/git --git-dir=/home/julius/.cfg/ --work-tree=/home/julius'

# The following lines were added by compinstall
zstyle ':completion:*' completer _expand _complete _ignored
zstyle :compinstall filename '/home/julius/.zshrc'

autoload -Uz compinit
compinit
# complete aliases
setopt COMPLETE_ALIASES
# End of lines added by compinstall

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
unsetopt beep
setopt HIST_IGNORE_ALL_DUPS 
# End of lines configured by zsh-newuser-install

#export PS1="%~ -> "
#export PS1="%1~ -> "
export PS1="%1~ 🦥 > "
zstyle ':completion:*' menu select
# Beam cursor
echo -ne '\e[5 q'

# cdr to go to recent direcory
autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs
zstyle ':completion:*:*:cdr:*:*' menu selection
bindkey -M vicmd '?' history-incremental-search-backward
bindkey -M vicmd '/' history-incremental-search-forward

# vi-mode settings
bindkey -v
export KEYTIMEOUT=1
function zle-keymap-select zle-line-init {
  case $KEYMAP in
    vicmd) echo -ne '\e[1 q';;
    viins|main) echo -ne '\e[5 q';;
  esac
  zle reset-prompt
}
zle -N zle-keymap-select
zle -N zle-line-init

# Autohashing
# Go to arch wiki to find pacman hook

zshcache_time="$(date +%s%N)"

autoload -Uz add-zsh-hook

rehash_precmd() {
  if [[ -a /var/cache/zsh/pacman ]]; then
    local paccache_time="$(date -r /var/cache/zsh/pacman +%s%N)"
    if (( zshcache_time < paccache_time )); then
      rehash
      zshcache_time="$paccache_time"
    fi
  fi
}

add-zsh-hook -Uz precmd rehash_precmd
# set Firefox as default browser
#export BROWSER=/usr/bin/firefox

#display a cute cat :)
fm6000 --cat 
#load better vim mode
#source /usr/share/zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh
#export KEYTIMEOUT=1
