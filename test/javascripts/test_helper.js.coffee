#= require application
#= require sinon
#= require_tree .
#= require_self

Em.set('App.rootElement', "#ember-testing")
App.setupForTesting()
App.injectTestHelpers()

Em.set('App.GameDuration', 1)
Em.set('App.BounceDuration', 0)
Em.set('App.MessageDuration', 0)

@exists = (selector) ->
  !!find(selector).length

@standardTeardown = -> App.reset()
@standardSetup = -> Em.run App, App.advanceReadiness
