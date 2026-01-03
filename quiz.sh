#!/bin/bash
# Quiz: Fill in the blanks and fix errors

# 1. Fix this variable assignment (there's an error)
MY_NAME="ADI"

# 2. Capture the output of 'whoami' into a variable called CURRENT_USER
CURRENT_USER=$(whoami)

# 3. Write an if statement that prints "High" if LOAD is greater than 4
LOAD=5
if [ $LOAD -gt 4 ]; then
   echo "High"
fi

# 4. Write a for loop that prints numbers 1 to 3
for i in {1..3}; do
   echo "Number: $i"
done

# 5. Calculate 50 * 100 / 7600 and store in PERCENTAGE
PERCENTAGE=$(awk "BEGIN {printf \"%.1f\", (50 / 7600) * 100}")

# Print your answers
echo "1. MY_NAME: $MY_NAME"
echo "2. CURRENT_USER: $CURRENT_USER"
echo "3. (check if LOAD message printed)"
echo "4. (check if 1,2,3 printed)"
echo "5. PERCENTAGE: $PERCENTAGE%"
