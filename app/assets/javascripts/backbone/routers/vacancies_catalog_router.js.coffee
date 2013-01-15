class MyTeam.Routers.VacanciesCatalogRouter extends Backbone.Router
  routes:
    "vacancies/index"   : "index"
    "vacancies/:id"     : "show"
    "vacancies"         : "index"

  initialize: (options) ->
    @page = $("#page")
    @on("all", @change)

  index: ->
    @render new MyTeam.Views.Vacancies.SearchView()

  show: (id) ->
    team = @app.get_teams().get(id)
    @render new MyTeam.Views.Teams.ShowView(model: team)

  render: (view) ->
    @page.html(view.render().el)