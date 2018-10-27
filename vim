
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
       
    :set wrap           # to enable "visual" wrapping
    :set nowarp
    :set textwidth=0 wrapmargin=0           # to turn off physical line wrapping, i.e. automatic insertion of newlines
    :verbose set textwidth? wrapmargin?     # to check the current values
    
Configuration:
    :version
    :echo $HOME
    :echo $VIM
    
    :echo @%   # get current file name
    
Marks & Jumps
    :marks
    :marks aA
    :delm aAbB
    :jumps

   
Shell command for vim
    set -o emacs
    set -o vim
    # When you enter a line in vim mode, you are already placed in "insertion" mode, press ESC switches into "command" mode.
    # Move to previous hsitroy line with 'k' and subsequent line with 'j', and so forth in "command" mode.
    
Buffers
    :bn
    :bprev
    :b2
    
Windows
    File operations
    :sp filename
    :vsp filename
    
    Window operations
    :30vs           # split the viewport, making the new window 30 characters wide.
    Ctrl + ws       # split window
    Ctrl + ww       # switch widnows
    Ctrl + wq       # quit the window
    Ctrl + wv       # split the window vertically
    
    Resize operations
    :resize 60
    :res +5
    :res -5
    :vertical resize 80
    :vertical resize +5
    :vertical resize -5
    Ctrl-w +        # reisze the height of the current window by a sinle row.
    Ctrl-w -        # reisze the height of the current window by a sinle row.
    Ctrl-w 10+      # increase the window size by 10 lines
    Ctrl-w >        # resize the width of the current window by a single column.
    Ctrl-w <        # resize the width of the current window by a single column.
    Ctrl-w =        # resize all windows to equal demensions based on their splits
    Ctrl-w _        # increase a window its maximum height
    Ctrl-w |        # increase a window its maximum width
    
    
Regex
    \w\W\a\s\<\d\D\p\_s\S\x   # vim \s is different with Perl \s
