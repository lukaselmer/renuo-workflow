"use strict";

$(function(){
  init();

  function init(){
    if(isRedmineHomePage()) initRedmineHomePage();
  }

  function getBrowserDomain(){
    return window.location.href.split("/")[2];
  }
  
  function getBrowserUrl(){
    return window.location.href.split("/")[3];
  }
  
  function isRedmineHomePage(){
    return getBrowserDomain() === "redmine.renuo.ch" && getBrowserUrl() === "";
  }
  
  function initRedmineHomePage(){
    var left = $(".splitcontentleft");
    var leftInner = $("<div></div").addClass("projects box").appendTo(left);
    $("<h3>All projects </h3>").append($("<input>").attr("id", "quicksearch")).appendTo(leftInner);
    var list = $("<ul></ul>");

    $("#project_quick_jump_box option").each(function(_index, value){
      var url = $(value).val();
      var project = $(value).text();
      var link = $("<a></a>").text(project).attr("href", url);
      
      if(url && url !== ""){
        $("<li></li>").addClass("project-filterable").append(link).appendTo(list);
      }
    });
    leftInner.append(list);
    
    $("#quicksearch").bind("keyup change input", function(){
      var search = $("#quicksearch").val().toLowerCase();
      $(".project-filterable").each(function(_id, value){
        if($(value).text().toLowerCase().indexOf(search) == -1){
          $(value).hide();
        } else{
          $(value).show();
        }
      });
    });
    
    $("#quicksearch").focus();
  }
});
