#!/bin/bash

rm gcms-default-theme.zip
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

  # copy js assets
  cp -r vendor/fortawesome/font-awesome/webfonts assets/.
  cp -r vendor/twbs/bootstrap/dist/js/* assets/js/.
  cp -r vendor/components/jquery/*.js assets/js/.

  # remove unneeded stuff
  rm build.sh
  rm -rf dist
  rm -rf vendor

  # zip
  zip -r ../gcms-default-theme.zip *
)
rm -rf dist
