App.FistView = Ember.View.extend
  classNames: ['hand']
  classNameBindings: ['handType']

  handType: ( ->
    @get('side') + '_fist'
  ).property()

  click: ->
    console.log 'clicked'
