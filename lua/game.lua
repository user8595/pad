require("lua.defaults")
require("textures")

-- title screen
function title()
    love.graphics.setColor(uiText)
    love.graphics.print("pad", largeFont, 310, 220)
    love.graphics.setColor(uiSubText)
    love.graphics.print("(PLACEHOLDER TEXT)", subFont, 265, 245)
    love.graphics.setColor(uiText)
    love.graphics.print("Press Enter to play", textFont, 255, 260)
    love.graphics.setColor(uiSubText)
    love.graphics.print("incomplete", subFont, 10, 455)
end

-- game ui
function ui()
    -- board left
    love.graphics.setColor(uiColor)
    love.graphics.line(bL.x1, 110, bL.x1 - 110, 110)
    love.graphics.setColor(uiColor)
    love.graphics.line(bL.x1, bL.y1, bL.x2, bL.y2)
    
    -- board right
    love.graphics.setColor(uiColor)
    love.graphics.line(bR.x1, 110, bR.x1 + 110, 110)
    love.graphics.setColor(uiColor)
    love.graphics.line(bR.x1, bR.y1, bR.x2, bR.y2)
    
    -- score
    love.graphics.setColor(uiSubText)
    love.graphics.print("Score", textFont, bR.x1 + 15, 60)
    love.graphics.setColor(uiText)
    love.graphics.print(scoreVal, largeFont, bR.x1 + 15, 80)
    
    -- hi-score
    love.graphics.setColor(uiSubText)
    love.graphics.print("Hi-Score", textFont, bL.x1 - 75, 60)
    love.graphics.setColor(uiText)
    love.graphics.printf(hiScoreVal, largeFont, bL.x1 - 412, 80, 400, "right")
    
    -- level
    love.graphics.setColor(uiSubText)
    love.graphics.print("Lv.", textFont, bR.x1 + 15, 400)
    love.graphics.setColor(uiText)
    love.graphics.print(levelVal, largeFont, bR.x1 + 15, 420)

    -- lifes
    love.graphics.print("x" .. lifesVal, subFont, bR.x1 + 15, 145)
    love.graphics.draw(lifeicon, bR.x1 + 15, 116, 0, 0.5, 0.5)
end

-- default variables
local popupFailW = love.graphics.getWidth() / 2
local popupFailH = love.graphics.getHeight() / 2
popupButton1X = popupFailW - 21
popupButton1Y = popupFailH + 24
popupButton2X = popupFailW - 12
popupButton2Y = popupFailH + 49
local buttonColor1 = {0.75, 0.75, 0.75, 1}
local buttonColor2 = {0.75, 0.75, 0.75, 1}

-- fail screen
function failUI()
    -- fail popup
    love.graphics.setColor(uiText)
    love.graphics.rectangle("line", popupFailW - 105 , popupFailH - 90, 220, 180)
    love.graphics.setColor(uiText)
    love.graphics.print("Game Over", largeFont, popupFailW - 47, popupFailH - 70)
    -- current score
    love.graphics.setColor(uiSubText)
    love.graphics.print("score", subFont, popupFailW - 14, popupFailH - 38)
    love.graphics.setColor(uiText)
    love.graphics.printf(scoreVal, largeFont, popupFailW - 105, popupFailH - 24, 220, "center")
    love.graphics.setColor(uiSubText)
    -- show new record text
    if scoreVal >= hiScoreVal then
        love.graphics.printf("new record!", subFont, popupFailW - 105, popupFailH, 220, "center")        
    end
    -- buttons
    love.graphics.setColor(buttonColor1)
    love.graphics.print("Retry", largeFont, popupButton1X, popupButton1Y)
    love.graphics.setColor(buttonColor2)
    love.graphics.print("Quit", largeFont, popupButton2X, popupButton2Y)
end

-- lighten text on button hover
function buttonHover()
    local x = love.mouse.getX()
    local y = love.mouse.getY()
    if x >= popupButton1X and x <= popupButton1X + 52 and y >= popupButton1Y and y <= popupButton1Y + 20 and state == "fail" then
        buttonColor1 = {1, 1, 1, 1}
    else
        buttonColor1 = {0.75, 0.75, 0.75, 1}
    end
    if x >= popupButton2X and x <= popupButton2X + 34 and y >= popupButton2Y and y <= popupButton2Y + 20 and state == "fail" then
        buttonColor2 = {1, 1, 1, 1}
    else
        buttonColor2 = {0.75, 0.75, 0.75, 1}
    end
end

-- debug ui
function debugUI()
    love.graphics.setColor(uiText)
    -- fps
    love.graphics.print(tostring(love.timer.getFPS()) .. " FPS", subFont, 10, 10)
    -- mouse position
    love.graphics.print(tostring(love.mouse.getX()) .. ", " .. tostring(love.mouse.getY()), subFont, 10, 25)
    -- resolution
    love.graphics.print(tostring(love.graphics.getWidth()) .. " x " .. tostring(love.graphics.getHeight()), subFont, 10, 40)
    -- paddle position
    love.graphics.print(p1.x .. ", " .. p1.y, subFont, 10, 55)
    -- ball position
    love.graphics.print(b1.x .. ", " .. b1.y, subFont, 10, 70)
    -- current scene
    love.graphics.print("scene: " .. state, subFont, 10, 85)    
end