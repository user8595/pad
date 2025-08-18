require("lua.defaults")
require("textures")

-- title screen
function title()
    love.graphics.setColor(uiText)
    love.graphics.print("pad", largeFont, 310, 216)
    love.graphics.setColor(uiSubText)
    love.graphics.print("(PLACEHOLDER TEXT)", subFont, 265, 244)
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
    love.graphics.print("x" .. lifesVal, subFont, bR.x1 + 15, 140)
    love.graphics.draw(lifeicon, bR.x1 + 15, 124, 0, 0.5, 0.5)
end

-- default variables
local popupW = winWidth / 2
local popupH = winHeight / 2
popupButton1X = popupW - 21
popupButton1Y = popupH + 24
popupButton2X = popupW - 12
popupButton2Y = popupH + 49
local buttonColor1 = {0.75, 0.75, 0.75, 1}
local buttonColor2 = {0.75, 0.75, 0.75, 1}

-- fail screen
function failUI()
    -- dark overlay
    love.graphics.setColor(overlay)
    love.graphics.rectangle("fill", 0, 0, winWidth, winHeight)
    -- fail popup
    love.graphics.setColor(0, 0, 0, 1)
    love.graphics.rectangle("fill", popupW - 105 , popupH - 90, 220, 180)
    love.graphics.setColor(uiText)
    love.graphics.rectangle("line", popupW - 105 , popupH - 90, 220, 180)
    love.graphics.setColor(uiText)
    love.graphics.print("Game Over", largeFont, popupW - 47, popupH - 70)
    -- current score
    love.graphics.setColor(uiSubText)
    love.graphics.print("score", subFont, popupW - 14, popupH - 38)
    love.graphics.setColor(uiText)
    love.graphics.printf(scoreVal, largeFont, popupW - 105, popupH - 24, 220, "center")
    love.graphics.setColor(uiSubText)
    -- show new record text
    if scoreVal >= hiScoreVal then
        love.graphics.printf("new record!", subFont, popupW - 105, popupH, 220, "center")        
    end
    -- buttons
    love.graphics.setColor(buttonColor1)
    love.graphics.print("Retry", largeFont, popupButton1X, popupButton1Y)
    love.graphics.setColor(buttonColor2)
    love.graphics.print("Quit", largeFont, popupButton2X, popupButton2Y)
end

-- pause ui
function pauseUI()
    -- dark overlay
    love.graphics.setColor(overlay)
    love.graphics.rectangle("fill", 0, 0, winWidth, winHeight)
    -- text frame
    love.graphics.setColor(0, 0, 0, 1)
    love.graphics.rectangle("fill", popupW - 50 , popupH - 10, 93, 30)
    love.graphics.setColor(uiText)
    love.graphics.rectangle("line", popupW - 50 , popupH - 10, 93, 30)
    -- pause text
    love.graphics.setColor(uiText)
    love.graphics.print("Paused", textFont, popupW - 30, popupH - 5)
    love.graphics.setColor(uiSubText)
    love.graphics.print("ESC to title", subFont, popupW - 41, popupH + 32)

end

-- lighten text on button hover
function buttonHover()
    local x = love.mouse.getX()
    local y = love.mouse.getY()
    -- retry button
    if x >= popupButton1X and x <= popupButton1X + 52 and y >= popupButton1Y and y <= popupButton1Y + 22 and isFail == true then
        buttonColor1 = {1, 1, 1, 1}
    else
        buttonColor1 = {0.75, 0.75, 0.75, 1}
    end
    -- exit button
    if x >= popupButton2X and x <= popupButton2X + 34 and y >= popupButton2Y and y <= popupButton2Y + 22 and isFail == true then
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
    -- current popup scene
    if isFail == true then
        love.graphics.print("isFail", subFont, 10, 100)
    elseif isPause == true then
        love.graphics.print("isPause", subFont, 10, 100)
    elseif isCredits == true then
        love.graphics.print("isCredits", subFont, 10, 100)
    end
end