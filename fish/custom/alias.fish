################################
# Aliases and common functions
#

set message "[$OS] Aliases:"

################################
# General

function ll
    ls -la $argv
end

function md
	mkdir $argv
	cd $argv
end

set message $message" hlp, ll, md"

################################
# Fish specific

alias fishrst "source ~/.config/fish/config.fish"
alias gobash "exec /bin/bash -l"

set message $message", fishrst, gobash"


################################
# NVM:

if test -d ~/.nvm/
    # nvm fish wrapper
    # uses https://github.com/edc/bass
    function nvm
      bass source ~/.nvm/nvm.sh ';' nvm $argv
    end
end

if [ $OS = "OSX" ]

    ################################
    # Show and hide hidden files on Finder

    alias findershow 'defaults write com.apple.finder AppleShowAllFiles YES ; killall Finder'
    alias finderhide 'defaults write com.apple.finder AppleShowAllFiles NO ; killall Finder'
    set message $message", findershow, finderhide"

    ################################
    # Simple HTTP server

    alias serve 'python -m SimpleHTTPServer 8000'
    set message $message", serve"

    ################################
    # Misc

    alias srct "open -a SourceTree"
    set message $message", srct"


    ################################
    # PATH
    #
    # set set -gx VARIABLE_NAME VALUES...
    #   -g: global scope
    #   -x: export to child processes (making it an "environment variable")
    #   https://fishshell.com/docs/2.2/commands.html#set

    # Postgres.app:
    if test -d "/Applications/Postgres.app/Contents/Versions/latest/bin"
        set -gx PATH $PATH "/Applications/Postgres.app/Contents/Versions/latest/bin"
    end

    # Go:
    if test -d $HOME/go
        set -gx GOPATH $HOME/go
    end
    if test -d $GOPATH/bin
        set -gx PATH $PATH $GOPATH/bin
    end

end

set -x -g help_message $message
echo $help_message

function hlp
    echo $help_message
end