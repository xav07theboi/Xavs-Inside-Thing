function onEndSong()
    if getAchievementScore("d_runninperfection") < rating*100 and practice == false then
        setAchievementScore("d_runninperfection",rating*100)
    end
end