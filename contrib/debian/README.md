
Debian
====================
This directory contains files used to package bitcoinnoomyd/bitcoinnoomy-qt
for Debian-based Linux systems. If you compile bitcoinnoomyd/bitcoinnoomy-qt yourself, there are some useful files here.

## bitcoinnoomy: URI support ##


bitcoinnoomy-qt.desktop  (Gnome / Open Desktop)
To install:

	sudo desktop-file-install bitcoinnoomy-qt.desktop
	sudo update-desktop-database

If you build yourself, you will either need to modify the paths in
the .desktop file or copy or symlink your bitcoinnoomy-qt binary to `/usr/bin`
and the `../../share/pixmaps/bitcoinnoomy128.png` to `/usr/share/pixmaps`

bitcoinnoomy-qt.protocol (KDE)

