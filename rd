#!/bin/bash

# Copyright John Allsup 2015
# Released under the GNU General Public License v3
# See file LICENSE

#
# Display list of recent (last 24hrs) downloads

if [ -z "$RDIR" ]; then
    RDIR="$HOME/Downloads"
fi
find "$RDIR" -ctime -1 "$@"
