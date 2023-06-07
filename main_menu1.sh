#!/bin/bash

# manage a database system

# execute the create_database.sh script
create_database_script() {
    source ./create_database.sh
}

# execute the create_table.sh script
create_table_script() {
    source ./create_table.sh
}

# execute the modify_table.sh script
modify_table_script() {
    source ./modify_table.sh
}

# execute the show_table.sh script
show_table_script() {
    source ./show_table.sh
}









# Function for the main menu
main_menu() {
    
    echo "Main Menu"
    
    echo "CREATE DATABASE  : 1"
    echo "CREATE TABLE  : 2"
    echo " MODIFAY TABLE  : 3"
    echo " SHOW TABLE  : 4"
    
   
    read -p "choose any option: " number

    case $number in
        1) create_database_script ;;   # Call create_database_script function
        2) create_table_script ;;      # Call create_table_script function
        3) modify_table_script ;;      # Call modify_table_script function
        4) show_table_script ;;        # Call show_table_script function
       
       
        *) echo "Invalid " ;;
    esac

    main_menu  # Recursive call to display the main menu again
}

# Call the main_menu function to start the script
main_menu

