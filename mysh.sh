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
# open .py .c .html .cc .c++ .cpp .hpp .h with editor
