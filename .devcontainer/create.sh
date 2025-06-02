#!/bin/sh

### Add ssh-keyscan to known_hosts
mkdir -p /home/vscode/.ssh
chmod 700 /home/vscode/.ssh
ssh-keyscan github.com >>/home/vscode/.ssh/known_hosts

### Ensure correct access rights
sudo chown -Rf vscode:vscode ${containerWorkspaceFolder:-.}/* ${containerWorkspaceFolder:-.}/.*
sudo chmod -Rf 755 ${containerWorkspaceFolder:-.}/* ${containerWorkspaceFolder:-.}/.*
