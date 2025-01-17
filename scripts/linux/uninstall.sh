#! /bin/bash

# perform a clean installecho ""
echo "-----------------------------------------------------------------------"
read -p "clean install, current data will be lost? : " cleaninstall
if [[ $cleaninstall == "y" ]]
    then 
        echo "Removing virtual environment"
        rm -rf ./venv
        echo "Removing static files"
        rm -rf ./static
        echo "Removing database"
        rm -rf ./databases/default.db.sqlite3
        rm -rf ./databases/development.db.sqlite3
        echo "Removing temp files"
        rm -rf ./tmp/*
        echo "Removing temp files"
        rm -rf ./logs/*.log
fi