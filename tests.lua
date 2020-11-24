
-- clear console
-- for i=1,10 do print(" ") end
-- print("-- starting program --")

-- class to represent turtle object (for debugging)
-- turtle = {
--     getFuelLevel = function() return 0 end,
--     dig = function() print("dig") end,
--     inspect = function() return true, {name = "minecraft:flowing_lava"} end,

--     place = function() print("places") end,
--     refuel = function() print("refueled") end,

--     detect = function() return false end,
--     forward = function() print("moved forward") end,
--     -- name_here = function() return true end,
--     -- name_here = function() return true end,
--     -- name_here = function() return true end,
--     -- name_here = function() return true end
-- }


function can_refuel_lava()
    -- run simple boolean detect (less intensive)
    if (turtle.detect()) then return false end

    local success, data = turtle.inspect()
    
    return (data.name == "minecraft:flowing_lava")
end

function refuel_lava()
    
    -- pickup lava and refuel turtle
    turtle.place()
    turtle.refuel()

    turtle.forward()
end

function mine()
    turtle.dig()
    turtle.forward()
end


for i=1,10 do
    if can_refuel_lava() then
        refuel_lava()
    else
        mine()
    end
end