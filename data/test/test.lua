function onSongStart()
    noteTweenAlpha("pl", 4, nil, 1.0, "Linear")
    noteTweenAlpha("ol", 3, nil, 1.0, "Linear")
    runTimer("startleft",0.5,1)
end
---
--- @param tag string
--- @param loops integer
--- @param loopsLeft integer
---
function onTimerCompleted(tag, loops, loopsLeft)
    if tag == "startleft" then
        noteTweenAlpha("pd", 5, nil, 1.0, "Linear")
        noteTweenAlpha("od", 2, nil, 1.0, "Linear")
        runTimer("startdown",0.5,1)
    elseif tag == "startdown" then
        noteTweenAlpha("pu", 6, nil, 1.0, "Linear")
        noteTweenAlpha("ou", 1, nil, 1.0, "Linear")
        runTimer("startup",0.5,1)
    elseif tag == "startup" then
        noteTweenAlpha("pr", 7, nil, 1.0, "Linear")
        noteTweenAlpha("or", 0, nil, 1.0, "Linear")
    end
end
---
--- @param tag string
---
function onTweenCompleted(tag, 
    vars)
    if tag == "pl" or tag == "ol" then
        noteTweenAlpha("rpl", 4, 1.0, 1.0, "Linear")
        noteTweenAlpha("rol", 3, 1.0, 1.0, "Linear")
    elseif tag == "rpl" or tag == "rol" then
        noteTweenAlpha("pl", 4, nil, 1.0, "Linear")
        noteTweenAlpha("ol", 3, nil, 1.0, "Linear")
    elseif tag == "pd" or tag == "od" then
        noteTweenAlpha("rpd", 5, 1.0, 1.0, "Linear")
        noteTweenAlpha("rod", 2, 1.0, 1.0, "Linear")
    elseif tag == "rpd" or tag == "rod" then
        noteTweenAlpha("pd", 5, nil, 1.0, "Linear")
        noteTweenAlpha("od", 2, nil, 1.0, "Linear")
    elseif tag == "pu" or tag == "ou" then
        noteTweenAlpha("rpu", 6, 1.0, 1.0, "Linear")
        noteTweenAlpha("rou", 1, 1.0, 1.0, "Linear")
    elseif tag == "rpu" or tag == "rou" then
        noteTweenAlpha("pu", 6, nil, 1.0, "Linear")
        noteTweenAlpha("ou", 1, nil, 1.0, "Linear")
    elseif tag == "pr" or tag == "or" then
        noteTweenAlpha("rpr", 7, 1.0, 1.0, "Linear")
        noteTweenAlpha("ror", 0, 1.0, 1.0, "Linear")
    elseif tag == "rpr" or tag == "ror" then
        noteTweenAlpha("pr", 7, nil, 1.0, "Linear")
        noteTweenAlpha("or", 0, nil, 1.0, "Linear")
    end
end