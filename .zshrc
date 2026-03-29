#If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"
ZSH_AUTOSUGGEST_MANUAL_REBIND="true"
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
plugins=(
	git
	nvm
	zsh-autosuggestions
	fzf
)

source $ZSH/oh-my-zsh.sh

# ---------------------------------------------------------------------------
# Machine detection helpers — used throughout this file to guard OS-specific
# or work-specific config. All guards are purely file/command existence checks
# so this file works identically on any machine without modification.
# ---------------------------------------------------------------------------
is_macos()        { [[ "$OSTYPE" == darwin* ]]; }
is_linux()        { [[ "$OSTYPE" == linux* ]]; }
# Work machine = corporate cert bundle is present at ~/certs/combined-ca.pem
is_work_machine() { [[ -f "$HOME/certs/combined-ca.pem" ]]; }

# User configuration

# Work machine only: corporate MITM CA bundle.
# Git reads GIT_SSL_CAINFO the same as http.sslCAInfo.
is_work_machine && export GIT_SSL_CAINFO="$HOME/certs/combined-ca.pem"

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
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# nvim-linux64 binary path (Linux AppImage install only)
is_linux && export PATH="$PATH:/opt/nvim-linux64/bin"

# fdfind is the Debian/Ubuntu package name; macOS Homebrew installs it as fd
is_linux && alias fd=fdfind
# Install Ruby Gems to ~/gems
export GEM_HOME="$HOME/gems"
export PATH="$HOME/gems/bin:$PATH"

# postgres alias
alias pgstart='sudo service postgresql start'
alias runpg='sudo -u postgres psql'
alias pgrestart='sudo service postgresql restart'
alias pgstop='sudo service postgresql stop'

#redis alias
alias redistart='sudo service redis-server start'
alias redistop='sudo service redis-server stop'

# prettier-eslint-setup install
alias eslint-prettier-setup='exec 3<&1;bash <&3 <(curl https://raw.githubusercontent.com/AnimeshRy/eslint-prettier-airbnb-react/master/eslint-prettier-config.sh 2> /dev/null)'

# delete zone identifier
alias findndeletezone='find . -name "*.Identifier" -type f -delete'

## npm aliases
# alias ni="npm install";
# alias nrs="npm run start -s --";
# alias nrb="npm run build -s --";
# alias nrd="npm run dev -s --";
# alias nrt="npm run test -s --";
# alias nrtw="npm run test:watch -s --";
# alias nrv="npm run validate -s --";
# alias rmn="rm -rf node_modules";
# alias flush-npm="rm -rf node_modules && npm i && echo NPM is done";


## docker
alias di='docker images'
alias drr='docker-compose restart'
alias dup='docker-compose up'
alias dcs='docker-compose stop'
alias dcrm='docker-compose rm'
alias dri='docker rmi -f $(docker images -a -q)'

#kubernetes
alias k='kubectl'
alias kg='kubectl get'
alias kgp='kubectl get pod'
alias kgs='kubectl get services'
alias kgd='kubectl get deployments'
alias kgrs='kubectl get replicaset'

alias update_clock='sudo ntpdate time.windows.com'

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# go
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH

# nvim alias
alias vim='nvim'
alias vi='nvim'
alias oldvim='vim'

# pnpm — default install location differs by OS.
# macOS: ~/Library/pnpm  |  Linux: ~/.local/share/pnpm
# Only set PNPM_HOME if pnpm is actually installed there.
if is_macos && [[ -d "$HOME/Library/pnpm" ]]; then
  export PNPM_HOME="$HOME/Library/pnpm"
elif is_linux && [[ -d "$HOME/.local/share/pnpm" ]]; then
  export PNPM_HOME="$HOME/.local/share/pnpm"
fi
# Add to PATH if PNPM_HOME was resolved above
if [[ -n "$PNPM_HOME" ]]; then
  case ":$PATH:" in
    *":$PNPM_HOME:"*) ;;
    *) export PATH="$PNPM_HOME:$PATH" ;;
  esac
fi
export TERM=xterm-256color
alias lzd='lazydocker'

. "$HOME/.local/bin/env"

# bun completions — $HOME/.bun/_bun is the standard path on all platforms
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Python user-bin (macOS path; no-op on Linux where this dir doesn't exist)
[[ -d "$HOME/Library/Python/3.9/bin" ]] && export PATH="$HOME/Library/Python/3.9/bin:$PATH"

# libpq (Homebrew, macOS only) — added once
[[ -d "/opt/homebrew/opt/libpq/bin" ]] && export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

# Windsurf (Codeium editor) — only present when installed
[[ -d "$HOME/.codeium/windsurf/bin" ]] && export PATH="$HOME/.codeium/windsurf/bin:$PATH"

# Work machine: corporate MITM certificate bundle.
# is_work_machine() checks for ~/certs/combined-ca.pem — absent on personal machines,
# so this entire block is a silent no-op outside of work.
# NOTE: git config --global http.sslCAInfo is set once at machine setup, not here.
if is_work_machine; then
  _CERT="$HOME/certs/combined-ca.pem"
  export SSL_CERT_FILE="$_CERT"
  export REQUESTS_CA_BUNDLE="$_CERT"
  export NODE_EXTRA_CA_CERTS="$_CERT"
  export CURL_CA_BUNDLE="$_CERT"
  export POETRY_REQUESTS_CA_BUNDLE="$_CERT"
  # Keep ~/.curlrc in sync with the cert path
  echo "cacert=$_CERT" > ~/.curlrc
  unset _CERT
fi

# Zscaler root cert (separate file, also work-only)
[[ -f "$HOME/certs/ZscalerRootCertificate.crt" ]] && \
  export UV_EXTRA_CERTIFICATES="$HOME/certs/ZscalerRootCertificate.crt"

# git-ai — only present when installed
[[ -d "$HOME/.git-ai/bin" ]] && export PATH="$HOME/.git-ai/bin:$PATH"

# Antigravity — only present when installed
[[ -d "$HOME/.antigravity/antigravity/bin" ]] && export PATH="$HOME/.antigravity/antigravity/bin:$PATH"

# opencode — only present when installed
[[ -d "$HOME/.opencode/bin" ]] && export PATH="$HOME/.opencode/bin:$PATH"
