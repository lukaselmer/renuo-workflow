'use strict'

class HotkeyManager
  constructor: ->
    @hotkeys = []
    @registerHotkey('Show help', '?', () => @displayHelp())
    @registerHotkey('Close help', 'esc', () => @hideHelp())

  # more info for the keyCombination: https://github.com/madrobby/keymaster
  registerHotkey: (name, keyCombination, func) ->
    @hotkeys.push [keyCombination, name]
    window.Mousetrap.bind(keyCombination, func)

  displayHelp: () ->
    inner = $('<div></div>').addClass('hotkey-modal-inner')
    for hotkey in @hotkeys
      [keyCombination, name] = hotkey
      $('<div></div>')
      .append($('<div></div>').addClass('key-combination').text(keyCombination))
      .append($('<div></div>').addClass('name').text(name))
      .append($('<div></div>').addClass('clear-both'))
      .appendTo(inner)

    modal = $('<div></div>').addClass('hotkey-modal').append(inner).prependTo($('body'))

  hideHelp: () ->
    $('.hotkey-modal').remove()

define 'helpers/hotkeyManager', [], -> new HotkeyManager()
