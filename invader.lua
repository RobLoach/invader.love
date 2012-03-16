local __ = require 'underscore'
local math = math
local meta = require 'luagravity.meta'

local C = require 'consts'

local function draw_list(x, y)
    return {{
        'rectangle', 'line',
        x, y,
        C.invader.side, C.invader.side,
    }}
end

local function bounced(x)
    return x <= 0 or (x + C.invader.side) >= C.screen.width
end

local Invader = function(...)
    local function constructor(n, sx, sy)
        local col = n % C.swarm.columns
        local row = math.floor(n / C.swarm.columns)

        _x = (col * (C.invader.side * C.invader.spacing.x)) + sx
        _y = (row * (C.invader.side * C.invader.spacing.y)) + sy

        return {
            _draw_list=L(draw_list)(_x, _y),
            _bounced=L(bounced)(_x),
        }
    end

    return meta.apply(constructor)(...)
end

return Invader
