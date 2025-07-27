#           _
#   _______| |__
#  |_  / __| '_ \
#   / /\__ \ | | |
#  /___|___/_| |_|

# Launch Starship
eval "$(starship init zsh)"

# Zplug (this is the location that arch installs zpl)
source /usr/share/zsh/scripts/zplug/init.zsh

# Colorize older terminal apps (like man)
# Start blinking
export LESS_TERMCAP_mb=$(tput bold; tput setaf 2) # green
# Start bold
export LESS_TERMCAP_md=$(tput bold; tput setaf 2) # green
# Start stand out
export LESS_TERMCAP_so=$(tput bold; tput setaf 3) # yellow
# End standout
export LESS_TERMCAP_se=$(tput rmso; tput sgr0)
# Start underline
export LESS_TERMCAP_us=$(tput smul; tput bold; tput setaf 1) # red
# End bold, blinking, standout, underline
export LESS_TERMCAP_me=$(tput sgr0)

# aliases
alias ls='exa --long --header --icons --sort=type'
alias tree='exa --tree --level 3'
alias sdn="sudo shutdown -h now" # Quick shutdown
alias cp="cp -i" # Confirm before overwriting something
alias pkg="yay -Q | fzf"
alias yt='youtube-dl --add-metadata -i'
alias cz='git-cz --disable-emoji'

# load the good parts from oh-my-zsh
# zsh auto completion
zplug "lib/completion",      from:oh-my-zsh
# setups up histoyr
zplug "lib/history",         from:oh-my-zsh
# Color highlighting in terminal
zplug "zdharma/fast-syntax-highlighting"
# Auto suggests commands based on history
zplug "zsh-users/zsh-autosuggestions"

# Install plugins if there are plugins that have not been installed (copied from the zplug readme)
if ! zplug check --verbose; then
	printf "Install? [y/N]: "
		if read -q; then
		echo; zplug install
	fi
fi

# # Then, source plugins and add commands to $PATH
zplug load

# run pfetch if terminal is interactive (https://github.com/dylanaraps/pfetch)
[ -z "$PS1" ] || fastfetch
