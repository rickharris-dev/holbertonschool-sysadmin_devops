#!/bin/bash
FILE='/tmp/permissions'
touch $FILE #Creates the file
sudo chown nobody /tmp/permissions #Changes the owner of the file to nobody
