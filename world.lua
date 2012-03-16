local __ = require 'underscore'

local C = require 'consts'

return function()
    local thing = {}
    function thing:_draw_list()
        return {{'rectangle', 'line', 10, 10, 500, 500}}
    end

    __.extend(Screen, {thing})

    await('key.escape')
end
