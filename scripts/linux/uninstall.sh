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
        rm -rf ./db.sqlite3
fi