///<reference path="../typings/all.d.ts"/>
///<reference path="../helpers/urlHelper.ts"/>

window.define("redmine/enhancedPrioritySorting", [], () => {
    function initInteractiveIssuesSorting() {
        var numericPriority;
        numericPriority = $(".issue td.cf_5.float");
        // TODO: implement this
        //console.log numericPriority
        //numericPriority.size()
        //console.log numericPriority.size()
    }

    if (new UrlHelper().isRedmineIssuesPage()) {
        initInteractiveIssuesSorting();
    }
});
