---
layout: page
title: Introduction to Git
---

The purpose of this lesson to provide a minimum use case of how to link
Rstudio, git, and GitHub. I also provide links down below to lessons that 
demonstrate how to use git from the command line. 

To complete the GitHub portion of this lesson you will need to create a 
GitHub user account: https://github.com/ 

Git is a version control system that allows you to track changes to your data
and source code as you develop quantitative projects. It is common when 
working on a project to accrue many different versions of data and code files. 
git provides a system of organizing these file versions into a powerful 
reference system.

![phdcomics](./figures/final_doc.gif)

### Install Git

* Download Git for your OS here: 
<https://git-scm.com/download>

* Note: Mac users you may already have git installed on your OS.
Open your terminal and type `git` and see if you get an error. 

* Note: some Mac users have found these step-by-step install instructions 
helpful <https://codeburst.io/installing-git-for-the-first-time-on-mac-osx-bf9c513af2b8> 

### Configure Git within Rstudio 
For most Rstudio will automatically figure out where git is located, but for
others you will need to do this manually. Follow these steps

1. Click Tools > Global Options
2. Click Git/SVN 
3. Find the box labled "Git executabile" and browse to the directory on your
machine where this file is located. On my windows machine this is 
`C:\Program Files (x86)\Git\bin`

### Configure your git user name

You will need to configure your git user name the first time you use it on a 
machine. This is a pretty simple process.

1. Open a terminal window. You can do this in Rstudio by either navitagating to 
the window called "Terminal" usually right next to the console or by clicking: 
Tools -> Terminal -> Move focus to terminal

![terminal](./figures/terminal.png)

2. Set a Git username: 
```
$ git config --global user.name "Mona Lisa"
$ git config --global user.email "mona@gmail.com"
```

3. Confirm that you have set the Git username correctly:
```
$ git config --list
Output
user.name=Mona Lisa
user.email=mona@gmail.com
```
### Configure GitHub

GitHub continues to change its user policies and authenication methods on a 
yearly basis. Currently (2023) there are several setps that you need to complete
to make sure you can log in and remotely push code to github. 

1. create a free user account at http://github.com 
    - chose a username that you would feel happy going on your CV to potential employers. 

2. configure the two factor authentication within your github account
    - lots of options here I recommend either sms txt message or Microsoft
    authenticator phone app (should already have an account with your g.cofc.edu
    address). Just make sure you can log into github.com without hitting a snag.
3. configure a secure way to push code to github. 
    - The service does not allow you to use a simple password so there are least
    two simplish options. I will be using a personal access token in class
    (because my rstudio server only allows this option) but you may prefer to
    setup an ssh key. You can think of these two methods as just very fancy
    passwords. The personal access token can be used from any machine but its
    the kind of thing you have to copy and paste (its long) whereas the ssh key
    is specific for a specific machine but once you set it up you never have to
    think about it again 😮. I would use the ssh tokens if I could.  I'll
    provide the instructions here for both approaches here:
    -  [personal access token (classic) instructions](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token#creating-a-personal-access-token-classic)  
        i. be sure to set the expiration date to never and click all the boxes
        in the scopes options you want to be able to do any of those tasks with
        your token - they are crazy about security on github.  
        ii. once it is created save this long text string somewhere you can
        access when you need to make remote change to github (i.e., through
        Rstudio) - it will serve as your "password" - its confusing because you
        have a separate github account password 🙁  
    - [ssh token full instructions](https://git-scm.com/book/en/v2/Git-on-the-Server-Generating-Your-SSH-Public-Key)   
        i. open terminal  
        ii. paste the following commands into the terminal  
        `cd ~/.ssh`  
        `ssh-keygen -o`  
        hit enter when prompted for file name and passphrase  
        This creates a new open SSH key for your machine.
        iii. When you're prompted to "Enter a file in which to save the key", you can
        press Enter to accept the default file location.  
        iv. Now we need to print our ssh key to the terminal so we can copy and paste it  
        `cat ~/.ssh/id_rsa.pub`  
        that will print the ssh key to the terminal. Go ahead and highlight it
        with your mouse and copy it to your clipboard.  
        Now navigate your web-browser to: https://github.com/settings/ssh/new   
        v. Paste the key into the box called "Key" in the box title  
            - provide a name that will help you recognize the specific machine you are on.  
            - each machine you use will need a separate ssh key.  
        vi. Click the green box "Add SSH key"  

### Typical Rstudio, Git, and GitHub work flow  

Congratulations! If you've made it this far you have successfully configured
Rstudio, git, and github - no small accomplishment! Now we're ready to start
doing work with these tools in concert. Each tool has a different role:

1. git - the program that creates the versions of the data and code
2. Rstudio - provides a GUI (point and click) interface for using git (as an
   alternative to at the command line)
3. GitHub - provides a web archive of the code if your machine dies or is lost

The standard workflow that we will work though now is: 

a. create a repo on GitHub with a blank `README.md` file for a new project that you want to undertake  
b. clone (i.e., download) the repo to your local machine using Rstudio Project interface  
c. make changes to repo by adding code and data  
d. commit your changes locally  
e. push (i.e., upload) your changes to GitHub via Rstudio GUI  
f. repeat steps d and e as needed.

**Note**:  if you make any changes to the GitHub repo either on another machine or in
the web browser then you'll want to "pull" those changes down to your local 
machine you're working on before making new local changes. Failure to do this 
will result in files that are not-synced up. If you use dropbox this is called 
a conflicted copy - two versions of a file but the software isn't sure which is 
the version that is most appropriate. 

### a. Create your new repo on GitHub

Good news you just got funded to study longleaf pine forests - time to setup a new 
github repo to kick off the project. 

1. go to github.com and click "New" on the list of repositories on the left  

![new_repo](./figures/new_repo.PNG)

2. name your repo something informative like "longleaf"  

![naming_repo](./figures/naming_repo.PNG)

Be sure to click "Add a README file" - this makes things easier downstream

Click green button "Create repository"

### b. Clone your repo to your local machine

1. Now that you have created your new repo you'll need to clone it to your 
   local machine so you can start adding data and code to it.   

   Click the Green button called "<> Code"  

   What you chose next will depend on if you chose to work with personal access
   tokens or the ssh key for authentication into github.  
       i. personal access token -> "HTTPS" option  
       ii. ssh -> "SSH" option  

   Click the little window button next to the url this will "copy" that url to your
   clipboard.  

2. On your local machine open Rstudio and click:  

   File -> New Project  

   When the next window pops up chose "Version Control"  

   ![new_proj](./figures/new_proj.PNG)
 
   Then chose "Git"  

   ![new_proj2](./figures/new_proj2.PNG)

   Now paste in the url for the github repo (that you have on your clipboard)
   into the box for "Repository URL:"  

   ![proj_url](./figures/proj_url.PNG)

   Click "Create Project"

   You've just cloned your first repo! 

   You'll now notice in Rstudio you have a little tab called "Git"  

  ![git_panel](./figures/git_panel.PNG)

### c. Make changes to repo by adding code and data

Now is where we get to work. The first thing we probably want to do
is provide our project with a better description in our `README.md` file. 

Open that file in Rstudio and type a description of the project and save the file.

You will notice that in Rstudio's Git tab has changed slightly as the file
`README.md` will have a blue M next to it in the status column.  

![git_tab_explained](./figures/git_tab_explained.png)  

This is different than the "?" that accompany the .gitignore and .Rproj files.
Those files are not 'tracked' by git meaning that it does not monitor those files
for changes. These files were auto generated when you created the version control
Rstudio project. In general, best practices suggest not to track either of these
files. 

Now we can examine our changes by clicking the "Diff" button which will bring up
the following window:

![git_diff](./figures/git_diff.png)  

### d. Commit your changes to the repo 

If those changes look good then simply add a commit message in the top right.  

A few pointers on good commit messages:
* present tense
* informative - like the subject of an email 
* if detailed description of the changes is needed simply place that a few
lines after the first line of the commit message. 
* group files into different commits if they accomplish different goals. 

### e. Push your changes to GitHub

Now that we have commited a change to our repo we can "Push" these changes to 
GitHub so they show up on the internet. 

Simply click the "Push" button. If you configured "HTTPS" then you will be prompted
for your GitHub user name and your password. Note password refers to your personal
access token in this case. If you setup "SSH" then the commit should go through 
without having to do anything. 

### f. Rinse and repeat

You've mastered the basic workflow at this point so you can make new changes
to your repo. You can add data or code or more detailed description of the 
project on the `README.md` file. 

As you make changes to your files and commit those changes you will be ever 
increasing the length of the git log or history. This can be examined either
on github under commit history or in Rstudio by clicking the clock icon on the 
git tab. 

Note that it is not necessary to Push your code after every commit. Typically I 
just push changes when I'm done with a work session or just finished a task. 

### Review the Rstudio Git tab

Now is a good time to review the functionality of the buttons on the git tab in
Rstudio: 

![git_tab_explained](./figures/git_tab_explained.png)  

* "Staged" - if you click the box next to one of the files it tells git you want 
to track that file and you are preparing to "commit" that file to the repository.
* "Commit" - this take make a snapshot of all staged files at that time and log
those in git's commit history. When you click this button it will pull up the
"Diff" window where you can see the changes and log a commit message.
* "Diff" - opens a panel that displays the line-by-line differences between the 
file from the last commit and its current saved state. If you make changes to a
file but do not save the file then they will not show up in the diff panel
* "Pull" - downloads commits on GitHub to your local machine
* "Push" - uploads commits from you local machine to GitHub
* clock icon - displays the git log or history of commits along with their associated
commit messages
* gear icon - provides a few additional tools including:
    - "revert" which rolls a saved file back to its state in the last commit
    - "ignore" which allows you to tell git to never track or display certain
    files in the git tab - for example you may chose to ignore your .git and .Rproj
    files. 

### Using Git from the command line (optional material)
The above instructions walked you through how to use git using the Rstudio GUI,
and for 90% of your workflow that will be sufficient. Sometimes it will be 
necessary to use the command line (i.e., the terminal) to issue git commands.
If you want to learn how to do that please work through the SWC lesson on Git 
[Version Control with Git](http://swcarpentry.github.io/git-novice/)

In particular focus on:

* [Setting Up Git](http://swcarpentry.github.io/git-novice/02-setup/index.html)
* [Creating a Repository](http://swcarpentry.github.io/git-novice/03-create/index.html)
* [Tracking Changes](http://swcarpentry.github.io/git-novice/04-changes/index.html)
* [Exploring History](http://swcarpentry.github.io/git-novice/05-history/index.html)
* [Ignoring Things](http://swcarpentry.github.io/git-novice/06-ignore/index.html)
* [Remotes in GitHub](http://swcarpentry.github.io/git-novice/07-github/index.html)
* [Using Git from RStudio](http://swcarpentry.github.io/git-novice/14-supplemental-rstudio/index.html)

### Important Note:
If you setup an Rstudio project in a directory that was not a git directory then 
Rstudio will not recognize that it is a git directory until you create the 
Rstudio project. This is not difficult just follow the instructions for 
"Using Git from Rstudio" which is above.

## Optional text editor checks - if you will use git from the command line (less common)
### Windows Users
It is a good idea that you ensure that you have a text editor that can be run
from the terminal. Newer installs of git ship with an editor called nano
In the bash terminal type `nano` and hit Enter. 
If this does not bring up a text editor window in the terminal then you will
need to reinstall git and chose to use the nano editor for commit messages. Alternatively you can download nano directly from here: 
<http://www.nano-editor.org/dist/v2.2/NT/nano-2.2.6.zip>
Unzip the file and paste the files that have either a .exe or .dll extension
in the directory: `C:/Windows/System32/`

If none of the files appear to have a .exe file ending look for the file called
`nano` (this also indicates to me that you must have the default windows
option of hiding file extensions active - go turn it off when you get a chance).

Restart the terminal and try the command `winpty nano test.txt` If everything
is working this will create a file called `test.txt` in your working directory 
for you to edit within the terminal. 

If that still does not work not to fret you can always use the native text editor
on Windows called `notepad`. 
In the terminal simply type `notepad test.txt` to create a text file called
`test.txt` for you to edit in a GUI interface (i.e., not within the terminal window). 
Hit `Cntrl - c` at the terminal command prompt to close `notepad`. 

### Mac Users
Your OS may ship with the nano text editor. To examine if it is already 
functional on your machine. Open the terminal and type `nano` and hit Enter.
If is is not installed then I recommend you try Text wrangler: 
<http://www.barebones.com/products/textwrangler/>

### Setting up Git Instructions
<https://swcarpentry.github.io/git-novice/02-setup/>

### Additional Links
* [Happy Git and GitHub for the useR](https://happygitwithr.com/index.html)
* [Git in Rstudio by H. Whickham](https://r-pkgs.org/software-development-practices.html#sec-sw-dev-practices-git-github)

![dynamite](./figures/serious_git.png)
