local __ = require 'underscore'
local meta = require 'luagravity.meta'

local Consts = require 'consts'

local Invader = require 'invader'

local function draw_list(invaders, x, y)
    return __(invaders):chain()
        :map(function(i)
            return i:_draw_list()
        end)
        :concat()
        :value()
end

local Swarm = function(...)
    local function constructor(ix, iy, iv, bullet)
        _v = iv
        _x = ix + S(_v)
        _y = iy

        local invaders = __.range(0, Consts.invader.rows * Consts.invader.columns - 1)
            :map(function(n)
                return Invader(n, _x, _y, bullet)
            end)
        
        _bounced = __.reduce(invaders, false, function(c, i)
            return OR(c, i._bounced)
        end)
            
        local function bounce()
            await(cond(_bounced))
            _v = _v() * -1
            _y = _y() + Consts.invader.side / 4
            return bounce()
        end
        spawn(bounce)

        return {_draw_list=L(draw_list)(invaders, _x, _y)}
    end

    return meta.apply(constructor)(...)
end

return Swarm
