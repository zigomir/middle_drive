# MiddleDrive

## Quick start

    gem install middleman
    middleman init new_site

To `Gemfile` in `new_site` add `middle_drive`

    gem 'middle_drive'

Then run

    cd new_site
    bundle
    middle_drive init

## Manual install

    gem install middle_drive

## Setup

    middle_drive init

## Usage

    middle_drive

## Conventions

`pages` must be a spreadsheet which contains pages, separated into worksheets (tabs).

### Middleman config for dynamic pages

Copy `config.MIDDLEMAN.rb` to `config.rb` to your Middleman app.

## TODO
- http://middlemanapp.com/advanced/local-data/
- http://tvaughan.github.io/middleman-deploy/
- [Partials](http://middlemanapp.com/templates/) for debug info

- when building from scratch it would be better to start building `pages.yml`, `data.yml`, `en.yml` files locally and
then run init to build structure on google drive
