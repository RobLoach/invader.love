local __ = require 'underscore'

local C = require 'consts'

local Bullet = require 'bullet'
local Player = require 'player'
local Swarm = require 'swarm'

return function()
    local bullet = Bullet(500, 500, C.bullet.v)

    local swarm = Swarm(C.swarm.initial.x,
                        C.swarm.initial.y)

    local player = Player(C.player.initial.x,
                          C.player.initial.y)
    link('key.left', player.left)
    link('key.right', player.right)

    __.extend(Screen, {bullet, swarm, player})

    await('key.escape')
end
