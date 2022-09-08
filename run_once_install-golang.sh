#!/bin/bash

curl -fsSLo /tmp/golang.tar.gz https://go.dev/dl/go1.19.1.linux-amd64.tar.gz
sudo rm -rf /usr/local/go
sudo mkdir /usr/local/go
sudo tar -C /usr/local -xf /tmp/golang.tar.gz
rm -f /tmp/golang.tar.gz
