local __ = require 'underscore'
local gvt = require 'luagravity'
local meta = require 'luagravity.meta'

local world = require 'world'

function love.load()
    w = meta.apply(world)
    app = gvt.start(w)
end

function love.keypressed(key)
    if app.state ~= 'ready' then
        gvt.step(app, 'key.' .. key)
    end
end

function love.update(dt)
    if app.state ~= 'ready' then
        gvt.step(app, 'dt', dt)
    elseif app.state ~= 'stopped' then
        love.event.push('q')
    end
end
