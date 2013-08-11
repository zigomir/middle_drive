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

### Middleman setup

    middle_drive init

### Google drive setup conventions

- create a new collection in your google drive. Name it the same like in `middle_drive.yml`'s `site.collection` value.
- create google spreadsheet named `pages` inside this collection. You can name it differently if you specify it for `site.pages`
  - each tab in this spreadsheet represents a page
  - value in first row and first column represents a template which will be used by middleman
![Example](/img/spreadsheet.png)

## Usage

    middle_drive

This command will sync images and page information from your Google Drive collection which was set in
`middle_drive.yml` file.

## TODO
- http://middlemanapp.com/advanced/local-data/
- http://tvaughan.github.io/middleman-deploy/
- [Partials](http://middlemanapp.com/templates/) for debug info

- when building from scratch it would be better to start building `pages.yml`, `data.yml`, `en.yml` files locally and
then run init to build structure on google drive
