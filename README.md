<!--

---
lang: american
---
-->

[![Build Status](https://travis-ci.org/cw-ansible/cw.apt.svg?branch=master)](https://travis-ci.org/cw-ansible/cw.apt)
[![Tweet this](http://img.shields.io/badge/%20-Tweet-00aced.svg)](https://twitter.com/intent/tweet?tw_p=tweetbutton&via=renard_0&url=https%3A%2F%2Fgithub.com%2Fcw-ansible%2Fcw.apt&text=Configure%20%23APT%20on%20%23Debian%20and%20%23Ubuntu%20using%20%23ansible.)
[![Follow me on twitter](http://img.shields.io/badge/Twitter-Follow-00aced.svg)](https://twitter.com/intent/follow?region=follow_link&screen_name=renard_0&tw_p=followbutton)


# APT

Configure APT system.


## Usage

Include the `cw.apt` module to your playbook.

## Description

Add 2 configuration files for the *apt* system in `/etc/apt/apt.conf.d`:
- `02autoinstall`: disable installation of recommended and suggested
  packages.
- `03fix-partitions`: run `before_install` and `after_install` scripts
  before and after apt invocation.

Install `before_install` and `after_install` scripts in `etc/apt/scripts`
which make sure that both `/tmp` and `/usr` are mount in read-write and exec
modes before *apt* is run and remount these partitions in their nominal mode
as found in `/etc/fstab`. If neither `/tmp` nor `/usr` are not on specific
partition, these scripts do nothing.

## Configuration

See specific documentation in `defaults/main.yml`



## Copyright

Author: Sébastien Gross `<seb•ɑƬ•chezwam•ɖɵʈ•org>` [@renard_0](https://twitter.com/renard_0)

License: WTFPL, grab your copy here: http://www.wtfpl.net
