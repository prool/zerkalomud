#!/bin/sh
#
# MUNIN plugin for Zerkalo MUD uptime
# by prool
# <proolix@gmail.com>
# www.prool.kharkov.org    mud.kharkov.org
# GPL v.3
#

if [ "$1" = "config" ]; then
    echo 'graph_title ZZ) Zerkalo MUD uptime'
    echo 'graph_vlabel days'
    echo 'graph_noscale true'
    echo 'graph_category MUD'
    echo 'graph_info Zerkalo MUD uptime'
    echo 'vup.label Zerkalo MUD uptime'
    echo 'vup.draw AREA'
    echo 'vup.colour COLOUR7'
#    echo 'objs.label VMUD objs'
    exit 0
fi

date >> /var/log/munin/prool-munin.log
echo "munin mud plugin start" >> /var/log/munin/prool-munin.log
cat /var/www/zerkalo.kharkov.org/who.html | grep "MUD server uptime" | awk '{print "vup.value " $4}'
