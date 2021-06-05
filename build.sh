#!/bin/bash

rm gcms-gisler-software.zip
rm -rf dist
mkdir dist
cp -R * dist/.

(
  cd dist

  # build css
  (
    cd assets/css
    sass style.scss style.css
    uglifycss style.css --output style.min.css
    sass maintenance.scss maintenance.css
    uglifycss maintenance.css --output maintenance.min.css
  )

  # remove unneeded stuff
  rm build.sh
  rm -rf dist
  rm -rf vendor

  # zip
  zip -r ../gcms-gisler-software.zip *
)
rm -rf dist
