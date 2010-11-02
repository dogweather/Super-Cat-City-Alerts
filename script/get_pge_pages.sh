#!/bin/sh

DEST_DIR="/home/www/apps/supercat/downloads"
MAIN_URL="http://www.portlandgeneral.com/safety_outages/outages/outage_updates/outage_detail.aspx?county"

/usr/bin/curl "$MAIN_URL=clackamas" > $DEST_DIR/pge_clackamas.html
/usr/bin/curl "$MAIN_URL=columbia" > $DEST_DIR/pge_columbia.html
/usr/bin/curl "$MAIN_URL=marion" > $DEST_DIR/pge_marion.html
/usr/bin/curl "$MAIN_URL=multnomah" > $DEST_DIR/pge_multnomah.html
/usr/bin/curl "$MAIN_URL=polk" > $DEST_DIR/pge_polk.html
/usr/bin/curl "$MAIN_URL=washington" > $DEST_DIR/pge_washington.html
/usr/bin/curl "$MAIN_URL=yamhill" > $DEST_DIR/pge_yamhill.html

