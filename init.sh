# create git key 
[-f ~/.ssh/id_ed25519] || ssh-keygen -t ed25519 -C "5009477+arnavs@users.noreply.github.com"
mkdir -p ~/.ssh
touch ~/.ssh/config
grep -q '^Host github.com' ~/.ssh/config || cat >> ~/.ssh/config <<'EOF'
Host github.com
  AddKeysToAgent yes
  IdentityFile ~/.ssh/id_ed25519
EOF
# install brew apps 
brew bundle 
# install dotfiles
cp -f .zshrc ~/.zshrc
cp -f .aliases ~/.aliases
cp -f .gitconfig ~/.gitconfig 
cp -f .gitignore ~/.gitignore
# install tex packages
xargs sudo tlmgr install < tex.txt
# scripts
mkdir -p ~/scripts
cp -f update.sh ~/scripts/update.sh
