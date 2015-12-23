# config/initializers/compression.rb

Rails.application.configure do
  # Use environment names or environment variables:
  break if !Rails.env.production? && ENV['ENABLE_COMPRESSION'] != '1'


  # Strip all comments from JavaScript files, even copyright notices.
  # By doing so, you are legally required to acknowledge
  # the use of the software somewhere in your Web site or app:
  uglifier = Uglifier.new output: { comments: :none }

  # To keep all comments instead or only keep copyright notices (the default):
  # uglifier = Uglifier.new output: { comments: :all }
  # uglifier = Uglifier.new output: { comments: :copyright }

  config.assets.compile = true
  config.assets.debug = false

  config.assets.js_compressor = uglifier
  config.assets.css_compressor = :sass

  config.middleware.use Rack::Deflater
  config.middleware.insert_before ActionDispatch::Cache, Rack::Deflater

  config.middleware.use HtmlCompressor::Rack,
                        compress_css: true,
                        compress_javascript: true,
                        css_compressor: Sass,
                        enabled: true,
                        javascript_compressor: uglifier,
                        preserve_line_breaks: false,
                        remove_comments: true,
                        remove_form_attributes: false,
                        remove_http_protocol: false,
                        remove_https_protocol: false,
                        remove_input_attributes: true,
                        remove_intertag_spaces: false,
                        remove_javascript_protocol: true,
                        remove_link_attributes: true,
                        remove_multi_spaces: true,
                        remove_quotes: true,
                        remove_script_attributes: true,
                        remove_style_attributes: true,
                        simple_boolean_attributes: true,
                        simple_doctype: false




  # caching
  config.middleware.use Rack::PageCaching,
    # Directory where the pages are stored. Defaults to the public folder in
    # Rails, but you'll probably want to customize this
    page_cache_directory: Rails.root.join('public'),
    # Gzipped version of the files are generated with compression level
    # specified. It accepts the symbol versions of the constants in Zlib,
    # e.g. :best_speed and :best_compression. To turn off gzip, pass in false.
    gzip: :best_speed,
    # Hostnames can be included in the path of the page cache. Default is false.
    include_hostname: false
end