# Apps
apps=(
  dropbox
  qlcolorcode
  firefox
  qlmarkdown
  spotify
  vagrant
  virtualbox
  atom
  flux
  mailbox
  skype
)

# Install apps to /Applications
# Default is: /Users/$user/Applications
echo "installing apps..."
brew cask install ${apps[@]}