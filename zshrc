# =========================================================
# ~/.zshr
# Zsh configuration file
# =========================================================


# ---------------------------------------------------------
# 1. Bootstrap / Guard clauses
# ---------------------------------------------------------
# (placeholder per logica OS / WSL / login shell)


# ---------------------------------------------------------
# 2. Environment variables
# ---------------------------------------------------------

export PAGER=less
export GROFF_NO_SGR=1


# ---------------------------------------------------------
# 3. Shell options
# ---------------------------------------------------------

setopt HIST_IGNORE_ALL_DUPS
setopt HIST_SAVE_NO_DUPS
setopt SHARE_HISTORY


# ---------------------------------------------------------
# 4. History configuration
# ---------------------------------------------------------

HISTSIZE=10000
SAVEHIST=10000
HISTFILE="$HOME/.zsh_history"


# ---------------------------------------------------------
# 5. Completion system
# ---------------------------------------------------------

autoload -Uz compinit
compinit


# ---------------------------------------------------------
# 6. PATH configuration
# ---------------------------------------------------------

# Local binaries
export PATH="$HOME/.local/bin:$PATH"

# Windows tools (WSL)
export PATH="$PATH:/mnt/c/Users/ACER/AppData/Local/Programs/Microsoft VS Code/bin"


# ---------------------------------------------------------
# 7. Pager / man colors
# ---------------------------------------------------------

export LESS_TERMCAP_mb=$'\e[1;31m'
export LESS_TERMCAP_md=$'\e[1;36m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_so=$'\e[1;44;33m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;32m'
export LESS_TERMCAP_ue=$'\e[0m'


# ---------------------------------------------------------
# 8. Aliases
# ---------------------------------------------------------

# Editor
alias vim='nvim'

# Update zsh
alias zz='source ~/.zshrc'

# Navigation (WSL → Windows FS)
alias dev='cd /mnt/c/Users/ACER/Development'
alias wp='cd /mnt/c/Users/ACER/Development/Wordpress'
alias obs='cd /mnt/c/Users/ACER/ObsidianSecondBrain'

alias mg='cd /mnt/c/Users/ACER/Development/wordpress/mg-developer/app/public/wp-content/themes/blanktheme/'
alias fer='cd /mnt/c/Users/ACER/Development/wordpress/studioferretti/app/public/wp-content/themes/blanktheme/'

# Listing
alias ll='ls -lAFh'
alias ls='ls -lAFh'
alias la='ls -A'
alias l='ls -CF'

# Git
alias gs='git status'
alias gd='git diff'
alias gc='git commit'
alias gp='git push'

# Open
alias open='explorer.exe'


# ---------------------------------------------------------
# 9. Functions
# ---------------------------------------------------------

mkcd() {
  mkdir -p "$@" && cd "$_"
}

cdf() {
  local base dir
  base="${1:-.}"

  dir=$(find "$base" \
    -type d \
    \( \
      -path '*/.git' \
      -o -path '*/node_modules' \
      -o -path '*/vendor' \
      -o -path '*/wp-admin' \
      -o -path '*/wp-includes' \
      -o -path '*/wp-content/uploads' \
      -o -path '*/wp-content/cache' \
      -o -path '*/wp-content/upgrade' \
      -o -path '*/wp-content/backups' \
      -o -path '*/wp-content/ai1wm-backups' \
      -o -path '*/dist' \
      -o -path '*/build' \
      -o -path '*/coverage' \
      -o -path '*/.vscode' \
      -o -path '*/.idea' \
      -o -path '*/.cache' \
    \) -prune -false \
    -o -print 2>/dev/null \
    | fzf \
    | sed 's/\r$//')

  [[ -n "$dir" ]] && cd "$dir"
}


# ---------------------------------------------------------
# 10. Tooling initialization
# ---------------------------------------------------------

# NVM
export NVM_DIR="$HOME/.nvm"
[[ -s "$NVM_DIR/nvm.sh" ]] && source "$NVM_DIR/nvm.sh"



# ---------------------------------------------------------
# 11. Prompt configuration
# ---------------------------------------------------------
#PROMPT = '
#%n@%m %1~ %# ' //default

eval "$(oh-my-posh init zsh --config "$HOME/.cache/oh-my-posh/themes/iterm2.omp.json")"

# ---------------------------------------------------------
# 12. Local / machine-specific overrides
# ---------------------------------------------------------

# [[ -f ~/.zshrc.local ]] && source ~/.zshrc.local


# ---------------------------------------------------------
# 13. Debug / test
# ---------------------------------------------------------
# echo "hello from .zshrc"
# ========================
# SDKMA
# ========================









#LAST ITEM DON'T MOVE
export SDKMAN_DIR="$HOME/.sdkman
[[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]] && source "$SDKMAN_DIR/bin/sdkman-init.sh









