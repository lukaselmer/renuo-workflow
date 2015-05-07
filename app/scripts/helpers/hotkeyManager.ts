///<reference path="../typings/all.d.ts"/>
///<reference path="../models/hotkey.ts"/>

class HotkeyManager {
    hotkeys:Hotkey[] = [];

    constructor() {
        this.hotkeys = [];
        this.registerHotkey(new Hotkey("Show help", "?", () => this.displayHelp()));
        this.registerHotkey(new Hotkey("Close help", "esc", () => this.hideHelp()));
    }

    // more info for the keyCombination: http://craig.is/killing/mice
    public registerHotkey(hotkey:Hotkey):void {
        this.hotkeys.push(hotkey);
        Mousetrap.bind(hotkey.keyCombination, hotkey.func);
    }

    public displayHelp():void {
        var inner = $("<div></div>").addClass("hotkey-modal-inner");
        this.hotkeys.forEach((hotkey) => {
            $("<div></div>").append(
                $("<div></div>").addClass("key-combination").text(hotkey.keyCombination)
            ).append(
                $("<div></div>").addClass("name").text(hotkey.name)
            ).append(
                $("<div></div>").addClass("clear-both")
            ).appendTo(inner);
        });

        $("<div></div>").addClass("hotkey-modal").append(inner).prependTo($("body"));
    }

    public hideHelp():void {
        $(".hotkey-modal").remove();
    }
}
