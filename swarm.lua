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
end

local Swarm = function(...)
    local function constructor(ix, iy, iv, player_bullet)
	_v = iv
	_x = 250 + S(_v)
	_y = iy

	local invaders = __.range(0, Consts.invader.rows * Consts.invader.columns - 1)
	    :map(function(n)
		return Invader(n, _x, _y, player_bullet)
	    end)

	local function bounce(when)
	    await(cond(when))
	    _v = _v() * -1
	    _y = _y() + 1
	    return bounce(when)
	end
	local function any(...) return __.any(arg) end
	spawn(bounce, L(any)(unpack(__.pluck(invaders, '_bounced'))))

	return {_draw_list=L(draw_list)(invaders, _x, _y)}
    end

    return meta.apply(constructor)(...)
end

return Swarm
