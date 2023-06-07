
#!/bin/sh

# Script to format and display a table from an input text file

# Prompt the user for the path to the input text file
read -p "Enter the path to the input text file: " input_file


# Check if the input file exists
if [ ! -f "$input_file" ]; then
    echo "Error: File '$input_file' not found."
    exit 1
fi

# Format and display the table using sed, awk, tbl, and nroff
sed 's/  */\t/g' < "$input_file" | awk '
BEGIN {
    print ".TS"
    print "allbox;"
    print "c s s s"
    print "lb lb lb lb"
    print "l l l l."
    print "My Table"
}
{print}
END {
    print ".TE"  # end of table
}' | tbl | nroff -Tdumb | sed 's/^[[:space:]]*//' | sed '/^$/d'
