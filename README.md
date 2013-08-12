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
- create google spreadsheet named `pages` inside this `site.collection`
  - each tab in this spreadsheet represents a page
  - value in first row and first column represents a template which will be used by middleman
![Example](/img/spreadsheet.png)
- create google spreadsheet named `data` inside `site.collection`
  - each tab in this spreadsheet represents different list
  - first data cell represents data type, which can be any of `array`, `hash` and `list`
- to display image just use this Middleman helper

```erb
<%= image_tag data.article.article.image %>
```

- to display list type use this

```erb
<% data.blog.blog.each do |blog_post| %>
  <h2><%= blog_post.title %></h2>
  <%= blog_post.content %>
  <span><%= blog_post.date %></span>
<% end %>
```

## Usage

    middle_drive

This command will sync images and page information from your Google Drive collection which was set in
`middle_drive.yml` file.


    middle_drive update

Will search for update spreadsheet inside collection. If first A1 column will include `please update` value it will
sync all other data and clear up update flag. This is useful for circular checking if there are new updates to be
fetched.

## TODO
- http://tvaughan.github.io/middleman-deploy/ + https://github.com/javan/whenever to run middle_drive update
- [Partials](http://middlemanapp.com/templates/) for debug info
- when building from scratch it would be better to start building `pages.yml`, `data.yml`, `en.yml` files locally and
then run init to build structure on google drive
- https://support.google.com/drive/answer/63175
