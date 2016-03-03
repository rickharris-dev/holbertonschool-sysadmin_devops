#!/bin/bash
awk '{ 
    for ( i = 2; i <= NF; i++ ){ 
        if ($i ~ /^[0-9][0-9][0-9]$/) { 
            print $1, $i 
        } 
    } 
}' ${1} |  sort | uniq -c | sort -n