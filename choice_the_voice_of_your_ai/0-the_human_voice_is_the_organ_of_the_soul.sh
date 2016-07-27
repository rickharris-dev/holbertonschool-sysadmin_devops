#!/bin/bash

#This script will take three parameters.
  # - String with text to speak
  # - The sex of the voice m
    # m - male
    # f - female
    # x - robot
  # IP address to send the file

# Selects the voice based on the parameter provided
case ${2} in
  m)
    VOICE="Alex"
    ;;
  f)
    VOICE="Victoria"
    ;;
  x)
    VOICE="Zarvox"
    ;;
esac

# Create the audio file name
FILE=$(echo ${1} | awk '{print $1}')
FILE="$FILE.m4a"

# Creates the audio file
say ${1} -v $VOICE -o $FILE

# Sets the server path
HOST="admin@${3}"
REMOTE_PATH="/var/www/microblog_project/"

# Uploads the file to the specified server
/usr/bin/scp -q ./$FILE $HOST:"/var/www/microblog-project/"

# Echo file name
echo $FILE

# Echo where to listen to the file
echo "Listen to the message on http://${3}/$FILE"
