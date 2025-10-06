
# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored _approximate
zstyle :compinstall filename '/home/bob/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd
unsetopt extendedglob
bindkey -v
# End of lines configured by zsh-newuser-install

# prompt styling
setopt prompt_subst
autoload -Uz vcs_info
autoload -U colors

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' formats '%F{214} %b%f %m%u%c %a '
zstyle ':vcs_info:*' check-for-changes true 
zstyle ':vcs_info:*' stagedstr ' %F{green}✚%f' 
zstyle ':vcs_info:*' unstagedstr ' %F{red}●%f'

precmd() {
	vcs_info
	print -P "\n%B%F{10}󰉋  %~%b ${vcs_info_msg_0_}"
}

PROMPT='%F%B%(?.%F$.%F{red}%B$ %b($?%))%f%b '
# End of prompt styling

# Path additions
PATH=$PATH:/home/bob/.local/bin
PATH=$PATH:/home/bob/Android/Sdk/platform-tools
# End of Path additions

# user-set variables and aliases
EDITOR=nvim
alias zshconf='nvim ~/.zshrc'
# End of user-set variables and aliases

# yazi configuration
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}
# End of yazi configuration

source /home/bob/.local/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /home/bob/.local/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
