# $PATH exports
local PATH_LIST=(
    "/opt/local/bin"
    "/opt/local/sbin"
    "/usr/local/mysql/bin"
    "$HOME/apps/android-sdk/tools"
    "$HOME/apps/android-sdk/platform-tools"
    "$HOME/bin"
)

local P=
for P in "${PATH_LIST[@]}"; do
    if [ -d $P ]; then
        PATH="$P:$PATH"
    fi
done

export PATH=$PATH

# Load extra dotfiles
local FILE=
for FILE in ~/.{bash_prompt,exports,aliases,functions}; do
    [ -r "$FILE" ] && source "$FILE"
done

# Load the sub (https://github.com/37signals/sub) nern
if [ -d "$HOME/.nern" ]; then
    eval "$($HOME/.nern/bin/nern init -)"
fi
