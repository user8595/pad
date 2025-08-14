require("lua.defaults")
local bump = require("lua.bump")

-- movement function
function love.update(dt)
    if love.keyboard.isDown("a") then
        p1.x = p1.x - 7
        b1.x = b1.x - 7
    elseif love.keyboard.isDown("d") then
        p1.x = p1.x + 7
        b1.x = b1.x + 7
    end

    -- debugging feature
    if love.keyboard.isDown("space") then
        scoreVal = scoreVal + 100
    end
end

function hitbox()
    -- pad hitbox
    love.graphics.rectangle("line", p1.x, p1.y, p1.width, p1.height)    
    -- ball hitbox
    love.graphics.rectangle("line", b1.x, b1.y, b1.width, b1.height)

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

    -- wip: check hitboxes
    world:check(pad)
end

--TODO: Finish collision system