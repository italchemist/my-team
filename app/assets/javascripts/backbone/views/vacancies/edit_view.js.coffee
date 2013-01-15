MyTeam.Views.Vacancies ||= {}

class MyTeam.Views.Vacancies.EditView extends Backbone.View
  template: JST["backbone/templates/vacancies/edit"]

  events:
    "submit #edit-vacancy": "update"
    "click #save"         : "update"

  update: (e) ->
    e.preventDefault()
    e.stopPropagation()

    skills = $("#skills").textext()[0].tags()._formData
    @model.set("skills", skills)

    @team_id = @model.get("team_id")
    @model.save(null,
      success: (task) =>
        @model = task
        Backbone.history.navigate("/teams/#{@team_id}/vacancies", true)
        MyTeam.Helpers.NoticeHelper.success("Вакансия", "Вакансия сохранена")
    )

  render: ->
    @$el.html(@template(@model.toJSON()))
    @$("form").backboneLink(@model)
    return this