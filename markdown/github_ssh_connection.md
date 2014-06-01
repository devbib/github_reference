Sebastian Raschka  
last updated: 06/01/2014

#Connecting to GitHub and GitLab servers via SSH


<br>
<br>

## generate a private/public key pair

The private/public key pairs are usually stored in the user's home directory under the (invisible) directory `.ssh/`.

The default file names where the private/public key pairs are stored are

	- id_rsa
	
	- id_rsa.pub


**Procedure:**


<pre>
[bash]~ >cd ~/.ssh
[bash]~/.ssh > ssh-keygen -t rsa -C "username@uni.edu"
Generating public/private rsa key pair.
Enter file in which to save the key (/home/username/.ssh/id_rsa): 
/home/username/.ssh/id_rsa already exists.
Overwrite (y/n)? y
Enter passphrase (empty for no passphrase): 
Enter same passphrase again: 
Your identification has been saved in /home/username/.ssh/id_rsa.
Your public key has been saved in /home/username/.ssh/id_rsa.pub.
The key fingerprint is:
11:8[...]:f1:a5 username@uni.edu
The key's randomart image is:
+--[ RSA 2048]----+
| o+. =+.=%|
[ ...] 
+-----------------+ 
[bash]~/.ssh >ssh-add id_rsa
Enter passphrase for id_rsa: 
Identity added: id_rsa (id_rsa)

</pre>


<br>
<br>

##Add SSH keys to GitLab/GitHub SSH keys

Copy the content from `id_rsa.pub` and add them to the SSH keys on GitHub/GitLab.
	
e.g., 

	ssh-rsa AA[...]== username@uni.edu	
	
<br>
	
![](../images/add_ssh_key_1.png)

<br>
	
![](../images/add_ssh_key_2.png)	

<br>
<br>

## Add the content below to ~/.ssh/config

Replace the example information in the following lines and add them to the `.ssh/config` file:

<pre>
Host GitLab.uni.edu
HostName GitLab.uni.edu
IdentityFile ~/.ssh/id_rsa
User username
</pre>

<br>
<br>

## Create a new repository on GitHub/GitLab

Create new repository on GitHub/GitLab:

<br>

![](../images/github_new_repo.png)

<br>


then change the global Git settings:


	[bash]~/Gits >bash]~/ > git config --global user.name "rasbt"
	[bash]~/Gits >bash]~/ > git config --global user.email "username@uni.edu"


Now, you can clone the new repository to your local drive:

![](../images/git_clone.png)

	[bash]~/ >cd github_repos
	[bash]~/github_repos/ >git clone git@github.com:rasbt/github_reference.git