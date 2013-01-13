class MyTeam.Helpers.MenuHelper
  @toggle_team_menus: (show, team_id) ->
    if team_id
      team = MyTeam.get_team(team_id)
      $("#menu-main-index").html("Главная страница " + team.get("name"))
      $("#menu-main-button-title").html(team.get("name"))
    else
      $("#menu-main-button-title").html("Команды")

    $("#menu-main-index").toggle(show)
    $("#menu-main-index-separator").toggle(show)
    $("#menu-main-index").attr("href", "/teams/#{team_id}")

    # Tasks menu for team
    $("#menu-tasks").toggle(show)
    $("#menu-tasks-list").attr("href", "/teams/#{team_id}/tasks")
    $("#menu-tasks-new").attr("href", "/teams/#{team_id}/tasks/new")

  @toggle_user_authenicated: (value) ->
  	$("#menu-users-signin").toggle(!value)
  	$("#menu-users-signup").toggle(!value)
  	$("#menu-users-signout").toggle(value)
