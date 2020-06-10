# Path to your oh-my-zsh installation.
export ZSH="/home/danh/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"


source $ZSH/oh-my-zsh.sh

#Non default configuration
bindkey -v
bindkey 'jj' vi-cmd-mode
/usr/bin/xset r rate 185 14

export LANG=en_US.utf8 
export LC_ALL=en_US.UTF-8

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1500
SAVEHIST=1500
bindkey -v
bindkey -M viins 'jj' vi-cmd-mode
# End of lines configured by zsh-newuser-install


### -- POWERLEVEL9K CUSTOMIZATION -- ###
spacing() {
	echo " "
}
POWERLEVEL9K_CUSTOM_SPACING="spacing"
POWERLEVEL9K_CUSTOM_SPACING_BACKGROUND='clear'
prompt_char() {
	print "%k%F{1}❯"
	#echo test
}
POWERLEVEL9K_CUSTOM_PROMPT_CHAR="prompt_char"
POWERLEVEL9K_CUSTOM_PROMPT_CHAR_BACKGROUND='clear'
#POWERLEVEL9K_CUSTOM_PROMPT_CHAR_FOREGROUND=69

#POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
#POWERLEVEL9K_PROMPT_ON_NEWLINE=true
#POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="\uE602 "
#POWERLEVEL9K_DISABLE_RPROMPT=true
POWERLEVEL9K_DIR_HOME_BACKGROUND='clear'
POWERLEVEL9K_DIR_HOME_FOREGROUND=2
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='clear'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND=2
POWERLEVEL9K_DIR_ETC_BACKGROUND='clear'
POWERLEVEL9K_DIR_ETC_FOREGROUND=2
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND='clear'
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND=3
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(vi_mode custom_spacing dir custom_spacing custom_prompt_char)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(vcs)
POWERLEVEL9K_VCS_CLEAN_FOREGROUND=4
POWERLEVEL9K_VCS_CLEAN_BACKGROUND='clear'
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND=4
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='clear'
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND=4
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='clear'
POWERLEVEL9K_VI_MODE_NORMAL_BACKGROUND='clear'
POWERLEVEL9K_VI_MODE_NORMAL_FOREGROUND=4
POWERLEVEL9K_VI_MODE_INSERT_BACKGROUND='clear'
POWERLEVEL9K_VI_MODE_INSERT_FOREGROUND=4
POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR=''
POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR=''
POWERLEVEL9K_LEFT_SUBSEGMENT_SEPARATOR=''
POWERLEVEL9K_RIGHT_SUBSEGMENT_SEPARATOR=''
POWERLEVEL9K_WHITESPACE_BETWEEN_LEFT_SEGMENTS=''
POWERLEVEL9K_WHITESPACE_BETWEEN_RIGHT_SEGMENTS=''

#PowerLevel9K Enable User Icon Font-Conf
POWERLEVEL9K_MODE="nerdfont-complete"
#POWERLEVEL9K_CUSTOM_MYUSER_ICON="echo $'\uF1D9 '"
#POWERLEVEL9K_CUSTOM_MYUSER_ICON_BACKGROUND=15

#Load and initialize the tab completion system
zstyle ':completion:*' list-colors 'di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
autoload -Uz compinit
compinit
kitty + complete setup zsh | source /dev/stdin

#Change the reverse video character
export PROMPT_EOL_MARK=''

#Alias command
alias zshconf="vim ~/.myzshrc"

#Modify zsh file and source
modzsh()
{
	zshconf
	source ~/.zshrc	
	echo Zshrc Successfully Sourced
}

#Enable and Connect to Tmux with only 1 session
#if type tmux >/dev/null 2>&1; then
#	if [[ $- = *i* ]] && [[ -z $TMUX ]]; then
#		availableTmuxSession="$(tmux ls)"
#		if [[ $availableTmuxSession != *"MainSession"* ]]; then
#			tmux new-session -d -s "MainSession" -n "MainWindow" >/dev/null 2>&1
#			tmux send-keys -t MainSession:MainWindow " tmux set-hook 'session-window-changed' 'run-shell \"tmux resize-window -A\"'" Enter
#			tmux send-keys -t MainSession:MainWindow " tmux set-hook 'after-new-window' 'run-shell \"tmux resize-window -A\"'" Enter
#			tmux send-keys -t MainSession:MainWindow " tmux resize-window -A" Enter
#			tmux send-keys -t MainSession:MainWindow " clear" Enter
#			tmux attach-session -t "MainSession" >/dev/null 2>&1
#			exit
#		else
#			tmux send-keys -t MainSession:MainWindow " tmux set-hook 'session-window-changed' 'run-shell \"tmux resize-window -A\"'" Enter
#			tmux send-keys -t MainSession:MainWindow " tmux set-hook 'after-new-window' 'run-shell \"tmux resize-window -A\"'" Enter
#			tmux send-keys -t MainSession:MainWindow " tmux resize-window -A" Enter
#			tmux send-keys -t MainSession:MainWindow " clear" Enter
#			tmux attach-session -t "MainSession" >/dev/null 2>&1
#			exit
#		fi
#	fi
#fi

#Enable and Connect to Tmux with multiple session
#if type tmux > /dev/null 2>&1 && [[ $- = *i* ]] && [[ -z $TMUX ]]; then
#	exec tmux
#fi

#A very hacky way to clear images in kitty when there is a black box glitch 
function clear() {
	if  type kitty > /dev/null 2>&1; then
		kitty +kitten icat --clear > /dev/null 2>&1
		/usr/bin/clear
	else
		/usr/bin/clear
	fi
}

#Add pywal support
which wal 1>/dev/null 2>&1 && cat ~/.cache/wal/sequences 

#Run neofetch
which neofetch 1>/dev/null 2>&1 && [ $(pgrep kitty | wc -l) -eq 1 ] && neofetch

#Change pager to bat
which bat 1>/dev/null 2>&1 && export MANPAGER="sh -c 'col -bx | bat -l man -p'"


###################################################
## Plugins
###################################################
#source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

#####OH MY ZSH PLUGINS
plugins=(git)

###################################################
## Alias
###################################################
which nvim >/dev/null 2>&1 && alias vim=nvim 
which fzf >/dev/null 2>&1 && alias installpkg="pacman -Qq | fzf --preview 'pacman -Qil {}' --layout=reverse --bind 'enter:execute(pacman -Qil {} | less)'"
which sudo >/dev/null 2>&1 && alias sudo='sudo '

###################################################
## FZF configuration
###################################################
if which fzf >/dev/null 2>&1; then
    #Source Fzf keybindings and autocompletion
    [ -f ~/.fzf-zsh-keybindings.zsh ] && source ~/.fzf-zsh-keybindings.zsh
    [ -f ~/.fzf-zsh-completion.zsh ] && source ~/.fzf-zsh-completion.zsh
    if which fd >/dev/null 2>&1; then
        export FZF_DEFAULT_COMMAND='fd --hidden --follow --exclude .git'
        export FZF_CTRL_T_COMMAND='fd --hidden --follow --exclude .git'
        export FZF_COMPLETION_COMMAND='fd --hidden --follow --exclude .git'
   else
        export FZF_DEFAULT_COMMAND='find -L'
        export FZF_CTRL_T_COMMAND='find -L'
        export FZF_COMPLETION_COMMAND='find -L'
    fi

    #Default fzf rendering options
    export FZF_DEFAULT_OPTS="--height=40% --layout=reverse --info=hidden --border --preview-window 'right:60%' --preview '([ -d {} ] && tree -aC {}) || ([ -f {} ] && bat -A --style=header,grid --color=always {})'"
fi
