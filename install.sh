#!/bin/bash
#
# [Release]: SnoopGod 24.04.2 LTS amd64
# [Website]: https://snoopgod.com/releases/?ver=24.04.2
# [License]: http://www.gnu.org/licenses/gpl-3.0.html

## ------------- ##
## INSTALL MENUS ##
## ------------- ##

## Clone repository
## ----------------
function clonerepo()
{
	# Clone the menus repository
	git clone https://github.com/snoopgodlinux/menus /tmp/snoopgod/menus
}

## Copy config folder
## ------------------
function copyconfig()
{
	# Create Skeleton config folder if not exists
	mkdir -p /etc/skel/.config
	cp -r /tmp/snoopgod/menus/etc/skel/.config/menus /etc/skel/.config/
}

## Copy local folder
## -----------------
function copylocal()
{
	# Create Skeleton local folder if not exists
	mkdir -p /etc/skel/.local
	cp -r /tmp/snoopgod/menus/etc/skel/.local/share /etc/skel/.local/
}

## -------------- ##
## EXECUTE SCRIPT ##
## -------------- ##

## Launch
## ------
function launch()
{
	# Execute Actions
	clonerepo
	copyconfig
	copylocal
}

## -------- ##
## CALLBACK ##
## -------- ##

launch
