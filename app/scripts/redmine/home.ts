///<reference path="../typings/all.d.ts"/>

window.define("redmine/home", ["helpers/urlHelper"], (urlHelper) => {
    function addIssues(leftInner) {
        var issuesList;
        $("<h3>Issues</h3>").appendTo(leftInner);
        issuesList = $("<ul></ul>");
        function addIssueLink(name, url) {
            var link;
            link = $("<a></a>").text(name).attr("href", url);
            return $("<li></li>").addClass("quicksearchable-home").append(link).appendTo(issuesList);
        }
        addIssueLink("Issues", "/issues");
        addIssueLink("Backlog (to estimate)", "/issues?query_id=31");
        addIssueLink("Backlog (in progress)", "/issues?query_id=35");
        addIssueLink("Backlog (to assign)", "/issues?query_id=33");
        addIssueLink("Backlog (to agree)", "/issues?query_id=32");
        addIssueLink("My Tickets", "/issues?query_id=14");
        return leftInner.append(issuesList);
    }

    function addProjects(leftInner) {
        var list;
        $("<h3>All projects </h3>").appendTo(leftInner);
        list = $("<ul></ul>");
        $("#project_quick_jump_box option").each((_index, value) => {
            var link, project, url;
            url = $(value).val();
            project = $(value).text();
            link = $("<a></a>").text(project).attr("href", url);
            if (url && url !== "") {
                return $("<li></li>").addClass("quicksearchable-home").append(link).appendTo(list);
            }
        });  //project_quick_jump_box option').each (_index, value) ->
        return leftInner.append(list);
    }

    function initSearch(leftInner) {
        leftInner.append($("<input>").attr("id", "quicksearch"));
        $("#quicksearch").bind("keyup change input", (event) => {
            var search;
            search = $("#quicksearch").val().toLowerCase();  //quicksearch').val().toLowerCase()
            return $(".quicksearchable-home").each((_id, value) => {
                if ($(value).text().toLowerCase().indexOf(search) === -1) {
                    return $(value).hide();
                } else {
                    return $(value).show();
                }
            });
        }).bind("keyup", (event) => {
            if (event.keyCode !== 13) {  // enter
                return;
            }
            return $(".quicksearchable-home:visible").children()[0].click();
        });  //quicksearch').bind('keyup change input', (event) ->
        return $("#quicksearch").focus();  //quicksearch').focus()
    }

    function initRedmineHomePage() {
        var left, leftInner;
        left = $(".splitcontentleft");
        leftInner = $("<div></div").addClass("projects box").appendTo(left);

        initSearch(leftInner);
        addIssues(leftInner);
        return addProjects(leftInner);
    }

    if (urlHelper.isRedmineHomePage()) {
        return initRedmineHomePage();
    }
});
