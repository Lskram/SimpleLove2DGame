local player = {
    x = 300,
    y = 400,
    speed = 100,
    image = nil,
    scale = 0.08
}

local meat = {
    x = 0,
    y = 0,
    image = nil,
    scale = 0.08
}

function love.load()
    -- โหลดรูปภาพของ player และ meat
    player.image = love.graphics.newImage("player.png")
    meat.image = love.graphics.newImage("meat.png")

    -- สุ่มตำแหน่งเริ่มต้นของ meat
    meat.x = math.random(0, love.graphics.getWidth() - meat.image:getWidth() * meat.scale)
    meat.y = math.random(0, love.graphics.getHeight() - meat.image:getHeight() * meat.scale)
end

function love.update(dt)
    -- ควบคุมการเคลื่อนที่ของ player ด้วยปุ่มลูกศร
    if love.keyboard.isDown("right") then
        player.x = player.x + player.speed * dt
    elseif love.keyboard.isDown("left") then
        player.x = player.x - player.speed * dt
    end

    if love.keyboard.isDown("down") then
        player.y = player.y + player.speed * dt
    elseif love.keyboard.isDown("up") then
        player.y = player.y - player.speed * dt
    end

    -- ตรวจสอบการชนกันระหว่าง player และ meat
    if CheckCollision(player.x, player.y, player.image:getWidth() * player.scale, player.image:getHeight() * player.scale, meat.x, meat.y, meat.image:getWidth() * meat.scale, meat.image:getHeight() * meat.scale) then
        -- เพิ่มความเร็วให้ player และสุ่มตำแหน่งใหม่ให้ meat
        player.speed = player.speed + 15
        meat.x = math.random(0, love.graphics.getWidth() - meat.image:getWidth() * meat.scale)
        meat.y = math.random(0, love.graphics.getHeight() - meat.image:getHeight() * meat.scale)
    end
end

function love.draw()
    -- วาดภาพ player ที่ตำแหน่ง (player.x, player.y) และปรับขนาดภาพ
    love.graphics.draw(player.image, player.x, player.y, 0, player.scale, player.scale)

    -- วาดภาพ meat ที่ตำแหน่ง (meat.x, meat.y) และปรับขนาดภาพ
    love.graphics.draw(meat.image, meat.x, meat.y, 0, meat.scale, meat.scale)

    -- พิมพ์ข้อความ "Hello, Love2D!" ที่ตำแหน่ง (400, 300)
    love.graphics.print("Hello, Love2D!", 400, 300)
end

-- ฟังก์ชันตรวจสอบการชนกัน
function CheckCollision(x1, y1, w1, h1, x2, y2, w2, h2)
    return x1 < x2 + w2 and
           x2 < x1 + w1 and
           y1 < y2 + h2 and
           y2 < y1 + h1
end
