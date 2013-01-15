class MyTeam.Routers.VacanciesRouter extends Backbone.Router
  routes:
    "teams/:team_id/vacancies/index"   : "index"
    "teams/:team_id/vacancies/new"     : "create"
    "teams/:team_id/vacancies/:id/edit": "edit"
    "teams/:team_id/vacancies/:id"     : "show"
    "teams/:team_id/vacancies"         : "index"

  initialize: (options) ->
    @app  = MyTeam
    @menu = MyTeam.Helpers.MenuHelper
    @page = $("#page")
    @on("all", @change)

  change: (route, team_id) ->
    @menu.toggle_team_menus(true, team_id)

  index: (team_id) ->
    @render new MyTeam.Views.Vacancies.IndexView(vacancies: @app.get_vacancies(team_id))

  create: (team_id) ->
    @render new MyTeam.Views.Vacancies.NewView(collection: @app.get_vacancies(team_id))

  edit: (team_id, id) ->
    vacancy = @app.get_vacancies(team_id, false).get(id)
    @render new MyTeam.Views.Vacancies.EditView(model: vacancy)
    # todo: вынести в хелпер с передачей списка тэгов. В рендере быть не может ибо плагин в таком случае работает плохо
    $("#skills").textext
      plugins: 'autocomplete tags ajax',
      tags: { items: vacancy.get("skills") }
      ajax: { url: '/api/skills', dataType: 'json' }

  show: (team_id, id) ->
    vacancy = @app.get_vacancies(team_id, false).get(id)
    @render new MyTeam.Views.Vacancies.ShowView(model: vacancy)

  render: (view) ->
    @page.html(view.render().el)