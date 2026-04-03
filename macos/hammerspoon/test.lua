------
-- Swipe gesture detection for centering cursor
------

local swipeGesture = {}
local eventtap = nil

-- Gesture event types (from Hammerspoon eventtap)
local GESTURE_EVENT = 29
local SWIPE_GESTURE = 31

-- Track gesture state to prevent multiple triggers
local lastProcessedTime = 0
local DEBOUNCE_INTERVAL = 0.5  -- seconds

function centerCursor(targetScreen)
    local screen = targetScreen or hs.mouse.getCurrentScreen()
    local center = hs.geometry.rectMidPoint(screen:frame())
    hs.mouse.setAbsolutePosition(center)

    -- Highlight the cursor position
    local mousepoint = hs.mouse.getAbsolutePosition()
    local color = { ["red"] = 1, ["blue"] = 0, ["green"] = 0, ["alpha"] = 0.8 }
    local circle = hs.drawing.circle(hs.geometry.rect(mousepoint.x - 40, mousepoint.y - 40, 80, 80))
    circle:setStrokeColor(color):setFill(false):setStrokeWidth(5):show()
    hs.timer.doAfter(1, function() circle:delete() end)
end

function swipeGesture.start()
    if eventtap then
        eventtap:stop()
    end

    eventtap = hs.eventtap.new({ hs.eventtap.event.types.gesture }, function(event)
        local gestureType = event:getType(true)

        -- Only process swipe gestures (type 31)
        if gestureType == SWIPE_GESTURE then
            local currentTime = hs.timer.secondsSinceEpoch()

            -- Check if enough time has passed since last gesture
            if currentTime - lastProcessedTime < DEBOUNCE_INTERVAL then
                return false
            end

            -- Check modifiers
            local modifiers = hs.eventtap.checkKeyboardModifiers()
            local cmdPressed = modifiers['cmd']
            local ctrlPressed = modifiers['ctrl']
            local altPressed = modifiers['alt']

            -- Cmd+Ctrl+Alt = Previous screen
            -- Cmd+Ctrl = Next screen
            if cmdPressed and ctrlPressed then
                lastProcessedTime = currentTime

                local currentScreen = hs.mouse.getCurrentScreen()
                local targetScreen

                if altPressed then
                    -- Go to previous screen
                    targetScreen = currentScreen:previous()
                else
                    -- Go to next screen
                    targetScreen = currentScreen:next()
                end

                centerCursor(targetScreen)
            end
        end

        return false  -- Don't block the original event
    end)

    eventtap:start()
    hs.alert.show("Swipe gesture enabled")
end

function swipeGesture.stop()
    if eventtap then
        eventtap:stop()
        eventtap = nil
        hs.alert.show("Swipe gesture disabled")
    end
end

return swipeGesture
