cookbook-keepalived CHANGELOG
===============

## 0.4.1

  - ljblancoredborder
    - [ce1c365] rename of vip

## 0.4.0

  - nilsver
    - [98f83a5] only add disable to remove action
    - [8fbcfcf] fix lint
    - [e6a3dd6] if webui disabled, keepalived also disabled, so remove ip table rule

## 0.3.5

  - jnavarrorb
    - [cb6bb50] Remove executable permissions on non-executable files

## 0.3.4

  - Rafael Gomez
    - [af4524d] Add permissive rules for keepalived service management
    - [50d92f9] Enhance backup notification script to identify and update primary connection info based on active PostgreSQL nodes
    - [558400e] Using serf tags to pass it to rb_sync_from_master
    - [647375b] Using virtual ip as master
    - [3ea70c4] set_keepalived_permissive if postgresql vrrp is registered
    - [7f89792] Update notify posgresql without serf tags
    - [284dcaa] Deregister postgresql from node to re add it in consul
    - [eed9100] Remove master.postgresql.service from hosts deregistering virtual IP
    - [c11d0d7] do not execute notify_master_postgresql if postgres ip is not registred
    - [404d20f] rb_keepalived_master_notify_postgresql.sh is exectued each time keepalived.conf is changed
    - [e91284f] rb_sync_from_master.sh added
    - [5aa455d] Adding sync iface to internal virtual IPs insead of management
    - [e661c73] Update notify_postgresql.erb
    - 
  - David Vanhoucke
    - [eda657d] fix trigger file
    
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
