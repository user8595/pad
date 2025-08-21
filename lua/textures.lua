require("lua.defaults")

-- textures
lifeicon = love.graphics.newImage("/assets/textures/lifeicon.png")
bg = love.graphics.newImage("/assets/textures/bg.png")
bgGame = love.graphics.newImage("/assets/textures/bg_game.png")
paddle = love.graphics.newImage("/assets/textures/paddle.png")
ball = love.graphics.newImage("/assets/textures/ball.png")
mPixel = love.graphics.newImage("/assets/textures/menu_pixel.png")
oPixel = love.graphics.newImage("/assets/textures/overlay_pixel.png")

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
    love.graphics.draw(ball, b1.x, b1.y)
end

-- set image filter to nearest neighbor
love.graphics.setDefaultFilter("nearest", "nearest")