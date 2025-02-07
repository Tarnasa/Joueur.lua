-- Spitter: A Spiderling that creates and spits new Webs from the Nest it is on to another Nest, connecting them.
-- DO NOT MODIFY THIS FILE
-- Never try to directly create an instance of this class, or modify its member variables.
-- Instead, you should only be reading its variables and calling its functions.


local class = require("joueur.utilities.class")
local Spiderling = require("games.spiders.spiderling")

-- <<-- Creer-Merge: requires -->> - Code you add between this comment and the end comment will be preserved between Creer re-runs.
-- you can add additional require(s) here
-- <<-- /Creer-Merge: requires -->>

--- A Spiderling that creates and spits new Webs from the Nest it is on to another Nest, connecting them.
-- @classmod Spitter
local Spitter = class(Spiderling)

-- initializes a Spitter with basic logic as provided by the Creer code generator
function Spitter:init(...)
    Spiderling.init(self, ...)

    -- The following values should get overridden when delta states are merged, but we set them here as a reference for you to see what variables this class has.

    --- The Nest that this Spitter is creating a Web to spit at, thus connecting them. nil if not spitting.
    self.spittingWebToNest = nil

    --- (inherited) When empty string this Spiderling is not busy, and can act. Otherwise a string representing what it is busy with, e.g. 'Moving', 'Attacking'.
    -- @field[string] self.busy
    -- @see Spiderling.busy

    --- (inherited) String representing the top level Class that this game object is an instance of. Used for reflection to create new instances on clients, but exposed for convenience should AIs want this data.
    -- @field[string] self.gameObjectName
    -- @see GameObject.gameObjectName

    --- (inherited) A unique id for each instance of a GameObject or a sub class. Used for client and server communication. Should never change value after being set.
    -- @field[string] self.id
    -- @see GameObject.id

    --- (inherited) If this Spider is dead and has been removed from the game.
    -- @field[bool] self.isDead
    -- @see Spider.isDead

    --- (inherited) Any strings logged will be stored here. Intended for debugging.
    -- @field[{string, ...}] self.logs
    -- @see GameObject.logs

    --- (inherited) The Web this Spiderling is using to move. nil if it is not moving.
    -- @field[Web] self.movingOnWeb
    -- @see Spiderling.movingOnWeb

    --- (inherited) The Nest this Spiderling is moving to. nil if it is not moving.
    -- @field[Nest] self.movingToNest
    -- @see Spiderling.movingToNest

    --- (inherited) The Nest that this Spider is currently on. nil when moving on a Web.
    -- @field[Nest] self.nest
    -- @see Spider.nest

    --- (inherited) The number of Spiderlings busy with the same work this Spiderling is doing, speeding up the task.
    -- @field[number] self.numberOfCoworkers
    -- @see Spiderling.numberOfCoworkers

    --- (inherited) The Player that owns this Spider, and can command it.
    -- @field[Player] self.owner
    -- @see Spider.owner

    --- (inherited) How much work needs to be done for this Spiderling to finish being busy. See docs for the Work forumla.
    -- @field[number] self.workRemaining
    -- @see Spiderling.workRemaining


end

--- Creates and spits a new Web from the Nest the Spitter is on to another Nest, connecting them.
-- @tparam Nest nest The Nest you want to spit a Web to, thus connecting that Nest and the one the Spitter is on.
-- @treturn bool True if the spit was successful, false otherwise.
function Spitter:spit(nest)
    return not not (self:_runOnServer("spit", {
        nest = nest,
    }))
end

--- (inherited) Attacks another Spiderling
-- @function Spitter:attack
-- @see Spiderling:attack
-- @tparam Spiderling spiderling The Spiderling to attack.
-- @treturn bool True if the attack was successful, false otherwise.

--- (inherited) Adds a message to this GameObject's logs. Intended for your own debugging purposes, as strings stored here are saved in the gamelog.
-- @function Spitter:log
-- @see GameObject:log
-- @tparam string message A string to add to this GameObject's log. Intended for debugging.

--- (inherited) Starts moving the Spiderling across a Web to another Nest.
-- @function Spitter:move
-- @see Spiderling:move
-- @tparam Web web The Web you want to move across to the other Nest.
-- @treturn bool True if the move was successful, false otherwise.


-- <<-- Creer-Merge: functions -->> - Code you add between this comment and the end comment will be preserved between Creer re-runs.
-- if you want to add any client side logic this is where you can add them
-- <<-- /Creer-Merge: functions -->>

return Spitter
