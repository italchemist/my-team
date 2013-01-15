MyTeam.Views.Vacancies ||= {}

class MyTeam.Views.Vacancies.SearchView extends Backbone.View
  template: JST["backbone/templates/vacancies/search"]

  events:
    "submit #search-vacancy": "search"

  initialize: () ->
    @vacancies = new MyTeam.Collections.VacanciesCollection
    @vacancies.bind("reset", @addAll)

  addAll: () =>
    @vacancies.each(@addOne)

  addOne: (vacancy) =>
    view = new MyTeam.Views.Vacancies.VacancyView(model: vacancy)
    @$("#vacancies-list").append(view.render().el)

  search: (e) ->
    e.preventDefault()
    e.stopPropagation()
    skills = $("#skills").textext()[0].tags()._formData.join(",")

    @$("#vacancies-list").html(null)
    @vacancies.url = "/api/vacancies/search/#{skills}"
    @vacancies.fetch()

  render: =>
    @$el.html(@template())
    @$("#skills").textext
      plugins : 'autocomplete filter tags ajax',
      ajax : {
        url : '/api/skills',
        dataType : 'json'
      }
    return this