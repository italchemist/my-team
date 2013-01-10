MyTeam.Views.Welcome ||= {}

class MyTeam.Views.Welcome.IndexView extends Backbone.View
  template: JST["backbone/templates/welcome/index"]

  render: =>
    @$el.html(@template())
    return this
