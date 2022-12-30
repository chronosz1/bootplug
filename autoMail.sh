#!/bin/bash

# Set the email recipient
recipient="example@example.com"

# Set the subject of the email
subject="This is the subject of the email"

# Set the body of the email
body="This is the body of the email. You can include multiple lines of text here."

# Send the email using sendmail
echo "$body" | sendmail -f "sender@example.com" -t "$recipient" -u "$subject"

# Print a message to confirm that the email was sent
echo "Email sent to $recipient"
