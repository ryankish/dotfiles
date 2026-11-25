# Set Zsh as the default shell
export SHELL="$(command -v zsh)"

[ -f "$HOME/.local/bin/env" ] && . "$HOME/.local/bin/env"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Source /etc/profile for system-wide configuration
if [ -f /etc/profile ]; then
    source /etc/profile
fi


# Prompt configuration
autoload -Uz vcs_info

# prompt with git branch
#TODO: add zsh-async
precmd_vcs_info() {
  vcs_info
}

vim_mode() {
  case ${KEYMAP} in
    vicmd) echo '[N]' ;;
    *) echo '[I]' ;;
  esac
}

function zle-keymap-select() {
  zle reset-prompt
}
zle -N zle-keymap-select

precmd_functions+=( precmd_vcs_info )
autoload -U colors && colors
local user_color="%F{yellow}"
local host_color="%F{green}"
local path_color="%F{blue}"
local git_color="%F{magenta}"
local reset_color="%f"
setopt PROMPT_SUBST
PROMPT='${user_color}%n${reset_color}@${host_color}%m${reset_color} ${path_color}%1~ ${git_color}${vcs_info_msg_0_} ${reset_color}$(vim_mode)%# '
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' formats '(%b)'
zstyle ':vcs_info:git:*' actionformats '(%b|%a)'

alias ll='ls -l'
alias la='ls -la'
alias ..='cd ..'

bindkey -v

export KEYTIMEOUT=1

bindkey "^?" backward-delete-char
bindkey "^W" backward-kill-word
bindkey "^H" backward-delete-char
bindkey "^U" backward-kill-line

HISTFILE=~/.zsh_history  # Set the history file location
HISTSIZE=10000           # Number of commands to save in memory
SAVEHIST=10000           # Number of commands to save in the history file
setopt INC_APPEND_HISTORY # Append to history file in real-time
setopt SHARE_HISTORY     # Share history across sessions
setopt EXTENDED_HISTORY  # Save timestamps in history

alias sour='source .venv/bin/activate'
export UV_PYTHON=3.11
alias clauded='claude --permission-mode bypassPermissions'
alias codexd='codex --dangerously-bypass-approvals-and-sandbox'

alias lg='lazygit'

