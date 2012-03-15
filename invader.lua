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

local function bounced(x)
    return x <= 0 or (x + Consts.invader.side) >= Consts.screen.width
end

local function box(x, y)
    return {x=x, y=y, width=Consts.invader.side, height=Consts.invader.side}
end

local function colliding(ibox, bbox)
    local ax2, ay2 = ibox.x + ibox.width, ibox.y + ibox.height
    local bx2, by2 = bbox.x + bbox.width, bbox.y + bbox.height
    return ibox.x < bx2 and ax2 > bbox.x and ibox.y < by2 and ay2 > bbox.y
end

local function alive()
    local been_hit = false

    return function(hit)
        been_hit = been_hit or hit
        return not been_hit
    end
end

local Invader = meta.apply(function(n, sx, sy, player_bullet)
    local col = n % Consts.invader.columns
    local row = math.floor(n / Consts.invader.columns)

    local _x = (col * (Consts.invader.side * 2)) + sx
    local _y = (row * (Consts.invader.side * 1.5)) + sy

    local _box = L(box)(_x, _y)
    local _hit = L(colliding)(_box, player_bullet._box)
    local _alive = L(alive())(_hit)

    return {
        _draw_list=L(draw_list)(_alive, _x, _y),
        _bounced=L(bounced)(_x)
    }
end)

return Invader
