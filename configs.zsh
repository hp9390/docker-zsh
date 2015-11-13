if [[ -z "$skip_global_compinit"  ]]; then
    autoload -U compinit
    compinit
fi
if [[ -x /usr/lib/command-not-found  ]] ; then
    function command_not_found_handler() {
        /usr/lib/command-not-found --no-failure-msg -- $1
    }
fi
export PATH=$PATH:/root/.composer/vendor/bin
