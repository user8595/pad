function love.load()
    require("lua.defaults")
    require("lua.collision")
end

function love.update(dt)
    if love.keyboard.isDown("a") then
        p1.x = p1.x - 7
        b1.x = b1.x - 7
    elseif love.keyboard.isDown("d") then
        p1.x = p1.x + 7
        b1.x = b1.x + 7
    end

    if love.keyboard.isDown("return") then
        scoreVal = scoreVal + 100
    end
end

function love.keypressed(key, isrepeat)
    if key == "escape" then
        love.event.quit()
    end
end

function love.draw()
    -- pad hitbox
    love.graphics.rectangle("line", p1.x, p1.y, p1.width, p1.height)
    
    -- ball hitbox
    love.graphics.rectangle("line", b1.x, b1.y, b1.width, b1.height)

    -- board left
    love.graphics.setColor(uiColor)
    love.graphics.line(142, 110, 46, 110)
    love.graphics.setColor(uiColor)
    love.graphics.line(bL.x1, bL.y1, bL.x2, bL.y2)
    
    -- board right
    love.graphics.setColor(uiColor)
    love.graphics.line(484, 110, 580, 110)
    love.graphics.setColor(uiColor)
    love.graphics.line(bR.x1, bR.y1, bR.x2, bR.y2)
    
    -- ui
    -- score
    love.graphics.setColor(uiSubText)
    love.graphics.print("Score", w95fa, 500, 60)
    love.graphics.setColor(uiText)
    love.graphics.print(scoreVal, scoreFont, 500, 80)
    -- hi-score
    love.graphics.setColor(uiSubText)
    love.graphics.print("Hi-Score", w95fa, 65, 60)
    love.graphics.setColor(uiText)
    love.graphics.print(hiScoreVal, scoreFont, 116, 80)
    
    -- level
    love.graphics.setColor(uiSubText)
    love.graphics.print("Lv.", w95fa, 500, 400)
    love.graphics.setColor(uiText)
    love.graphics.print(levelVal, scoreFont, 500, 420)

    -- debug
    love.graphics.setColor(uiText)
    love.graphics.print(tostring(love.timer.getFPS()) .. " FPS", debugFont, 10, 10)
    love.graphics.print(tostring(love.mouse.getX()) .. ", " .. tostring(love.mouse.getY()), debugFont, 10, 25)
    love.graphics.print(tostring(love.graphics.getWidth()) .. " x " .. tostring(love.graphics.getHeight()), debugFont, 10, 40)
    love.graphics.print(p1.x .. ", " .. p1.y, debugFont, 10, 55)
    love.graphics.print(b1.x .. ", " .. b1.y, debugFont, 10, 70)
end