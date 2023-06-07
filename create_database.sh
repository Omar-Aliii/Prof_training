#!/bin/bash

# Validation function to check whether the input contains spaces or special characters
check_validation() {
    if [[ $1 =~ [[:space:]] || $1 =~ [^a-zA-Z0-9_-] ]]; then
        return 1
    fi
    return 0
}

while true; do
    # Prompt the user to enter the name of the database to create
    read -p "Enter the name of the database you wish to create (please avoid spaces and special characters): " database_name

    check_validation "$database_name"
    check_validation=$?

    if [ $check_validation -eq 0 ]; then
        break # Exit the loop if the input is valid
    else
        echo "Please check your input and try again (Do not use spaces or special characters)."
    fi
done

# Search for the database folder
database_folder=$(find / -type d -name "$database_name" 2>/dev/null)

if [ -n "$database_folder" ]; then
    # If the database folder exists, prompt the user to enter a different name
    while true; do
        echo "The database folder already exists at: $database_folder"
        read -p "Please enter a different name for the database: " database_name
        check_validation "$database_name"
        check_validation=$?
        if [ $check_validation -eq 0 ]; then
            # Exit the loop if the new input is valid
            break
        else
            echo "Please check your input and try again (Do not use spaces or special characters)."
        fi
    done
fi

# Create the database folder
while true; do
    read -p "The database folder does not exist. Do you want to create it? (Y/N): " create_database
    if [ "$create_database" = "Y" ] || [ "$create_database" = "y" ]; then
        read -p "Enter the directory to create the database folder (Press enter to keep it in current directory): " create_directory
        if [ -z "$create_directory" ]; then
            create_directory="."
        fi
        mkdir -p "$create_directory/$database_name"
        echo "The database folder has been created in: $create_directory/$database_name"
        break # Exit the loop after creating the folder
    elif [ "$create_database" = "N" ] || [ "$create_database" = "n" ]; then
        echo "Failed to create the database."
        break
    else
        echo "Invalid input. Please enter Y or N."
    fi
done
