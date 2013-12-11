App.TableController = Ember.Controller.extend Ember.Evented,

  isPlaying: false

  newGame: ->
    @set('isPlaying', true)
    @startCountdown()
    @trigger('resetHand')
    @trigger('bounce')
    Ember.run.later( @, @gameOver, 3000)

  gameOver: ->
    @trigger('aiHand')
    winner = @determineWinner()
    @showMessages(winner)
    # add to win/lose count
    @set('isPlaying', false)

  showMessages: (winner) ->
    console.log winner
    if winner is 'human'
      @trigger('win')
    else if winner is 'ai'
      @trigger('loss')
    else
      @trigger('tie')

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
