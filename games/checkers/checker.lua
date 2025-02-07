-- Checker: A checker on the game board.
-- DO NOT MODIFY THIS FILE
-- Never try to directly create an instance of this class, or modify its member variables.
-- Instead, you should only be reading its variables and calling its functions.


local class = require("joueur.utilities.class")
local GameObject = require("games.checkers.gameObject")

-- <<-- Creer-Merge: requires -->> - Code you add between this comment and the end comment will be preserved between Creer re-runs.
-- you can add additional require(s) here
-- <<-- /Creer-Merge: requires -->>

--- A checker on the game board.
-- @classmod Checker
local Checker = class(GameObject)

-- initializes a Checker with basic logic as provided by the Creer code generator
function Checker:init(...)
    GameObject.init(self, ...)

    -- The following values should get overridden when delta states are merged, but we set them here as a reference for you to see what variables this class has.

    --- If the checker has been kinged and can move backwards.
    self.kinged = false
    --- The player that controls this Checker.
    self.owner = nil
    --- The x coordinate of the checker.
    self.x = 0
    --- The y coordinate of the checker.
    self.y = 0

    --- (inherited) String representing the top level Class that this game object is an instance of. Used for reflection to create new instances on clients, but exposed for convenience should AIs want this data.
    -- @field[string] self.gameObjectName
    -- @see GameObject.gameObjectName

    --- (inherited) A unique id for each instance of a GameObject or a sub class. Used for client and server communication. Should never change value after being set.
    -- @field[string] self.id
    -- @see GameObject.id

    --- (inherited) Any strings logged will be stored here. Intended for debugging.
    -- @field[{string, ...}] self.logs
    -- @see GameObject.logs


end

--- Returns if the checker is owned by your player or not.
-- @treturn bool True if it is yours, false if it is not yours.
function Checker:isMine()
    return not not (self:_runOnServer("isMine", {
    }))
end

--- Moves the checker from its current location to the given (x, y).
-- @tparam number x The x coordinate to move to.
-- @tparam number y The y coordinate to move to.
-- @treturn Checker Returns the same checker that moved if the move was successful. nil otherwise.
function Checker:move(x, y)
    return (self:_runOnServer("move", {
        x = x,
        y = y,
    }))
end

--- (inherited) Adds a message to this GameObject's logs. Intended for your own debugging purposes, as strings stored here are saved in the gamelog.
-- @function Checker:log
-- @see GameObject:log
-- @tparam string message A string to add to this GameObject's log. Intended for debugging.


-- <<-- Creer-Merge: functions -->> - Code you add between this comment and the end comment will be preserved between Creer re-runs.
-- if you want to add any client side logic this is where you can add them
-- <<-- /Creer-Merge: functions -->>

return Checker
