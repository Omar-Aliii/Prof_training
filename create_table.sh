#!/bin/bash

#Script to create a table file with column names and fill the row content
#Function to add column names to the table file
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
      echo "Invalid input. Column names can only contain letters, numbers, and underscores."
    fi
  done
  
  echo "Do you have a rows to insert? (Y/N)"
  read -a choice
  if [ "$choice" = "Y" ] || [ "$choice" = "y" ]; then
     continue
  else
     break
     fi
  
  while true; do
    echo "Enter the row for each row (separated by tabs):"
    read -a rows
    joined_rows=$(IFS=$'\t'; echo "${rows[*]}")
    #checking if it contains letters and nums and underscores
    if echo "${joined_rows}" | awk '/^[a-zA-Z0-9_]+$/ { print }'; then
      echo -e "$joined_rows" >> "$table_file_name"
      echo "row written successfully."
      echo "Do you want to insert another row? (Y/N)"
      read -a choice
      if [ "$choice" = "Y" ] || [ "$choice" = "y" ]; then
        continue
      else
        break
      fi
    else
      echo "Invalid input. row can only contain letters, numbers, and underscores."
    fi
  done
}


append_table() {
while true; do
echo "enter the row you want to append separated by tabs"
read -a rows
    joined_rows=$(IFS=$'\t'; echo "${rows[*]}")
    #checking if it contains letters and nums and underscores
    if echo "${joined_rows}" | awk '/^[a-zA-Z0-9_]+$/ { print }'; then
      echo -e "$joined_rows" >> "$table_file_name"
      echo "row written successfully."
      echo "Do you want to insert another row? (Y/N)"
      read -a choice
      if [ "$choice" = "Y" ] || [ "$choice" = "y" ]; then
        continue
      else
        break
      fi
    else
      echo "Invalid input. row can only contain letters, numbers, and underscores."
    fi
  done

}



echo "Enter the name of the table file:"
read table_file_name
touch "$table_file_name"

echo "Table '$table_file_name' created successfully."

while true; do
  echo "Table Menu"
  echo "if you want to create the table and fill it with your current data press 1"
  echo "if you want to add to your table press 2"
  echo "for exit press 3"
  echo ""
  read -p "Enter your choice: " choice
  case $choice in
    1) fill_table ;; # Call fill_table function
    2) append_table;; #call append_table function
    3) break ;; # Exit the loop and script
    *) echo "Invalid choice. Please try again." ;;
  esac
done
