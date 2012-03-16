local __ = require 'underscore'
local gvt = require 'luagravity'
local meta = require 'luagravity.meta'

local world = require 'world'

local screen = {}

function love.load()
    w = meta.apply(world, {Screen=screen})
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

function love.draw()
    for i, v in pairs(screen) do
        if type(i) == 'number' then
            __.map(v:_draw_list(), function(dl)
                love.graphics[dl[1]](unpack(dl, 2))
            end)
        end
    end
end
