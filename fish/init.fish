# No greetings, please
set fish_greeting

# Set OS variable
set osname (uname -s)
if [ $osname = "Darwin" ]
    set -x OS "OSX"
else
    set -x OS "Linux"
end

# Load custom functions
# Private config that should not be commited can be added to 'fish/custom/local.fish'
for path in $OMF_CONFIG/custom/*
	source $path ^/dev/null
end

# Enable autojump plugin
[ -f /usr/local/share/autojump/autojump.fish ]; and source /usr/local/share/autojump/autojump.fish

# Load rbenv automatically
status --is-interactive; and source (rbenv init -|psub)

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/eduardoportilho/dev/tools/google-cloud-sdk/path.fish.inc' ]; . '/Users/eduardoportilho/dev/tools/google-cloud-sdk/path.fish.inc'; end
