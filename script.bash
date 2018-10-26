# -*- mode: shell-script -*-

# bash pitfalls
# http://mywiki.wooledge.org/BashPitfalls

yell()   { echo "$0: $*" >&2; }
die()    { yell "$*"; exit 111; }
try()    { "$@" || die "cannot $*"; }
asuser() { sudo su - "$1" -c "${*:2}"; }
ensure_bash() { try([ -z "$BASH_VERSION" ]) }

header()   { echo -e "\n\033[1m$@\033[0m"; }
success()  { echo -e "  \033[1;32m✔\033[0m  $@"; }
error()    { echo -e "  \033[1;31m✖\033[0m  $@"; exit; }
arrow()    { echo -e "  \033[1;33m➜\033[0m  $@"; }

function usage() {
    cat <<EOF
Usage: $0 <command> <file>
-h| --help           display this message
commands
foobar               do something
EOF
}

ensure_bash()

[ $# -eq 0 ] && usage && exit 1
[[ ($1 == "--help") || $1 == "-h" ]] && usage && exit 0
