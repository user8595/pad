require("lua.defaults")

-- define default game state ("game", "title")
local state = "title"

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
        -- return to default values
        p1.x
        b1.x
        b1.y
        scoreVal
        hiScoreVal
        levelVal
    end
end

function love.draw()
    -- debug
    love.graphics.setColor(uiText)
    love.graphics.print(tostring(love.timer.getFPS()) .. " FPS", debugFont, 10, 10)
    love.graphics.print(tostring(love.mouse.getX()) .. ", " .. tostring(love.mouse.getY()), debugFont, 10, 25)
    love.graphics.print(tostring(love.graphics.getWidth()) .. " x " .. tostring(love.graphics.getHeight()), debugFont, 10, 40)
    love.graphics.print(p1.x .. ", " .. p1.y, debugFont, 10, 55)
    love.graphics.print(b1.x .. ", " .. b1.y, debugFont, 10, 70)
    -- if state is title, show title screen, otherwise launch game
    if state == "title" then
        love.graphics.print("PLACEHOLDER TEXT", scoreFont, 225, 220)
        love.graphics.print("Press Enter to play", w95fa, 260, 260)
    elseif state == "game" then
        require("lua.ui")
        require("lua.collision")
        ui()
        hitbox()
    end
end