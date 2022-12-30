#!/bin/bash

# download the latest Go binary
wget https://golang.org/dl/go$(wget -qO- https://golang.org/VERSION?m=text).linux-amd64.tar.gz

# extract the Go binary
tar -C /usr/local -xzf go$(wget -qO- https://golang.org/VERSION?m=text).linux-amd64.tar.gz

# add Go to the PATH environment variable
echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.bashrc

# source the .bashrc file to apply the changes
source ~/.bashrc

# verify the Go installation
go version

# set the GOPATH environment variable
echo 'export GOPATH=$HOME/go' >> ~/.bashrc

# source the .bashrc file to apply the changes
source ~/.bashrc

# create the GOPATH directory
mkdir -p $GOPATH

echo "GoLang environment setup complete!"
