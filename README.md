
#Table of Contents

- [About this repository](#about-this-repository)
    
- [Pull and fetch & merge changes](#pull-and-fetch-merge-changes)
    - [Automatic pull for subdirectories](#automatic-pull-for-subdirectories)
    - [Force to overwrite local files](#force-to-overwrite-local-files)
    - [Purging a file or directory from the entire git history](#purging-a-file-or-directory-from-the-entire-git-history)
    - [Keeping both files separate at merge conflict](#keeping-both-files-separate-at-merge-conflict)
    - [Getting updates from the original project after forking](getting-updates-from-the-original-project-after-forking)
- [Connecting to GitHub and GitLab](#connecting-to-github-and-gitlab)
    - [Connecting to GitHub and GitLab servers via SSH](#connecting-to-github-and-gitlab-servers-via-ssh)
- [Branching](#branching)
    - [Branching Basics](#branching-basics)
- [Committing Changes](#committing-changes)
    - [Committing Basics](#committing-basics)
    - [Remove files from commit](#remove-files-from-commit)
    - [View the commit log with different levels of detail](#view-the-commit-log-with-different-levels-of-detail)
    - [Summarizing/squashing commits](#summarizingsquashing-commits)
- [Links to useful external resources](#links-to-useful-external-resources)



<br>
<br>
<br>
<br>



#### About this repository
[[back to top](#table-of-contents)]

This repository is meant to be a collection of useful commands, tools, and tips & tricks around Git and GitHub.  
There are a lot of the not-so-basic things I have to look up in certain cases, or particular questions people are asking me. This repository should serve as a place to collect all those things.

#### I am looking forward to your contributions, suggestions, and ideas
[[back to top](#table-of-contents)]

If you have any suggestions or want to make additions, I would be very happy if you could send me an [email](mailto:se.raschka@gmail.com), leave me a message on [google+](https://plus.google.com/118404394130788869227/), or even send me a tweet on [twitter](https://twitter.com/rasbt) (given you can fit it within the 140 character limit ;)).  
Or even better: It would be great if you would simply fork this project and send me a pull request.

<br>
<br>

<hr>



<hr>

<br>
<br>





## Pull and fetch & merge changes
[[back to top](#table-of-contents)]



<br>
<br>



### Automatic pull for subdirectories
[[back to top](#table-of-contents)]


Shell command to pull changes from the remote for all
subdirectories in the current directory.

	find . -type d -depth 1 -exec git --git-dir={}/.git --work-tree=$PWD/{} pull origin master \;
	
For your convenience - since the syntax may not be easy to remember - you can put this command into a [shell script](./scripts/pull_all.sh) and save it into your main GitHub directory to conveniently pull all changes for all your contained GitHub repositories via
	
	sh pull_all.sh


<br>
<br>


### Force to overwrite local files
[[back to top](#table-of-contents)]

Replace local changes with most recent contents from `HEAD`.

	git checkout -- <file>

Fetches the most recent files from the remote and resets the master branch to those by overwriting all local changes.

	git fetch --all
	git reset --hard origin/master
	
<br>
<br>

### Purging a file or directory from the entire git history
[[back to top](#table-of-contents)]


Deleting a file or directory from the Git history is - in my opinion - was an option that was not intended by its creator. However, sometimes large binary files can cause a repository to grow over multiple Gigabytes in size, and in this case it might be useful to delete those.

	git filter-branch --prune-empty --index-filter 'git rm -rf --cached --ignore-unmatch MY-BIG-DIRECTORY-OR-FILE' --tag-name-filter cat -- --all
	
(for more info, see the original [article](http://naleid.com/blog/2012/01/17/finding-and-purging-big-files-from-git-history))	
	
After that, you might want to commit your changes and clone the "slimmer" repository:

	git clone --no-hardlinks file:///Users/yourUser/your/full/repo/path repo-clone-name	
	
<br>
<br>

### Keeping both files separate at merge conflict
[[back to top](#table-of-contents)]	

	 * branch            master     -> FETCH_HEAD
	Auto-merging README.md
	CONFLICT (content): Merge conflict in README.md
	Automatic merge failed; fix conflicts and then commit the result.

In cases of an automatic merge conflicts which causes hundreds or thousands of conflicts to fix manually, you maybe want to decide to keep both files separate, or either one of them (without the conflict notes inserted).  

Here is how to keep your current local file:

	git checkout --ours README.md 

And this command can be used to keep just the file that was about to merged in:

	git checkout --theirs README.md



Auto-merged index.html
CONFLICT (content): Merge conflict in index.html
Automatic merge failed; fix conflicts and then commit the result.
There’s two unmerged files here. According to the git checkout manpage, there’s a --theirs and --ours options on the command. The former will keep the version of the file that you merged in, and the other will keep the original one we had.
The following commands will keep the original file for index.html, and then use the merged in file only for _layouts/default.html.
git checkout --ours index.html
git checkout --theirs _layouts/default.html

<br>
<br>

### Getting updates from the original project after forking
[[back to top](#table-of-contents)]	

1) Add the original repository as a remote

	cd onyourlocaldrive/repo_name
	git remote add upstream git://github.com/username/repo_name.git

2) Then you can pull from it via:
	
	git merge upstream/master master


<br>
<br>
<br>
<br>

## Connecting to GitHub and GitLab
[[back to top](#table-of-contents)]


<br>
<br>


###Connecting to GitHub and GitLab servers via SSH
[[back to top](#table-of-contents)]


If you want to communicate to the GitHub/GitLab servers via a "more secure" connections or if your are using a terminal that doesn't support `https`.  

-	[github_ssh_connection.md](./markdown/github_ssh_connection.md)


<br>
<br>

## Branching
[[back to top](#table-of-contents)]


<br>
<br>



### Branching Basics
[[back to top](#table-of-contents)]


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


## Committing Changes
[[back to top](#table-of-contents)]

<br>
<br>


### Committing Basics
[[back to top](#table-of-contents)]



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



### Remove files from commit
[[back to top](#table-of-contents)]


Removes staged (`add`ed files from the commit)

	git rm --cached <file>
	
<br>
<br>


### View the commit log with different levels of detail
[[back to top](#table-of-contents)]


1) one line

	$git log --pretty=oneline
	
	7d8d551bc3c244659e5fef20bf5cf9cbe4db9f3c changes to a.txt
	ca6b353428d78dd3d8f03f03ee6128df703462d9 created a.txt and b.txt
	
2) short	
	
	$git log --pretty=short
	
	commit 7d8d551bc3c244659e5fef20bf5cf9cbe4db9f3c
	Author: rasbt <se.raschka@me.com>

    changes to a.txt

3) full

	$git log --pretty=full

	commit 7d8d551bc3c244659e5fef20bf5cf9cbe4db9f3c
	Author: rasbt <se.raschka@me.com>
	Commit: rasbt <se.raschka@me.com>

    changes to a.txt
    
4) fuller

	$git log --pretty=fuller

	commit 7d8d551bc3c244659e5fef20bf5cf9cbe4db9f3c
	Author:     rasbt <se.raschka@me.com>
	AuthorDate: Sat Jun 7 11:34:00 2014 -0400
	Commit:     rasbt <se.raschka@me.com>
	CommitDate: Sat Jun 7 11:34:00 2014 -0400

    changes to a.txt
    
    
<br>
<br>


    
### Summarizing/squashing commits
[[back to top](#table-of-contents)]
 

 
**Warning:** This should only be done for local commits that you haven't been uploaded to a remote, yet.

Here, we want to squash those 3 commits into 1 single one to keep the commit history "lean":

	$git log --pretty=oneline
	
	d3abc1933ed9782ddae0ef07505b2a0cd54dbe77 changes to a again
	7d8d551bc3c244659e5fef20bf5cf9cbe4db9f3c changes to a.txt
	ca6b353428d78dd3d8f03f03ee6128df703462d9 created a.txt and b.txt
	
	
We will use `rebase` for the `HEAD` (latest commit) up to 3 commits ago `HEAD~3`

	$git rebase -i HEAD~3
	
And editor will open with the following example contents:

	pick 3abc193 changes to a again
	pick 7d8d551 changes to a.txt
	pick ca6b353 created a.txt and b.txt

	# Rebase d3abc1..4dbe77 onto 60709da
	#
	# Commands:
	#  p, pick = use commit
	#  e, edit = use commit, but stop for amending
	#  s, squash = use commit, but meld into previous commit
	#
	# If you remove a line here THAT COMMIT WILL BE LOST.
	# However, if you remove everything, the rebase will be aborted.
	#
	
Now, we change the first 3 lines to summarize all 3 commits into the latest commit:

	pick 3abc193 changes to a again
	squash 7d8d551 changes to a.txt
	squash ca6b353 created a.txt and b.txt
	
After we save and close the editor, a new editor window will open where we can modify the commit message and the `rebase` should be successfully completed.

<br>
<br>
<br>
<br>

## Links to useful external resources
[[back to top](#table-of-contents)]


**[Git Cheat Sheet](http://byte.kde.org/~zrusin/git/git-cheat-sheet-medium.png)**  
This cheat sheet is probably something that you want to print out and pin to your wall right next to your monitor: All the most important Git commands on one page.


**[git - the simple guide](http://rogerdudler.github.io/git-guide/)**  
A very brief overview of the Git essentials as it headline says: "just a simple guide for getting started with git. no deep shit ;)".  
In my opinion it is a little bit too "concise" to be a good introduction to Git for absolute beginners, but I think that this is a very good look-up reference for people who are just getting started.

**[Pro Git](http://git-scm.com/book)**  
Probably the most thorough resource about Git you can find. Its 200+ pages (in the free PDF eBook version) might be a little bit overwhelming for Git newbies, but I would still recommend the first 2 chapter as a good introduction to Git - and the rest of the book to the more advanced users.


**[help.github.com](https://help.github.com)**  
GitHub help pages are especially useful for everything that is about setting up a connection to the GitHub servers and managing	 your repositories.

<br>
<br>
