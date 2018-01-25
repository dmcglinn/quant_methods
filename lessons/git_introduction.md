---
layout: page
title: Introduction to Git
---

The purpose of this lesson to start using Git and GitHub from the command line
and within R studio.

To complete the GitHub portion of this lesson you will need to create a 
GitHub user account. If you are a student or teacher make sure to check out their
education account options which offer free private repos: 
<https://education.github.com/>

Git is a version control system that allows you to track changes to your data
and source code as you develop quantiative projects. 

We will follow the Git and Github section from Hadley Wickham's book *R packages* 
which contains a very useful overview and step-by-step description of git and
how it can be used with Rstudio. This material can be freely accessed here:
<http://r-pkgs.had.co.nz/git.html> I have also put together some slides on 
motivation to learn and how to use git here: [git_slides.pdf](./lessons/git_slides.pdf) 

### Install Git

* Download Git for your OS here: 
<https://git-scm.com/download>

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
https://swcarpentry.github.io/git-novice/02-setup/


#### Configure Git within Rstudio 
For most Rstudio will automatically figure out where git is located, but for others you will need to do this manually. Follow these steps

1. Click Tools > Global Options
2. Click Git/SVN 
3. Find the box labled "Git executabile" and browse to the directory on your
machine where this file is located. On my windows machine this is 
`C:\Program Files (x86)\Git\bin`


### Version control with Git
We will work through one of the SWC lesson's on Git
[Version Control with Git](http://swcarpentry.github.io/git-novice/)

This lesson will introduce us to the basics of using Git locally. However we want to back up our local git repo to the cloud and we will use GitHub to host our git repo. Therefore, first sign in to Github and create a repo called `planets` with a `README.md` file. We are creating this directory remotely first because it is very easy to link a local instance of Rstudio and a repo on GitHub if the repo exists on GitHub first. 

### Rstudio and Git
Rstudio provides a simple (but not very powerful) client for using Git to manage
your projects. Note that Rstudio is not required to use Git, but it is very 
convient for 90% of the tasks you will be confronted with. To set this up you
will have to be using an Rstudio Project. 

#### Create an Rstudio Project
To link the remote repo to your local machine follow these steps:

1. Click File > New Project
2. Chose from "Version Control"
3. Chose Git
4. Input the repo's url, something like: https://github.com/yourusername/planets.git


### Important Note:
If setup an Rstudio project in a directory that was not a git directory then 
Rstudio will not recognize that it is a git directory until you recreate the 
Rstudio project. This is not difficult just follow the instructions for 
"Create and Rstudio Project" which is above.

### Additional Links
* <https://stat545-ubc.github.io/git01_git-install.html#but-first-why>

![dynamite](../figures/serious_git.png)
