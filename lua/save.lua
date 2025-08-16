require("lua.defaults")

function newSaveFile()
    if love.filesystem.read("savefile.txt") == nil then
        love.filesystem.write("savefile.txt", 0)
    else
        return 0
    end
end

function loadSaveFile()
    for line in love.filesystem.lines("savefile.txt") do
        table.insert(highScores, tonumber(line))
    end
    if highScores[1] == nil then
        highScores[1] = 0
    end
    hiScoreVal = highScores[1]
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

-- save hi-score
function saveFile()
    local scoreData = {hiScoreVal}
    love.filesystem.write("savefile.txt", table.concat(scoreData))
end