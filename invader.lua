local __ = require 'underscore'
local math = math
local meta = require 'luagravity.meta'

local Consts = require 'consts'

local function draw_list(alive, x, y)
    if alive then
        return {{
            'rectangle', 'line',
            x, y,
            Consts.invader.side, Consts.invader.side
        }}
    else
        return {}
    end
end

local function bounced(alive, x)
    if alive then
        return x <= 0 or (x + Consts.invader.side) >= Consts.screen.width
    else
        return false
    end
end

local function box(x, y)
    return {x=x, y=y, width=Consts.invader.side, height=Consts.invader.side}
end

local function colliding(ibox, bbox)
    local ax2, ay2 = ibox.x + ibox.width, ibox.y + ibox.height
    local bx2, by2 = bbox.x + bbox.width, bbox.y + bbox.height
    return ibox.x < bx2 and ax2 > bbox.x and ibox.y < by2 and ay2 > bbox.y
end

local Invader = function(...)
    local function constructor(n, sx, sy, player_bullet)
        local col = n % Consts.invader.columns
        local row = math.floor(n / Consts.invader.columns)

        _x = (col * (Consts.invader.side * Consts.invader.y_spacing)) + sx
        _y = (row * (Consts.invader.side * Consts.invader.x_spacing)) + sy

        _box = L(box)(_x, _y)
        _hit = L(colliding)(_box, player_bullet._box)
        _alive = true

        local function die(when)
            await(cond(when))
            _alive = false
        end
        spawn(die, _hit)

        return {
            _draw_list=L(draw_list)(_alive, _x, _y),
            _bounced=L(bounced)(_alive, _x)
        }
    end

    return meta.apply(constructor)(...)
end
    
return Invader
