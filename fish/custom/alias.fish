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

    # TopTal: node 8
    nvm use 8
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

    # TopTal: elasticsearch on path
    set -g fish_user_paths "/usr/local/opt/elasticsearch@5.6/bin" $fish_user_paths

    
    ################################
    # TopTal: imagemagick

    # If you need to have imagemagick@6 first in your PATH run:
    set -g fish_user_paths "/usr/local/opt/imagemagick@6/bin" $fish_user_paths

    # For compilers to find imagemagick@6 you may need to set:
    set -gx LDFLAGS "-L/usr/local/opt/imagemagick@6/lib"
    set -gx CPPFLAGS "-I/usr/local/opt/imagemagick@6/include"

    # For pkg-config to find imagemagick@6 you may need to set:
    set -gx PKG_CONFIG_PATH "/usr/local/opt/imagemagick@6/lib/pkgconfig"

    
    ################################
    # TopTal: libxml2
    
    # If you need to have libxml2 first in your PATH run:
    set -g fish_user_paths "/usr/local/opt/libxml2/bin" $fish_user_paths

    # For compilers to find libxml2 you may need to set:
    set -gx LDFLAGS "-L/usr/local/opt/libxml2/lib"
    set -gx CPPFLAGS "-I/usr/local/opt/libxml2/include"

    # For pkg-config to find libxml2 you may need to set:
    set -gx PKG_CONFIG_PATH "/usr/local/opt/libxml2/lib/pkgconfig"

end

set -x -g help_message $message
echo $help_message

function hlp
    echo $help_message
end