
IMGKit.configure do |config|
   config.wkhtmltoimage = 'C:\wkhtmltopdf\bin\wkhtmltopdf.exe'
   config.default_options = {
     
      :print_media_type => true
    }
    # Use only if your external hostname is unavailable on the server.
  #  config.root_url = "http://localhost"
  #  config.verbose = false

   # config.default_format = :png
  end