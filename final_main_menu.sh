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

# execute the remove_table.sh script
remove_table_script() {
    source ./remove_table.sh
}

# exit the script
exit_script() {
    echo -e "Leaving...\xF0\x9F\x98\xA2"
    
    exit 0
}




clear
echo "Welcome to Database Management System"
echo "----------------------------------------"
echo "this project is done by:"
echo "Abdelrahman Saleh"
echo "Ahmed Hazem"
echo "Aly Mahmoud"
echo "Mayada Gamal"
echo "Moamen Ahmed"
echo "Omar Ali"
echo "Omar Osama"
echo "Youssef Waleed"


# Function for the main menu
main_menu() {
    echo "----------------------------------------"
    echo "Main Menu"
    echo "----------------------------------------"
    echo "To CREATE DATABASE choose number : 1"
    echo "To CREATE or append to a TABLE choose number : 2"
    echo "To MODIFAY TABLE choose number : 3"
    echo "To SHOW TABLE choose number : 4"
    echo "To REMOVE TABLE choose number : 5"
    echo "To EXIT from main menu choose number : 6"
    read -p "Enter what you want to do : " number

    case $number in
        1) create_database_script ;;   # Call create_database_script function
        2) create_table_script ;;      # Call create_table_script function
        3) modify_table_script ;;      # Call modify_table_script function
        4) show_table_script ;;        # Call show_table_script function
        5) remove_table_script ;;      # Call remove_table_script function
        6) exit_script ;;              # Call exit_script function
        *) echo "Invalid option , Please try again and select number from 1 -> 6." ;;
    esac

    main_menu  # Recursive call to display the main menu again
}

# Call the main_menu function to start the script
main_menu
