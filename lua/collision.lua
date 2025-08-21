require("lua.defaults")
local bump = require("lib.bump")

local world = bump.newWorld(64)

function hitbox()
    -- hitbox names
    local pad = {name="pad"}
    local ball = {name="ball"}
    local borderLeft = {name="borderL"}
    local borderRight = {name="borderR"}

    -- hitboxes
    -- pad
    world:add(pad, p1.x, p1.y, p1.width, p1.height)
    -- borders
    world:add(borderLeft, bL.x1 - 4, bL.y1, 4, bL.y2)
    world:add(borderRight, bR.x1, bR.y1, 4, bR.y2)
end

--TODO: Finish collision system