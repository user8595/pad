require("lua.defaults")
local bump = require("lua.bump.bump")

-- hitbox names
local pad = {name="pad"}
local ball = {name="ball"}
local borderLeft = {name="borderL"}
local borderRight = {name="borderR"}

local world = bump.newWorld()

-- hitboxes
-- pad
world:add(pad, p1.x, p1.y, p1.width, p1.height)
-- borders
world:add(borderLeft, bL.x1, bL.y1, 2, bL.y2)
world:add(borderRight, bR.x1, bR.y1, 2, bR.y2)

world:check(pad)