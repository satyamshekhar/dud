dud
===

Dud is emacs configuration for dummy's. It's meant to expose the
power of emacs without much configuration and at the same time
adhereing to emacs philosophy of customization.

Tested on emacs 24, ubuntu 13.04.

This configuration is very nascent but I plan to keep developing
this as and when I need things. You can try using this if you like
and I will help incase anything breaks.

Shortcuts
=========
All global shortcuts are defined in <project-root>/src/dud-key-bindings.el.
Mode level shorcuts are defined in <project-root>/modes/<mode>.el

    > C-+ - Increase text size
    > C-- - Decrease text size
    > C-) - Reset text size.

    > F12 - Hide/Show menu bar.
    > F11 - Toggle fullscreen.

    > Shift-<up arrow>    - move to window up.
    > Shift-<down arrow>  - move to window down.
    > Shift-<left arrow>  - move to window left.
    > Shift-<right arrow> - move to window right.

Configured packages
===================

No packages will be enforced. You can choose to install or not install
these packages by modifying the dud-packages-list variable defined in
<project-root>/dud.el.

1. dud-cpp-mode - Follows google-style cpp formatting.
2. dud-protobuf-mode - Configures major mode for editing protbufs.

Planned packages
================
3. dud-js2-mode   - Enables js2-mode by mooz. Enable other featurs
4. ido            - Fast buffer switching.
5. flyspell       - spell checker.
6. thesaures      - .
7. ack            - better grep.
8. ace-jump-mode  - faster navigation.
9. buffer-move    - easier to move buffer around.
10. escreen       - screen integration into emacs.
11. cscope        -
12. ecb           - code browser.
13. cedet         - collection of emacs development tools.
14. magit         - git integration.
15. autocomplete  - better autocomplete.
16. hippie-expand - better name expansion.
17. flymake       - detects compilation errors.
18. helm

Planned custom functions
========================
previous-buffer/next-buffer - Similar to browser history.
rename-buffer-and-file
delete-buffer-and-file

Installation
============

1. Create .emacs.d directory if not already present.

    > mkdir ~/.emacs.d

2. Clone the repository.

    > git clone git://github.com/satyamshekhar/dud.git ~/.emacs.d/dud

3. Add the following line to your .emacs file or (init.el in .emacs.d)

    <code> (load "~/.emacs.d/dud/dud.el") </code>
