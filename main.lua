require("lua.defaults")

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
end

function love.draw()
    -- if state is title, show title screen, otherwise launch game
    if state == "title" then
        love.graphics.setColor(uiText)
        love.graphics.print("PLACEHOLDER TEXT", scoreFont, 235, 220)
        love.graphics.print("Press Enter to play", textFont, 255, 260)
        love.graphics.setColor(uiSubText)
        love.graphics.print("incomplete", subFont, 10, 455)
    elseif state == "game" then
        require("lua.ui")
        require("lua.collision")
        require("lua.score")
        ui()
        hitbox()
        score()
    end
    -- draw debug menu if f4 key is pressed
    if debugMenu == "debug" then
        love.graphics.setColor(uiText)
        love.graphics.print(tostring(love.timer.getFPS()) .. " FPS", subFont, 10, 10)
        love.graphics.print(tostring(love.mouse.getX()) .. ", " .. tostring(love.mouse.getY()), subFont, 10, 25)
        love.graphics.print(tostring(love.graphics.getWidth()) .. " x " .. tostring(love.graphics.getHeight()), subFont, 10, 40)
        love.graphics.print(p1.x .. ", " .. p1.y, subFont, 10, 55)
        love.graphics.print(b1.x .. ", " .. b1.y, subFont, 10, 70)
    else
        return
    end
end