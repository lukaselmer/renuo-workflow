///<reference path="../typings/all.d.ts"/>

class HotkeyManager {
    hotkeys = [];

    constructor() {
        this.hotkeys = [];
        this.registerHotkey("Show help", "?", () => this.displayHelp());
        this.registerHotkey("Close help", "esc", () => this.hideHelp());
    }

    // more info for the keyCombination: http://craig.is/killing/mice
    public registerHotkey(name, keyCombination, func) {
        this.hotkeys.push([keyCombination, name]);
        return Mousetrap.bind(keyCombination, func);
    }

    public displayHelp() {
        var inner, keyCombination, modal, name;
        inner = $("<div></div>").addClass("hotkey-modal-inner");
        this.hotkeys.forEach((hotkey) => {
            keyCombination = hotkey[0], name = hotkey[1];
            return $("<div></div>").append($("<div></div>").addClass("key-combination").text(keyCombination)).append($("<div></div>").addClass("name").text(name)).append($("<div></div>").addClass("clear-both")).appendTo(inner);
        });

        return modal = $("<div></div>").addClass("hotkey-modal").append(inner).prependTo($("body"));
    }

    public hideHelp() {
        return $(".hotkey-modal").remove();
    }
}
