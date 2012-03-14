local gvt = require 'luagravity'
local meta = require 'luagravity.meta'
local invader = require 'invader'

local screen = {
    width=love.graphics.getWidth(),
    height=love.graphics.getHeight()
}

function screen:add(cmd)
    table.insert(self, cmd)
    return #self
end

function screen:remove(idx)
    self[idx] = nil
end

function love.load()
    opts = {
        INVADER_COLUMNS = 7,
        INVADER_ROWS = 11,
        INVADER_SIDE = 25,
        Screen = screen,
        meta = meta
    }
    world = meta.apply(invader.run, opts)
    app = gvt.start(world)
end

function love.update(dt)
    if app.state ~= 'ready' then
        gvt.step(app, 'dt', dt)
    end
end

function love.draw()
    for i, v in pairs(screen) do
        if type(i) == 'number' then
            local cmd = v()
            love.graphics[cmd[1]](unpack(cmd, 2))
        end
    end
end
