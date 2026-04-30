zre_files=()

function zre_add_cand() {
    zre_files=($zre_files $1)
}

function zre_random_execute(){
    zre_files=($zre_files "fortune")
    zre_len=${#zre_files[@]}
    i=$((RANDOM % zre_len + 1))
    file=$zre_files[$i]
    ZSH_HACKER_QUOTES_ENABLE_WHEN_INTERACTIVE=
    # need ~/.matecitorc config

    if [[ $file != "fortune" ]]; then
        source "$file"
    fi

    if [[ "$file" = *"zsh-random-quotes"* ]]; then
        cmds=("inspire" "love" "funny" "nerd" "facts")
        len=${#cmds[@]}
        i=$((RANDOM % len))
        $cmds[i]
    fi

    if [[ "$file" = *"welcome-banner"* ]]; then
        show_welcome_banner_once
    fi

    if [[ "$file" = *"rand-quote"* ]]; then
        quote
    fi

    if [[ "$file" = *"fortune"* ]]; then
        fortune
    fi
}
