#!/bin/bash
# Arithmetic in bash

# Method 1: $(( )) - Integer arithmetic only
A=10
B=3

SUM=$((A + B))
DIFF=$((A - B))
PRODUCT=$((A * B))
QUOTIENT=$((A / B)) # Integer division! 10/3 = 3, not 3.3
REMAINDER=$((A % B)) # Modulo

echo "A = $A, B = $B"
echo "Sum: $SUM"
echo "Difference: $DIFF"
echo "Product: $PRODUCT"
echo "Quotient: $QUOTIENT (integer division!)"
echo "Remainder: $REMAINDER"

# Method 2: Using expr (older method)
RESULT=$(expr $A + $B)
echo "Using expr: $RESULT"

# Method 3: Using bc for decimals
DECIMAL=$(echo "scale =2; 10 / 3" | bc)
echo "With decimals: $DECIMAL"

# Practical example: Calculate percentage
TOTAL=7600
USED=2700
PERCENTAGE=$((USED * 100 / TOTAL))
echo "Memory usage: ${PERCENTAGE}%"

# With decimals using awk
PERCENTAGE_DECIMAL=$(awk "BEGIN {printf \"%.1f\", ($USED / $TOTAL) * 100}")
echo "Memory usage (precise): ${PERCENTAGE_DECIMAL}%"
