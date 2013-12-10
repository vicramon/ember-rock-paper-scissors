App.PlayButtonView = Ember.View.extend
  tagName: 'input'
  classNames: ['play_button']
  attributeBindings: ['value', 'type', 'disabled']
  value: "Play rock paper scissors"
  type: 'submit'
  disabled: false

  click: ->
    @get('controller').newGame()

  disabled: ( ->
    'disabled' if @get('controller.isPlaying')
  ).property('controller.isPlaying')
