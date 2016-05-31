# Auto list directory when changing
function cl () {
  cd "$@" && clear && ls -laAhF
}
# Change and list directory on creation
function md () {
  mkdir -p "$@" && cl "$@"
}
function make_screens() {
    pageres http://localhost:8100/"$@" < ~/Development/CuttleDev/Projects/screen-resolutions.txt
}

# Determine size of a file or total size of a directory
function fs() {
  if du -b /dev/null > /dev/null 2>&1; then
    local arg=-sbh
  else
    local arg=-sh
  fi
  if [[ -n "$@" ]]; then
    du $arg -- "$@"
  else
    du $arg .[^.]* *
  fi
}

# Create a data URL from a file
function dataurl() {
  local mimeType=$(file -b --mime-type "$1")
  if [[ $mimeType == text/* ]]; then
    mimeType="${mimeType};charset=utf-8"
  fi
  echo "data:${mimeType};base64,$(openssl base64 -in "$1" | tr -d '\n')"
}

include () {
    [[ -f "$1" ]] && source "$1"
}
