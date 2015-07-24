#!/bin/bash

convert iconwhite.png -resize 144x144 ../apple-touch-icon-144x144-precomposed.png
convert iconwhite.png -resize 114x114 ../apple-touch-icon-114x114-precomposed.png
convert iconwhite.png -resize 72x72 ../apple-touch-icon-72x72-precomposed.png
convert iconwhite.png -resize 57x57 ../apple-touch-icon-precomposed.png
convert iconwhite.png -resize 32x32 ../../favicon.png
convert iconwhite.png -resize 16x16 ../../favicon.ico
