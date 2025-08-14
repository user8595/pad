function ui()
    -- ui
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
end