require("lua.defaults")

-- set image filter to nearest neighbor
love.graphics.setDefaultFilter("nearest", "nearest")

-- textures

bg = love.graphics.newImage("/assets/textures/bg.png")
bgGame = love.graphics.newImage("/assets/textures/bg_game.png")
mPixel = love.graphics.newImage("/assets/textures/menu_pixel.png")
oPixel = love.graphics.newImage("/assets/textures/overlay_pixel.png")

paddle = love.graphics.newImage("/assets/textures/game/paddle.png")
paddleOutline = love.graphics.newImage("/assets/textures/game/paddle_outline.png")
ball = love.graphics.newImage("/assets/textures/game/ball.png")
lifeicon = love.graphics.newImage("/assets/textures/game/lifeicon.png")

brick = love.graphics.newImage("/assets/textures/game/brick.png")

keyA = love.graphics.newImage("/assets/textures/menu/a.png")
keyAp = love.graphics.newImage("/assets/textures/menu/a_press.png")

keyD = love.graphics.newImage("/assets/textures/menu/d.png")
keyDp = love.graphics.newImage("/assets/textures/menu/d_press.png")

keyK = love.graphics.newImage("/assets/textures/menu/k.png")
keyKp = love.graphics.newImage("/assets/textures/menu/k_press.png")

keyP = love.graphics.newImage("/assets/textures/menu/p.png")
keyPp = love.graphics.newImage("/assets/textures/menu/p_press.png")

kp = keyK
ap = keyA
dp = keyD
pp = keyP

pdO = oPixel

-- background
function backgrounds()
    love.graphics.draw(bgGame, 0, 0)
    -- board background
    love.graphics.setColor(boardBg)
    love.graphics.rectangle("fill", bL.x1, bL.y1, bR.x1 - bL.x1, bR.y2)
end

-- game texture
function gameTexture()
    love.graphics.draw(paddle, p1.x, p1.y)
    love.graphics.draw(ball, b1.x - 2, b1.y - 2)
    love.graphics.draw(brick, bri.x, bri.y)
    -- paddle speedup outline
    if paddleSpeedUp == true then
        love.graphics.draw(paddleOutline, p1.x - 2, p1.y - 2)
    elseif paddleSpeedUp == false then
    end
end
