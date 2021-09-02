#!/bin/bash

cd /var/www/html/ci_uploads
for d in ./nioruntime/*
do
 echo "Processing $d"
 for f in $d/doc.tar.gz
 do
  echo "file: $f"
  gzip -dc $f | tar xf -
 done
done
