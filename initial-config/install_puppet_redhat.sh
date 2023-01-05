#!/bin/bash

echo "* Installing puppet for RedHat ..."

sudo dnf install -y https://yum.puppet.com/puppet7-release-el-8.noarch.rpm
sudo dnf install -y puppet