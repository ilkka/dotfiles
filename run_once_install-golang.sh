#!/bin/bash

curl -fsSLo /tmp/golang.tar.gz https://go.dev/dl/go1.19.1.linux-amd64.tar.gz
rm -rf /usr/local/go
sudo mkdir /usr/local/go && sudo chown $(id -u):$(id -g) /usr/local/go
tar -C /usr/local -f /tmp/golang.tar.gz
rm -f /tmp/golang.tar.gz
