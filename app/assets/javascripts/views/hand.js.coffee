App.HandView = Ember.View.extend
  classNames: ['hand']
  classNameBindings: ['handType']

  handType: (
    -> @get('side') + '_' + @get('currentType')
  ).property('side', 'currentType')

  didInsertElement: ->
    @get('controller').on('bounce', $.proxy(@bounce, @))
    @get('controller').on('aiHand', $.proxy(@aiHand, @))
    @get('controller').on('resetHand', $.proxy(@resetHand, @))

  bounce: ->
    duration = 500
    distance = '100px'
    for i in [0..4]
      @$().animate('margin-top': distance, duration)
        .animate('margin-top': '0px', duration)

  resetHand: -> @set('typeIndex', 0)

  click: -> @changeType() unless @get('isAI')

  isAI: ( ->
    true if @get('elementId') is 'ai'
  ).property('id')

  currentType: ( ->
    @typeList[@get('typeIndex')]
  ).property('typeIndex')

  changeType: ->
    typeIndex = @get('typeIndex')
    @set('typeIndex', (typeIndex += 1))
    @set('typeIndex', 0) if @get('typeIndex') is 3

  typeIndex: 0
  typeList: ['rock', 'paper', 'scissors']

  aiHand: ->
    @set('typeIndex', @randomInteger(0, 2)) if @get('isAI')

  randomInteger: (min, max) ->
    return Math.floor(Math.random() * (max - min + 1) + min)

