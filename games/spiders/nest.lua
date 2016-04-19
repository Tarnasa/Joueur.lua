-- Generated by Creer at 12:46AM on April 16, 2016 UTC, git hash: 'f74143f3f89eebeaa381aba30a8afbda7d0e1d89'
-- This is a simple class to represent the Nest object in the game. You can extend it by adding utility functions here in this file.

local class = require("joueur.utilities.class")
local GameObject = require("games.spiders.gameObject")

-- <<-- Creer-Merge: requires -->> - Code you add between this comment and the end comment will be preserved between Creer re-runs.
-- you can add addtional require(s) here
-- <<-- /Creer-Merge: requires -->>

--- A location (node) connected to other Nests via Webs (edges) in the game that Spiders can converge on, regardless of owner.
-- @classmod Nest
local Nest = class(GameObject)

-- initializes a Nest with basic logic as provided by the Creer code generator
function Nest:init(...)
    GameObject.init(self, ...)

    -- The following values should get overridden when delta states are merged, but we set them here as a reference for you to see what variables this class has.

    --- All the Spiders currently located on this Nest.
    self.spiders = Table()
    --- Webs that connect to this Nest.
    self.webs = Table()
    --- The X coordinate of the Nest. Used for distance calculations.
    self.x = 0
    --- The Y coordinate of the Nest. Used for distance calculations.
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

--- (inherited) Adds a message to this GameObject's logs. Intended for your own debugging purposes, as strings stored here are saved in the gamelog.
-- @function Nest:log
-- @see GameObject:log
-- @tparam string message A string to add to this GameObject's log. Intended for debugging.


-- <<-- Creer-Merge: functions -->> - Code you add between this comment and the end comment will be preserved between Creer re-runs.

--- Calculates the distance from this Nest to another Nest
-- @tparam Nest nest The nest to calculate the distance to
-- @treturn number The euclidean distance between the two Nests
function Nest:distanceTo(nest)
    return math.sqrt( (nest.x - self.x)^2 + (nest.y - self.y)^2 )
end

-- <<-- /Creer-Merge: functions -->>

return Nest
