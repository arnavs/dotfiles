export LS_COLORS="di=1;38;5;214"
source ~/.aliases
PROMPT='%F{red}%n%f@%F{green}%m%f:%F{yellow}%B%~%b%f%# '
# 1. Set your conda base directory path
export CONDA_DIR="/opt/homebrew/anaconda3/bin" # Adjust if yours is anaconda3, etc.

# 2. Put Conda's binaries straight onto your PATH immediately
# This ensures 'which conda', 'which python', and 'which pip' work natively
export PATH="$PATH:$CONDA_DIR"

# 3. Lazy initialize the shell integration only when 'conda' is explicitly called
conda() {
  unfunction conda
  __conda_setup="$("$CONDA_DIR/bin/conda" 'shell.zsh' 'hook' 2> /dev/null)"
  if [ $? -eq 0 ]; then
    eval "$__conda_setup"
  else
    if [ -f "$CONDA_DIR/etc/profile.d/conda.sh" ]; then
      . "$CONDA_DIR/etc/profile.d/conda.sh"
    fi
  fi
  unset __conda_setup
  
  # Run the original command the user typed
  conda "$@"
}


eval $(thefuck --alias)