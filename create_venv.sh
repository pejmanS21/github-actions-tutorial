#! /bin/bash

DIR=venv
if [ -d "$DIR" ];
then
    echo "$DIR directory exists."
else
	virtualenv venv
fi
