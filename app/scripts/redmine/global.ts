///<reference path="../typings/all.d.ts"/>
///<reference path="../helpers/urlHelper.ts"/>
///<reference path="../helpers/hotkeyManager.ts"/>
///<reference path="../models/hotkey.ts"/>

class RedmineGlobal {
    constructor(public urlHelper:UrlHelper, public hotkeyManager:HotkeyManager) {
        this.initRedmineHotkeys();
    }

    public initRedmineHotkeys():void {
        // Global keys
        this.hotkeyManager.registerHotkey(new Hotkey("Go to home", "g h", this.redirectTo("/")));

        // Project keys
        this.hotkeyManager.registerHotkey(new Hotkey("Go to project issues", "g i", this.redirectTo("%project%/issues")));
        this.hotkeyManager.registerHotkey(new Hotkey("Go to project wiki", "g w", this.redirectTo("%project%/wiki")));
        this.hotkeyManager.registerHotkey(new Hotkey("Go to project roadmap", "g r", this.redirectTo("%project%/roadmap")));
        this.hotkeyManager.registerHotkey(new Hotkey("Go to project time entries", "g t", this.redirectTo("%project%/time_entries")));
        this.hotkeyManager.registerHotkey(new Hotkey("Go to project overview", "g o", this.redirectTo("%project%")));
        this.hotkeyManager.registerHotkey(new Hotkey("Go to project activity", "g a", this.redirectTo("%project%/activity")));
        this.hotkeyManager.registerHotkey(new Hotkey("Go to project settings", "g s", this.redirectTo("%project%/settings")));
        this.hotkeyManager.registerHotkey(new Hotkey("Create new issue", "n", this.redirectTo("%project%/issues/new")));

        // Issue keys
        this.hotkeyManager.registerHotkey(new Hotkey("Edit issue", "e", this.redirectTo("%issue%/edit")));
    }

    public redirectTo(suffix:string):() => void {
        return () => {
            if (suffix.startsWith("%issue%"))
                window.location.assign(suffix.replace("%issue%", "/issues/" + (this.urlHelper.getBrowserUrlRaw()[1])));
            else if (suffix.startsWith("%project%"))
                window.location.assign(suffix.replace("%project%", "/projects/" + (this.urlHelper.getBrowserUrlRaw()[1].split("?")[0])));
            else
                window.location.assign(suffix);
        };
    }
}
