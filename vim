
Buffers
    :bn
    :bprev
    :b2
    
Regex
    \w\W\a\s\<\d\D\p\_s\S\x   # vim \s is different with Perl \s
        
    
Format
    :set texwitdth = 120
    :set tw = 120
    :set lines =24 coloumns=80
    :set number
    :set nonumber
    :set nu!
    :set nonu!
    
    :syntax on
    :syntax off
    :set cursorline
    
    :set expandtab      # to insert space characters whenever the tab key is pressed
    :set tabstop = 4  
    :retab              # to change all the existing tab characters to match the current tab settings
    :set aoutoindent
       
    
Configuration:
    :version
    :echo $HOME
    :echo $VIM
    
    :echo @%   # get current file name
   
Shell command for vim
    set -o emacs
    set -o vim
    # When you enter a line in vim mode, you are already placed in "insertion" mode, press ESC switches into "command" mode.
    # Move to previous hsitroy line with 'k' and subsequent line with 'j', and so forth in "command" mode.
    
