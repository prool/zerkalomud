#!/bin/sh
#
# MUNIN plugin. Zerkalo MUD. memory
# by prool
# <proolix@gmail.com>
# www.prool.kharkov.org    mud.kharkov.org
# GPL v.3
#

if [ "$1" = "config" ]; then
    echo 'graph_title Zerkalo MUD memory'
    echo 'graph_vlabel bytes'
    echo 'graph_noscale true'
    echo 'graph_category MUD'
    echo 'graph_info Zerkalo MUD memory'
    echo 'rmem.label Real memory'
    echo 'vmem.label Virtual memory'
#    echo 'objs.colour COLOUR7'
    exit 0
fi

ps aux | grep "bin/circle.zerkalo" | grep -v grep | awk '{print "vmem.value " $5}'
ps aux | grep "bin/circle.zerkalo" | grep -v grep | awk '{print "rmem.value " $6}'
