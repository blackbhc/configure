# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# load local configuration
[[ -e ~/.local/zshrc ]] && source ~/.local/zshrc

# Alias
alias ls="lsd"
alias vi="nvim"
alias rm="rm -i"
alias mv="mv -i"
alias ls="lsd"
alias ll="lsd -l"
alias l="lsd -la"
alias la="lsd -la"
alias lt="lsd --tree"
alias lta="lsd --tree -a"
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
function mkcd
{
  dir="$*";
  mkdir -p "$dir" && cd "$dir";
}

# History file 
HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000000
SAVEHIST=10000000

# Some CLI tools
eval "$(zoxide init zsh)" # z cmd
eval "$(thefuck --alias)" # fuck cmd
eval "$(fzf --zsh)"       # fzf for history research

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk
# Two regular plugins loaded without investigating.
zinit light zsh-users/zsh-autosuggestions
zinit light zdharma-continuum/fast-syntax-highlighting
zinit ice depth"1" # git clone depth
zinit light romkatv/powerlevel10k

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
