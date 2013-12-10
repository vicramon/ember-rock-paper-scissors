App.TableController = Ember.Controller.extend Ember.Evented,

  isPlaying: false

  # refactor, use setInterval
  startCountdown: ->
    @set('countdown', 5)
    Ember.run.later( @, ( -> @set('countdown', 4)), 1000)
    Ember.run.later( @, ( -> @set('countdown', 3)), 2000)
    Ember.run.later( @, ( -> @set('countdown', 2)), 3000)
    Ember.run.later( @, ( -> @set('countdown', 1)), 4000)
    Ember.run.later( @, ( -> @set('countdown', 0)), 5000)

  countdown: ( -> ).property()

  newGame: ->
    @set('isPlaying', true)
    @startCountdown()
    @trigger('resetHand')
    @trigger('bounce')
    Ember.run.later( @, @gameOver, 5000)

  gameOver: ->
    @trigger('aiHand')
    winner = @determineWinner()
    console.log winner
    # display text
    # add to win/lose count
    @set('isPlaying', false)

  determineWinner: ->
    humanChoice = Ember.View.views.human.get('currentType')
    aiChoice = Ember.View.views.ai.get('currentType')
    if @beatTable[humanChoice] is aiChoice
      'human'
    else if @beatTable[aiChoice] is humanChoice
      'ai'
    else
      'tie'

  ## Should be app constant
 
  beatTable: {
    rock: 'scissors'
    scissors: 'paper'
    paper: 'rock'
  }
