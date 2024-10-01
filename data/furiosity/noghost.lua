total = 0
damage = 0.25*playbackRate
started = false
function onSongStart()
    started = true
end
function onUpdate(elapsed)
    if started == false then
        return
    end
    total = total + (elapsed*playbackRate)
    percent = total/(songLength/1000)
    thing = damage * elapsed * percent
    setHealth(getHealth()-thing)
end