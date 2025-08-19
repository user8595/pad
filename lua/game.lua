require("lua.defaults")

-- reset stats
function init()
    p1.x = 290
    p1.y = 420
    b1.x = 326
    b1.y = 413
    scoreVal = 0
    levelVal = 1
    lifesVal = 2
end

-- reset when lose life
function initLife()
    p1.x = 290
    p1.y = 420
    b1.x = 326
    b1.y = 413
end

-- game states
function states()    
    -- game state function
    if state == "title" then
        title()
    elseif state == "game" then
        ui()
        hitbox()
    end
    if isFail == true then
        isPause = false
        failUI()
        if scoreVal >= hiScoreVal then
            saveFile()
        end
    end
    if isPause == true then
        pauseUI()
    else
        return
    end
end

function debugMn()
    -- draw debug menu if f4 key is pressed
    if debugMenu == "debug" then
        debugUI()
    else
        return
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

-- life lost code
function lifeFail()
    if lifesVal <= -1 then
        lifesVal = 0
        isFail = true
    end
end