///<reference path="../typings/all.d.ts"/>
///<reference path="../helpers/urlHelper.ts"/>
///<reference path="../helpers/hotkeyManager.ts"/>

class RedmineGlobal {
    constructor(public urlHelper, public hotkeyManager) {
        this.initRedmineHotkeys();
    }

    public initRedmineHotkeys() {
        // Global keys
        this.hotkeyManager.registerHotkey("Go to home", "g h", this.redirectTo("/"));

        // Project keys
        this.hotkeyManager.registerHotkey("Go to project issues", "g i", this.redirectTo("%project%/issues"));
        this.hotkeyManager.registerHotkey("Go to project wiki", "g w", this.redirectTo("%project%/wiki"));
        this.hotkeyManager.registerHotkey("Go to project roadmap", "g r", this.redirectTo("%project%/roadmap"));
        this.hotkeyManager.registerHotkey("Go to project time entries", "g t", this.redirectTo("%project%/time_entries"));
        this.hotkeyManager.registerHotkey("Go to project overview", "g o", this.redirectTo("%project%"));
        this.hotkeyManager.registerHotkey("Go to project activity", "g a", this.redirectTo("%project%/activity"));
        this.hotkeyManager.registerHotkey("Go to project settings", "g s", this.redirectTo("%project%/settings"));
        this.hotkeyManager.registerHotkey("Create new issue", "n", this.redirectTo("%project%/issues/new"));

        // Issue keys
        return this.hotkeyManager.registerHotkey("Edit issue", "e", this.redirectTo("%issue%/edit"));
    }

    public redirectTo(suffix) {
        return () => {
            if (suffix.startsWith("%issue%")) {
                return window.location = suffix.replace("%issue%", "/issues/" + (this.urlHelper.getBrowserUrlRaw()[1]));
            } else if (suffix.startsWith("%project%")) {
                return window.location = suffix.replace("%project%", "/projects/" + (this.urlHelper.getBrowserUrlRaw()[1].split("?")[0]));
            } else {
                return window.location = suffix;
            }
        };
    }
}

window.define("redmine/global", [], () => {
    var urlHelper = new UrlHelper();
    var hotkeyManager = new HotkeyManager();
    if (urlHelper.isRedmine()) new RedmineGlobal(urlHelper, hotkeyManager);
});
