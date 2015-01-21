Introduction to Git
-------------------

Dan McGlinn
01/16/2015

The purpose of this lesson is to get students exposed to using Git and GitHub
from the command line and within R studio

Git is a version control system that allows you to track changes to your data
and source code as you develop quantiative projects. 

### Install Git

* Follow the instructions here: https://help.github.com/articles/set-up-git/

> ### Windows Users
> It is a good idea that you ensure that you ahve a text editor that can be run
> from the terminal. Newer installs of git ship with an editor called nano
> In the bash terminal type `nano` and hit Enter. 
> If this does not bring up a text editor window in the terminal then you will
> need to install nano manually. 
> Download the program from here: 
> http://www.nano-editor.org/dist/v2.2/NT/nano-2.2.6.zip
> Unzip the file and paste the files that have either a .exe or .dll extension
> in the directory: C:/Windows/System/
> Now try to call nano from the terminal, it should work.

### Version control with Git
We will work through one of the SWC lesson's on Git
[A Better Kind of Backup](http://software-carpentry.org/v5/novice/git/01-backup.html)

This lesson will introduce us to the basics of using Git locally. 

### Rstudio and Git
Rstudio provides a simple (but not very powerful) client for using Git to manage
your projects. Note that Rstudio is not required to use Git, but it is very 
convient for 90% of the tasks you will be confronted with. To set this up you
will have to be using an Rstudio Project. 

#### Create an Rstudio Project
To create a Project in the `planets` directory (which we created in the lesson
above) follow these steps:

1. Click File > New Project
2. Chose from "Existing Directory"
3. Navigate to the `planets` directory and click on it.

#### Configure Git within Rstudio
You must tell Rstudio where to find Git on your system so that it can be
integrated into your workflow. Follow these steps

1. Click Tools > Global Options
2. Click Git/SVN 
3. Find the box labled "Git executabile" and browse to the directory on your
machine where this file is located. On my windows machine this is 
`C:\Program Files (x86)\Git\bin`

### Important Note:
If setup an Rstudio project in a directory that was not a git directory then 
Rstudio will not recognize that it is a git directory until you recreate the 
Rstudio project. This is not difficult just follow the instructions for 
"Create and Rstudio Project" which is above.

### 

### Additional Links
* https://stat545-ubc.github.io/git01_git-install.html#but-first-why
