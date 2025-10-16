Ball = {}

function Ball:load()
    self.x = love.graphics.getWidth() / 2
    self.y = love.graphics.getHeight() / 2
    self.width = 15
    self.height = 15
    self.speed = 200
    self.veloX = -self.speed
    self.veloY = 0
end

function Ball:update(dt)
    self:move(dt)
    self:collision()
end

function Ball:collision()
    if CollisionChecker(self, Player) then
        self.veloX = -self.veloX
        local Bcenter = self.y + self.height / 2
        local Pcenter = Player.y + Player.height / 2
        local collisionDiff = Bcenter - Pcenter
        self.veloY = collisionDiff * 5 
            end
    
    if CollisionChecker(self, ai) then
        self.veloX = -self.veloX
        local Bcenter = self.y + self.height / 2
        local aicenter = ai.y + ai.height / 2
        local collisionDiff = Bcenter - aicenter
        self.veloY = collisionDiff * 5 
            end

    if self.y < 0 then
        self.y = 0
        self.veloY = -self.veloY
    elseif self.y + self.height > love.graphics.getHeight() then
        self.y = love.graphics.getHeight() - self.height
        self.veloY = -self.veloY
        end

    if self.x < 0 then
        self.x = love.graphics.getWidth() / 2 - self.width / 2
        self.y = love.graphics.getHeight() / 2 - self.height / 2
        self.veloX = -self.speed
    end

    if self.x + self.width > love.graphics.getWidth() then
        self.x = love.graphics.getWidth() / 2 - self.width / 2
        self.y = love.graphics.getHeight() / 2 - self.height / 2
        self.veloX = -self.speed
    end
end

function Ball:move(dt)
    self.x = self.x + self.veloX * dt
    self.y = self.y + self.veloY * dt
end

function Ball:draw()
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end