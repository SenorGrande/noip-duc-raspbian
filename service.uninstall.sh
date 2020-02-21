#!/bin/sh
name=noip2
service $name stop
update-rc.d -f $name remove
