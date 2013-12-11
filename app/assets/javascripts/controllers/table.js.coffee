App.TableController = Ember.Controller.extend Ember.Evented,

  isPlaying: false
  winCount: 0
  lossCount: 0
  tieCount: 0

  newGame: ->
    @set('isPlaying', true)
    @trigger('resetHand')
    @trigger('bounce')
    Ember.run.later( @, @gameOver, App.GameDuration)

  gameOver: ->
    @trigger('chooseAIHand')
    outcome = @determineWinner()
    @trigger(outcome)
    @updateStats(outcome)
    @set('isPlaying', false)

  updateStats: (outcome) -> @incrementProperty(outcome + 'Count')

  determineWinner: ->
    humanChoice = Ember.View.views.human.get('currentType')
    aiChoice = Ember.View.views.ai.get('currentType')
    if App.BeatTable[humanChoice] is aiChoice
      'win'
    else if App.BeatTable[aiChoice] is humanChoice
      'loss'
    else
      'tie'
