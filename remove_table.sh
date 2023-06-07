#!/bin/bash

# Script to remove a file

# Function to validate and remove a file
remove_file() {
    local file_path

    read -p "Enter the path to the file you want to remove: " file_path

    # Check if the file exists
    if [ -f "$file_path" ]; then
        rm "$file_path"  # Remove the file
        echo "File '$file_path' removed successfully."
    else
        echo "Error: File '$file_path' not found."
        remove_file # Prompt for file path again
    fi
}

# Function to confirm file removal
confirm_removal() {
    local confirmation

    read -p "Are you sure you want to remove the file? (Y/N): " confirmation

    case $confirmation in
        [Yy])
            remove_file # Proceed with file removal
            ;;
        [Nn])
            echo "File removal canceled."
            ;;
        *)
            echo "Invalid choice. File removal canceled."
            ;;
    esac
}

# Call the confirm_removal function to start the file removal process
confirm_removal

# End of the script
