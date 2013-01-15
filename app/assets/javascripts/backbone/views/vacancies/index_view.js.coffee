MyTeam.Views.Vacancies ||= {}

class MyTeam.Views.Vacancies.IndexView extends Backbone.View
  template: JST["backbone/templates/vacancies/index"]

  initialize: () ->
    @options.vacancies.bind("reset", @addAll)
    @options.vacancies.bind("add", @addOne)
    @options.show_header = true unless @options.show_header?
    @options.show_description_as = "column" unless @options.show_description_as?
    @options.show_skills_as = "column" unless @options.show_skills_as?

  addAll: () =>
    @options.vacancies.each(@addOne)

  addOne: (vacancy) =>
    view = new MyTeam.Views.Vacancies.VacancyView
      model: vacancy
      show_description_as: @options.show_description_as
      show_skills_as: @options.show_skills_as
    @$("tbody").append(view.render().el)

  render: =>
    @$el.html(@template({
      show_header: @options.show_header,
      show_description_as: @options.show_description_as
    }))
    @addAll()
    return this