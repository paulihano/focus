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

focus -p x-terminal-emulator terminator
* The -p allows the program to have another name.
* terminator may my declared terminal I use, but managers start it via x-terminal-emumator.

focus -p thunderbird-default thunderbird
* This will rotate every window opened by thunderbird.

focus -c 2 -p x-terminal-emulator terminator
* The -c indicates that 2 instanes of such windows may be open.
* If the only matching window is currently focused, then 'terminator' is executed again to create another window like it.

focus -w "debian.ods - LibreOffice Calc" libreoffice /0/debian.ods
* This causes the next window whose title contains 'debian.ods - LibreOffice Calc' to be focused.
* If no such window exists, then 'libreoffice /0/debian.ods' is bash executed (window opens such a window).

focus -c 0 -p "(feh|ffplay|mupdf|evince|totem)"
* This argument manner is for opening windows created via terminal commands.
* The window search is always an extended expression.
* This causes the next window whose process name matches feh or ffplay or mupdf or evince or totem to be focused.
* The lack of a command and the -c 0 both eliminate the execution of any command if such a window does not exist.

focus -v my-program
* The -v causes window information to be output so that you can determine what you might need tor -p and -w.

# @see code for more information

Note: x, which starts up emacs (has nothing to do with x11), is also included because I found emacsclient to be so difficult that I created x which uses focus, not the other way around.

# Please report bugs.
# Only tested with openbox.

