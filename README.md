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
All global shortcuts are defined in \<project-root\>/src/dud-key-bindings.el.
Mode level shorcuts are defined in \<project-root\>/modes/\<mode\>.el

    > C-+ - Increase text size
    > C-- - Decrease text size
    > C-) - Reset text size.

    > F12 - Hide/Show menu bar.
    > F11 - Toggle fullscreen.

    > Shift-<up arrow>    - move to window up.
    > Shift-<down arrow>  - move to window down.
    > Shift-<left arrow>  - move to window left.
    > Shift-<right arrow> - move to window right.

    > F5 - In cpp mode, rotates among .h .cpp and _test.cpp files.

Dependencies
============
1. el-get - Dud installs el-get if it is not already present.
   It uses el-get for package management because of its simplicity
   and power. User can install packages using el-get. Dud won't interfere there.
   but won't provide any customizations on those packages as well. Packages
   installed using el-get are installed in \<project_root\>/packages. el-get
   itself is installed in \<project_root\>/packages/el-get.
   > Note: In case el-get was already installed dud will override the install
     path of packages to the paths mentioned above. Refer to src/dud-packages.el
     for more details.

2. autoconf (build-essentials) [sudo apt-get install autoconf]
3. texlive [sudo apt-get install texlive]
4. ack-grep [sudo apt-get install ack-grep &&
             sudo dpkg-divert --local --divert /usr/bin/ack --rename --add /usr/bin/ack-grep]
5. aspell [sudo apt-get install aspell]
Configured packages
===================

No packages will be enforced. You can choose to install or not install
these packages by modifying the dud-packages-list variable defined in
\<project-root\>/dud.el.

1. dud-cpp-mode - Follows google-style cpp formatting.
2. dud-protobuf-mode - Configures major mode for editing protbufs.
3. ido-flx           - Fast buffer switching.
4. ido-ubiquitous    - Enable ido everywhere.
5. perspective       - workspace switcher.
6. ace-jump-mode
7. ack-and-a-half
8. dud-js-mode   - Enables js2-mode by mooz. Enable other featurs

Planned packages
================
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
1. previous-buffer/next-buffer - Similar to browser history.
2. rename-buffer-and-file
3. delete-buffer-and-file

Installation
============

1. Create .emacs.d directory if not already present.

    > mkdir ~/.emacs.d

2. Clone the repository.

    > git clone git://github.com/satyamshekhar/dud.git ~/.emacs.d/dud

3. Add the following line to your .emacs file or (init.el in .emacs.d)

    <code> (load "~/.emacs.d/dud/dud.el") </code>
