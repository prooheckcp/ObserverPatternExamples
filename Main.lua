local Subject = require("Subject")

local subject = Subject.new()

-- Our first listener
subject:Connect(function(...)
    print("Listener 1: ", ...)
end)

subject:Fire("Hello", "World") -- Will only fire listener 1

-- Our Second listener
subject:Connect(function(...)
    print("Listener 2: ", ...)
end)

subject:Fire("Goodbye", "World") -- Will fire listener 1 and 2