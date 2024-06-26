# Set my path
set -gx PATH ~/.local/bin $PATH
set -gx PATH /opt/homebrew/bin $PATH

# load local configuration files
if test -e ~/.local/local.fish
    source ~/.local/local.fish
end

# My aliases
## basic
alias rm="rm -i"
alias mv="mv -i"
alias ls="lsd"
alias ll="lsd -l"
alias l="lsd -la"
alias la="lsd -la"
alias lt="lsd --tree"
alias lta="lsd --tree -a"
if type -q python3
    alias py="python3"
end
if type -q ipython
    alias ipy="ipython"
end
if type -q nvim
    alias vi="nvim"
    export EDITOR=nvim
else if type -q vim
    alias vi="vim"
    export EDITOR=vim
end
function mkcd
    mkdir -p $argv
    and cd $argv[-1]
end
alias emacs="emacs -nw"
## git
alias gst="git status"
alias gd="git diff"
alias gdc="git diff --cached"
alias gds="git diff --staged"
alias ga="git add"
alias gaa="git add --all"
alias gcmsg="git commit --message"
alias gb="git branch"
alias gbd="git branch --delete"
alias gbD="git branch --delete --force"
alias gbr="git branch --remote"
alias gsw="git switch"
alias gl="git pull"
alias glo="git pull origin"
alias gc="git clone"
alias gp="git push"
alias grs="git restore"
alias grst="git restore --staged"
alias gpo="git push origin"
alias glog="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset' --stat"
## tmux
alias tad="tmux attach -d -t"
alias tl="tmux list-sessions"
alias ts="tmux new-session -s"
alias tksv="tmux kill-server"
alias tkss="tmux kill-session -t"
## others
alias ic="imgcat"
alias a2="aria2c"

# no intro
set --universal fish_greeting

# start others
zoxide init fish | source
