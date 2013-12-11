App.TableView = Ember.View.extend
  tagName: 'section'
  classNames: ['table']

  didInsertElement: ->
    @get('controller').on('win', @showWinMessage)
    @get('controller').on('loss', @showLossMessage)
    @get('controller').on('tie', @showTieMessage)

  showWinMessage: -> $('#win_message').show().delay(3000).fadeOut()
  showLossMessage: -> $('#loss_message').show().delay(3000).fadeOut()
  showTieMessage: -> $('#tie_message').show().delay(3000).fadeOut()
