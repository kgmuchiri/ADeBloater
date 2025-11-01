#!/bin/bash

RAW_FILE="packages.txt"
if [ -z "$1" ]; then
    CLEANED_FILE="cleaned_packages.txt"
else
    FILTER="$1"
    CLEANED_FILE="packages_${FILTER}.txt"
fi

# Check if ADB is available
if ! command -v adb &> /dev/null; then
    echo "❌ ADB not found."
    exit 1
fi

# Get list of packages
if [ -z "$1" ]; then
    echo "  Fetching all packages..."
    adb shell pm list packages | tee "$RAW_FILE"
else
    echo " Fetching packages matching '$1'..."
    adb shell pm list packages | grep "$1" | tee "$RAW_FILE"
fi

# Run strip-prefix on the output file
echo "Stripping prefix from $RAW_FILE..."
sed 's/^package://' "$RAW_FILE" > "$CLEANED_FILE"
rm "$RAW_FILE"
mv "$CLEANED_FILE" ./device-package-list/



