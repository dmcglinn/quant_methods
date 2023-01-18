---
layout: page
title: Introduction to Git
---

The purpose of this lesson to start using Git and GitHub from the command line
and within R studio.

To complete the GitHub portion of this lesson you will need to create a 
GitHub user account. 

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

## Text editor checks
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


#### Configure Git within Rstudio 
For most Rstudio will automatically figure out where git is located, but for
others you will need to do this manually. Follow these steps

1. Click Tools > Global Options
2. Click Git/SVN 
3. Find the box labled "Git executabile" and browse to the directory on your
machine where this file is located. On my windows machine this is 
`C:\Program Files (x86)\Git\bin`

### Version control with Git
We will work through the SWC lesson's on Git
[Version Control with Git](http://swcarpentry.github.io/git-novice/)

In particular we will focus on:

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

### Additional Links
* [Motivation to learn Git](https://stat545-ubc.github.io/git01_git-install.html#but-first-why)
* [Git in Rstudio walkthrough by H. Whickham](http://r-pkgs.had.co.nz/git.html)

![dynamite](./figures/serious_git.png)
