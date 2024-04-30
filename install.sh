#!/bin/bash
#
# [Release]: SnoopGod 24.04.1 LTS amd64
# [Website]: https://snoopgod.com/releases/?ver=24.04.1
# [License]: http://www.gnu.org/licenses/gpl-3.0.html

## ------------------- ##
## PREPARE ENVIRONMENT ##
## ------------------- ##

## Clear screen
## ------------
function clearscreen()
{
	clear
	sleep 2s
}

## Move to `tmp` directory
## -----------------------
function changedir()
{
	cd /tmp/
}

## Configure environment
## ---------------------
function configenv()
{
	export PYTHONWARNINGS=ignore
	mkdir -p /tmp/snoopgod/
}

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
	cp -r /tmp/snoopgod/menus/.config/menus /etc/skel/.config/
}

## Copy local folder
## -----------------
function copylocal()
{
	# Create Skeleton local folder if not exists
	mkdir -p /etc/skel/.local
	cp -r /tmp/snoopgod/menus/.local/share /etc/skel/.local/
}

## --------------- ##
## CLEAN-UP SYSTEM ##
## --------------- ##

## Clean `root` directory
## ----------------------
function cleanroot()
{
	rm -rf /root/.cache
	rm -rf /root/.config
	rm -rf /root/.git
	rm -rf /root/.local
	rm -rf /root/.ssh
	rm -rf /root/.wget-hsts
}

## Clean `tmp` directory
## ---------------------
function cleantmp()
{
	rm -rf /tmp/*
}

## Clean `bash` history
## --------------------
function cleanbash()
{
	rm -f ~/.bash_history
	rm -f /root/.bash_history
	history -c && history -w
}

## Terminate
## ---------
function terminate()
{
	echo "Process completed"
	sleep 1s
}

## -------------- ##
## EXECUTE SCRIPT ##
## -------------- ##

## Launch
## ------
function launch()
{
    # Retrieve current datetime
	flushtime=`date +%s.%N`

	# Execute Actions
	clearscreen
	changedir
	configenv
	clonerepo
	copyconfig
	copylocal
	cleanroot
	cleantmp
	cleanbash

	# Terminate
	terminate

	# Return notice
	endtime=`date +%s.%N`
	runtime=$( echo "$endtime - $flushtime" | bc -l )
	echo "Executed within ${runtime} seconds"
}

## -------- ##
## CALLBACK ##
## -------- ##

launch
