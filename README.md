#auto auth permanent
git config --global credential.helper store

#15 min by default
#git config --global credential.helper cache

#settings for notes' repo
git config --bool branch.main.sync true
git config --bool branch.main.sync true

#how to install - no root, --user is important and allows service to execute path using ~
#path has to be absolute - beware
systemctl --user enable /home/stashko/automation/git-based-autosync/autosync-repos.service
systemctl --user enable /home/stashko/automation/git-based-autosync/autosync-repos.timer

#testing
systemctl --user status autosync-repos.service
systemctl --user status autosync-repos.timer
