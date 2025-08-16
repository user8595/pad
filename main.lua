require("lua.defaults")
require("lua.ui")
require("lua.collision")
require("lua.save")

function love.load()
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
    elseif key == "escape" and state == "fail" then
        state = "title"
    end
end

-- movement function
function love.update(dt)
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