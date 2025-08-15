require("lua.defaults")

function score()
    local scoreData = {hiScoreVal, scoreVal}
    if scoreVal >= hiScoreVal then
        hiScoreVal = scoreVal
    end
end