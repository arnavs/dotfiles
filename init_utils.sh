# see https://github.com/pearlzli/dotfiles/blob/master/init.sh
normal=$(tput sgr0)
red=$(tput setaf 1)
green=$(tput setaf 2)

# Create symlinks verbosely
# Usage: try_symlink <src> <dst=src>
# Performs: ln -s "$dotfile_dir/$src" "$(pwd)/$dst"
# See https://stackoverflow.com/a/33419280 for reference on bash optional arguments
try_symlink() {
    src=$1
    dst=${2:-$src}
    if [ -L "$dst" ]; then
        echo "${red}Did not link $(pwd)/$dst: symlink already exists${normal}"
    elif [ ! -f "$src" ]; then
        ln -s "$dotfile_dir/$src" "$dst"
        if [ $? -eq 0 ]; then
            echo "${green}Linked $(pwd)/$dst -> $dotfile_dir/$src${normal}"
        else
            echo "${red}Could not link $(pwd)/$dst${normal}"
        fi
    else
        echo "${red}Did not link $dst: non-symlink file already exists. Merge $dst into $dotfile_dir/$src first and then delete $dst before retrying${normal}"
    fi
}

# Check if something is installed
# Usage: not_installed <program>
not_installed() {
  if [[ -n "$(which $1)" ]]; then
    return 1
  else
    return 0
  fi
}

# Make directory if it doesn't already exist
# Usage: maybe_mkdir <path>
maybe_mkdir() {
    if [ ! -d "$1" ]; then
        mkdir -p $1
        if [ $? -eq 0 ]; then
            echo "${green}Created $1${normal}"
        else
            echo "${red}Could not create $1${normal}"
        fi
    fi
}

# Add to PATH environment variable verbosely
# Usage: try_addpath <dir> <front>
try_addpath() {
    dir=$1
    front=$2 # whether to add dir to front of PATH
    if [ -z "$(grep $dir ~/.bashrc-local)" ]; then
        if [ $front -eq 1 ]; then
            echo "export PATH=$dir:\$PATH" >> ~/.bashrc-local
        else
            echo "export PATH=\$PATH:$dir" >> ~/.bashrc-local
        fi
        if [ $? -eq 0 ]; then
            echo "${green}Added $dir to PATH in ~/.bashrc-local${normal}"
        else
            echo "${red}Could not add $dir to PATH in ~/.bashrc-local${normal}"
        fi
    else
        echo "${red}Did not add $dir to PATH in ~/.bashrc-local: already there${normal}"
    fi
}

# Length of time before timing out
timeout_length="30s"

# Print result of timeout downloading
# Usage: timeout_result <retcode> <filename>
function timeout_result {
    if [ $1 -eq 124 ]; then
        echo "${red}Killed downloading $2: timed out${normal}"
    elif [ $1 -ne 0 ]; then
        echo "${red}Could not download $2${normal}"
    else
        echo "${green}Successfully downloaded $2${normal}"
    fi
}