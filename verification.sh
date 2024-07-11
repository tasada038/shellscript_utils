#!/bin/bash

# Check arguments
if [ "$#" -ne 3 ]; then
    echo "Usage: $0 <data_file> <public_key> <signature_file>"
    exit 1
fi

# Assign arguments to variables
DATA_FILE=$1
PUBLIC_KEY=$2
SIGNATURE_FILE=$3

# Check if files exist
if [ ! -f "$DATA_FILE" ]; then
    echo "Error: Data file '$DATA_FILE' not found."
    exit 1
fi

if [ ! -f "$PUBLIC_KEY" ]; then
    echo "Error: Public key '$PUBLIC_KEY' not found."
    exit 1
fi

if [ ! -f "$SIGNATURE_FILE" ]; then
    echo "Error: Signature file '$SIGNATURE_FILE' not found."
    exit 1
fi

# Decode the signature from base64
SIGNATURE_BIN="/tmp/signature.bin"
openssl base64 -d -in $SIGNATURE_FILE -out $SIGNATURE_BIN

# Verify the signature
openssl dgst -sha256 -verify $PUBLIC_KEY -signature $SIGNATURE_BIN $DATA_FILE

# Clean up
rm $SIGNATURE_BIN

