App.HandView = Ember.View.extend
  classNames: ['hand']
  classNameBindings: ['handType']
  handType: ( -> @get('side') + '_fist').property()

  didInsertElement: ->
    @get('controller').on('bounce', $.proxy(@bounce, @))

  bounce: ->
    duration = 500
    distance = '250px'
    for i in [0..5]
      @$().animate('padding-top': distance, duration)
        .animate('padding-top': '0px', duration)
