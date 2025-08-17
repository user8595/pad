require("lua.defaults")

-- creates new save file if missing
function newSaveFile()
    if love.filesystem.read("savefile.txt") == nil then
        love.filesystem.write("savefile.txt", 0)
    else
        return 0
    end
end

-- load save file
function loadSaveFile()
    for line in love.filesystem.lines("savefile.txt") do
        table.insert(highScores, tonumber(line))
    end
    -- if value missing, set to 0
    if highScores[1] == nil then
        highScores[1] = 0
    end
    hiScoreVal = highScores[1]
end

-- save hi-score
function saveFile()
    local scoreData = {hiScoreVal}
    love.filesystem.write("savefile.txt", table.concat(scoreData))
end