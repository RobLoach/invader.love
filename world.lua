local __ = require 'underscore'

local C = require 'consts'

local Bullet = require 'bullet'
local Swarm = require 'swarm'

return function()
    local bullet = Bullet(500, 500, C.bullet.v)

    local swarm = Swarm(C.swarm.initial.x,
                        C.swarm.initial.y)

    __.extend(Screen, {bullet, swarm})

    await('key.escape')
end
