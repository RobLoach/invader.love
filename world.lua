local __ = require 'underscore'

local Consts = require 'consts'

local Bullet = require 'bullet'
local Player = require 'player'
local Swarm = require 'swarm'

return function()
    local bullet = Bullet(-1, -1, Consts.bullet.v)

    local swarm = Swarm(Consts.swarm.initial.x,
                        Consts.swarm.initial.y,
                        Consts.invader.speed,
                        bullet)

    local player = Player(Consts.screen.width / 2,
                          Consts.screen.height - Consts.player.height - 1,
                          Consts.player.speed)
    link('key.left', player.left)
    link('key.right', player.right)

    local function shoot()
        bullet.shoot(player._x(), player._y() - Consts.bullet.height / 2)
    end
    link('key. ', shoot)
    link('key.up', shoot)

    __.extend(Screen, {bullet, swarm, player})

    await('key.escape')
end
