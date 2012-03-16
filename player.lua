local meta = require 'luagravity.meta'

local C = require 'consts'

local function draw_list(x, y)
    return {{
        'triangle', 'line',
        x, y,
        x + C.player.width, y + C.player.height,
        x - C.player.width, y + C.player.height,
    }}
end

local Player = function(...)
    local function constructor(ix, iy)
        _x = ix
        _y = iy

        return {
            _draw_list = L(draw_list)(_x, _y),
        }
    end

    return meta.apply(constructor)(...)
end

return Player
