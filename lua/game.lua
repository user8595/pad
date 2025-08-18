require("lua.defaults")

-- reset stats
function init()
    p1.x = 285
    p1.y = 420
    b1.x = 326
    b1.y = 413
    scoreVal = 0
    levelVal = 1
end

-- reset when lose life
function initLife()
    p1.x = 285
    p1.y = 420
    b1.x = 326
    b1.y = 413
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
        isFail = true
        lifesVal = 2
    end
end