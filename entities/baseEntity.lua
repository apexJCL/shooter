local x_boundary = love.graphics.getWidth() / 2
local y_boundary = love.graphics.getHeight() / 2

BaseEntity = {}

--[[

  BaseEntity: It defines a basic object with basic attributes and functions

]]
function BaseEntity:new ()
  description = {
    x = 0,
    y = 0,
    direction = 0,
    scaleX = 1,
    scaleY = 1,
    sprite = nil,
    width = 0,
    height = 0,
    centerInOrigin = false
  }
  self.__index = self
  return setmetatable(description, self)
end

--[[

  BaseEntity: setSprite

  Sets the new sprite, assings new width and height.
  Optionally, you can indicate if you want it to offset it center to the
  absolute image center

  Parameters:
  sprite: love.graphics.newImage
  center: boolean


]]
function BaseEntity:setSprite (sprite, center)
  self.sprite, self.width, self.height = sprite, sprite:getDimensions()
  self.centerInOrigin = center
end

--[[

  BaseEntity: draw

  It draws the sprite according to the default contents of this object

]]

function BaseEntity:draw ()
  if self.centerInOrigin then
    love.graphics.draw(
      self.sprite,
      self.x,
      self.y,
      self.direction,
      self.scaleX,
      self.scaleY,
      self.width / 2,
      self.height / 2)
  else
    love.graphics.draw(
      self.sprite,
      self.x,
      self.y,
      self.direction,
      self.scaleX,
      self.scaleY)
  end
end

--[[

  BaseEntity: act

]]

function BaseEntity:act (dt)
end

--[[

  BaseEntity: script

]]

function BaseEntity:script (dt)
end

--[[

  Collision detection: basic

]]

function BaseEntity:touchingEdge ()
    return ((math.abs(self.x) + self.width) >= x_boundary) or
           ((math.abs(self.y) + self.height) >= y_boundary)
end

function BaseEntity:touching (objectA, objectB)
  -- Check for collision between bodies
end
