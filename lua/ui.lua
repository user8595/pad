require("lua.defaults")
require("lua.textures")
local cron = require("lib.cron")
-- default popup variables
local popupW = winWidth / 2
local popupH = winHeight / 2

-- text blinking effect in title screen
function titleBlink()
    function tb()
        textBlink = {1, 1, 1, 0}
    end
    -- D: disappear
    function tbD()
        textBlink = {1, 1, 1, 1}
    end
    b = cron.every(0.75, tb)
    bf = cron.every(1.5, tbD)
end

-- title screen
function title()
    love.graphics.draw(bg, 0, 0)
    love.graphics.draw(mPixel, 209, 100, 0, 227, 80)
    love.graphics.print("pad", titleFont, 294, 118)
    love.graphics.print({textBlink, "Press Enter"}, textFont, 278, 353)
    love.graphics.print({uiSubText, "incomplete"}, subFont, 10, 455)
end

function menu()
    love.graphics.draw(bg, 0, 0)
    love.graphics.draw(mPixel, 209, 100, 0, 227, 80)    
    love.graphics.line(209, 0, 209, winHeight)
    love.graphics.line(436, 0, 436, winHeight)
    love.graphics.print("pad", titleFont, 294, 118)
    love.graphics.print({uiSubText, "Main Menu"}, subFont, 287, 158)
    love.graphics.print({buttonColor1, "Play"}, largeFont, 303, 240)
    love.graphics.print({buttonColor2, "Help"}, largeFont, 303, 266)
    love.graphics.print({buttonColor3, "About"}, largeFont, 295, 292)
    love.graphics.print({buttonColor4, "Exit Game"}, largeFont, 277, 318)
    love.graphics.print({uiSubText, "incomplete"}, subFont, 10, 455)
end

-- help screen
function help()
    love.graphics.draw(oPixel, 0, 0, 0, winWidth, winHeight)
    love.graphics.setColor(0, 0, 0, 1)
    love.graphics.rectangle("fill", popupW - 173, popupH - 97, 350, 220)
    love.graphics.setColor(uiText)
    love.graphics.rectangle("line", popupW - 173, popupH - 97, 350, 220)

    love.graphics.print("Controls", largeFont, popupW - 159, popupH - 86)
    love.graphics.draw(ap, popupW - 145, popupH - 45)
    love.graphics.draw(dp, popupW - 85, popupH - 45)
    love.graphics.draw(kp, popupW - 145, popupH + 30)
    --TODO: Add pause key
    love.graphics.print("Move paddle", textFont, popupW - 140, popupH + 7)
    love.graphics.print("Speed up paddle movement", textFont, popupW - 140, popupH + 82)
    love.graphics.print({uiSubText, "ESC to close"}, subFont, popupW - 40, popupH + 135)
end

function helpKeys()
    kp = keyK
    ap = keyA
    dp = keyD
    if love.keyboard.isDown("k") then
        kp = keyKp
    else
        ky = keyK
    end
    
    if love.keyboard.isDown("a") then
        ap = keyAp
    else
        ap = keyA
    end
    if love.keyboard.isDown("d") then
        dp = keyDp
    else
        dp = keyD
    end
end

-- about screen
function about()
    love.graphics.draw(oPixel, 0, 0, 0, winWidth, winHeight)
    love.graphics.print("TODO: Finish about page", subFont, 10, 455)
    love.graphics.print("ESC to close", subFont, 10, 440)
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
    love.graphics.print({uiElement, "Score"}, textFont, bR.x1 + 15, 60)
    love.graphics.print({uiText, scoreVal}, largeFont, bR.x1 + 15, 80)
    
    -- hi-score
    love.graphics.print({uiElement, "Hi-Score"}, textFont, bL.x1 - 75, 60)
    love.graphics.printf({uiText, hiScoreVal}, largeFont, bL.x1 - 412, 80, 400, "right")
    
    -- level
    love.graphics.print({uiElement, "Lv."}, textFont, bR.x1 + 15, 400)
    love.graphics.print({uiText, levelVal}, largeFont, bR.x1 + 15, 420)

    -- lives
    love.graphics.print({uiText, "x" .. livesVal}, subFont, bR.x1 + 15, 140)
    love.graphics.draw(lifeicon, bR.x1 + 15, 124, 0, 0.5, 0.5)
end

-- for fail screen only
popupButtonX1 = popupW - 21
popupButtonY1 = popupH + 24
popupButtonX2 = popupW - 12
popupButtonY2 = popupH + 49
-- hover text
buttonColor1 = {0.75, 0.75, 0.75, 1}
buttonColor2 = {0.75, 0.75, 0.75, 1}
buttonColor3 = {0.75, 0.75, 0.75, 1}
buttonColor4 = {0.75, 0.75, 0.75, 1}

-- resume button
pauseX1 = popupW - 32
pauseY1 = popupH + 3
-- restart button
pauseX2 = popupW - 32
pauseY2 = popupH + 29
-- quit button
pauseX3 = popupW - 15
pauseY3 = popupH + 56

-- pause ui
function pauseUI()
    -- dark overlay
    love.graphics.setColor(0, 0, 0, 0.65)
    love.graphics.rectangle("fill", 0, 0, winWidth, winHeight)
    -- text frame
    love.graphics.setColor(0, 0, 0, 1)
    love.graphics.rectangle("fill", popupW - 42 , popupH - 35, 93, 30)
    love.graphics.setColor(uiText)
    love.graphics.rectangle("line", popupW - 42 , popupH - 35, 93, 30)
    -- pause text
    love.graphics.print({uiText, "Paused"}, largeFont, popupW - 30, popupH - 30)
    love.graphics.print({uiSubText, "ESC to menu"}, subFont, popupW - 40, winHeight - 20)
    -- resume text
    love.graphics.print({buttonColor1, "Resume"}, largeFont, pauseX1, pauseY1)
    -- restart text
    love.graphics.print({buttonColor2, "Restart"}, largeFont, pauseX2, pauseY2)
    -- restart text
    love.graphics.print({buttonColor3, "Quit"}, largeFont, pauseX3, pauseY3)
end

-- fail screen
function failUI()
    -- dark overlay
    love.graphics.draw(oPixel, 0, 0, 0, winWidth, winHeight)
    -- fail popup
    love.graphics.draw(oPixel, popupW - 105 , popupH - 90, 0, 220, 180)
    love.graphics.rectangle("line", popupW - 105 , popupH - 90, 220, 180)
    love.graphics.print({uiText, "Game Over"}, largeFont, popupW - 47, popupH - 70)
    -- current score
    love.graphics.print({uiSubText, "score"}, subFont, popupW - 14, popupH - 38)
    love.graphics.printf({uiText, scoreVal}, largeFont, popupW - 105, popupH - 24, 220, "center")
    -- show new record text
    if scoreVal >= hiScoreVal then
        love.graphics.printf({uiSubText, "new record!"}, subFont, popupW - 105, popupH, 220, "center")        
    end
    -- buttons
    love.graphics.print({buttonColor1, "Retry"}, largeFont, popupButtonX1, popupButtonY1)
    love.graphics.print({buttonColor2, "Quit"}, largeFont, popupButtonX2, popupButtonY2)
end

-- lighten text on button hover
function menuButtonHover()
    local x = love.mouse.getX()
    local y = love.mouse.getY()
    -- play button
    if x >= 303 and x <= 341 and y >= 240 and y <= 264 and state == "menu" then
        buttonColor1 = {1, 1, 1, 1}
    else
        buttonColor1 = {0.75, 0.75, 0.75, 1}
    end
    -- help button
    if x >= 303 and x <= 340 and y >= 266 and y <= 288 and state == "menu" then
        buttonColor2 = {1, 1, 1, 1}
    else
        buttonColor2 = {0.75, 0.75, 0.75, 1}
    end
    -- about button
    if x >= 295 and x <= 348 and y >= 292 and y <= 316 and state == "menu" then
        buttonColor3 = {1, 1, 1, 1}
    else
        buttonColor3 = {0.75, 0.75, 0.75, 1}
    end
    -- exit button
    if x >= 277 and x <= 368 and y >= 318 and y <= 342 and state == "menu" then
        buttonColor4 = {1, 1, 1, 1}
    else
        buttonColor4 = {0.75, 0.75, 0.75, 1}
    end
end
    
function failButtonHover()
    local x = love.mouse.getX()
    local y = love.mouse.getY()
    -- retry button
    if x >= popupButtonX1 and x <= popupButtonX1 + 52 and y >= popupButtonY1 and y <= popupButtonY1 + 22 and isFail == true then
        buttonColor1 = {1, 1, 1, 1}
    else
        buttonColor1 = {0.75, 0.75, 0.75, 1}
    end
    -- exit button
    if x >= popupButtonX2 and x <= popupButtonX2 + 34 and y >= popupButtonY2 and y <= popupButtonY2 + 22 and isFail == true then
        buttonColor2 = {1, 1, 1, 1}
    else
        buttonColor2 = {0.75, 0.75, 0.75, 1}
    end
end

function pauseButtonHover()
    local x = love.mouse.getX()
    local y = love.mouse.getY()
    -- resume button
    if x >= pauseX1 and x <= pauseX1 + 72 and y >= pauseY1 and y <= pauseY1 + 17 and isPause == true then
        buttonColor1 = {1, 1, 1, 1}
    else
        buttonColor1 = {0.75, 0.75, 0.75, 1}
    end
    -- restart button
    if x >= pauseX2 and x <= pauseX2 + 72 and y >= pauseY2 and y <= pauseY2 + 17 and isPause == true then
        buttonColor2 = {1, 1, 1, 1}
    else
        buttonColor2 = {0.75, 0.75, 0.75, 1}
    end
    -- exit button
    if x >= pauseX3 and x <= pauseX3 + 34 and y >= pauseY3 and y <= pauseY3 + 19 and isPause == true then
        buttonColor3 = {1, 1, 1, 1}
    else
        buttonColor3 = {0.75, 0.75, 0.75, 1}
    end
end

-- debug ui
function debugUI()
    -- fps
    love.graphics.print({uiText, tostring(love.timer.getFPS()) .. " FPS"}, subFont, 10, 10)
    -- mouse position
    love.graphics.print({uiText, tostring(love.mouse.getX()) .. ", " .. tostring(love.mouse.getY())}, subFont, 10, 25)
    -- resolution
    love.graphics.print({uiText, tostring(love.graphics.getWidth()) .. " x " .. tostring(love.graphics.getHeight())}, subFont, 10, 40)
    -- paddle position
    love.graphics.print({uiText, p1.x .. ", " .. p1.y}, subFont, 10, 55)
    -- ball position
    love.graphics.print({uiText, b1.x .. ", " .. b1.y}, subFont, 10, 70)
    -- current scene
    love.graphics.print({uiText, "scene: " .. state}, subFont, 10, 85)
    -- current popup scene
    if isFail == true then
        love.graphics.print({uiText, "isFail"}, subFont, 10, 100)
    elseif isPause == true then
        love.graphics.print({uiText, "isPause"}, subFont, 10, 100)
    elseif isAbout == true then
        love.graphics.print({uiText, "isAbout"}, subFont, 10, 100)
    elseif isHelp == true then
        love.graphics.print({uiText, "isHelp"}, subFont, 10, 100)
    end
end