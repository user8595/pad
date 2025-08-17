-- fonts
largeFont = love.graphics.newFont("/assets/PixeloidSans.ttf", 18)
textFont = love.graphics.newFont("/assets/PixeloidSans.ttf", 14)
subFont = love.graphics.newFont("/assets/Picopixel.ttf", 14)

-- default game states
-- "title", "game", "fail"
state = "title"
debugMenu = "none"

-- border left
bL = {
    x1 = 151,
    y1 = 0,
    x2 = 151,
    y2 = love.graphics.getHeight()
}

-- border right
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
-- highscores for save function
highScores = {}

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