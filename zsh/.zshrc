# Set Zsh as the default shell
export SHELL=/bin/zsh

# Prompt configuration
autoload -Uz vcs_info

# prompt with git branch
#TODO: add zsh-async
precmd_vcs_info() {
  vcs_info
}
precmd_functions+=( precmd_vcs_info )
autoload -U colors && colors
local user_color="%F{yellow}"
local host_color="%F{green}"
local path_color="%F{blue}"
local git_color="%F{magenta}"
local reset_color="%f"
setopt PROMPT_SUBST
PROMPT='${user_color}%n${reset_color}@${host_color}%m${reset_color} ${path_color}%1~ ${git_color}${vcs_info_msg_0_}${reset_color}%# '
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' formats '(%b)'
zstyle ':vcs_info:git:*' actionformats '(%b|%a)'

alias ll='ls -l'
alias la='ls -la'
alias ..='cd ..'
