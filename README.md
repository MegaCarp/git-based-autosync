#auto auth permanent
git config --global credential.helper store

#15 min by default
#git config --global credential.helper cache

#settings for notes' repo
git config --bool branch.main.sync true
git config --bool branch.main.sync true

#how to install - no root, --user is important and allows service to execute path using ~
###this version attempts to work using ~
systemctl --user enable ~/automation/autosync-repos.service
systemctl --user enable ~/automation/autosync-repos.timer
