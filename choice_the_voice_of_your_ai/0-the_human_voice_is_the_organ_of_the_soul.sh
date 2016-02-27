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
FILE="./$FILE.m4v"

# Creates the audio file
say ${1} -v $VOICE -o $FILE

# Sets the server path
PATH="admin@${3}:/var/www"

# Uploads the file to the specified server
scp -i ~/Dropbox/first_key $FILE $PATH
