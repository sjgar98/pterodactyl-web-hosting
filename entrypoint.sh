#!/bin/bash
sleep 1

cd /home/container

if [ ! -f /home/container/apache2.conf ]; then
    echo "[Entrypoint] Copying default Apache config"
    cp /etc/apache2/apache2.conf /home/container
fi

if [ ! -d /home/container/public_html ]; then
    echo "[Entrypoint] Copying default web root"
    cp -r /usr/local/default_files/public_html /home/container
fi

echo "Listening on port $SERVER_PORT"
echo "Listen $SERVER_PORT" > /home/container/ports.conf

echo "Starting Apache..."
exec apache2-foreground -f /home/container/apache2.conf
