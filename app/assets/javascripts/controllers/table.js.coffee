App.TableController = Ember.Controller.extend Ember.Evented,

  isPlaying: false

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
    @trigger('bounce')
    Ember.run.later( @, @gameOver, 6000)

  gameOver: ->
    @set('isPlaying', false)
