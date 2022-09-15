# focus (: simplistc user joy :)
Very small window switcher and program starter written in bash.

## focus should be the most used program by any keyboard user.

* focus eliminates need to activate programs or choose windows via a desktop.
* focus goes staright to an exising window via the window manager or executing a command.
* focus greatly reduces the need for window-manager next-window (usually Alt-Tab)
* focus commands are meant for keyboard assignment in your window manager.

## Cycles existing matching windows and/or executes program to create matching window.

## Examples:

focus font-manager
* This single argument causes the next window opened by font-manager to become the focused window.
* If no such window exists, then font-manager is executed (which opens such a window).

focus -n x-terminal-emulator terminator
* The -n allows the program to have another name.
* Windows opened by managers via x-terminal-emumator are named x-terminal-emumator.

focus -n thunderbird-default -m mail thunderbird
* thunderbird claims its windows are opened by thunderbird-default.
* thunderbird can have many windows open, but if the window named mail (the main window) is closed, -m causes it to be reopened via the command when looking for another thunderbird window.
* Use -v to see what the options must be.

focus -n Firefox-esr firefox-esr
* The extended regular expressions are case sensitive

focus -c 2 -n Firefox-esr -n x-www-browser firefox-esr
* The -c 2 indicates that 2 instanes of such windows may be opened via the command.
* If the only matching window is currently focused, then 'firefox-esr' is executed again to create another window like it.

focus -t "debian.ods - LibreOffice Calc" libreoffice /0/debian.ods
* This causes the next window whose title is 'debian.ods - LibreOffice Calc' to be focused.
* If no such window exists, then 'libreoffice /0/debian.ods' is bash executed (opens the window).

focus -c 0 -n "(feh|ffplay|mupdf|evince|totem)"
* These arguments open windows created via many terminal commands.
* The window search is always an extended expression.
* This causes the next window whose process name matches feh or ffplay or mupdf or evince or totem to be focused.
* The lack of a command and the -c 0 both eliminate the execution of any command if such a window does not exist.

focus -v
* The -v causes window information to be output so that you can determine what you might need tor -t and -n.

# @see code for more information

Note: x, which I use to start up emacs (has nothing to do with x11), is also included because I found emacsclient to be so difficult that I created x which uses focus, not the other way around.

# Please report bugs.
# Only tested with openbox.

