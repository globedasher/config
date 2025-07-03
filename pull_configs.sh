# Copy the existing config files to the config repo
rsync -av ~/.config/nvim/* ./nvim/ --exclude pack
rsync -av ~/.config/hypr/* ./hypr/
rsync -av ~/.config/tmux/* ./tmux/
rsync -av ~/.config/waybar/* ./waybar/
