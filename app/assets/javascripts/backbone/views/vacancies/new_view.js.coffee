MyTeam.Views.Vacancies ||= {}

class MyTeam.Views.Vacancies.NewView extends Backbone.View
  template: JST["backbone/templates/vacancies/new"]

  events:
    "submit #new-vacancy": "save"

  constructor: (options) ->
    super(options)
    @team_id = @collection.team_id
    @model   = new @collection.model()
    @model.set("team_id", @team_id)
    @model.bind("change:errors", () => this.render())

  save: (e) ->
    e.preventDefault()
    e.stopPropagation()

    skills = $("#skills").textext()[0].tags()._formData
    @model.set("skills", skills)

    @model.unset("errors")
    @collection.create(@model.toJSON(),
      success: (task) =>
        @model = task
        Backbone.history.navigate("/teams/#{@team_id}/vacancies", true)
        MyTeam.Helpers.NoticeHelper.success("Вакансия", "Вакансия создана")
      error: (task, jqXHR) =>
        @model.set({errors: $.parseJSON(jqXHR.responseText)})
    )

  render: ->
    @$el.html(@template(@model.toJSON()))
    @$("#skills").textext
      plugins : 'autocomplete tags ajax',
      ajax : {
        url : '/api/skills',
        dataType : 'json'
      }
    @$("form").backboneLink(@model)
    return this