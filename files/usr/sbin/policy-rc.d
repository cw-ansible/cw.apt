#!/bin/sh

# Copyright © 2016 Sébastien Gross <seb•ɑƬ•chezwam•ɖɵʈ•org>
#
# Created: 2016-02-01
# Last changed: 2016-02-01 12:34:07
#
# This program is free software. It comes without any warranty, to
# the extent permitted by applicable law. You can redistribute it
# and/or modify it under the terms of the Do What The Fuck You Want
# To Public License, Version 2, as published by Sam Hocevar. See
# http://sam.zoy.org/wtfpl/COPYING for more details.

# Prevent services from beeing started inside a chroot environment.

is_chroot() {
    id=$(id -u)
    if test $id -ne 0; then
	exit 101
    fi
    root_dev=$(stat  --format '%d' /)
    root_inode=$(stat  --format '%i' /)
    proc_dev=$(stat  --format '%d' /proc/1/root)
    proc_inode=$(stat  --format '%i' /proc/1/root)

    if test $root_dev -eq $proc_dev -a test $root_inode -eq $proc_inode; then
	exit 101
    fi
}

if test -e /usr/bin/ischroot; then
    /usr/bin/ischroot && exit 101
else
    is_chroot && exit 101
fi

exit 0
