
--------------------------------------------------------------------------------------------------------
Q: How to permanently export a variable in Linux?
A1:
add export commands to your .bashrc or .profile. 
The variables set in $HOME/.profile are active for the current user, the ones in /etc/profile are global. 
The .bashrc is pulled on each bash session start.

A2:
You can add it to your shell configuration file, e.g. $HOME/.bashrc or more globally in /etc/environment.
After adding these lines the changes won't reflect instantly in GUI based system's you have to 
exit the terminal or create a new one and in server logout the session and login to reflect these changes.

A3:
You have to edit three files to set a permanent environment variable as follow:

~/.bashrc
When you open any terminal window this file will be run. Therefore, if you wish to have a permanent 
environment variable in all of your terminal windows you have to add the following line at the end 
of this file:
export DISPLAY=0

~/.profile
Same as bashrc you have to put the mentioned command line at the end of this file to have your environment 
variable in every login of your OS.

/etc/environment
If you want your environment variable in every window or application (not just terminal window) you have to 
edit this file. Add the following command at the end of this file:
DISPLAY=0
Note that in this file you do not have to write export command

Normally you have to restart your computer to apply these changes. But you can apply changes in bashrc 
and profile by these commands:
$ source ~/.bashrc
$ source ~/.profile

But for /etc/environment you have no choice but restarting (as far as I know)

A4:
Ordinarily, you'd put your "export" line into whatever shell startup file is appropriate: 
.profile, .bash_profile, .zprofile, whatever, in your $HOME directory.

If you want to make it permanent for every user, the various shells usually have system-wide config 
files in /etc/: /etc/profile exists on this linux box, but do read the man page to figure out 
which user-specific and which system-wide file to put it in.

A5:
The file $HOME/.profile is used by a number of shells, including bash, sh, dash, and possibly others.
csh and tcsh explicitly don't look at ~/.profile but those shells are kinda antiquated.

When bash is invoked as an interactive login shell, ... it first reads and executes commands from the file 
/etc/profile, if that file exists. After reading that file, it looks for ~/.bash_profile, ~/.bash_login, 
and ~/.profile, in that order, and reads and executes commands from the first one that exists and is readable.

A6:
There is no common file, but you can make every shell read from a common file.
bash reads from .bash_profile or .bashrc
zsh reads from .zprofile and .zshrc
ksh reads from .profile or $ENV
