App.TableController = Ember.Controller.extend Ember.Evented,

  isPlaying: false
  winCount: 0
  lossCount: 0
  tieCount: 0

  newGame: ->
    @set('isPlaying', true)
    @trigger('resetHand')
    @trigger('bounce')
    Ember.run.later( @, @gameOver, 3000)

  gameOver: ->
    @trigger('aiHand')
    outcome = @determineWinner()
    @trigger(outcome)
    @updateStats(outcome)
    @set('isPlaying', false)

  updateStats: (outcome) ->
    @incrementProperty(outcome + 'Count')

  determineWinner: ->
    humanChoice = Ember.View.views.human.get('currentType')
    aiChoice = Ember.View.views.ai.get('currentType')
    if @beatTable[humanChoice] is aiChoice
      'human'
    else if @beatTable[aiChoice] is humanChoice
      'ai'
    else
      'tie'

  beatTable: {
    rock: 'scissors'
    scissors: 'paper'
    paper: 'rock'
  }
