# ----------------------------- File Navigation ------------------------------ #
# Auto list directory when changing, given the directory name
function cl () {
  cd "$@" && clear

  if test -f ".nvmrc"; then
    echo "🔎🔎🔎 .nvmrc found - activating Node environment\n"
    nvm use
  fi

  ls -laAhF
}

# Change into then list directory on creation, given the directory name
function md () {
  mkdir -p "$@" && cl "$@"
}

# Change into Cuttlesoft client project directory, given the project name
function cuttleproject() {
  cl ~/Development/CuttleDev/Projects/Clients/"$@"
}


# ----------------------------------- Git ------------------------------------ #
# Clone down Cuttlesoft repository
function cuttleclone() {
  git clone ssh://git@github.com/cuttlesoft/"$@".git
}

# Archive a branch
# - Tag the branch as archived, continue only if successful
# - Remove the branch locally
# - Remove the branch on origin
# - Push tag to remote
function archive-branch() {
  git tag archive/"$@" "$@" && git branch -D "$@"; git push origin :"$@"; git push origin archive/"$@"
}

# Display branch statuses
function branch-status() {
  echo "🙅🏻‍♀️ Not Merged:"
  git branch --no-merge

  echo "💁🏻‍♀️ Merged (or even):"
  git branch --merge
}

# Open the current repository in GitKraken
function kraken() {
  echo "🦑 Opening in GitKraken..."
  open -na GitKraken --args -p "$(git rev-parse --show-toplevel)"
}

# --------------------------- Development Helpers ---------------------------- #
# Generate screenshots using pageres
function makescreens() {
  pageres http://localhost:8100/"$@" < ~/Development/CuttleDev/Projects/screen-resolutions.txt
}

# Make resources for an Ionic project with different icons for each platform
function ionicresources() {
  mkdir resources/.tmp

  cp -f resources/icon-ios.psd resources/icon.psd
  ionic cordova resources --icon

  mv -f resources/ios/icon/* resources/.tmp
  rm resources/icon.psd

  cp -f resources/icon-android.psd resources/icon.psd
  ionic cordova resources --icon

  rm resources/ios/icon/*
  mv -f resources/.tmp/* resources/ios/icon

  rm resources/.tmp
  rm resources/icon.psd

  ionic cordova resources --splash
}

# --------------------------------- Helpers ---------------------------------- #
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
