function onBeatHit()
    setHealth(getHealth()-(0.01*misses))
    cameraShake("game", 0.001*misses, 0.1)
end