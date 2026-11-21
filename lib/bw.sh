# Sourced by the tasks that read from Bitwarden (mise-tasks/gpg-key, ssh-key).
# Leaves $bw pointing at the CLI and BW_SESSION exported for an unlocked vault.
# Logging in and unlocking prompt on the terminal; the session key only lives
# in the calling script's environment.

bw=$(command -v bw || true)
if [ -z "$bw" ]; then
  bw=/opt/homebrew/bin/bw
fi
if [ ! -x "$bw" ]; then
  echo "bitwarden-cli (bw) is not installed. Run: mise bootstrap packages apply" >&2
  exit 1
fi

# `bw status` reports unauthenticated, locked or unlocked. --raw makes login
# and unlock print nothing but the session key.
bw_status=$("$bw" status | sed -E 's/.*"status":"([a-z]+)".*/\1/')
case "$bw_status" in
  unauthenticated)
    BW_SESSION=$("$bw" login --raw)
    ;;
  locked)
    BW_SESSION=$("$bw" unlock --raw)
    export BW_SESSION
    "$bw" sync >/dev/null
    ;;
  unlocked) ;;
  *)
    echo "unexpected 'bw status': $bw_status" >&2
    exit 1
    ;;
esac
export BW_SESSION
