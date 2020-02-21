#!/bin/sh
name=noip2
service=/etc/init.d/$name
distrib=$1

if [ -z "$distrib" ];
then
    echo "usage: $0 <distrib>"
    exit 1
fi

if [ ! -f $distrib.$name.sh ];
then
    echo "$0: distrib '$distrib' unknow"
    exit 1
fi

echo -n "$0: installing $name service for $distrib... "
cp $distrib.$name.sh $service
chmod +x $service
chown root:root $service
update-rc.d $name defaults
update-rc.d $name enable
service $name start
echo "OK!"

