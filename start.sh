#!/usr/bin/env bash 

REPOSITORIES_TEXT=https://github.com/bootiful-podcast/__init__/blob/master/repositories.txt
GIT_TEMPLATE_ROOT=git@github.com:bootiful-podcast
start=$( cd `dirname $0` && pwd	 )
echo "initializing from ${start} "
curl https://raw.githubusercontent.com/bootiful-podcast/__init__/master/repositories.txt | while read l ; do
    d=$(echo $l | cut -f5 -d\/ | cut -f1 -d\. ) 
    echo "Processing $d"  
    dir_to_create=${start}/$d
    if [[ -e  $dir_to_create ]] ; then 
        echo "WARN: ${dir_to_create} aleady exists." 
    else
        echo "initializing ${dir_to_create}"  
        git_repo=${GIT_TEMPLATE_ROOT}/${d}.git
        git clone ${git_repo} ${dir_to_create}
    fi
done
