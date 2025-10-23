local wm                           = require("wm")
local spaces                       = require("spaces")
local apps                         = require("appSwitcher")

--------------------------------------------------------------------------------
-- CONSTANTS
--------------------------------------------------------------------------------
local cmdAlt                       = { "cmd", "alt" }
local cmdAltCtrl                   = { "cmd", "alt", "ctrl" }
local cmdShiftCtrl                 = { "cmd", "shift", "ctrl" }
local cmdShift                     = { "cmd", "shift" }
local cmd                          = { "cmd" }
local ctrl                         = { "ctrl" }
local cmdCtrl                      = { "cmd", "ctrl" }
local openmash                     = { "alt" }
local alt                          = { "alt" }

hs.window.animationDuration        = 0
-- hs.application.enableSpotlightForNameSearches(true)

-- Make the alerts look nicer.
hs.alert.defaultStyle.strokeColor  = { white = 1, alpha = 0 }
hs.alert.defaultStyle.fillColor    = { hex = "#d0d0db", alpha = 0.75 }
hs.alert.defaultStyle.radius       = 7
hs.alert.defaultStyle.atScreenEdge = 0
hs.alert.defaultStyle.textColor    = { white = 0, alpha = 0.75 }

--------------------------------------------------------------------------------
-- HOTKEYS
--------------------------------------------------------------------------------

function config()
    -- Open apps
    local key2App = {
        -- w = 'Microsoft Edge',
        -- w = 'Arc',
        -- w = 'Orion',
        w = 'Vivaldi',
        a = 'kitty',
        f = 'Finder',
        s = 'Slack',
        -- h = 'Insomnia',
        i = 'Spark Desktop',
        t = 'Telegram',
        x = 'Fork',
        m = 'Spotify',
        -- m = 'Music',
        n = 'Notion',
        e = 'Visual Studio Code - Insiders',
        c = 'ChatGPT',
    }

    for key, name in pairs(key2App) do
        hs.hotkey.bind(openmash, key, apps.launchOrFocusWin(name))
    end

    hs.hotkey.bind(openmash, ',', apps.launchOrFocusWin('System Preferences'))
    hs.hotkey.bind(ctrl, 'j', function() hs.eventtap.keyStroke({}, 'down', 1000) end)
    hs.hotkey.bind(ctrl, 'k', function() hs.eventtap.keyStroke({}, 'up', 1000) end)

    hs.hotkey.bind(cmdAlt, "R", function()
        hs.reload()
    end)

    bindTilingHotkeys()
    bindMouseKeys()
    bindSpacesHotkeys()

    -- Enable swipe gesture for cursor centering
    local swipeGesture = require("test")
    swipeGesture.start()

    hs.hotkey.bind(cmdCtrl, "tab", function()
        hs.hints.windowHints()
    end)
end

function bindTilingHotkeys()
    hs.hotkey.bind(cmdAlt, "left", function()
        local win = hs.window.focusedWindow()
        wm.left(win)
    end)

    hs.hotkey.bind(cmdAlt, "right", function()
        local win = hs.window.focusedWindow()
        wm.right(win)
    end)

    hs.hotkey.bind(cmdCtrl, "left", function()
        local win = hs.window.focusedWindow()
        wm.leftThird(win)
    end)

    hs.hotkey.bind(cmdCtrl, "down", function()
        local win = hs.window.focusedWindow()
        wm.centerThird(win)
    end)

    hs.hotkey.bind(cmdCtrl, "right", function()
        local win = hs.window.focusedWindow()
        wm.rightThird(win)
    end)

    hs.hotkey.bind(cmdShiftCtrl, "left", function()
        local win = hs.window.focusedWindow()
        wm.leftTwoThird(win)
    end)

    hs.hotkey.bind(cmdShiftCtrl, "right", function()
        local win = hs.window.focusedWindow()
        wm.rightTwoThird(win)
    end)

    hs.hotkey.bind(cmdAlt, "up", function()
        local win = hs.window.focusedWindow()
        wm.up(win)
    end)

    hs.hotkey.bind(cmdAlt, "down", function()
        local win = hs.window.focusedWindow()
        wm.down(win)
    end)

    hs.hotkey.bind(cmdAltCtrl, "left", function()
        local win = hs.window.focusedWindow()
        wm.upLeft(win)
    end)

    hs.hotkey.bind(cmdAltCtrl, "down", function()
        local win = hs.window.focusedWindow()
        wm.downLeft(win)
    end)

    hs.hotkey.bind(cmdAltCtrl, "right", function()
        local win = hs.window.focusedWindow()
        wm.downRight(win)
    end)

    hs.hotkey.bind(cmdAltCtrl, "up", function()
        local win = hs.window.focusedWindow()
        wm.upRight(win)
    end)

    --  hs.hotkey.bind(cmdShift, "f", function()
    --    local win = hs.window.focusedWindow()
    --    if (win) then
    --      wm.toggleFullscreen(win)
    --    end
    --  end)

    hs.hotkey.bind(cmdAlt, "f", function()
        local win = hs.window.focusedWindow()
        if (win) then
            win:maximize()
        end
    end)
end

function bindSpacesHotkeys()
    -- Move to next/prev space
    -- hs.hotkey.bind(cmdAlt, "N", function()
    --   local win = hs.window.focusedWindow()
    --   spaces.moveToSpaceInDirection(win, "right")
    -- end)

    -- hs.hotkey.bind(cmdAlt, "P", function()
    --   local win = hs.window.focusedWindow()
    --   spaces.moveToSpaceInDirection(win, "left")
    -- end)

    --   for idx, space in pairs(spaces.screenSpaces()) do
    --     hs.hotkey.bind(alt, idx, function()
    --       spaces.goToSpace(idx)
    --     end)
    --   end

    -- Move to next/prev display
    hs.hotkey.bind(cmdCtrl, "N", function()
        local win = hs.window.focusedWindow()
        win:moveOneScreenEast()
    end)

    hs.hotkey.bind(cmdCtrl, "P", function()
        local win = hs.window.focusedWindow()
        win:moveOneScreenWest()
    end)
end

function moveMouseToNextScreen()
    local screen = hs.mouse.getCurrentScreen()
    local nextScreen = screen:next()
    local rect = nextScreen:fullFrame()
    local center = hs.geometry.rectMidPoint(rect)

    hs.mouse.absolutePosition(center)
end

function highlightMousePointer()
    local mousepoint = hs.mouse.getAbsolutePosition()
    local color = { ["red"] = 1, ["blue"] = 0, ["green"] = 0, ["alpha"] = 0.8 }
    local circle = hs.drawing.circle(hs.geometry.rect(mousepoint.x - 40, mousepoint.y - 40, 80, 80))
    circle:setStrokeColor(color):setFill(false):setStrokeWidth(5):show()
    hs.timer.doAfter(1, function() circle:delete() end)
end

function moveMouseToCenter()
    local screen = hs.screen.allScreens()[1] or hs.mouse.getCurrentScreen()
    local center = hs.geometry.rectMidPoint(screen:frame())
    hs.mouse.setAbsolutePosition(center)

    highlightMousePointer()
end

function bindMouseKeys()
    -- hs.eventtap.new({25}, moveMouseToNextScreen):start()
    -- hs.hotkey.bind(cmdAlt, 'm', moveMouseToNextScreen)
    hs.hotkey.bind(cmdAlt, 'm', moveMouseToCenter)
end

--------------------------------------------------------------------------------
-- END CONFIGURATIONS
--------------------------------------------------------------------------------

-- Hotkey binding calls only work with U.S. or Dutch layouts
if (hs.keycodes.currentLayout() ~= 'Dutch') then
    hs.keycodes.setLayout('Dutch')
    hs.reload()
else
    config()
    hs.alert.show("Config loaded")
end
