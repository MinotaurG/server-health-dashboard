#!/bin/bash
# Conditionals in bash

# Basic if statement
AGE=25

if [ $AGE -ge 18 ]; then
    echo "Adult"
else
    echo "Minor"
fi

# Numeric comparisons
# -eq equals
# -ne not equals
# -gt greater than
# -lt less than
# -ge greater than or equal to
# -le less than or equal to

NUMBER=75


if [ $NUMBER -gt 90 ]; then
    echo "Excellent!"
elif [ $NUMBER -gt 70 ]; then
    echo "Good"
elif [ $NUMBER -gt 50 ]; then
    echo "Average"
else
    echo "Needs Improvement"
fi

# String Comparisons
NAME="admin"

if [ "$NAME" == "admin" ]; then
    echo "Welcome, administrator!"
else
    echo "Welcome, user!"
fi

# Check if string is empty
EMPTY_VAR=""

if [ -z "EMPTY_VAR" ]; then
   echo "Variable is empty"
fi

# Check if string is not empty
FULL_VAR="hello"

if [ -n "$FULL_VAR" ]; then
   echo "Variable has content: $FULL_VAR"
fi

# File checks
if [ -f "/etc/passwd" ]; then
   echo "/etc/passwd exists and is a file"
fi

if [ -d "/home" ]; then
   echo "/home exits and is a directory"
fi

# Combining conditions
SCORE=85
ATTENDANCE=90

if [ $SCORE -gt 80 ] && [ $ATTENDANCE -gt 75 ]; then
   echo "Passed with good attendance!"
fi

# OR condition
DAY="Saturday"

if [ "$DAY" == "Saturday" ] || [ "$DAY" == "Sunday" ]; then
   echo "It's the weekend!"
fi
