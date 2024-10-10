function onSongStart()
    started = true
end
---
--- @param character string
---
function onMoveCamera(character)
    if started == true then
        triggerEvent("spacebar", 1, 1)
    end
end