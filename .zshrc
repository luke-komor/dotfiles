export ZSH="$HOME/.oh-my-zsh"
#export DISPLAY=$(grep -m 1 nameserver /etc/resolv.conf | awk '{print $2}'):0

export ZSH_AUTOSUGGEST_MANUAL_REBIND=true
ZSH_THEME=""
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#808080'
VI_MODE_RESET_PROMPT_ON_MODE_CHANGE=true
plugins=(git zsh-autosuggestions history-substring-search zsh-syntax-highlighting colored-man-pages)
source $ZSH/oh-my-zsh.sh

export PATH=$PATH:$HOME/.local/kitty.app/bin

#export PATH=/snap/bin:$PATH
export PAGER="less -r"
export EDITOR=nvim
export GH_PAGER=""
export GH_FORCE_TTY="100%"
export CLICOLOR=1
alias nvim="CLICOLOR=0 nvim --listen /tmp/nvimsocket"
alias vim=nvim


export BROWSER=wslview

export FZF_DEFAULT_OPTS="--bind ctrl-u:preview-up,ctrl-d:preview-down"

fzf_gl() {
    git log --oneline --color=always | fzf --reverse --ansi --preview "git show --color=always {1} | delta "
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# export TERM=xterm-kitty
alias lg=lazygit
bindkey -e
eval $(starship init zsh)
