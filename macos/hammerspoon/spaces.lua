------
-- Switch spaces
------

local export = {}

-- grabs screen with active window, unless it's Finder's desktop
-- then we use mouse position
local function activeScreen()
  local activeWindow = hs.window.focusedWindow()

  if activeWindow and activeWindow:role() ~= 'AXScrollArea' then
    return activeWindow:screen()
  else
    local mousePoint = hs.geometry.point(hs.mouse.getAbsolutePosition())

    return hs.fnutils.find(hs.screen.allScreens(), function(screen)
      return mousePoint:inside(screen:frame())
    end)
  end
end

function activeSpaceIndex(screenSpaces)
  return hs.fnutils.indexOf(screenSpaces, spaces.activeSpace()) or 1
end

function screenSpaces(currentScreen)
  currentScreen = currentScreen or activeScreen()
  return spaces.layout()[currentScreen:spacesUUID()]
end

function spaceInDirection(direction)
  local screenSpaces = screenSpaces()
  local activeIdx = activeSpaceIndex(screenSpaces)
  local targetIdx = direction == 'left' and activeIdx - 1 or activeIdx + 1

  return screenSpaces[targetIdx], targetIdx
end

function export.moveToSpaceInDirection(win, direction)
  local targetSpace, targetIdx = spaceInDirection(direction)
  spaces.moveWindowToSpace(win:id(), targetSpace)
  spaces.changeToSpace(targetSpace)
  hs.alert.show("Space: " .. targetIdx, 0.4)
  -- hs.dialog.textPrompt("Space: " .. targetIdx, targetIdx)
  -- hs.eventtap.keyStroke({"fn", "ctrl"}, direction)
end

function export.flashScreen(screen)
   local flash=hs.canvas.new(screen:fullFrame()):appendElements({
	 action = "fill",
	 fillColor = { alpha = 0.25, red=1},
	 type = "rectangle"})
   flash:show()
   hs.timer.doAfter(.15,function () flash:delete() end)
end 

return export
