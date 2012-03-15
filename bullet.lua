local Consts = require 'consts'
local meta = require 'luagravity.meta'

local function draw_list(x, y)
    return {{'line', x, y, x, y + Consts.bullet.height}}
end

local function box(x, y)
    return {x=x, y=y, width=1, height=Consts.bullet.height}
end

local Bullet = meta.apply(function(ix, iy, iv)
    local _y = iy + S(iv)
    return {
        _box = L(box)(ix, _y),
	_draw_list=L(draw_list)(ix, _y)
    }
end)

return Bullet
