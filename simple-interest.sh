#!/bin/bash

echo "=== Simple Interest Calculator ==="
echo

# Function to validate numeric input
validate_numeric() {
    local input=$1
    if [[ ! $input =~ ^[0-9]+\.?[0-9]*$ ]]; then
        return 1
    fi
    return 0
}

# Get principal amount
while true; do
    read -p "Enter the principal amount: " principal
    if validate_numeric "$principal" && (( $(echo "$principal > 0" | bc -l) )); then
        break
    else
        echo "Error: Please enter a valid positive number for principal amount."
    fi
done

# Get rate of interest
while true; do
    read -p "Enter the rate of interest (in percentage): " rate
    if validate_numeric "$rate" && (( $(echo "$rate >= 0" | bc -l) )); then
        break
    else
        echo "Error: Please enter a valid non-negative number for rate of interest."
    fi
done

# Get time period
while true; do
    read -p "Enter the time period (in years): " time
    if validate_numeric "$time" && (( $(echo "$time > 0" | bc -l) )); then
        break
    else
        echo "Error: Please enter a valid positive number for time period."
    fi
done

# Calculate simple interest
# Formula: Simple Interest = (Principal × Rate × Time) / 100
simple_interest=$(echo "scale=2; $principal * $rate * $time / 100" | bc -l)
total_amount=$(echo "scale=2; $principal + $simple_interest" | bc -l)

echo
echo "=== Calculation Results ==="
echo "Principal Amount: \$$(printf "%.2f" $principal)"
echo "Rate of Interest: $rate%"
echo "Time Period: $time years"
echo
echo "Simple Interest: \$$(printf "%.2f" $simple_interest)"
echo "Total Amount: \$$(printf "%.2f" $total_amount)"
echo
echo "Thank you for using Simple Interest Calculator!"
