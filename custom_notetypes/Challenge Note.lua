madeup = 0
makeup = 0
badmiss = 0
---
--- @param membersIndex int
--- @param noteData int
--- @param noteType string
--- @param isSustainNote bool
---
function onCreate()
    makeLuaText("chaltext", "yeah", screenWidth, 0, (screenHeight / 2))
    addLuaText("chaltext")
    setTextSize("chaltext", screenWidth*0.05)
    doTweenColor("chaltextwarningred", "chaltext", "FF0000", 1.0/framerate, "Linear")
    doTweenAlpha("superakfdsuk", "chaltext", nil, 40.0/framerate, "Linear")
end
function goodNoteHit(membersIndex, noteData, noteType, isSustainNote)
    if noteType == "Challenge Note" then
        makeup = makeup + getMisses()-madeup
        runTimer("challenge",10,0)
        doTweenAlpha("yeah", "chaltext", 1.0, 1.0/framerate, "Linear")
    end
    if isSustainNote == false then
         if makeup > 0 then
            madeup = madeup + 1
            makeup = makeup - 1
            setTextString("chaltext","hit "..makeup.." more notes to not die")
         end
    end
    if makeup == 0 then
        cancelTimer("challenge")
        doTweenAlpha("yeah", "chaltext", nil, 1.0, "Linear")
    end
end
---
--- @param membersIndex int
--- @param noteData int
--- @param noteType string
--- @param isSustainNote bool
---
function noteMiss(membersIndex, noteData, noteType, isSustainNote)
    if noteType == "Challenge Note" then
        badmiss = badmiss + 1
        madeup = -10 * badmiss
        makeup = makeup + getMisses()+(10*badmiss)
        runTimer("challenge",10,0)
        doTweenAlpha("yeah", "chaltext", 1.0, 1.0/framerate, "Linear")
        setTextString("chaltext","hit "..makeup.." more notes to not die")
        
    end
end
---
--- @param tag string
--- @param loops integer
--- @param loopsLeft integer
---
function onTimerCompleted(tag, loops, loopsLeft)
    if tag == "challenge" then
        playSound("so-you-get-nothing!-you-lose!-good-day-sir!")
        setHealth(0)
    end
end