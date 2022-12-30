#!/bin/bash

# Check if domain argument is provided
if [ -z "$1" ]; then
  echo "Error: Please provide a domain as an argument."
  exit 1
fi

# Save domain to a variable
domain=$1

# Find subdomains using amass
echo "Finding subdomains with amass..."
amass enum -d $domain > amass.txt

# Find subdomains using subfinder
echo "Finding subdomains with subfinder..."
subfinder -d $domain -silent >> subfinder.txt

# Find subdomains using assetfinder
echo "Finding subdomains with assetfinder..."
assetfinder $domain >> assetfinder.txt

# Find subdomains using sublister
echo "Finding subdomains with sublister..."
sublist3r -d $domain -o sublister.txt

# Find subdomains using findomain
echo "Finding subdomains with findomain..."
findomain -t $domain >> findomain.txt

# Find subdomains using crt.sh
echo "Finding subdomains with crt.sh..."
curl -s https://crt.sh/?q=%25.$domain | grep $domain | sed 's/<\/td><td>/ /g' | cut -d ' ' -f1 | sort -u >> crt.sh.txt

# Find subdomains using subdomainscan
echo "Finding subdomains with subdomainscan..."
subdomainscan $domain >> subdomainscan.txt

# Find subdomains using subbrute
echo "Finding subdomains with subbrute..."
subbrute $domain > subbrute.txt

# Find subdomains using knockpy
echo "Finding subdomains with knockpy..."
knockpy $domain > knockpy.txt

# Find subdomains using virustotal
echo "Finding subdomains with virustotal..."
curl -s https://www.virustotal.com/ui/domains/$domain/subdomains | jq '.data | .[]' | sed 's/"//g' >> virustotal.txt

# Combine results from all tools into a single file
echo "Combining results into a single file..."
cat amass.txt subfinder.txt assetfinder.txt sublister.txt findomain.txt crt.sh.txt subdomainscan.txt subbrute.txt knockpy.txt virustotal.txt | sort -u > subdomains.txt

# Remove temporary files
echo "Cleaning up temporary files..."
rm amass.txt subfinder.txt assetfinder.txt sublister.txt findomain.txt crt.sh.txt subdomainscan.txt subbrute.txt knockpy.txt virustotal.txt

echo "Done!"
