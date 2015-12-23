Rails.application.configure do
  config.middleware.use Rack::PageCaching,
    # Directory where the pages are stored. Defaults to the public folder in
    # Rails, but you'll probably want to customize this
    page_cache_directory: Rails.root.join('public'),
    # Gzipped version of the files are generated with compression level
    # specified. It accepts the symbol versions of the constants in Zlib,
    # e.g. :best_speed and :best_compression. To turn off gzip, pass in false.
    gzip: :best_speed,
    # Hostnames can be included in the path of the page cache. Default is false.
    include_hostname: true
end