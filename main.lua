require("lua.defaults")
require("lua.ui")
require("lua.collision")
require("lua.save")
require("lua.game")

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
        isFail = false
        isPause = false
        state = "title"
        hiScoreVal = highScores[1]
    end

    -- launch game
    if key == "return" and state == "title" then
        state = "game"
        -- reset stats
        init()
    end

    -- exit from fail screen
    if key == "escape" and isFail == true then
        state = "title"
    end

    -- toggle debug menu
    if key == "f4" and debugMenu == "none" then
        debugMenu = "debug"
    elseif key == "f4" and debugMenu == "debug" then
        debugMenu = "none"
    end

    -- toggle pause menu
    if key == "p" and state == "game" and isFail == false and isPause == false then
        isPause = true
    elseif key == "p" and isPause == true and state == "game" and isFail == false then
        isPause = false
    end

    -- trigger fail state
    if key == "f" then
        isFail = true
    end

    -- reduce health
    if key == "down" then
        lifesVal = lifesVal - 1
        initLife()
    end
end

function love.mousepressed(x, y, button)
    -- retry button
    if button == 1 and x >= popupButton1X and x <= popupButton1X + 52 and y >= popupButton1Y and y <= popupButton1Y + 22 and isFail == true then
        state = "game"
        isFail = false
        init()
    -- exit button
    elseif button == 1 and x >= popupButton2X and x <= popupButton2X + 34 and y >= popupButton2Y and y <= popupButton2Y + 22 and isFail == true then
        state = "title"
        isFail = false
        if scoreVal >= hiScoreVal then
            saveFile()
        end
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
    if isFail == true then
        buttonHover()
    end

    if isPause == true then
        pauseUI()
    elseif isPause == false then
        return
    end
end

function love.draw()
    -- game state function
    if state == "title" then
        title()
    elseif state == "game" then
        ui()
        hitbox()
    end
    if isFail == true then
        isPause = false
        failUI()
        if scoreVal >= hiScoreVal then
            saveFile()
        end
    end

    if isPause == true then
        pauseUI()
    else
        return
    end
    
    -- draw debug menu if f4 key is pressed
    if debugMenu == "debug" then
        debugUI()
    else
        return
    end
end