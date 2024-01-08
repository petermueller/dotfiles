#!/bin/sh

# exit immediately if bitwarden-cli, bw, is already in $PATH
type bw >/dev/null 2>&1 && exit

case "$(uname -s)" in
Darwin)
    # commands to install bw on Darwin
    brew install bitwarden-cli
    ;;
Linux)
    # commands to install bw on Linux
    ;;
*)
    echo "unsupported OS"
    exit 1
    ;;
esac
