class @CollaborativeCursing.AbstractController
  constructor: (action) ->
    @initialize(action)

  initialize: (action) =>
    @[action]()
