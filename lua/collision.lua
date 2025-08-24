require("lua.defaults")
local bump = require("lib.bump")
local world

function hitboxInit()
    world = bump.newWorld(64)
    -- paddle
    world:add(p1, p1.x, p1.y, p1.width, p1.height)
    -- ball
    world:add(b1, b1.x, b1.y, b1.width, b1.height)
    -- borders
    world:add(bL, bL.x1 - 8, bL.y1, 8, bL.y2)
    world:add(bR, bR.x1, bR.y1, 8, bR.y2)
    world:add(bT, bT.x, bT.y, bT.w, bT.h)
end

function hitboxPad()
    -- get paddle position
    local actualX, actualY, cols, len = world:move(p1, p1.x, p1.y)

    p1.x = actualX
    p1.y = actualY
    
    if isLaunched == false then
        b1.x = actualX + 36
    end
end

function hitboxBall()
    local actualX, actualY, cols, len = world:move(b1, b1.x, b1.y)
    
    b1.x = actualX
    b1.y = actualY

    if len > 0 then
        for i = 1, len do
            local col = cols[i]

            if col.normal.x ~= 0 then
                b1.vx = -b1.vx
            end
            
            if col.normal.y ~= 0 then
                b1.vy = -b1.vy
            end
        end
    end
end
--TODO: Finish collision system