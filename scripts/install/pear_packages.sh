#!/bin/sh

pear config-set auto_discover 1

pear channel-discover pear.phing.info
pear install -s phing/phing
pear install -s pear.phpunit.de/phpcpd
pear install -s pear.phpunit.de/phploc
