# Pulls changes from remote for all GitHub sub-directories in a 
# current directory.

find . -type d -depth 1 -exec git --git-dir={}/.git --work-tree=$PWD/{} pull origin master \;

