set -o vi

alias update='sudo apt update'
alias upgrade='sudo apt upgrade'
alias install='sudo apt install'
alias remove='sudo apt remove'
alias search='apt search'
alias pkgsearch='apt list'
alias flsearch='apt search'
alias pkglist='apt list --installed'
alias pkgshow='apt show'

#alias update='sudo xbps-install -S'
#alias upgrade='sudo xbps-install -u'
#alias install='sudo xbps-install'
#alias remove='sudo xbps-remove'
#alias search='sudo xbps-query -s'
#alias pkgsearch='sudo xbps-query -R'
#alias flsearch='sudo xbps-query -Rs'
#alias pkglist='sudo xbps-query -l'
#alias pkgshow='sudo xbps-query -S'

## A -- Z
# q for qutebrowser
alias q='qutebrowser'
#t
alias t='tmux'
y
u
i
o
p
a
s
d
#f
alias f='fd' #find vs fd
alias ff='fzf' #
#g
alias g='grep'
alias gg='ripgrep'
#h
alias h='htop'
alias hh='btop'
j
k
z
x
c
#v for nvim
alias v='nvim'
#b
alias bat='/bin/batcat'
n
m


oc for opencode


#Git (most used):
alias g='git'
alias gs='git status'
alias ga='git add'
alias ga.='git add .'
alias gc='git commit -m'
alias gp='git push'
alias gpull='git pull'
alias gco='git checkout'
alias gb='git branch'
alias gd='git diff'
alias gl='git log --oneline'

##Search tools
#ripgrep (rg) - blazingly fast grep
#fzf - fuzzy finder

##File explorers:
#eza - modern replacement for ls (Rust-based)
#fzf - fuzzy finder (incredibly useful)
#bat - modern cat replacement (shows syntax highlighting)

#Custom:
# opencode
export PATH=/home/sunday/.opencode/bin:$PATH
alias oc='opencode'

alias ll='eza -la'   # if you have eza, otherwise ls -la

export PATH="$HOME/.cargo/bin:$PATH"
