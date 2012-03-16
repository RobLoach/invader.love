local Consts = require 'consts'

local Bullet = require 'bullet'
local Player = require 'player'
local Swarm = require 'swarm'

return function()
    local player_bullet = Bullet(-1, -1, Consts.bullet.v)
    Screen:add(player_bullet)

    local swarm = Swarm((Consts.screen.width / 2) -
                            ((Consts.invader.side * Consts.invader.x_spacing) * Consts.invader.columns) / 2,
                        Consts.invader.side,
                        Consts.invader.speed,
                        player_bullet)
    Screen:add(swarm)

    local player = Player(Consts.screen.width / 2,
                          Consts.screen.height - Consts.player.height - 1,
                          Consts.player.speed)
    Screen:add(player)
    link('key.left', player.left)
    link('key.right', player.right)

    local function shoot()
        player_bullet.reload(player._x(), player._y() - Consts.bullet.height / 2)
    end
    link('key. ', shoot)
    link('key.up', shoot)

    await('key.escape')
end
