#!/bin/bash

# Check arguments
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <file_to_decrypt> <private_key>"
    exit 1
fi

# Assign arguments to variables
FILE_TO_DECRYPT=$1
PRIVATE_KEY=$2

# Check if the file exists
if [ ! -f "$FILE_TO_DECRYPT" ]; then
    echo "Error: File '$FILE_TO_DECRYPT' not found."
    exit 1
fi

if [ ! -f "$PRIVATE_KEY" ]; then
    echo "Error: Private key '$PRIVATE_KEY' not found."
    exit 1
fi

# Set the name of the decrypted file
DECRYPTED_FILE="dec_${FILE_TO_DECRYPT}"

# Decrypt the file
openssl rsautl -decrypt -inkey $PRIVATE_KEY -in $FILE_TO_DECRYPT -out $DECRYPTED_FILE

echo "File '$FILE_TO_DECRYPT' has been decrypted as '$DECRYPTED_FILE'."

