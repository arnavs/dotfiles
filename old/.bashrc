if [ -f ~/scripts/.git-completion.bash ]; then
  . ~/scripts/.git-completion.bash
fi
set +H

source ~/.aliases
export PATH=/opt/homebrew/bin:/opt/homebrew/anaconda3/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Library/TeX/texbin
export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
export JULIA_CUDA_SILENT=true
export LC_CTYPE=C 
export LC_ALL=C
export BASH_SILENCE_DEPRECATION_WARNING=1

eval $(thefuck --alias)
eval $(thefuck --alias FUCK)

source ~/.bashrc-local
export FRED_API_KEY=c57b62fef90cf7f83f34233ba9152929
