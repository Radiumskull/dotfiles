echo 'Deleting Old Files'
rm ~/.zshrc
rm ~/.bashrc
rm ~/.tmux.conf
rm ~/.config/nvim
rm ~/.config/alacritty

ln .zshrc ~/.zshrc
ln .bashrc ~/.bashrc
ln .tmux.conf ~/.tmux.conf
ln -s nvim ~/.config/nvim
ln -s alacritty ~/.config/alacritty
