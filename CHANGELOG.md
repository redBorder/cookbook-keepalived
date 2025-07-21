cookbook-keepalived CHANGELOG
===============

## 0.3.4

  - Luis Blanco
    - [5a15f03] Merge pull request #5 from redBorder/feature/#18850_add_internal_virtual_ips
  - Rafael Gomez
    - [be84837] Merge branch 'master' into feature/#18850_add_internal_virtual_ips
    - [5c49410] Merge branch 'master' into feature/#18850_add_internal_virtual_ips
    - [f0d3b2a] Revert changes
    - [18c92f3] Restore PostgreSQL notification scripts in keepalived configuration
    - [af4524d] Add permissive rules for keepalived service management
    - [ae97965] Merge branch 'master' into feature/#18850_add_internal_virtual_ips
    - [cd37190] Refactor backup notification script to streamline primary connection info update process
    - [50d92f9] Enhance backup notification script to identify and update primary connection info based on active PostgreSQL nodes
    - [c94d7e4] Refactor PostgreSQL promotion scripts to use virtual IPs
    - [e76d713] Merge branch 'master' into feature/#18850_add_internal_virtual_ips
    - [558400e] Using serf tags to pass it to rb_sync_from_master
    - [34b80d0] Merge branch 'master' into feature/#18850_add_internal_virtual_ips
    - [647375b] Using virtual ip as master
    - [82f5947] Fix linter
    - [44fae98] Changing order of Cleaning tmp files fix.
    - [3ea70c4] set_keepalived_permissive if postgresql vrrp is registered
    - [d37a58b] Remove setenforce
    - [8d10a18] Cleaning tmp file and save logs of rb_sync_from_master in tmp file
    - [dc09b5d] First stable version
    - [042d464] Remove script execution
    - [1ed16c0] Add logger file
    - [7f89792] Update notify posgresql without serf tags
    - [284dcaa] Deregister postgresql from node to re add it in consul
    - [5541261] Fix linter
    - [eed9100] Remove master.postgresql.service from hosts deregistering virtual IP
    - [ee6d44c] Merge branch 'master' into feature/#18850_add_internal_virtual_ips
    - [3b4da15] Fix linter
    - [c11d0d7] do not execute notify_master_postgresql if postgres ip is not registred
    - [404d20f] rb_keepalived_master_notify_postgresql.sh is exectued each time keepalived.conf is changed
    - [e91284f] rb_sync_from_master.sh added
    - [f149f94] Uploading postgres notify template
    - [e49afd5] There is no need to pass iface_sync
    - [243eb0f] Adding iface_sync
    - [5aa455d] Adding sync iface to internal virtual IPs insead of management
    - [27ab0b8] Fixing if service is webui add notify master and backup
  - David Vanhoucke
    - [eda657d] fix trigger file
  - Rafa Gómez
    - [c78ddbb] Keeping same priority. Executing scripts in all nodes :)
    - [6eb997a] Do not pass master_node to master script
    - [a7252aa] Directly accessing array elements
    - [9d54894] Spliting scripts
    - [7bc354d] Keepalived wont remove posgresql from etc hots
    - [e661c73] Update notify_postgresql.erb

## 0.3.3

  - nilsver
    - [5b91dc2] remove flush cache

## 0.3.2

  - Miguel Negrón
    - [59f224a] Merge pull request #12 from redBorder/bugfix/#20932_remove_netaddr
    - [6de3041] Remove NetAddr dependency

## 0.3.1

  - Miguel Negrón
    - [0aeeb4b] add notify master/backup script for sfacctd

## 0.3.0

  - Rafael Gomez
    - [54e7acd] Remove user login permissions to user keepalived

## 0.2.1

  - nilsver
    - [f0f1604] track sync interface fix

## 0.2.0

  - Miguel Negron
    - [9c39609] notify webui only for webui service

## 0.1.1

  - Miguel Negrón
    - [2cabb15] Add pre and postun to clean the cookbook

## 0.1.0

  - David Vanhoucke
    - [cfd2c8a] trigger notify scripts to add or remove iptables rules

## 0.0.2

  - Miguel Negrón
    - [09d3ee9] add keepalived logs
    - [0bb11e1] Update rpm.yml
    - [e95a3aa] Update README

This file is used to list changes made in each version of the ntp cookbook.

0.0.1
-----
- [David Vanhoucke dvanhoucke@redborder.com]
  - COMMIT_REF Initial release of cookbook keepalived

- - -
Check the [Markdown Syntax Guide](http://daringfireball.net/projects/markdown/syntax) for help with Markdown.

The [Github Flavored Markdown page](http://github.github.com/github-flavored-markdown/) describes the differences between markdown on github and standard markdown.
