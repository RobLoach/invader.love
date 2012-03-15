local U = require 'underscore'
local math = math

local print=print
local unpack=unpack

local M = {}
function M.run()
    _v = -100
    _x = 250 + S(_v)
    _y = INVADER_SIDE

    function invader_draw(x, y)
        return {
            'rectangle', 'line',
            x, y,
            INVADER_SIDE, INVADER_SIDE
        }
    end

    function invader_x(n, x)
        local col = n % INVADER_COLUMNS
        return (col * (INVADER_SIDE * 2)) + x
    end

    function invader_y(n, y)
        local row = math.floor(n / INVADER_COLUMNS)
        return (row * (INVADER_SIDE * 1.5)) + y
    end

    function invader_bounced(x)
        return x <= 0 or (x + INVADER_SIDE) >= Screen.width
    end

    function invader_spawn(n)
        local x = L(invader_x)(n, _x)
        local y = L(invader_y)(n, _y)
	return {
            x = x, y = y,
            bounced = L(invader_bounced)(x),
            sid = Screen:add(L(invader_draw)(x, y))
        }
    end

    invaders = U.range(0, INVADER_ROWS * INVADER_COLUMNS - 1)
      :map(invader_spawn)

    function invaders_bounced(...)
        return U.reduce(arg, false, function(c, i)
            return c or i
        end)
    end

    -- Bounce the invaders
    spawn(function(when)
        while true do
            await(cond(when))
            _v = _v() * -1
            _y = _y() + 1
        end
    end, L(invaders_bounced)(unpack(U.pluck(invaders, 'bounced'))))

    -- TODO: Make this real
    await(15)
end

return M
