#= require application
#= require_tree .
#= require_self

Em.set('App.rootElement', "#ember-testing")
App.setupForTesting()
App.injectTestHelpers()

@exists = (selector) ->
  !!find(selector).length

@standardTeardown = -> App.reset()
@standardSetup = -> Ember.run App, App.advanceReadiness
