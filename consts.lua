local C = {}

C.screen = {
    width = love.graphics.getWidth(),
    height = love.graphics.getHeight(),
}

C.bullet = {
    height = 25,
    width = 3,
    v = -200,
}

C.invader = {
    columns = 7,
    rows = 11,
    side = 25,
    spacing = {
        x = 2,
        y = 1.5,
    },
    speed = 100,
}

C.swarm = {
    initial = {
        x = (C.screen.width / 2) - ((C.invader.side * C.invader.spacing.x) * C.invader.columns) / 2,
        y = C.invader.side,
    },
}

C.player = {
    width = 25 * 1.5,
    height = 25,
    speed = 150,
}

return C
