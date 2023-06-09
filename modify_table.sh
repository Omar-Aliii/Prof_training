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
}

# Function to edit a specific row
edit_row() {
  echo "Enter the row number to edit:"
  read row_number

  echo "Enter the replacement value (tab-separated columns):"
  read -a replacement_values

  # Use awk to edit the specific row in the file
  awk -v row="$row_number" -v vals="${replacement_values[*]}" 'BEGIN{FS=OFS="\t"} {if (NR==row) {split(vals, a, "\t"); for(i=1; i<=NF; i++) $i=a[i];} print}' "$file_path" > temp.txt
  mv temp.txt "$file_path"

  echo "Row $row_number edited successfully!"
  echo
}

# Function to remove specific rows
remove_rows() {
  echo "Enter the row numbers to remove (comma-separated):"
  read row_numbers

  # Use sed to remove the specific rows from the file
  sed -i "$(echo "$row_numbers" | sed 's/,/d;/g')d" "$file_path"

  echo "Rows $row_numbers removed successfully!"
  echo
}

# Function to add a new row
add_row() {
  echo "Enter the values for the new row (tab-separated columns):"
  read -a new_row_values

  # Append the new row to the file
  echo "${new_row_values[*]}" >> "$file_path"

  echo "New row added successfully!"
  echo
}

# Function to manually edit the file using nano editor
manual_edit() {
  echo "Manually editing the file. Press Enter to continue..."
  read
  nano "$file_path"
  echo "File edited successfully!"
  echo
}

# Main script

echo "Enter the path to the text file:"
read file_path

while true; do
  display_menu

  read -p "Option: " option
  echo

  case $option in
    1)
      edit_column
      ;;
    2)
      remove_column
      ;;
    3)
      edit_row
      ;;
    4)
      remove_rows
      ;;
    5)
      add_row
      ;;
    6)
      manual_edit
      ;;
    7)
      echo "Exiting..."
      break
      ;;
    *)
      echo "Invalid option. Please try again."
      echo
      ;;
  esac
done
