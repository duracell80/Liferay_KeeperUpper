# Liferay_KeeperUpper
Can never keep up with weekly releases? Me neither. Scripts to keep a local hypersonic copy of Liferay 7.4 up-to-date! Maybe?! Windows version coming later

https://learn.liferay.com/dxp/latest/en/installation-and-upgrades/maintaining-a-liferay-installation/updating-liferay.html#updating-to-a-new-liferay-tomcat-bundle

# Requirements / Tested on
So far:
- Linux (Debian Deriv)
- Java
- Wget

# Setup
```
$ cd ~/
$ git clone https://github.com/duracell80/Liferay_KeeperUpper.git
$ mv Liferay_KeeperUpper liferay & cd liferay
$ ./lfr-get.sh
```

# Update
```
$ cd ~/liferay
$ ./liferay_dxp/tomcat/bin/shutdown.sh
$ ./lfr-update.sh
$ ./liferay_dxp/tomcat/bin/startup.sh
```
