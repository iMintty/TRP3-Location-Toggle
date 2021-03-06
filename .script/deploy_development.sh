#!/usr/bin/env bash

curl -s https://raw.githubusercontent.com/BigWigsMods/packager/master/release.sh | bash -s -- -g 9.0.2
curl -s https://raw.githubusercontent.com/BigWigsMods/packager/master/release.sh | bash -s -- -g 1.13.5

curlfiles=""
for file in "/home/travis/build/iMintty/TRP3-Location-Toggle/.release"/*
do
    if [ ${file: -4} == ".zip" ]
    then
        curlfiles="$curlfiles -F $(basename $file)=@$file"
    fi
done

curl $curlfiles $DISCORD_WEBHOOK
echo $curlfiles