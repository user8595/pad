require("lua.defaults")
require("lua.ui")
require("lua.collision")
require("lua.save")
require("lua.game")

-- i realized that i'm bad at this game

-- open debugger if launched in debug mode
if arg[2] == "debug" then
    require("lldebugger").start()
end

function love.load()
    require("lua.textures")
    newSaveFile()
    loadSaveFile()
    titleBlink()
end

function love.keypressed(key, isrepeat)
    -- exit or close game
    if key == "escape" and state == "title" and isPause == false and isFail == false then
        love.event.quit()
    -- exit to title screen when escape is pressed in main menu
    elseif key == "escape" and state == "menu" and isAbout == false and isHelp == false then
        state = "title"
        menuButton = -1
    -- when pressed in about screen, exit to menu
    elseif key == "escape" and isPause == false and isFail == false and isAbout == true then
        isAbout = false
    elseif key == "escape" and isPause == false and isFail == false and isHelp == true then
        isHelp = false
    -- pause game if escape is pressed
    elseif key == "escape" and state == "game" and isPause == false and isFail == false then
        isPause = true
        menuButton = -1
    -- close game when escape is pressed in fail screen
    elseif key == "escape" and state == "game" and isFail == true then
        isFail = false
        isPause = false
        state = "menu"
        hiScoreVal = highScores[1]
        menuButton = -1
    end

    -- toggle pause menu if "p" key is pressed
    if key == "p" and state == "game" and isFail == false and isPause == false then
        isPause = true
        menuButton = -1
    elseif key == "p" and isPause == true and state == "game" and isFail == false then
        isPause = false
    end

    -- open main menu
    if key == "return" and state == "title" then
        menuButton = -1
        state = "menu"
    end

    -- toggle debug menu
    if key == "f4" and debugMenu == false then
        debugMenu = true
    elseif key == "f4" and debugMenu == true then
        debugMenu = false
    end

    -- trigger fail screen
    if key == "f" and state == "game" then
        isFail = true
        menuButton = -1
    end
    
    -- menu keyboard function
    if key == "return" and menuButton == 1 and state == "menu" and isAbout == false and isHelp == false then
        state = "game"
        init()
    end
    if key == "return" and menuButton == 2 and state == "menu" and isAbout == false and isHelp == false then
        isHelp = true
    end
    if key == "return" and menuButton == 3 and state == "menu" and isAbout == false and isHelp == false then
        isAbout = true
    end
    if key == "return" and menuButton == 4 and state == "menu" and isAbout == false and isHelp == false then
        love.event.quit()
    end

    -- pause keyboard function
    if key == "return" and menuButton == 1 and state == "game" and isPause == true then
        isPause = false
    elseif key == "return" and menuButton == 2 and state == "game" and isPause == true then
        state = "game"
        isPause = false
        init()
    elseif key == "return" and menuButton == 3 and state == "game" and isPause == true then
        isFail = false
        isPause = false
        state = "menu"
        hiScoreVal = highScores[1]
        menuButton = -1
    end
    
    -- fail screen keyboard function
    if key == "return" and menuButton == 1 and state == "game" and isFail == true then
        state = "game"
        isFail = false
        init()
    elseif key == "return" and menuButton == 2 and state == "game" and isFail == true then
        isFail = false
        state = "menu"
        if scoreVal >= hiScoreVal then
            saveFile()
        end
        menuButton = -1
    end
    
    -- text hover for keyboard navigation
    if key == "up" and isAbout == false and isHelp == false then
        menuButton = menuButton - 1
    elseif key == "down" and isAbout == false and isHelp == false then
        menuButton = menuButton + 1
    end

    -- set to first button
    if key == "down" and menuButton == 0 then
        menuButton = 1
    end

    -- menu screen
    if key == "up" and menuButton < 1 and state == "menu" then
        menuButton = 4
    elseif key == "down" and menuButton > 4 and state == "menu" then
        menuButton = 1
    end

    -- pause screen
    if key == "up" and menuButton < 1 and state == "game" and isPause == true then
        menuButton = 3
    elseif key == "down" and menuButton > 3 and state == "game" and isPause == true then
        menuButton = 1
    end

    -- fail screen
    if key == "up" and menuButton < 1 and state == "game" and isFail == true then
        menuButton = 2
    elseif key == "down" and menuButton > 2 and state == "game" and isFail == true then
        menuButton = 1
    end

    -- reduce health (for testing)
    if key == "down" and state == "game" and isPause == false and isFail == false then
        livesVal = livesVal - 1
        initLife()
    end
end

function love.mousepressed(x, y, button)
    -- main menu screen
    -- play button
    if button == 1 and x >= 303 and x <= 341 and y >= 240 and y <= 264 and state == "menu" and isAbout == false and isPause == false and isHelp == false then
        state = "game"
        init()
    -- help button
    elseif button == 1 and x >= 303 and x <= 340 and y >= 266 and y <= 288 and state == "menu" and isAbout == false and isPause == false and isHelp == false then
        isHelp = true
    -- about button
    elseif button == 1 and x >= 295 and x <= 348 and y >= 292 and y <= 316 and state == "menu" and isAbout == false and isPause == false and isHelp == false then
        isAbout = true
    -- exit button
    elseif button == 1 and x >= 277 and x <= 368 and y >= 318 and y <= 342 and state == "menu" and isAbout == false and isPause == false and isHelp == false then
        love.event.quit()
    end

    -- fail screen
    -- retry button
    if button == 1 and x >= popupButtonX1 and x <= popupButtonX1 + 52 and y >= popupButtonY1 and y <= popupButtonY1 + 22 and isFail == true then
        state = "game"
        isFail = false
        init()
    -- exit button
    elseif button == 1 and x >= popupButtonX2 and x <= popupButtonX2 + 34 and y >= popupButtonY2 and y <= popupButtonY2 + 22 and isFail == true then
        state = "menu"
        isFail = false
        if scoreVal >= hiScoreVal then
            saveFile()
        end
        menuButton = -1
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
        state = "menu"
        isPause = false
    end
end

function love.update(dt)
    -- movement function
    if isPause == false and isFail == false and state == "game" then
        if love.keyboard.isDown("a") then
            p1.x = p1.x - p1.v * dt
            b1.x = b1.x - b1.vx * dt
        elseif love.keyboard.isDown("d") then
            p1.x = p1.x + p1.v * dt
            b1.x = b1.x + b1.vx * dt
        end
        -- increase speed by 3 pixels when "k" key is held
        if love.keyboard.isDown("k") then
            paddleSpeedUp = true
            if love.keyboard.isDown("a") then 
                p1.x = p1.x - 400 * dt
                b1.x = b1.x - 400 * dt
            elseif love.keyboard.isDown("d") then
                p1.x = p1.x + 400 * dt
                b1.x = b1.x + 400 * dt
            end
        else
            paddleSpeedUp = false
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

    -- open fail screen when all lives lost
    lifeFail()
    if isHelp == true then
        helpKeys()
    end
    
    -- text hover effect in menu screen
    if state == "menu" then
        menuButtonHover()
    end
    
    -- text hover effect in fail screen
    if isFail == true then
        failButtonHover()
    end
    
    -- keyboard navigation
    keyHover()
    
    -- text blink effect in title screen
    if state == "title" then
        b:update(dt)
        bf:update(dt)
    else
    end
end

function love.draw()
    states()
    debugMn()
end

local love_errorhandler = love.errorhandler

function love.errorhandler(msg)
    if lldebugger then
        error(msg, 2)
    else
        return love_errorhandler(msg)
    end
end
