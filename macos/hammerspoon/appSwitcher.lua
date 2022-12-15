local appSwitcher = {}

-- --- App switcher
-- function mutable_cycle()
--   local i = 1
--   return function(arr)
--     local x = arr[i % (#arr + 1)]
--     i = i % #arr + 1
--     return x
--   end
-- end

-- function appSwitcher.launchOrFocusWin(name)
--   local mutable_cycle_func = mutable_cycle()

--   return function()
--     local app = hs.appfinder.appFromName(name)
--     if not app then
--       hs.application.launchOrFocus(name)
--       return
--     end

--     -- Cycle over all windows on all spaces
--     local wf = hs.window.filter.new(false):setAppFilter(name):setCurrentSpace(nil):keepActive()
--     local window_list = wf:getWindows()

--     if #window_list == 0 then
--       hs.application.launchOrFocus(name)
--       return
--     end

--     table.sort(window_list, function(x, y) return x:id() < y:id() end)

--     win = mutable_cycle_func(window_list)
--     if win then
--       win:focus()
--     end
--   end
-- end

function appSwitcher.launchOrFocusWin(name)
  return function()
    hs.application.launchOrFocus(name)
  end
end

return appSwitcher
