####### --- editor config -----
if command -v nvim 2 1 &>/dev/null &>/dev/null; then
	alias vi=nvim
elif
	command -v vim 2 1 &>/dev/null &
	/dev/null
then
	alias vi=vim
fi

if command -v exa 2 1 &>/dev/null &>/dev/null; then
	alias ls=exa
fi

####### --- special files -----
# open .py .c .html .cc .c++ .cpp .hpp .h .sh ... with editor
alias -s py pyc ipynb c cc c++ cpp h hpp sh zsh bash txt dat temp test=vi
# run with archived file with tar or unzip
alias -s gz='tar -xzvf'
alias -s tgz='tar -xzvf'
alias -s zip='unzip'
alias -s bz2='tar -xjvf'
