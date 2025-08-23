-- fonts
titleFont = love.graphics.newFont("/assets/PixeloidSans.ttf", 28)
menuFont = love.graphics.newFont("/assets/PixeloidSans.ttf", 24)
largeFont = love.graphics.newFont("/assets/PixeloidSans.ttf", 18)
textFont = love.graphics.newFont("/assets/PixeloidSans.ttf", 14)
subFont = love.graphics.newFont("/assets/Picopixel.ttf", 14)

-- window height and width
winWidth = love.graphics.getWidth()
winHeight = love.graphics.getHeight()

-- default game states
-- "title", "game"
state = "title"
debugMenu = false
isFail = false
isPause = false
--TODO: Add about scene
isAbout = false
isHelp = false

-- button highlight value
menuButton = -1

-- border left
bL = {
    x1 = 151,
    y1 = 0,
    x2 = 151,
    y2 = winHeight
}

-- border right
bR = {
    x1 = 489,
    y1 = 0,
    x2 = 489,
    y2 = winHeight
}

-- pad
p1 = {
    x = 290,
    y = 420,
    v = 600,
    col = 0,
    len = 0,
    width = 64,
    height = 16
}

-- paddle speed up texture boolean
-- antager
paddleSpeedUp = false

-- ball
b1 = {
    x = 326,
    y = 412,
    vx = 600,
    vy = 600,
    col = 0,
    len = 0,
    width = 8,
    height = 8
}

-- statistics
-- score
scoreVal = 0
-- hi - score
hiScoreVal = 0
-- level
levelVal = 1
-- lives
livesVal = 2
-- highscores table for save function
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
uiElement = {
    0.75,
    0.75,
    0.75,
    1
}
uiColor = {
    1,
    1,
    1,
    1
}
boardBg = {
    0,
    0.01,
    0,
    0.25
}
textBlink = {
    1,
    1,
    1,
    1
}