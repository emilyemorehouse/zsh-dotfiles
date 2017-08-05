# Auto list directory when changing
function cl () {
  cd "$@" && clear && ls -laAhF
}
# Change and list directory on creation
function md () {
  mkdir -p "$@" && cl "$@"
}
function makescreens() {
  pageres http://localhost:8100/"$@" < ~/Development/CuttleDev/Projects/screen-resolutions.txt
}

# Clone down Cuttlesoft repository
function cuttleclone() {
  git clone ssh://git@bitbucket.org/cuttlesoft/"$@".git
}

function cuttleproject() {
  cl ~/Development/CuttleDev/Projects/Clients/"$@"
}

# Make resources for an Ionic project with different icons for each platform
function ionicresources() {
  mkdir resources/.tmp

  cp -f resources/icon-ios.psd resources/icon.psd
  ionic resources --icon

  mv -f resources/ios/icon/* resources/.tmp
  rm -f resources/icon.psd

  cp -f resources/icon-android.psd resources/icon.psd
  ionic resources --icon

  rm -f resources/ios/icon/*
  mv -f resources/.tmp/* resources/ios/icon

  rm -rf resources/.tmp
  rm -f resources/icon.psd

  ionic resources --splash
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
