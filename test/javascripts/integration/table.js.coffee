module "Integration: Table",
  setup: => @standardSetup()
  teardown: => @standardTeardown()

test 'Header ok', ->
  visit '/'
  ok exists("h3:contains('Ember Rock Paper Scissors')"), 'Header ok'

test 'Fists are visible', ->
  visit '/'
  ok exists '.left_rock'
  ok exists '.right_rock'
