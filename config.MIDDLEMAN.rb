require 'yaml'

PAGES = YAML.load(File.open('pages.yml'))
MIDDLE_DRIVE_CONFIG = YAML.load(File.open('middle_drive.yml'))

LANGS = MIDDLE_DRIVE_CONFIG['site']['languages']
DEFAULT_LANGUAGE = MIDDLE_DRIVE_CONFIG['site']['default_language']

###
# Dynamic pages
###
PAGES['pages'].each do |page|
  page_name = page[0]
  template_name = page[1]

  # for each page create default language without locale in url
  proxy page_name,
        "#{template_name}-template.html",
        :locals => { :page_name => page_name, :locale => DEFAULT_LANGUAGE },
        :ignore => true

  LANGS.each do |locale|
    proxy "#{locale}/#{page_name}",
          "#{template_name}-template.html",
          :locals => { :page_name => page_name, :locale => locale },
          :ignore => true
  end
end

###
# Helpers
###
# Methods defined in the helpers block are available in templates
helpers do
  def trans(page_name, key, locale)
    I18n.t("#{page_name}.#{key}", locale: locale)
  end
end

###
# Compass
###

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Reload the browser automatically whenever files change
activate :livereload

# http://middlemanapp.com/advanced/localization/
# set path so all templates can use t helper, otherwise only templates in localizable directory would work
activate :i18n, :path => ''

set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'

# Build-specific configuration
configure :build do
  activate :minify_css
  activate :minify_javascript
  # Use relative URLs
  # activate :relative_assets
  # Or use a different image path
  # set :http_path, "/Content/images/"
end
