#!/bin/bash
if [ ${ command -v espeak >/dev/null 2>&1 || { echo >&2 "Not installed" } } == "Not installed" ] ; then
    echo "Installing Espeak..."
    command -v sudo apt-get install espeak >/dev/null 2>&1 || { echo >&2 "Error: Installing Espeak." }
else
    echo "Espeak already installed."
fi
