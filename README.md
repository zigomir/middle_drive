# MiddleDrive

## Setup

    cp settings.SAMPLE.yml settings.yml

## Usage

    bundle console

Temporary: copy assets to middleman app

    cp -r ../development/middle_drive/build/* .

## Conventions

Look at settings.SAMPLE.yml

`pages` must be a spreadsheet which contains pages, separated into worksheets (tabs).

### Middleman config for dynamic pages

Copy `config.MIDDLEMAN.rb` to `config.rb` to your Middleman app.

## TODO
- http://middlemanapp.com/advanced/local-data/
- http://tvaughan.github.io/middleman-deploy/
- middle_drive should as a gem live inside middleman app and should be callable as command line app with arguments
- when building from scratch it would be better to start building `pages.yml`, `data.yml`, `en.yml` files locally and
then run init to build structure on google drive
