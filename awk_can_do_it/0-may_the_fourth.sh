#!/bin/bash
echo $(echo ${1} | awk '{print $4}')
