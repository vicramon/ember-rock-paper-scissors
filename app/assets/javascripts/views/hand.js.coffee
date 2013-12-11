App.HandView.reopen
  classNames: ['hand']
  classNameBindings: ['handType']

  handType: (
    -> @get('side') + '_' + @get('currentType')
  ).property('side', 'currentType')

  didInsertElement: ->
    @get('controller').on('bounce', $.proxy(@bounce, @))

  bounce: ->
    duration = 500
    distance = '100px'
    for i in [0..4]
      @$().animate('margin-top': distance, duration)
        .animate('margin-top': '0px', duration)

  currentType: ( ->
    @typeList[@get('typeIndex')]
  ).property('typeIndex')

  typeIndex: 0

  ## Should be app constants

  typeList: ['rock', 'paper', 'scissors']
