///<reference path="../typings/all.d.ts"/>

window.define("redmine/enhancedPrioritySorting", ["helpers/urlHelper"], (urlHelper) => {
    function initInteractiveIssuesSorting() {
        var numericPriority;
        return numericPriority = $(".issue td.cf_5.float");
        // TODO: implement this
        //console.log numericPriority
        //numericPriority.size()
        //console.log numericPriority.size()
    }

    if (urlHelper.isRedmineIssuesPage()) {
        return initInteractiveIssuesSorting();
    }
});
