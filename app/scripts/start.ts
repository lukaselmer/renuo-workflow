///<reference path="redmine/global.ts"/>
///<reference path="redmine/home.ts"/>
///<reference path="redmine/enhancedPrioritySorting.ts"/>

$(
    () => {
        var urlHelper = new UrlHelper();
        var hotkeyManager = new HotkeyManager();

        if (urlHelper.isRedmineIssuesPage()) new EnhancedPrioritySorting();
        if (urlHelper.isRedmine()) new RedmineGlobal(urlHelper, hotkeyManager);
        if (new UrlHelper().isRedmineHomePage()) initRedmineHomePage();
    }
)
