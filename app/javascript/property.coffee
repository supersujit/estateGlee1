class HT.Property
  constructor: (options) ->
    console.log('in property constructor')
    @container = options.container
    @init()

  init: () =>
    console.log('initing...')
