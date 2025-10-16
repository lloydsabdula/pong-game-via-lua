require("player")
require("ball")
require("enemyai")

function love.load()
    Player:load()
    Ball:load()
    ai:load()
end

function love.update(dt)
    Player:update(dt)
    Ball:update(dt)
    ai:update(dt)
end

function love.draw()
    Player:draw()
    Ball:draw()
    ai:draw()
end

function CollisionChecker(a, b)
    if a.x < b.x + b.width and
        b.x < a.x + a.width and
        a.y < b.y + b.height and
        b.y < a.y + a.height then
           return true
    else
           return false    
    end
end