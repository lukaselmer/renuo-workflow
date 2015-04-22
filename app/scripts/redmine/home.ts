///<reference path="../typings/all.d.ts"/>
///<reference path="../helpers/urlHelper.ts"/>

function addIssues(leftInner:JQuery) {
    $("<h3>Issues</h3>").appendTo(leftInner);
    var issuesList = $("<ul></ul>");

    function addIssueLink(name, url) {
        var link = $("<a></a>").text(name).attr("href", url);
        $("<li></li>").addClass("quicksearchable-home").append(link).appendTo(issuesList);
    }

    addIssueLink("Issues", "/issues");
    addIssueLink("Backlog (to estimate)", "/issues?query_id=31");
    addIssueLink("Backlog (in progress)", "/issues?query_id=35");
    addIssueLink("Backlog (to assign)", "/issues?query_id=33");
    addIssueLink("Backlog (to agree)", "/issues?query_id=32");
    addIssueLink("My Tickets", "/issues?query_id=14");
    leftInner.append(issuesList);
}

function addProjects(leftInner:JQuery) {
    $("<h3>All projects </h3>").appendTo(leftInner);
    var list = $("<ul></ul>");
    $("#project_quick_jump_box option").each((_index, value) => {
        var url = $(value).val();
        var project = $(value).text();
        var link = $("<a></a>").text(project).attr("href", url);
        if (url && url !== "") $("<li></li>").addClass("quicksearchable-home").append(link).appendTo(list);
    });
    leftInner.append(list);
}

function initSearch(leftInner:JQuery) {
    leftInner.append($("<input>").attr("id", "quicksearch"));
    $("#quicksearch").bind("keyup change input", (event) => {
        var search = $("#quicksearch").val().toLowerCase();
        $(".quicksearchable-home").each((_id, value) => {
            if ($(value).text().toLowerCase().indexOf(search) === -1) {
                return $(value).hide();
            } else {
                return $(value).show();
            }
        });
    }).bind("keyup", (event) => {
        if (event.keyCode == 13) $(".quicksearchable-home:visible").children()[0].click(); // enter
    });
    $("#quicksearch").focus();
}

function initRedmineHomePage():void {
    var left = $(".splitcontentleft");
    var leftInner:JQuery = $("<div></div>").addClass("projects box").appendTo(left);
    initSearch(leftInner);
    addIssues(leftInner);
    addProjects(leftInner);
}

