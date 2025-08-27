require("lua.defaults")
require("lua.textures")

-- reset stats
function init()
    p1.x = 290
    p1.y = 420
    b1.x = 326
    b1.y = 412
    scoreVal = 0
    levelVal = 1
    livesVal = 2
    isLaunched = false
end

-- reset when lose life
function initLife()
    p1.x = 290
    p1.y = 420
    b1.x = 326
    b1.y = 412
    isLaunched = false
end

-- game states
function states()    
    -- game state function
    if state == "title" then
        title()
    elseif state == "menu" then
        menu()
    elseif state == "game" then
        backgrounds()
        ui()
        gameTexture()
    end

    -- show fail screen
    --TODO: Add fail cooldown ("Ready" text) to fix (?) ball randomly appearing below paddle
    if isFail == true and state == "game" then
        isPause = false
        failUI()
        if scoreVal >= hiScoreVal then
            saveFile()
        end
    end

    -- show pause screen
    if isPause == true and state == "game" then
        pauseUI()
    else
    end

    -- show about or help screen
    if isHelp == true then
        help()
    elseif isAbout == true then
        about()
    else
    end
end

-- life lost code
function lifeFail()
    if livesVal < 0 and state == "game" then
        livesVal = 0
        isFail = true
        menuButton = -1
    end
end

-- checks if the ball is below screen
function failCheck()
    if b1.y > winHeight then
        livesVal = livesVal - 1
        initLife()
    end
end

-- hi-score code
function score()
    if scoreVal >= hiScoreVal then
        hiScoreVal = scoreVal
    end
    if state == "title" then
        hiScoreVal = highScores[1]
    end
end


function debugMn()
    -- draw debug menu if f4 key is pressed
    if debugMenu == true then
        debugUI()
        -- show hitboxes when debug menu is enabled
        if state == "game" then
            -- pad hitbox
            love.graphics.rectangle("line", p1.x, p1.y, p1.width, p1.height)    
            -- ball hitbox
            love.graphics.rectangle("line", b1.x, b1.y, b1.r, b1.r)        
        elseif debugMenu == false then
        end
    else
    end
end