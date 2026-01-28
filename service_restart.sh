#!/bin/bash
SERVICE=nginx

if ! systemctl is-active --quiet $SERVICE; then
  systemctl start $SERVICE
  echo "$SERVICE restarted"
fi

