-- Generated by Creer, git hash c6767247662bdc8024518de1aebc87bcf634ca49
-- This is a simple class to represent the GameObject object in the game. You can extend it by adding utility functions here in this file.

local class = require("utilities.class")
local BaseGameObject = require("baseGameObject")

--- @class GameObject: An object in the game. The most basic class that all game classes should inherit from automatically.
local GameObject = class(BaseGameObject)

--- initializes a GameObject with basic logic as provided by the Creer code generator
-- @param <table> data: initialization data
function GameObject:init(data)
    BaseGameObject.init(self, data)

    if data.id == nil then -- set to default value because it was not sent
        self.id = ""
    else
        self.id = tostring(data.id)
    end

    if data.logs == nil then -- set to default value because it was not sent
        self.logs = Table()
    else
        self.logs = (data.logs)
    end

end


--- adds a message to this game object's log. Intended for debugging purposes.
-- @param <string> message: A string to add to this GameObject's log. Intended for debugging.
function GameObject:log(message)
    return self._client:sendCommand(self, "log", {
        message = message,
    })
end

return GameObject
