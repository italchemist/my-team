MyTeam.Views.Members ||= {}

class MyTeam.Views.Members.ShowView extends Backbone.View
  template: JST["backbone/templates/members/show"]

  render: ->
    @$el.html(@template(@model.toJSON()))
    return this