App.HandView = Ember.View.extend()
App.AIHandView = App.HandView.extend

  didInsertElement: ->
    @_super()
    @get('controller').on('aiHand', $.proxy(@aiHand, @))
    @get('controller').on('resetHand', $.proxy(@resetHand, @))

  aiHand: -> @set('typeIndex', @randomInteger(0, 2))

  randomInteger: (min, max) ->
    return Math.floor(Math.random() * (max - min + 1) + min)

  resetHand: -> @set('typeIndex', 0)
