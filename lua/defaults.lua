-- fonts
largeFont = love.graphics.newFont("/assets/PixeloidSans.ttf", 18)
textFont = love.graphics.newFont("/assets/PixeloidSans.ttf", 14)
subFont = love.graphics.newFont("/assets/Picopixel.ttf", 14)

-- default game states
state = "title"
debugMenu = "none"

-- border height
border = (love.graphics.getWidth() / 2) / 2.25

-- left
bL = {
    x1 = 151,
    y1 = 0,
    x2 = 151,
    y2 = love.graphics.getHeight()
}

-- right
bR = {
    x1 = 489,
    y1 = 0,
    x2 = 489,
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
-- lifes
lifesVal = 2
-- highscores
highScores = {}

-- reset stats
function init()
    p1.x = 285
    p1.y = 420
    b1.x = 326
    b1.y = 413
    scoreVal = 0
    levelVal = 1
end

function lifeFail()
    if lifesVal <= -1 then
        state = "fail"
        lifesVal = 2
    end
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