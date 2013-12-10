App.HandView = Ember.View.extend
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


  ## Human Only

  changeType: ->
    typeIndex = @get('typeIndex')
    @set('typeIndex', (typeIndex += 1))
    @set('typeIndex', 0) if @get('typeIndex') is 3

  click: -> @changeType() if @get('controller.isPlaying')


  ## AI Only

  didInsertElement: ->
    @_super()
    @get('controller').on('aiHand', $.proxy(@aiHand, @))
    @get('controller').on('resetHand', $.proxy(@resetHand, @))

  aiHand: ->
    @set('typeIndex', @randomInteger(0, 2)) if @get('isAI')

  randomInteger: (min, max) ->
    return Math.floor(Math.random() * (max - min + 1) + min)

  resetHand: -> @set('typeIndex', 0)

  isAI: ( ->
    true if @get('elementId') is 'ai'
  ).property('id')


  ## Should be global variable

  typeList: ['rock', 'paper', 'scissors']
