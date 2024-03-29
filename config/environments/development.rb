TechLocator::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  config.cache_store = :dalli_store, 'localhost:11211', { :expires_in => 1.day, :compress => true }
  config.action_controller.perform_caching = false

  # Log error messages when you accidentally call methods on nil.
  config.whiny_nils = true

  # Show full error reports and disable caching
  config.consider_all_requests_local       = true
  #config.action_controller.perform_caching = false

  # Print deprecation notices to the Rails logger
  config.active_support.deprecation = :log

  # Only use best-standards-support built into browsers
  config.action_dispatch.best_standards_support = :builtin

  # Raise exception on mass assignment protection for Active Record models
  config.active_record.mass_assignment_sanitizer = :strict

  # Log the query plan for queries taking more than this (works
  # with SQLite, MySQL, and PostgreSQL)
  config.active_record.auto_explain_threshold_in_seconds = 0.5

  # Do not compress assets
  config.assets.compress = false

  # Expands the lines which load the assets
  # config.assets.debug = true
  
  ### ActionMailer Config
  config.action_mailer.default_url_options = { :host => 'localhost:3000' }
  # A dummy setup for development - deliveries and logged
  config.action_mailer.delivery_method = :sendmail
  config.action_mailer.perform_deliveries = false
  config.action_mailer.raise_delivery_errors = true

  config.middleware.use ExceptionNotifier,
      :email_prefix => "[Exception] ",
      :sender_address => %{"Exception Notifier" <error@weconnectchicago.org>},
      :exception_recipients => %w{derek.eder@gmail.com}
end
