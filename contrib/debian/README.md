
Debian
====================
This directory contains files used to package mulecoind/mulecoin-qt
for Debian-based Linux systems. If you compile mulecoind/mulecoin-qt yourself, there are some useful files here.

## mulecoin: URI support ##


mulecoin-qt.desktop  (Gnome / Open Desktop)
To install:

	sudo desktop-file-install mulecoin-qt.desktop
	sudo update-desktop-database

If you build yourself, you will either need to modify the paths in
the .desktop file or copy or symlink your mulecoin-qt binary to `/usr/bin`
and the `../../share/pixmaps/mulecoin128.png` to `/usr/share/pixmaps`

mulecoin-qt.protocol (KDE)

