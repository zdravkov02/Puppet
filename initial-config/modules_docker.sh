#!/bin/bash

echo "* Installing docker module ..."
puppet module install puppetlabs-docker 
sudo cp -vR ~/.puppetlabs/etc/code/modules/ /etc/puppetlabs/code/