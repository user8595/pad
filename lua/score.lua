require("lua.defaults")

function newSaveFile()
    if love.filesystem.read("savefile.txt") == nil then
        love.filesystem.write("savefile.txt", 0)
    else
        return 0
    end
end

function loadSave()
    local highScores = {}
    for line in love.filesystem.lines("savefile.txt") do
        table.insert(highScores, tonumber(line))
    end
    hiScoreVal = highScores[1]
end

-- hi-score code
function score()
    if scoreVal >= hiScoreVal then
        hiScoreVal = scoreVal
    end
end

-- save hi-score
function saveScore()
    local scoreData = {hiScoreVal}
    love.filesystem.write("savefile.txt", table.concat(scoreData))
end