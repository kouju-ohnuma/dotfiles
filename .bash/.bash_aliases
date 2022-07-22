
#######################################################################################
# custum alias ########################################################################
#######################################################################################

# docker
alias d='docker'
alias d:clean='docker system prune -f'
alias dc='docker-compose'
alias dp='docker-compose up --remove-orphans'
alias dpd='docker-compose up --remove-orphans -d'
alias dl='docker-compose logs -t -f'

# gradle
alias gw='./gradlew'

# cd
alias cw='cd ~/work'

# history
alias h='history'
alias hg='history | grep'

# ls
alias ls='ls -ah'
alias ll='ls -alh'

# olter
alias s='source'
alias sp='source ~/.profile'
alias c='code ~'
alias cg='code ~/.gitconfig'

# gif
function togif() {
    # 圧縮
    ffmpeg -fflags +discardcorrupt -i $1 -c:v libx265 -crf 35 -r 18 -tag:v hvc1 -preset ultrafast tmp_$1
    # 変換
    ffmpeg -r 18 -i tmp_$1 $2
    rm tmp_$1
}
alias togif='togif'

function cgif() {
    togif $@  
}
alias cgif='cgif'
