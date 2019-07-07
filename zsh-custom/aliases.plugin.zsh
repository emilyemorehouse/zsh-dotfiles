# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en1"
alias ips="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"
alias wifi_passwd='security find-generic-password -ga labnol | grep password'

# Enhanced WHOIS lookups
alias whois="whois -h whois-servers.net"

# Flush Directory Service cache
alias flush="sudo discoveryutil mdnsflushcache && dscacheutil -flushcache && killall -HUP mDNSResponder"

# Misc aliases
alias antlr4='java -jar /usr/local/lib/antlr-4.0-complete.jar'
alias grun='java org.antlr.v4.runtime.misc.TestRig'
alias fix_mamp='ln -s /Applications/MAMP/tmp/mysql/mysql.sock /tmp/mysql.sock'

# Python-specific aliases
alias py_ex='chmod +x *.py'
alias mkv='mkvirtualenv'
alias mktv='mktmpenv'
alias mkv3='mkvirtualenv --python=$(which python3)'
alias rmv='rmvirtualenv'

alias l='ls -laAhF'
alias dir='ls -a'
alias rm='rmtrash'

# React Native helpers
alias fix-config-h='cd node_modules/react-native && ./scripts/ios-install-third-party.sh && cd third-party/glog-0.3.4 && ../../scripts/ios-configure-glog.sh && cd ../../../..'

# Ionic Helpers
alias platform_reset='ios_reset && android_reset'
alias ios_reset='ionic platform rm ios && ionic platform add ios'
alias android_reset='ionic platform rm android && ionic platform add android'

# Simulator Quick Starts
alias ios-simulator="open /Applications/Xcode.app/Contents/Developer/Applications/Simulator.app/"
alias sim-iphone-x="ios-sim start --devicetypeid 'iPhone-X, 12.1'"
alias sim-iphone-xs="ios-sim start --devicetypeid 'iPhone-XS, 12.1'"
alias sim-iphone-xs-max="ios-sim start --devicetypeid 'iPhone-XS-Max, 12.0'"
alias sim-iphone-8="ios-sim start --devicetypeid 'iPhone-8, 12.0'"
alias sim-iphone-8-plus="ios-sim start --devicetypeid 'iPhone-8-Plus, 12.0'"
alias sim-ipad-pro-sm="ios-sim start --devicetypeid 'iPad-Pro--9-7-inch-, 12.0'"
alias sim-ipad-pro="ios-sim start --devicetypeid 'iPad-Pro--12-9-inch---2nd-generation-, 12.0'"
alias android-tablet="emulator -avd Nexus_7_API_25 &"
alias android-pixel="emulator -avd Pixel_XL_API_25 &"

# Project Quick Starts
alias ws='cl ~/Development/CuttleDev/Projects/Clients/WeatherSTEM/weatherstem.mobile && subl . && ionic serve'

# show/hide all hidden files using script
alias togglehidden='sh ~/Development/Configs/dotfiles/togglehidden.sh'

# network connection aliases
alias airdown='sudo networksetup -setairportpower en0 off'
alias airup='sudo networksetup -setairportpower en0 on'
alias wifi_passwd='security find-generic-password -ga labnol | grep password'

# mysql
alias mysql.start="sudo /usr/local/mysql/support-files/mysql.server start"
alias mysql.stop="sudo /usr/local/mysql/support-files/mysql.server stop"
alias mysql.restart="sudo /usr/local/mysql/support-files/mysql.server restart"
alias mysql.status="sudo /usr/local/mysql/support-files/mysql.server status"
