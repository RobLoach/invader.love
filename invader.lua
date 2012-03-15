local __ = require 'underscore'
local math = math
local meta = require 'luagravity.meta'

local Consts = require 'consts'

local function draw_list(x, y)
    return {{
        'rectangle', 'line',
        x, y,
        Consts.invader.side, Consts.invader.side
    }}
end

local function bounced(x)
    return x <= 0 or (x + Consts.invader.side) >= Consts.screen.width
end

local Invader = meta.apply(function(n, sx, sy)
    local col = n % Consts.invader.columns
    local row = math.floor(n / Consts.invader.columns)

    local _x = (col * (Consts.invader.side * 2)) + sx
    local _y = (row * (Consts.invader.side * 1.5)) + sy

    return {
        _draw_list=L(draw_list)(_x, _y),
        _bounced=L(bounced)(_x)
    }
end)

return Invader
