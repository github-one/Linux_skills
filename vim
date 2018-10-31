
Configuration:
    :version            # get vimrc file location besides vim version information
    :echo $HOME         # get current work directory
    :echo $VIM          # get the vim binary name
    :echo @%            # get current file name which you're editting on

Color scheme:
    :color              # view current color scheme
    :hi                 # list all color groups
    :hi Statement       # view color definations for Statement.
    
    To get the list of installed color schemes
    Type :colorscheme then press "Space" followed by "Tab" 
    Type :colorscheme then press "Space" followed by "Ctrl-d"

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
    
    :set splitbelow     # open new split panes to bottom, which feels more natural than Vim's default
    :set splitright
    
Marks & Jumps
    Two types of mark jumps, bactick(`<mark>) and single quote('<mark>).
    Three types of mark: 
        lowercase marks,    set for a single file
        uppercase maskes,   set for multiple files
        numbered marks,     revserved for vim
    
    mx          # add a mark called x
    `x          # return to the line and column for mark x
    'x          # return to the beginning of the line where marks x is set
    `.          # move the cursor to the line and column where the last edit was make    
    '.          # move the cursor to the line where the last edit was make
    '"          # move the cursor to the las position for the cursor when you exited the previous session(file)
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
    :ls

Tabs
    :tabnew
    :tabedit <filename>
    gt      # go to the next tab
    gT      # go to he previous tab
    Ctrl +w T       # break the current window to a new tab
    
Windows
    File operations
    :new            # open a file above the current window
    :vnew           # open a file beside the current window
    :sp filename
    :vsp filename
    
    Window operations
    :30vs           # split the viewport, making the new window 30 characters wide.
    Ctrl + ws       # split window
    Ctrl + ww       # switch widnows
    Ctrl + wq       # quit the window
    Ctrl + wv       # split the window vertically
    
    Switch operations
    Ctrl +w h,j,k,l
    Ctrl +w r           switch two windows but keep the window layout the same
    Ctrl +w w           move the cursor between the two windows/buffers
    
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
