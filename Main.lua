local Observer = require("Observer")

local observer = Observer.new()

-- Our first listener
observer:Connect(function(...)
    print("Listener 1: ", ...)
end)

observer:Fire("Hello", "World")

observer:Connect(function(...)
    print("Listener 2: ", ...)
end)

observer:Fire("Goodbye", "World")