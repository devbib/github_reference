github_reference
================

#### About this repository

This repository is meant to be a collection of useful commands, tools, and tips & tricks around Git and GitHub.  
There are a lot of the not-so-basic things I have to look up in certain cases, or particular questions people are asking me. This repository should serve as a place to collect all those things.

#### I am looking forward to your contributions, suggestions, and ideas

If you have any suggestions or want to make additions, I would be very happy if you could send me an [email](mailto:se.raschka@gmail.com), leave me a message on [google+](https://plus.google.com/118404394130788869227/), or even send me a tweet on [twitter](https://twitter.com/rasbt) (given you can fit it within the 140 character limit ;)).  
Or even better: It would be great if you would simply fork this project and send me a pull request.

<br>
<br>

<hr>

<a id='sections'></a>

## Sections

- [Links to useful external resources](#links)

- [Pull and fetch & merge changes](#pull_fetch_merge)

	- [Automatic pull for subdirectories](#auto_pull)
	
	- [Force to overwrite local files](#force_overwrite)
	
- [Connecting to GitHub and GitLab](#connecting)

	- [Connecting to GitHub and GitLab servers via SSH](#ssh)

- [Branching](#branching)

	- [Branching basics](#branching_basics)
	
- [Committing changes](#committing)

	- [Committing basics](#committing_basics)
	
	- [Remove files from commit](#committing_remove)



<hr>

<br>
<br>


<a id='links'></a>

## Links to useful external resources

[[back to top]](#sections)

####[Git Cheat Sheet](http://byte.kde.org/~zrusin/git/git-cheat-sheet-medium.png)
This cheat sheet is probably something that you want to print out and pin to your wall right next to your monitor: All the most important Git commands on one page.


####[git - the simple guide](http://rogerdudler.github.io/git-guide/)
A very brief overview of the Git essentials as it headline says: "just a simple guide for getting started with git. no deep shit ;)".  
In my opinion it is a little bit too "concise" to be a good introduction to Git for absolute beginners, but I think that this is a very good look-up reference for people who are just getting started.

####[Pro Git](http://git-scm.com/book)
Probably the most thorough resource about Git you can find. Its 200+ pages (in the free PDF eBook version) might be a little bit overwhelming for Git newbies, but I would still recommend the first 2 chapter as a good introduction to Git - and the rest of the book to the more advanced users.


####[help.github.com](https://help.github.com)
GitHub help pages are especially useful for everything that is about setting up a connection to the GitHub servers and managing	 your repositories.

<br>
<br>

<a id='pull_fetch_merge'></a>
## Pull and fetch & merge changes

[[back to top]](#sections)

<br>


<a id='auto_pull'></a>
### Automatic pull for subdirectories

[[back to top]](#sections)

Shell command to pull changes from the remote for all
subdirectories in the current directory.

	find . -type d -depth 1 -exec git --git-dir={}/.git --work-tree=$PWD/{} pull origin master \;
	
For your convenience - since the syntax may not be easy to remember - you can put this command into a [shell script](./scripts/pull_all.sh) and save it into your main GitHub directory to conveniently pull all changes for all your contained GitHub repositories via
	
	sh pull_all.sh


<br>
<br>

<a id='force_overwrite'></a>	
### Force to overwrite local files
[[back to top]](#sections)

Replace local changes with most recent contents from `HEAD`.

	git checkout -- <file>

Fetches the most recent files from the remote and resets the master branch to those by overwriting all local changes.

	git fetch --all
	git reset --hard origin/master
	
	
	
<br>
<br>

<a id='connecting'></a>	

## Connecting to GitHub and GitLab
[[back to top]](#sections)

<br>
<br>

<a id='ssh'></a>
####Connecting to GitHub and GitLab servers via SSH

[[back to top]](#sections)

If you want to communicate to the GitHub/GitLab servers via a "more secure" connections or if your are using a terminal that doesn't support `https`.  

-	[github_ssh_connection.md](./markdown/github_ssh_connection.md)


<br>
<br>

<a id='branching'></a>
## Branching

[[back to top]](#sections)

<br>
<br>


<a id='branching_basics'></a>
#### Branching Basics

[[back to top]](#sections)

Create a new branch called "develop"

	git branch develop

Switch to new branch

	git checkout develop
	
Alternative shorthand for creating and switching:

	git checkout -b develop
	
Delete the branch

	git branch -d develop

Push branch to the remote server:

	git push origin develop
	
Preview differences between branches

	git diff <source_branch> <target_branch>
	
Merge changes from new branch back into the master branch

	git checkout master
	git merge develop
	
	
<br>
<br>	

<a id='committing'></a>
## Committing Changes

[[back to top]](#sections)

<br>
<br>

<a id='committing_basics'></a>
#### Committing Basics

[[back to top]](#sections)

Add individual files

	git add <file>
	
Recursively add everything in the current directory

	git add .
	
Commit changes

	git commit -m 'some commit message'
	
Shorthand for adding all files and committing them in 1 command

	git commit -a -m 'some commit message'

<br>
<br>


<a id='committing_remove'></a>
#### Remove files from commit

[[back to top]](#sections)

Removes staged (`add`ed files from the commit)

	git rm --cached <file>
