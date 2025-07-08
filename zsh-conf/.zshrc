# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#

# GENERAL
alias Uupdate="sudo apt update && sudo apt upgrade -y"
alias Uclean="sudo apt autoremove -y && sudo apt clean"
alias clr="clear"
alias hy="history"

catclip() {
  cat "$1" | xclip -selection clipboard
}

alias v="nvim"
alias gzsh="vim ~/.zshrc"
alias uzsh="source ~/.zshrc"
alias gtmux="vim ~/.tmux.conf"
alias utmux="tmux source-file ~/.tmux.conf"

# Sys
alias jj="journalctl -xe"
alias ssopen="watch -n 2 'ss -tulnp'"
alias ssall="watch -n 2 'ss -tunap'"
alias awifi="nmcli dev wifi list"

# GIT
alias gs="git status"
alias ga="git add"
alias gc="git commit -m"
alias gw="git switch"
alias gck="git checkout"
alias gd="git diff"
alias gp="git push"
alias gpull="git pull"
alias gr="git remote -v"
alias gb="git branch -a"
alias gl="git log"
alias gl++="git log --oneline --graph --all --decorate"
alias gf="git fetch --all --prune"

# MAKE
alias ms="make start"
alias mb="make build"

# DOCKER
alias dhelp="docker --help"
alias dlog="docker logs"
alias dinsp="docker inspect"
alias dps="docker ps -a"
alias dls="docker image ls"
alias db="docker build"
alias drun="docker run"
alias drmi="docker image rm"
alias drm="docker rm"
alias ds="docker start"
alias dst="docker stop"
alias dexec="docker exec -it"
alias dprune="docker system prune -a"
alias dlog="docker logs -f"
alias dv="docker volume"
alias dn="docker network ls"
alias dni="docker network inspect"

#NPM
alias nrd="npm run dev"
alias nrb="npm run build"
alias nrt="npm run test"
alias nrtr="npm run test:run"
alias nrc="npm run coverage"

# VAGRANT
alias vu="vagrant up"
alias vh="vagrant halt"
alias vd="vagrant destroy"
alias vs="vagrant status"
alias vgs="vagrant global-status"
alias vr="vagrant reload"
alias vbl="vagrant box list"
alias vssh="vagrant ssh"

# K8s
alias kall="kubectl get all -n kube-system"
alias kgn="kubectl get nodes -o wide"
alias kgd="kubectl get deployments -o wide"
alias kgp="kubectl get pods -o wide"
alias ksv="kubectl get svc -o wide"
alias ka="kubectl apply -f"
alias kd="kubectl describe"
alias kdd="kubectl delete -f"
alias kd="kubectl describe"

# TERRAFORM
alias tf="terraform fmt"
alias ti="terraform init"
alias tv="terraform validate"
alias tp="terraform plan"
alias ta="terraform apply"


export ZSH_COMPDUMP=$PWD/.zcomdump_d/.zcompdump-$HOST

# Skip tmux auto-attach when in VS Code terminal
if [[ -z "$TMUX" && -z "$VSCODE_INJECTION" && -z "$TERM_PROGRAM" ]]; then
    tmux attach-session -t default || tmux new-session -s default
fi

# .NET
export PATH="$HOME/.dotnet:$PATH"
export DOTNET_ROOT=$HOME/.dotnet

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
