#!/bin/bash
#cd ~/liferay

#echo "[i] Shutting Down DXP ..."
#./liferay_dxp/tomcat/bin/shutdown.sh
#How to detect if tomcat is running and when tomcat has shutdown? Sleep for a minute?
#sleep 60

echo "[i] Archiving DXP"
#mv -f liferay_dxp archived_dxp

echo "[i] Let's Build A New House"

# CAINT NEVER COULD PART TWO ... GET LATEST VERSION HOW?
wget "https://github.com/liferay/liferay-portal/tags"
VERSION=$(cat "./tags" | grep -i "/liferay/liferay-portal/releases/tag/7.4" | head -n 1 | cut -d '/' -f6 | cut -d '-' -f1 | cut -d '.' -f4 & rm -f tags*)

wget "https://github.com/liferay/liferay-portal/releases/tag/7.4.3.$VERSION-ga$VERSION"
FILE=$(cat "./7.4.3.$VERSION-ga$VERSION" | grep -i "tar.gz" | grep -i "tomcat" | cut -d '>' -f2 | cut -d '<' -f1 & rm -f 7.*)
wget "https://github.com/liferay/liferay-portal/releases/download/7.4.3.$VERSION-ga$VERSION/${FILE:1}"

tar xvf *.tar.gz
#mv -f *.tar.gz ../Downloads
#mv -f liferay-ce-portal* ./liferay_dxp
#mv -f ./liferay_dxp/tomcat-* ./liferay_dxp/tomcat

#cp -rf ./archived_dxp/osgi/modules ./liferay_dxp/osgi
#cp -rf ./archived_dxp/osgi/war ./liferay_dxp/osgi
#cp -rf ./archived_dxp/osgi/marketplace ./liferay_dxp/osgi
#cp -rf ./archived_dxp/osgi/configs ./liferay_dxp/osgi

#cp -rf ./archived_dxp/data ./liferay_dxp
#cp -rf ./archived_dxp/deploy ./liferay_dxp
#cp -rf ./archived_dxp/*.properties ./liferay_dxp

# KEEP THE ARCHIVE FOR NOW IN CASE ANYTHING ELSE NEEDS COPYING ACROSS
# rm -rf ./archived_dxp

echo "[i] DXP 7.4 Hypersonic Upgraded to Release ${VERSION}"
