####### --- editor config -----
if command -v vim  2&>/dev/null 1&>/dev/null; then
	alias vi=vim
elif command -v nvim 2&>/dev/null 1&/dev/null; then
	alias vi=nvim
fi

if command -v exa 2&>/dev/null 1&>/dev/null; then
	alias ls=exa
fi

####### --- special files -----
# open .py .c .html .cc .c++ .cpp .hpp .h with editor
