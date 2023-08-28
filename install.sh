# Credit: Joe Previte (@jsjoeio) - https://github.com/jsjoeio/dotfiles/blob/master/install.sh
# Setup for MacOSX
###########################
# zsh setup
###########################
echo -e "⤵ Installing zsh..."
sudo apt-get -y install zsh
echo -e "✅ Successfully installed zsh version: $(zsh --version)"

# Set up zsh tools
PATH_TO_ZSH_DIR=$HOME/.oh-my-zsh
echo -e "Checking if .oh-my-zsh directory exists at $PATH_TO_ZSH_DIR..."
if [ -d $PATH_TO_ZSH_DIR ]
then
   echo -e "\n$PATH_TO_ZSH_DIR directory exists!\nSkipping installation of zsh tools.\n"
else
   echo -e "\n$PATH_TO_ZSH_DIR directory not found."
   echo -e "⤵ Configuring zsh tools in the $HOME directory..."

   (cd $HOME && sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended)
   echo -e "✅ Successfully installed zsh tools"
fi

# Set up symlink for .zshrc
ZSHRC_LINK=$HOME/.zshrc
if [ -L ${ZSHRC_LINK} ] ; then
   if [ -e ${ZSHRC_LINK} ] ; then
      echo -e "\n.zshrc is symlinked corrected"
   else
      echo -e "\nOops! Your symlink appears to be broken."
   fi
elif [ -e ${ZSHRC_LINK} ] ; then
   echo -e "\nYour .zshrc exists but is not symlinked."
   # We have to symlink the .zshrc after we curl the install script
   # because the default zsh tools installs a new one, even if it finds ours
   rm $HOME/.zshrc
   echo -e "⤵ Symlinking your .zshrc file"
   ln -s $HOME/dotfiles/.zshrc $HOME/.zshrc
   echo -e "✅ Successfully symlinked your .zshrc file"
else
   echo -e "\nUh-oh! .zshrc missing."
fi

# Set the default shell
echo -e "⤵ Changing the default shell"
sudo chsh -s $(which zsh) $USER
echo -e "✅ Successfully modified the default shell"

###########################
# end zsh setup
###########################

###########################
# vim setup
# Uncomment to setup vim
###########################
# Install Vim Plug
# echo -e "Installing VimPlug"
# VIM_PLUG=$HOME/.vim/autoload/plug.vim
# if [ -f ${VIM_PLUG} ]
# then
#    echo -e "\n$VIM_PLUG exists!\nSkipping installation of vim plug."
# else
#    echo -e "\n$VIM_PLUG not found."
#    echo -e "\n⤵ Configuring vim plug in the $HOME directory..."
#    (cd $HOME && curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim)
#    echo -e "\n✅ Successfully installed vim plug
#    "
# fi

# echo -e "\nInstalling vim plugins"
# # Install Plugins

# vim +PlugInstall +qall
# echo -e "\n✅ Successfully installed vim plugins"

###########################
# end vim setup
###########################

### Install Fasd https://github.com/clvv/fasd
sudo add-apt-repository ppa:aacebedo/fasd
sudo apt-get update
sudo apt-get -y install fasd
### Install ripgrep https://github.com/BurntSushi/ripgrep
curl -LO https://github.com/BurntSushi/ripgrep/releases/download/13.0.0/ripgrep_13.0.0_amd64.deb
sudo dpkg -i ripgrep_13.0.0_amd64.deb
nix-env --install ripgrep
### Install zsh syntax highlight and suggestions (plugins)
# git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

### Install neovim
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt-get update
sudo apt-get -y install neovim

