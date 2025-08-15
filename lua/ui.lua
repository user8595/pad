require("lua.defaults")

function ui()
    -- ui
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
    love.graphics.setColor(uiSubText)
    love.graphics.print("Score", textFont, bR.x1 + 15, 60)
    love.graphics.setColor(uiText)
    love.graphics.print(scoreVal, largeFont, bR.x1 + 15, 80)
    
    -- hi-score
    love.graphics.setColor(uiSubText)
    love.graphics.print("Hi-Score", textFont, bL.x1 - 75, 60)
    love.graphics.setColor(uiText)
    love.graphics.printf(hiScoreVal, largeFont, bL.x1 - 412, 80, 400, "right")
    
    -- level
    love.graphics.setColor(uiSubText)
    love.graphics.print("Lv.", textFont, bR.x1 + 15, 400)
    love.graphics.setColor(uiText)
    love.graphics.print(levelVal, largeFont, bR.x1 + 15, 420)
end

function failUI()
    local popupFailW = love.graphics.getWidth() / 2
    local popupFailH = love.graphics.getHeight() / 2
    local buttonColor = {1, 1, 1, 1}
    -- fail popup
    love.graphics.setColor(uiText)
    love.graphics.rectangle("line", popupFailW - 105 , popupFailH - 90, 220, 180)
    love.graphics.setColor(uiText)
    love.graphics.print("Game Over", largeFont, popupFailW - 46, popupFailH - 60)
    love.graphics.setColor(buttonColor)
    -- buttons
    love.graphics.print("Retry", largeFont, popupFailW - 21, popupFailH + 16)
    love.graphics.setColor(buttonColor)
    love.graphics.print("Quit", largeFont, popupFailW - 12, popupFailH + 42)
end