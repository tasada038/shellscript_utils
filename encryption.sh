#!/bin/bash

# Check arguments
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <file_to_encrypt> <public_key>"
    exit 1
fi

# Assign arguments to variables
FILE_TO_ENCRYPT=$1
PUBLIC_KEY=$2

# Check if the file exists
if [ ! -f "$FILE_TO_ENCRYPT" ]; then
    echo "Error: File '$FILE_TO_ENCRYPT' not found."
    exit 1
fi

if [ ! -f "$PUBLIC_KEY" ]; then
    echo "Error: Public key '$PUBLIC_KEY' not found."
    exit 1
fi

# Get the current date and time (format: YYYYMMDD_HHMMSS)
CURRENT_TIME=$(date +"%Y%m%d_%H%M%S")

# Set the name of the encrypted file
ENCRYPTED_FILE="enc_${CURRENT_TIME}_${FILE_TO_ENCRYPT}"

# Encrypt the file
openssl rsautl -encrypt -inkey $PUBLIC_KEY -pubin -in $FILE_TO_ENCRYPT -out $ENCRYPTED_FILE

echo "File '$FILE_TO_ENCRYPT' has been encrypted as '$ENCRYPTED_FILE'."

