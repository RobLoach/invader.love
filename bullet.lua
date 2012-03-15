local Consts = require 'consts'
local meta = require 'luagravity.meta'

local function draw_list(x, y)
    return {{'circle', 'fill', x, y, Consts.bullet.radius, Consts.bullet.segments}}
end

local Bullet = meta.apply(function(ix, iy, iv)
    local _y = iy + S(iv)
    return {_draw_list=L(draw_list)(ix, _y)}
end)

return Bullet
