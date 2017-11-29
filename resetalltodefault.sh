#!/bin/bash
echo "Stopping containers."
docker-compose down

echo "Clean mysql dir"
rm -rf mysql/*

#echo "Clean themes"
#rm -rf themes/*

echo "Clean www directory"
rm -rf www/*
find www/ -type f -delete
