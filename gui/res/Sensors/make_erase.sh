#!/bin/bash

iname=$1
oname=${iname%.png}_.png

echo "Converting $iname to $oname"
convert $iname -fill white -opaque blue $oname
