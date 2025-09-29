#!/bin/bash

writefile="$1"
writestr="$2"

echo "$writestr" > "$writefile" 

if [ -z "$writefile" ] || [ -z "$writestr" ]; then
echo "Error: Missing Arguments."
echo "Usage: $0 <writefile> <writestr>"
exit 1
fi

mkdir -p "$(dirname "$writefile")"

if ! echo "$writestr" > "$writefile"; then
echo "Error: Could not create file $writefile"
exit 1
fi


echo "File created: $writefile"
echo "Content written: $writestr"
exit 0