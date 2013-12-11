module "Integration: User plays game",
  setup: => @standardSetup()
  teardown: => @standardTeardown()

test 'Header loads', ->
  visit '/'
  ok exists("h3:contains('Ember Rock Paper Scissors')"), 'Header ok'

test 'Hands are visible and default to rock', ->
  visit '/'
  ok exists '#human.left_rock'
  ok exists '#ai.right_rock'

test 'The AI throws a hand after the game duration', ->
  visit '/'
  aiThrowsPaper()
  click('.play_button').then ->
    ok exists('#ai.right_paper')


test "User can click on hand to change it's type", ->
  visit '/'
  click('#human').then ->
    ok exists '#human.left_paper'
  click('#human').then ->
    ok exists '#human.left_scissors'
  click('#human').then ->
    ok exists '#human.left_rock'

test 'Game increments counters properly', ->
  visit '/'
  aiThrowsPaper()
  click('.play_button').then ->
    ok exists('#human.left_rock')
    ok exists('#ai.right_paper')
    ok exists(".stat:contains('Losses: 1')")

  click('#human')
  click('.play_button').then ->
    ok exists('#human.left_paper')
    ok exists('#ai.right_paper')
    ok exists(".stat:contains('Ties: 1')")

  click('#human')
  click('.play_button').then ->
    ok exists('#human.left_scissors')
    ok exists('#ai.right_paper')
    ok(exists(".stat:contains('Wins: 1')"))

@aiThrowsPaper = ->
  sinon.stub(Ember.View.views.ai, 'randomInteger', -> 1)
