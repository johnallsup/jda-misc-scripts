#!/bin/bash

# Copyright John Allsup 2015
# Released under the GNU General Public License v3
# See file LICENSE

# Find ip address of any running vm and try to ssh to it.

A="$(arp -n | grep virbr | cut -f1 -d\ )"
if [ -n "$A" ]; then
ssh "$A"
else
echo Cannot find vm
fi
