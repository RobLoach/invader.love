local meta = require 'luagravity.meta'

local Consts = require 'consts'

local function draw_list(x, y)
    return {{'line', x, y, x, y + Consts.bullet.height}}
end

local function box(x, y)
    return {x=x, y=y, width=1, height=Consts.bullet.height}
end

local Bullet = function(...)
    local function constructor(ix, iy, iv)
	_v = iv
	_y = iy + S(_v)

	return {
	    _box = L(box)(ix, _y),
	    _draw_list = L(draw_list)(ix, _y),
	    reload = reload
	}
    end

    return meta.apply(constructor)(...)
end

return Bullet
