---
--- @param membersIndex int
--- @param noteData int
--- @param noteType string
--- @param isSustainNote bool
---
function noteMiss(membersIndex, noteData, noteType, isSustainNote)
    if noteType == "Instakill Note" then
        playSound("so-you-get-nothing!-you-lose!-good-day-sir!")
    end
end