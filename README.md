Description
===================
Installs latest stable builds of [osquery](http://osquery.io) provided from [Facebook](http://osquery.io/downloads/).

Requirements
===================
Currently this cookbook only supports CentOS {6,7} and Ubuntu {'12.04','14.04'} and requires the apt cookbook for installation on Ubuntu.

Issues
===================
Currently daemonization via an init script is only functional on CentOS 6. I know total bummer right? But hey its open source, so please send me a pull request with a better approach on how to do this and I'll happily oblige.

Roadmap
===================
Fixing daemonization of the osquery service would be greaaattt....
