#!/bin/bash
VERSION=0.1.3

wget -O /tmp/gophersearch.tar.gz https://github.com/nicholasjackson/gopher_search/releases/download/v${VERSION}/gophersearch_${VERSION}_linux_amd64.tar.gz
tar -xzf /tmp/gophersearch.tar.gz -C /tmp
sudo mkdir /app
sudo mv /tmp/gophersearch /app

sudo tee /etc/systemd/system/gophersearch.service > /dev/null <<"EOF"
  [Unit]
  Description = "GopherSearch"
  
  [Service]
  WorkingDirectory=/app
  KillSignal=INT
  ExecStart=/app/gophersearch
  Restart=always
  ExecStopPost=sleep 5
EOF

sudo systemctl enable gophersearch.service