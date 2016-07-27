--[[
  General functions
]]


--[[

  Collision detection: basic

]]

local x_boundary = love.graphics.getWidth() / 2
local y_boundary = love.graphics.getHeight() / 2

function touchingEdge (object)
    return ((math.abs(object.x) + object.width) >= x_boundary) or
           ((math.abs(object.y) + object.height) >= y_boundary)
end
