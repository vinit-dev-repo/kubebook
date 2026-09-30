#!/bin/sh
# make.sh NAME VERSION REPLICAS: print the Deployment NAME made from app.tmpl
sed "s/__NAME__/$1/g; s/__VERSION__/$2/g; s/__REPLICAS__/$3/g" app.tmpl
