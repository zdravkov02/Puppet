#!/bin/bash

echo "* Installing firewall module ..."
puppet module install puppetlabs-firewall

sudo cp -vR ~/.puppetlabs/etc/code/modules/ /etc/puppetlabs/code/