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
    if key == "escape" and state == "title" and isPause == false and isFail == false then
        love.event.quit()
    -- pause game if escape is pressed
    elseif key == "escape" and state == "game" and isPause == false and isFail == false then
        isPause = true
    -- close game when escape is pressed in pause menu or in fail screen
    elseif key == "escape" and state == "game" and isFail == true then
        isFail = false
        isPause = false
        state = "title"
        hiScoreVal = highScores[1]
    elseif key == "escape" and state == "game" and isPause == true then
        isFail = false
        isPause = false
        state = "title"
        hiScoreVal = highScores[1]
    end

    -- toggle pause menu if "p" key is pressed
    if key == "p" and state == "game" and isFail == false and isPause == false then
        isPause = true
    elseif key == "p" and isPause == true and state == "game" and isFail == false then
        isPause = false
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
        isFail = true
    end

    -- reduce health
    if key == "down" then
        lifesVal = lifesVal - 1
        initLife()
    end
end

function love.mousepressed(x, y, button)
    -- fail screen
    -- retry button
    if button == 1 and x >= popupButtonX1 and x <= popupButtonX1 + 52 and y >= popupButtonY1 and y <= popupButtonY1 + 22 and isFail == true then
        state = "game"
        isFail = false
        init()
        -- exit button
    elseif button == 1 and x >= popupButtonX2 and x <= popupButtonX2 + 34 and y >= popupButtonY2 and y <= popupButtonY2 + 22 and isFail == true then
        state = "title"
        isFail = false
        if scoreVal >= hiScoreVal then
            saveFile()
        end
    end
    -- pause screen
    -- resume button
    if button == 1 and x >= pauseX1 and x <= pauseX1 + 72 and y >= pauseY1 and y <= pauseY1 + 17 and isPause == true then
        isPause = false
        -- restart button
    elseif button == 1 and x >= pauseX2 and x <= pauseX2 + 72 and y >= pauseY2 and y <= pauseY2 + 17 and isPause == true then
        state = "game"
        isPause = false
        init()
        -- exit button
    elseif button == 1 and x >= pauseX3 and x <= pauseX3 + 34 and y >= pauseY3 and y <= pauseY3 + 17 and isPause == true then
        state = "title"
        isPause = false
    end
end

function love.update(dt)
    -- movement function
    if isPause == false and isFail == false then
        if love.keyboard.isDown("a") then
            p1.x = p1.x - 7
            b1.x = b1.x - 7
        elseif love.keyboard.isDown("d") then
            p1.x = p1.x + 7
            b1.x = b1.x + 7
        end
        -- increase speed by 3 pixels when "k" key is held
        if love.keyboard.isDown("a") and love.keyboard.isDown("k") then
            p1.x = p1.x - 3
            b1.x = b1.x - 3
        elseif love.keyboard.isDown("d") and love.keyboard.isDown("k") then
            p1.x = p1.x + 3
            b1.x = b1.x + 3
        end
        -- freeze movement if paused
    elseif isPause == true or isFail == true then
        pauseButtonHover()
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
        failButtonHover()
    end
end

function love.draw()
    states()
    debugMn()
end
