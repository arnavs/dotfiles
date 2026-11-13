# install brew apps 
brew bundle 
# install dotfiles
cp -f .zshrc ~/.zshrc
cp -f .aliases ~/.aliases
cp -f .gitconfig ~/.gitconfig 
# install tex packages
xargs sudo tlmgr install < tex.txt
# scripts
mkdir ~/scripts
cp -f update.sh ~/scripts/update.sh
