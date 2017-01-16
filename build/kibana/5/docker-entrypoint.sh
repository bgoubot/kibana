#!/bin/bash
set -e

# Add kibana as command if needed
if [[ "$1" == -* ]]; then
	set -- kibana "$@"
fi

# Run as user "kibana" if the command is "kibana"
if [ "$1" = 'kibana' ]; then
        if [ "$ELASTICSEARCH_URL" ]; then
                sed -ri "s!^(\#\s*)?(elasticsearch\.url:).*!\2 '$ELASTICSEARCH_URL'!" /etc/kibana/kibana.yml
        fi
        if [ "$KIBANA_INDEX" ]; then
                sed -ri "s!^(\#\s*)?(kibana\.index:).*!\2 ${KIBANA_INDEX}!" /etc/kibana/kibana.yml
    	fi
    	if [ "$KIBANA_BASEPATH" ]; then
        	sed -ri "s!^(\#\s*)?(server\.basePath:).*!\2 ${KIBANA_BASEPATH}!" /etc/kibana/kibana.yml
    	fi
    	if [ "$KIBANA_HOST" ]; then
        	sed -ri "s!^(\#\s*)?(server\.host:).*!\2 ${KIBANA_HOST}!" /etc/kibana/kibana.yml
    	fi
    	if [ "$KIBANA_SRVNAME" ]; then
        	sed -ri "s!^(\#\s*)?(server\.name:).*!\2 ${KIBANA_SRVNAME}!" /etc/kibana/kibana.yml
   	fi

        set -- gosu kibana tini -- "$@"
fi

exec "$@"
