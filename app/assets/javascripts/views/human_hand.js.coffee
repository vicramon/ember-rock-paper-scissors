App.HumanHandView = App.HandView.extend

  click: -> @changeType()

  changeType: ->
    typeIndex = @get('typeIndex')
    @set('typeIndex', (typeIndex += 1))
    @set('typeIndex', 0) if @get('typeIndex') is 3
