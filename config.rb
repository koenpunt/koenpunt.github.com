###
# Blog settings
###

Time.zone = "Europe/Amsterdam"

activate :blog do |blog|
  # blog.prefix = "blog"
  blog.permalink = "blog/:year/:month/:day/:title.html"
  blog.sources = "blog/:year-:month-:day-:title.html"
  blog.taglink = "blog/tags/:tag.html"
  # blog.layout = "layout"
  blog.summary_separator = /READMORE/
  # blog.summary_length = 250
  blog.year_link = "blog/:year.html"
  blog.month_link = "blog/:year/:month.html"
  blog.day_link = "blog/:year/:month/:day.html"
  # blog.default_extension = ".markdown"

  blog.tag_template = "tag.html"
  blog.calendar_template = "calendar.html"

  # blog.paginate = true
  # blog.per_page = 10
  # blog.page_link = "blog/page/:num"
end

activate :directory_indexes
page "/blog/feed.xml", :layout => false

###
# Renderers
###
set :markdown_engine, :redcarpet
set :markdown, :fenced_code_blocks => true, :smartypants => true

activate :syntax, line_numbers: true

###
# Compass
###

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Helpers
###

# Automatic image dimensions on image_tag helper
activate :automatic_image_sizes

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

set :css_dir, 'stylesheets'

set :js_dir, 'javascripts'

set :images_dir, 'images'

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  # activate :minify_css
  
  # Minify Javascript on build
  # activate :minify_javascript
  
  # Enable cache buster
  # activate :cache_buster
  
  # Use relative URLs
  # activate :relative_assets
  
  # Compress PNGs after build
  # First: gem install middleman-smusher
  # require "middleman-smusher"
  # activate :smusher
  
  # Or use a different image path
  # set :http_path, "/Content/images/"
end
