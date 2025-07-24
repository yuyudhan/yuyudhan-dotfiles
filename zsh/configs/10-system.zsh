# FilePath: zsh/configs/10-system.zsh

# System Management
alias flushdns='sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder'
alias showhidden='defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder'
alias hidehidden='defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder'
alias volup='osascript -e "set volume output volume (output volume of (get volume settings) + 10) --100%"'
alias voldown='osascript -e "set volume output volume (output volume of (get volume settings) - 10) --100%"'
alias update='brew update && brew upgrade && brew cleanup'

# Network management
alias ip='ipconfig getifaddr en0'    # Get local IP address

