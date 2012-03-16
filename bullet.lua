local meta = require 'luagravity.meta'

local C = require 'consts'

local function draw_list(x, y)
    return {
        {'setLineWidth', C.bullet.width},
        {'line', x, y, x, y + C.bullet.height},
        {'setLineWidth', 1},
    }
end

local Bullet = function(...)
    local function constructor(ix, iy, v)
        _x = ix
        _y = iy + S(v)

        return {
            _draw_list = L(draw_list)(_x, _y),
        }
    end

    return meta.apply(constructor)(...)
end

return Bullet
