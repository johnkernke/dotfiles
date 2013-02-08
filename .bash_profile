# $PATH exports
PATH_LIST=(
    "/opt/local/bin"
    "/opt/local/sbin"
    "/usr/local/mysql/bin"
    "$HOME/apps/android-sdk/tools"
    "$HOME/apps/android-sdk/platform-tools"
    "$HOME/bin"
)

P=
for P in "${PATH_LIST[@]}"; do
    if [ -d $P ]; then
        PATH="$P:$PATH"
    fi
done

unset PATH_LIST
unset P
export PATH=$PATH

# Load extra dotfiles
FILE=
for FILE in ~/.{bash_prompt,exports,aliases,functions}; do
    [ -r "$FILE" ] && source "$FILE"
done

unset FILE

# Load the sub (https://github.com/37signals/sub) nern
if [ -d "$HOME/.nern" ]; then
    eval "$($HOME/.nern/bin/nern init -)"
fi
