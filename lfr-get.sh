#!/bin/bash
# Supply the version to download as the first argument eg 17

if [ $# -eq 0 ]; then
    read -p "[?] Which version ... (type 18 for GA18): " VERSION
else
        VERSION=$1
fi

echo $VERSION > version

# CAINT NEVER COULD
wget "https://github.com/liferay/liferay-portal/releases/tag/7.4.3.$VERSION-ga$VERSION"
FILE=$(cat "./7.4.3.$VERSION-ga$VERSION" | grep -i "tar.gz" | grep -i "tomcat" | cut -d '>' -f2 | cut -d '<' -f1)
wget "https://github.com/liferay/liferay-portal/releases/download/7.4.3.$VERSION-ga$VERSION/${FILE:1}"
rm -f 7.*

tar xvf *.tar.gz --directory ./
#mv -f *.tar.gz ../Downloads

mv -f liferay-ce-portal-7* liferay_dxp
mv -f liferay_dxp/tomcat-* liferay_dxp/tomcat

./liferay_dxp/tomcat/bin/startup.sh
