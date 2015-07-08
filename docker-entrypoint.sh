#!/bin/bash
set -e

case "$1" in
    trytond)
        find ${TRYTON_DIR}/trytond/trytond/modules -type l -exec rm {} \;
        ln -s ${TRYTON_DIR}/modules/* ${TRYTON_DIR}/trytond/trytond/modules
        ;;
esac

exec "$@"
