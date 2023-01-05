#!/bin/bash

echo "* Installing firewall abd mysql modules ..."
puppet module install puppetlabs/mysql
puppet module install puppetlabs-firewall

sudo cp -vR ~/.puppetlabs/etc/code/modules/ /etc/puppetlabs/code/
