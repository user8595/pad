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
isAbout = false
isHelp = false

-- button highlight value
menuButton = -1

-- border left
bL = {
    x1 = 151,
    y1 = 0,
    x2 = 151,
    y2 = winHeight,
    type = "borL"
}

-- border right
bR = {
    x1 = 489,
    y1 = 0,
    x2 = 489,
    y2 = winHeight,
    type = "borR"
}

-- border top (hidden)
bT = {
    x = 151,
    y = -2,
    -- border right x1 - border left x1
    w = bR.x1 - bL.x1,
    h = 2,
    type = "borT"
}

-- pad
p1 = {
    x = 290,
    y = 420,
    v = 600,
    -- direction, 1 = right, -1 = left
    d = 1,
    col = 0,
    len = 0,
    width = 64,
    height = 16,
    type = "paddle"
}

-- paddle speed up texture boolean
-- antager
paddleSpeedUp = false

-- ball
b1 = {
    x = 340,
    y = 412,
    r = 4,
    vx = 350,
    vy = 350,
    col = 0,
    len = 0,
    type = "ball"
}

-- boolean for when ball is launched
isLaunched = false

-- bricks
bri = {
    x = 151,
    y = 40,
    w = 32,
    h = 11,
    type = "brick"
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

-- fail boolean
isLiveLost = false

-- life lost timer
lostTimer = 0

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