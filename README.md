github_reference
================

A collection of useful GitHub commands and procedures

<hr>

<br>
<br>

## Pull and fetch & merge changes

<br>

### Automatic pull for subdirectories

Shell command to pull changes from the remote for all
subdirectories in the current directory.

	find . -type d -depth 1 -exec git --git-dir={}/.git --work-tree=$PWD/{} pull origin master \;
	
For your convenience - since the syntax may not be easy to remember - you can put this command into a [shell script](./scripts/pull_all.sh) and save it into your main GitHub directory to conveniently pull all changes for all your contained GitHub repositories via
	
	sh pull_all.sh


<br>
<br>

	
### Force to overwrite local files

Fetches the most recent files from the remote and resets the master branch to those by overwriting all local changes.

	git fetch --all
	git reset --hard origin/master
	
<br>
<br>

## Connecting to GitHub and GitLab

<br>
<br>

####Connecting to GitHub and GitLab servers via SSH

If you want to communicate to the GitHub/GitLab servers via a "more secure" connections or if your are using a terminal that doesn't support `https`.  

-	[github_ssh_connection.md](./markdown/github_ssh_connection.md)