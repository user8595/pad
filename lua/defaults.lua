-- fonts
scoreFont = love.graphics.newFont("/assets/W95FA.OTF", 24)
w95fa = love.graphics.newFont("/assets/W95FA.OTF", 18)
debugFont = love.graphics.newFont("/assets/W95FA.OTF", 14)    

-- border height
border = (love.graphics.getWidth() / 2) / 2.25

-- left
bL = {
    x1 = 142,
    y1 = 0,
    x2 = 142,
    y2 = love.graphics.getHeight()
}

-- right
bR = {
    x1 = 484,
    y1 = 0,
    x2 = 484,
    y2 = love.graphics.getHeight()
}

-- pad
p1 = {
    x = 285,
    y = 420,
    width = 60,
    height = 10
}

-- ball
b1 = {
    x = 326,
    y = 413,
    width = 5,
    height = 5
}

-- statistics
-- score
scoreVal = 0
-- hi - score
hiScoreVal = 0
-- level
levelVal = 1

function init()
    p1.x = 285
    p1.y = 420
    b1.x = 326
    b1.y = 413
    scoreVal = 0
    hiScoreVal = 0
    levelVal = 1
end

-- color
uiSubText = {
    0.5,
    0.5,
    0.5,
    1
}
uiText = {
    1,
    1,
    1,
    1
}
uiColor = {
    1,
    1,
    1,
    1
}