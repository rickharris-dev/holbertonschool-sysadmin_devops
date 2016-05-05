#!/bin/bash
FILE='/tmp/permissions'
touch $FILE #Creates the file
sudo chown nobody $FILE #Changes the owner of the file to nobody
