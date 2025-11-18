local Observer = {}
Observer.__index = Observer
Observer._Listeners = {}

function Observer.new()
    local self = setmetatable({
        _Listeners = {},
    }, Observer)
    
    return self
end

function Observer:Fire(...) -- Fires the listeners with the given arguments
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

function Observer:Connect(callback) -- Subscribes the listener
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

return Observer