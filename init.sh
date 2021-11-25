# symlinking and setup
# see https://github.com/pearlzli/dotfiles/blob/master/init.sh

# auxiliary utils
if [ -z "$1" ]; then
    echo "Run script using ./init.sh path/to/dotfiles/repo${normal}"
    exit 1
fi
dotfile_dir=$1
source $dotfile_dir/init_utils.sh

cd $HOME

# create local files
# need to do this first so paths can be edited
for file in ".bashrc-local" ".gitconfig-local"; do
    if [ ! -f $file ]; then
        touch $file
        echo "${green}Created $file${normal}"
    fi
done

# symlink dotfiles
for file in ".aliases" ".bashrc" ".gitconfig" ".bash_profile"; do
    try_symlink $file
done

# install homebrew, bundle, run Brewfile, symlink
if not_installed brew; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

source ~/.bashrc

brew bundle --file=$1/Brewfile -vd

try_addpath "/Library/TeX/texbin" 0
try_addpath "/opt/homebrew/anaconda3/bin" 1
# try_addpath "$(brew --prefix)/opt/coreutils/libexec/gnubin" 1

# ln -fs /usr/local/bin/exa /usr/local/bin/ls

# symlink folders
ln -s $dotfile_dir/scripts ~/scripts
ln -s $dotfile_dir/Shreddit ~/Shreddit


# fonts
# Fira Mono is a good alternative (and Fire Code has nice ligatures), but I like SF Mono best
cp /System/Applications/Utilities/Terminal.app/Contents/Resources/Fonts/SF-Mono-*.otf ~/Library/Fonts
if [ $? -eq 0 ]; then
    echo "${green}Copied SF Mono font files to ~/Library/Fonts${normal}"
else
    echo "${red}Could not copy SF Mono font files to ~/Library/Fonts${normal}"
fi

# VS Code
rm -f "/Users/arnavsood/Library/Application Support/Code/User/settings.json"
ln -s $dotfile_dir/settings.json "/Users/arnavsood/Library/Application Support/Code/User/settings.json"

# sudo touch id
sudo ln -fs $dotfile_dir/sudo /etc/pam.d/sudo

# macos
./.macos