local Subject = {}
Subject.__index = Subject
Subject._Listeners = {}

function Subject.new() -- Constructor
    local self = setmetatable({
        _Listeners = {},
    }, Subject)
    
    return self
end

function Subject:Fire(...) -- Fires the listeners with the given arguments
    for _, listener in pairs(self._Listeners) do
        local args = {...}

        local success, error_message = pcall(function()
            listener(table.unpack(args))
        end)

        if not success then
            print(error_message)
        end
    end
end

function Subject:Connect(callback) -- Subscribes the listener
    if type(callback) ~= "function" then
        error(string.format("Callback must be of type function, got %s instead", type(callback)))
    end

    table.insert(self._Listeners, callback)

    return function () -- Returns a disconnect function
        for i = #self._Listeners, 1, -1 do
            if self._Listeners[i] == callback then
                table.remove(self._Listeners, i)
                break
            end
        end
    end
end

return Subject