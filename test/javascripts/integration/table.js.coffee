module "Integration: Table",
  setup: => @standardSetup()
  teardown: => @standardTeardown()

test 'Header ok', ->
  visit('/')
  ok exists("h3:contains('Ember Rock Paper Scissors')"), 'Header ok'
