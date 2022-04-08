#!/bin/bash
#cd ~/liferay


# CAINT NEVER COULD PART TWO ... GET LATEST VERSION HOW?
wget -q "https://github.com/liferay/liferay-portal/tags"
VERSION=$(cat "./tags" | grep -i "/liferay/liferay-portal/releases/tag/7.4" | head -n 1 | cut -d '/' -f6 | cut -d '-' -f1 | cut -d '.' -f4 & rm tags*)
CURRENT=$(cat version)

if [[ "${VERSION}" == "${CURRENT}" ]]; then
	clear
	echo "[i] SCRUB - Currently are running the most recent update"
	exit 1
else
	clear
	echo "[i] MAXQ - Update available: Release ${VERSION}"
	sleep 2
fi

wget -q "https://github.com/liferay/liferay-portal/releases/tag/7.4.3.$VERSION-ga$VERSION"
FILE=$(cat "./7.4.3.$VERSION-ga$VERSION" | grep -i "tar.gz" | grep -i "tomcat" | cut -d '>' -f2 | cut -d '<' -f1 & rm -f 7.*)
wget -q --show-progress --no-clobber "https://github.com/liferay/liferay-portal/releases/download/7.4.3.$VERSION-ga$VERSION/${FILE:1}"


echo "[i] MECO - Shutting down the engines"
#./liferay_dxp/tomcat/bin/shutdown.sh
#How to detect if tomcat is running and when tomcat has shutdown? Sleep for a minute?
#sleep 60

echo "[i] SECO - Archiving DXP"
mkdir -p bundles
mv -f liferay_dxp archived_dxp
tar xvf *.tar.gz
mv -f *.tar.gz ./bundles

mv -f liferay-ce-portal-7* liferay_dxp
mv -f liferay_dxp/tomcat-* liferay_dxp/tomcat


echo "[i] DEPLOYMENT - Copying back the data"
cp -rf ./archived_dxp/osgi/modules ./liferay_dxp/osgi
cp -rf ./archived_dxp/osgi/war ./liferay_dxp/osgi
cp -rf ./archived_dxp/osgi/marketplace/override ./liferay_dxp/osgi/marketplace
cp -rf ./archived_dxp/osgi/configs ./liferay_dxp/osgi

cp -rf ./archived_dxp/data ./liferay_dxp
cp -rf ./archived_dxp/deploy ./liferay_dxp
cp -rf ./archived_dxp/*.properties ./liferay_dxp
cp -rf ./acrhived_dxp/licence/* ./liferay_dxp/licence
cp -rf ./archived_dxp/tomcat/conf ./liferay_dxp/tomcat

mv -f ./liferay_dxp/osgi/war/* ./liferay_dxp/deploy
mv -f ./liferay_dxp/osgi/modules/* ./liferay_dxp/deploy

# KEEP THE ARCHIVE FOR NOW IN CASE ANYTHING ELSE NEEDS COPYING ACROSS
# rm -rf ./archived_dxp

echo "[i] MISSION COMPLETE - DXP 7.4 Hypersonic Upgraded to Release ${VERSION}"
echo $VERSION > version
