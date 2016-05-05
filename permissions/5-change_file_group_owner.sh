#!/bin/bash
FILE='/tmp/permissions'
touch $FILE #Creates the file
sudo chgrp staff /tmp/permissions #Changes the group of the file to nobody
