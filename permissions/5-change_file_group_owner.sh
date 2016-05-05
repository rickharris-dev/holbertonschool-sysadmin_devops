#!/bin/bash
FILE='/tmp/permissions'
touch $FILE #Creates the file
sudo chgrp staff $FILE #Changes the group of the file to nobody
