#!/bin/bash

# Script to edit and manipulate a text file

# Function to display the menu options
display_menu() {
  echo "Please select an option:"
  echo "1. Edit a specific column"
  echo "2. Remove a specific column"
  echo "3. Edit a specific row"
  echo "4. Remove specific rows"
  echo "5. Add a row"
  echo "6. Manually edit the file"
  echo "7. Exit"
  echo
}

# Function to edit a specific column
edit_column() {
  echo "Enter the column number to edit:"
  read column_number

  echo "Enter the replacement value:"
  read replacement_value

  # Use awk to edit the specific column in the file
  awk -v col="$column_number" -v val="$replacement_value" 'BEGIN{FS=OFS="\t"} {if (NR==1) {$col = val;} else {$col = val} print}' "$file_path" > temp.txt
  mv temp.txt "$file_path"

  echo "Column $column_number edited successfully!"
  echo
}

# Function to remove a specific column
remove_column() {
  echo "Enter the column number to remove:"
  read column_number

  # Use awk to remove the specific column from the file
  awk -v col="$column_number" 'BEGIN{FS=OFS="\t"}{ for (i=col; i<NF; i++) $i = $(i+1); NF--; print }' "$file_path" > temp.txt
  mv temp.txt "$file_path"

  echo "Column $column_number removed successfully!"
  echo
}
