MyTeam.Views.Vacancies ||= {}

class MyTeam.Views.Vacancies.ShowView extends Backbone.View
  template: JST["backbone/templates/vacancies/show"]

  events:
    "click .destroy": "destroy"

  destroy: (e) ->
    e.preventDefault()
    e.stopPropagation()

    @team_id = @model.get("team_id")
    @model.destroy()
    this.remove()

    Backbone.history.navigate("/teams/#{@team_id}/vacancies", true)

    return false

  render: ->
    @$el.html(@template(@model.toJSON()))
    return this