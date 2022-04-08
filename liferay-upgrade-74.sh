#!/bin/bash
# Supply the version to upgrade to as the first argument eg 20 or get from git

if [ $# -eq 0 ]; then
    read -p "Which version? (type 20 for GA20): " VERSION
else
	VERSION=$1
fi

cd ~/liferay
echo "[i] Shutting Down DXP"
./liferay_dxp/tomcat/bin/shutdown.sh
sleep 30

echo "[i] Archiving DXP"
mv -f liferay_dxp archived_dxp

echo "[i] Let's Build A New House"
