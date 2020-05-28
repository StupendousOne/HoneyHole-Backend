Unsplash.configure do |config|
    config.application_access_key = "ACCESS KEY GOES HERE"
    config.application_secret = "APPLICATION SECRET GOES HERE"
    config.application_redirect_uri = "https://your-application.com/oauth/callback"
    config.utm_source = "HoneyHole"
  
    # optional:
    # config.logger = MyCustomLogger.new
  end