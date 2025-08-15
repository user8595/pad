require("lua.defaults")
require("lua.ui")
require("lua.collision")
require("lua.score")

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
    -- enable debug menu
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
end

function love.draw()
    -- if state is title, show title screen, otherwise launch game
    if state == "title" then
        love.graphics.setColor(uiText)
        love.graphics.print("pad", largeFont, 310, 220)
        love.graphics.setColor(uiSubText)
        love.graphics.print("(PLACEHOLDER TEXT)", subFont, 265, 245)
        love.graphics.setColor(uiText)
        love.graphics.print("Press Enter to play", textFont, 255, 260)
        love.graphics.setColor(uiSubText)
        love.graphics.print("incomplete", subFont, 10, 455)
    elseif state == "game" then
        ui()
        hitbox()
        score()
    elseif state == "fail" then
        failUI()
    end
    -- draw debug menu if f4 key is pressed
    if debugMenu == "debug" then
        love.graphics.setColor(uiText)
        love.graphics.print(tostring(love.timer.getFPS()) .. " FPS", subFont, 10, 10)
        love.graphics.print(tostring(love.mouse.getX()) .. ", " .. tostring(love.mouse.getY()), subFont, 10, 25)
        love.graphics.print(tostring(love.graphics.getWidth()) .. " x " .. tostring(love.graphics.getHeight()), subFont, 10, 40)
        love.graphics.print(p1.x .. ", " .. p1.y, subFont, 10, 55)
        love.graphics.print(b1.x .. ", " .. b1.y, subFont, 10, 70)
        love.graphics.print("scene: " .. state, subFont, 10, 85)
    else
        return
    end
end