EmberDataRailsExample::Application.configure do
  config.assets.precompile << '*.js.coffee'
  config.assets.precompile << '*.js'
  config.assets.precompile << '*.css'
  config.assets.precompile << '*.sass'
  config.cache_classes = true
  config.eager_load = true
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true
  config.serve_static_assets = false
  config.assets.js_compressor = :uglifier
  config.assets.compile = false
  config.assets.digest = true
  config.assets.version = '1.0'
  config.log_level = :info
  config.i18n.fallbacks = true
  config.active_support.deprecation = :notify
  config.log_formatter = ::Logger::Formatter.new
  config.ember.variant = :production
end
