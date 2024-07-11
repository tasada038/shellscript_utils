#!/bin/bash

# Check arguments
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <data_file>"
    exit 1
fi

# Data file to be signed
DATA_FILE=$1

# Check if the file exists
if [ ! -f "$DATA_FILE" ]; then
    echo "Error: File '$DATA_FILE' not found."
    exit 1
fi

# Get the current date and time (format: YYYYMMDD_HHMMSS)
CURRENT_TIME=$(date +"%Y%m%d_%H%M%S")

# Set the file names for the private key and public key
PRIVATE_KEY="private_key_${CURRENT_TIME}.pem"
PUBLIC_KEY="public_key_${CURRENT_TIME}.pem"

# Set the name of the signature file
SIGNATURE_FILE="signature_${CURRENT_TIME}.txt"

# Generate RSA key pair (2048 bits)
openssl genpkey -algorithm RSA -out $PRIVATE_KEY -pkeyopt rsa_keygen_bits:2048
openssl rsa -pubout -in $PRIVATE_KEY -out $PUBLIC_KEY

# Create the signature and save it in text format
openssl dgst -sha256 -sign $PRIVATE_KEY -out /tmp/signature.bin $DATA_FILE
openssl base64 -in /tmp/signature.bin -out $SIGNATURE_FILE
rm /tmp/signature.bin

echo "Private key, public key, and signature have been generated."
echo "Private key: $PRIVATE_KEY"
echo "Public key: $PUBLIC_KEY"
echo "Signature: $SIGNATURE_FILE"

