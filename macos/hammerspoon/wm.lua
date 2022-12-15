local wm = {}


-- Toogle native fullscreen
function wm.toggleFullscreen(win)
  win:setFullscreen(not win:isFullscreen())
end

--- TILING

-- Returns the frame of the screen
function maxFrame(win)
  local screen = win:screen()
  local max = screen:frame()

  return max
end

-- +-----------------+
-- |        |        |
-- |  HERE  |        |
-- |        |        |
-- +-----------------+
function wm.left(win)
  local f = win:frame()
  local max = maxFrame(win)

  f.x = max.x
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f)
end

-- +-----------------+
-- |        |        |
-- |        |  HERE  |
-- |        |        |
-- +-----------------+
function wm.right(win)
  local f = win:frame()
  local max = maxFrame(win)

  f.x = max.x + (max.w / 2)
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f)
end

-- +-----------------+
-- |      |           |
-- | HERE |           |
-- |      |           |
-- +-----------------+
function wm.leftThird(win)
  local f = win:frame()
  local max = maxFrame(win)

  f.x = max.x
  f.y = max.y
  f.w = max.w / 3
  f.h = max.h
  win:setFrame(f)
end

-- +-----------------+
-- |    |      |     |
-- |    | HERE |     |
-- |    |      |     |
-- +-----------------+
function wm.centerThird(win)
  local f = win:frame()
  local max = maxFrame(win)

  f.x = max.x + (max.w / 3)
  f.y = max.y
  f.w = max.w / 3
  f.h = max.h
  win:setFrame(f)
end

-- +-----------------+
-- |          |      |
-- |          | HERE |
-- |          |      |
-- +-----------------+
function wm.rightThird(win)
  local f = win:frame()
  local max = maxFrame(win)

  f.x = max.x + (max.w / 3) * 2
  f.y = max.y
  f.w = max.w / 3
  f.h = max.h
  win:setFrame(f)
end

-- +-----------------+
-- |            |    |
-- |    HERE    |    |
-- |            |    |
-- +-----------------+
function wm.leftTwoThird(win)
  local f = win:frame()
  local max = maxFrame(win)

  f.x = max.x
  f.y = max.y
  f.w = (max.w / 3) * 2
  f.h = max.h
  win:setFrame(f)
end
--
-- +-----------------+
-- |    |            |
-- |    |    HERE    |
-- |    |            |
-- +-----------------+
function wm.rightTwoThird(win)
  local f = win:frame()
  local max = maxFrame(win)

  f.x = max.x + (max.w / 3)
  f.y = max.y
  f.w = (max.w / 3) * 2
  f.h = max.h
  win:setFrame(f)
end


-- +-----------------+
-- |      HERE       |
-- +-----------------+
-- |                 |
-- +-----------------+
function wm.up(win)
  local f = win:frame()
  local max = maxFrame(win)

  f.x = max.x 
  f.y = max.y
  f.w = max.w
  f.h = max.h / 2
  win:setFrame(f)
end

-- +-----------------+
-- |                 |
-- +-----------------+
-- |      HERE       |
-- +-----------------+
function wm.down(win)
  local f = win:frame()
  local max = maxFrame(win)

  f.x = max.x 
  f.y = max.y + (max.h / 2)
  f.w = max.w 
  f.h = max.h / 2
  win:setFrame(f)
end

-- +-----------------+
-- |  HERE  |        |
-- +--------+        |
-- |                 |
-- +-----------------+
function wm.upLeft(win)
  local f = win:frame()
  local max = maxFrame(win)

  f.x = max.x
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h / 2
  win:setFrame(f)
end

-- +-----------------+
-- |                 |
-- +--------+        |
-- |  HERE  |        |
-- +-----------------+
function wm.downLeft(win)
  local f = win:frame()
  local max = maxFrame(win)

  f.x = max.x
  f.y = max.y + (max.h / 2)
  f.w = max.w / 2
  f.h = max.h / 2
  win:setFrame(f)
end

-- +-----------------+
-- |                 |
-- |        +--------|
-- |        |  HERE  |
-- +-----------------+
function wm.downRight(win)
  local f = win:frame()
  local max = maxFrame(win)

  f.x = max.x + (max.w / 2)
  f.y = max.y + (max.h / 2)
  f.w = max.w / 2
  f.h = max.h / 2
  win:setFrame(f)
end

-- +-----------------+
-- |        |  HERE  |
-- |        +--------|
-- |                 |
-- +-----------------+
function wm.upRight(win)
  local f = win:frame()
  local max = maxFrame(win)

  f.x = max.x + (max.w / 2)
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h / 2
  win:setFrame(f)
end

return wm
