#!/bin/bash
# Learning variables

# Assigning variables (NO SPACES around =)
NAME="Adishum"
AGE=29
CITY="Bangalore"

# Using variables ($ prefix)
echo "Name: $NAME"
echo "Age: $AGE"
echo "City: $City"

# Curly braces for clarity (optional but recommended)
echo "Hello, ${NAME}!"

# This is why braces matter:
FILE="report"
echo "$FILEname"      # WRONG: Looks for variable $FILEname
echo "${FILE}name"    # RIGHT: Uses $FILE + "name" = "reportname"
