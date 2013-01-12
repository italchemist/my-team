// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require underscore
//= require backbone
//= require backbone_rails_sync
//= require backbone_datalink
//= require backbone/my_team
//= require_tree .

$(function() {
  $("a.btn").live("click", function(e) {
    e.preventDefault();
    href = $(this).attr("href");
    if (href != "#") {
    	Backbone.history.navigate(href, true);
    }
  });

  $("a.lnk").live("click", function(e) {
    e.preventDefault();
    Backbone.history.navigate($(this).attr("href"), true);
  });  

  $("#menu-users-signout").live("click", function(e) {
    e.preventDefault();
    $.ajax({url:$(this).attr("href"), type:"delete"});
    MyTeam.Helpers.MenuHelper.toggle_user_authenicated(false)
    Backbone.history.navigate("/", true);
  });
});

