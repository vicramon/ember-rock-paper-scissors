App.HandView.reopen
  classNames: ['hand']
  classNameBindings: ['handType']

  handType: (
    -> @get('side') + '_' + @get('currentType')
  ).property('side', 'currentType')

  didInsertElement: ->
    @get('controller').on('bounce', => @bounce())

  bounce: ->
    duration = App.BounceDuration
    distance = '100px'
    for i in [0..2]
      @$().animate('margin-top': distance, duration)
        .animate('margin-top': '0px', duration)

  currentType: ( ->
    App.HandTypes[@get('typeIndex')]
  ).property('typeIndex')

  typeIndex: 0
