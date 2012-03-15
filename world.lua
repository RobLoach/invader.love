local Bullet = require 'bullet'
local Consts = require 'consts'
local Player = require 'player'
local Swarm = require 'swarm'

return function()
    local player_bullet = Bullet(400, 500, -200)
    Screen:add(player_bullet)

    local swarm = Swarm(250, Consts.invader.side, 100, player_bullet)
    Screen:add(swarm)

    local player = Player(400, 600 - (Consts.invader.side * 1.5), 100)
    link('key.left', player.left)
    link('key.right', player.right)
    Screen:add(player)

    await('key.escape')
end
