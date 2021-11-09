#!/bin/bash
{
	perl -0777 -i -pe 's/^( "socketio_port": 9000,\n "webserver_port": 8000)$/ "socketio_port": 9000/gm' /home/frappe/bench/sites/common_site_config.json
	sudo service mysql start
	bench start
} || {
	echo "============================================="
	echo "ERROR: entrypoint command failed to start"
	echo "============================================="
	tail -f /dev/null
}
