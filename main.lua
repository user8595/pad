require("lua.defaults")
require("lua.game")
require("lua.collision")
require("lua.save")

function love.load()
    require("textures")
    newSaveFile()
    loadSaveFile()
end

function love.keypressed(key, isrepeat)
    -- exit or close game
    if key == "escape" and state == "title" then
        love.event.quit()
    elseif key == "escape" and state == "game" then
        state = "title"
    end
    -- launch game
    if key == "return" and state == "title" then
        state = "game"
        -- reset stats
        init()
    end
    -- toggle debug menu
    if key == "f4" and debugMenu == "none" then
        debugMenu = "debug"
    elseif key == "f4" and debugMenu == "debug" then
        debugMenu = "none"
    end
    -- trigger fail state
    if key == "f" then
        state = "fail"
    end
    -- reduce health
    if key == "down" then
        lifesVal = lifesVal - 1
        initLife()
    end
    -- exit from fail screen
    if key == "escape" and state == "fail" then
        state = "title"
    end
end

function love.update(dt)
    -- movement function
    if love.keyboard.isDown("a") then
        p1.x = p1.x - 7
        b1.x = b1.x - 7
    elseif love.keyboard.isDown("d") then
        p1.x = p1.x + 7
        b1.x = b1.x + 7
    end
    -- for testing purposes
    if love.keyboard.isDown("space") then
        scoreVal = scoreVal + 100
    end
    -- hi score code
    if state == "game" then
        score()
    end
    -- open fail screen when all lifes lost
    lifeFail()
    -- text hover effect in fail screen
    if state == "fail" then
        buttonHover()
    end
end

function love.draw()
    -- game state function
    if state == "title" then
        title()
    elseif state == "game" then
        ui()
        hitbox()
    elseif state == "fail" then
        failUI()
        if scoreVal >= hiScoreVal then
            saveFile()
        end
    end
    
    -- draw debug menu if f4 key is pressed
    if debugMenu == "debug" then
        debugUI()
    else
        return
    end
end

function love.mousepressed(x, y, button)
    -- retry button
    if button == 1 and x >= popupButton1X and x <= popupButton1X + 52 and y >= popupButton1Y and y <= popupButton1Y + 22 and state == "fail" then
        state = "game"
        init()
    -- exit button
    elseif button == 1 and x >= popupButton2X and x <= popupButton2X + 34 and y >= popupButton2Y and y <= popupButton2Y + 22 and state == "fail" then
        state = "title"
        if scoreVal >= hiScoreVal then
            saveFile()
        end
    end
end
