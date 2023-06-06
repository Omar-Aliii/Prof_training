#!/bin/bash

#Script to create a table file with column headers and content
#Function to add column headers to the table file
fill_table() {
  while true; do
    echo "Enter the column names (separated by tabs):"
    read -a names
    joined_names=$(IFS=$'\t'; echo "${names[*]}")
    if echo "${joined_names}" | awk '/^[a-zA-Z0-9_-]+$/ { print }'; then
      echo -e "$joined_names" > "$table_file_name"
      echo "Column names added successfully."
      break
    else
      echo "Invalid input. Column headers can only contain letters, numbers, and underscores."
    fi
  done

  while true; do
    echo "Enter the content for each row (separated by tabs):"
    read -a rows
    joined_rows=$(IFS=$'\t'; echo "${rows[*]}")
    #checking if it contains letters and nums and underscores
    if echo "${joined_rows}" | awk '/^[a-zA-Z0-9_]+$/ { print }'; then
      echo -e "$joined_rows" >> "$table_file_name"
      echo "Content written successfully."
      echo "Do you want to insert another row? (Y/N)"
      read -a choice
      if [ "$choice" = "Y" ] || [ "$choice" = "y" ]; then
        continue
      else
        break
      fi
    else
      echo "Invalid input. Content can only contain letters, numbers, and underscores."
    fi
  done
}

echo "Enter the name of the table file:"
read table_file_name
touch "$table_file_name"

echo "Table '$table_file_name' created successfully."

while true; do
  echo "Table Menu"
  echo "1. Fill the table"
  echo "2. Exit"
  echo ""
  read -p "Enter your choice: " choice
  case $choice in
    1) fill_table ;; # Call fill_table function
    2) break ;; # Exit the loop and script
    *) echo "Invalid choice. Please try again." ;;
  esac
done