local __ = require 'underscore'

local C = require 'consts'

local Bullet = require 'bullet'

return function()
    local bullet = Bullet(500, 500, C.bullet.v)

    __.extend(Screen, {bullet})

    await('key.escape')
end
