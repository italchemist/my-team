MyTeam.Views.Teams ||= {}

class MyTeam.Views.Teams.TeamView extends Backbone.View
  template: JST["backbone/templates/teams/team"]

  events:
    "click .destroy" : "destroy"

  tagName: "li"
  className: "span4 relative"  

  destroy: () ->
    @model.destroy()
    this.remove()

    return false

  render: ->
    @$el.html(@template(@model.toJSON() ))
    return this
