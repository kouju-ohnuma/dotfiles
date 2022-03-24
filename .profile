function exec () {
    search $1 $2 
    if [ $? -eq 0 ]; then
        . $2
        if [ $? -eq 0 ]; then
            echo "success $2"
        else
            echo "failed $2"
        fi
    fi
}
function search () {
    if [ ! $1 $2 ]; then
        echo "not found $2"
        return 1
    fi
    return 0
}

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    exec -f "$HOME/.bash/.bashrc" 
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
    if [ $? -eq 0 ]; then
        echo "success bin PATH"
    else
        echo "failed bin PATH"
    fi
else
    echo "skip bin PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
    if [ $? -eq 0 ]; then
        echo "success .local/bin PATH"
    else
        echo "failed .local/bin PATH"
    fi
else
    echo "skip .local/bin PATH"
fi
