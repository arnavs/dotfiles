#!/bin/zsh
# Update website.
commit_date=$(date '+%b %d %y, %H:%M:%S')

git add .
git commit -m "Update ${commit_date}"
git push
