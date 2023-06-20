####### --- editor config -----
if command -v nvim 2 1 &>/dev/null &>/dev/null; then
	alias vi=nvim
	export EDITOR=nvim
elif
	command -v vim 2 1 &>/dev/null &>/dev/null
then
	alias vi=vim
	export EDITOR=vim
fi

if command -v lsd 2 1 &>/dev/null &>/dev/null; then
	alias ls=lsd
elif command -v exa 2 1 &>/dev/null &>/dev/null; then
	alias ls=exa
fi

####### --- special files -----
# open .py .c .html .cc .c++ .cpp .hpp .h .sh ... with editor
alias -s pyc=vi
alias -s ipynb=vi
alias -s c=vi
alias -s cpp=vi
alias -s c++=vi
alias -s cc=vi
alias -s h=vi
alias -s hpp=vi
alias -s zsh=vi
alias -s bash=vi
alias -s html=vi
alias -s txt=vi
alias -s dat=vi
alias -s test=vi
alias -s temp=vi
# run with archived file with tar or unzip
alias -s gz='tar -xzvf'
alias -s xz='tar -xzvf'
alias -s tgz='tar -xzvf'
alias -s zip='unzip'
alias -s bz2='tar -xjvf'

####### --- command editing mode -----
alias vimode='set -o vi'
alias emode='set -o emacs'

####### --- file navigator nnn -------
alias nnn="nnn -UigdC"
