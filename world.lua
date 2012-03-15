local Bullet = require 'bullet'
local Consts = require 'consts'
local Swarm = require 'swarm'

return function()
    local player_bullet = Bullet(400, 500, -200)
    Screen:add(player_bullet)

    local swarm = Swarm(250, Consts.invader.side, 100)
    Screen:add(swarm)

    await(50)
end
