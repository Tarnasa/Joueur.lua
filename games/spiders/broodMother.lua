-- BroodMother: The Spider Queen. She alone can spawn Spiderlings for each Player, and if she dies the owner loses.
-- DO NOT MODIFY THIS FILE
-- Never try to directly create an instance of this class, or modify its member variables.
-- Instead, you should only be reading its variables and calling its functions.


local class = require("joueur.utilities.class")
local Spider = require("games.spiders.spider")

-- <<-- Creer-Merge: requires -->> - Code you add between this comment and the end comment will be preserved between Creer re-runs.
-- you can add additional require(s) here
-- <<-- /Creer-Merge: requires -->>

--- The Spider Queen. She alone can spawn Spiderlings for each Player, and if she dies the owner loses.
-- @classmod BroodMother
local BroodMother = class(Spider)

-- initializes a BroodMother with basic logic as provided by the Creer code generator
function BroodMother:init(...)
    Spider.init(self, ...)

    -- The following values should get overridden when delta states are merged, but we set them here as a reference for you to see what variables this class has.

    --- How many eggs the BroodMother has to spawn Spiderlings this turn.
    self.eggs = 0
    --- How much health this BroodMother has left. When it reaches 0, she dies and her owner loses.
    self.health = 0

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

    --- (inherited) The Nest that this Spider is currently on. nil when moving on a Web.
    -- @field[Nest] self.nest
    -- @see Spider.nest

    --- (inherited) The Player that owns this Spider, and can command it.
    -- @field[Player] self.owner
    -- @see Spider.owner


end

--- Consumes a Spiderling of the same owner to regain some eggs to spawn more Spiderlings.
-- @tparam Spiderling spiderling The Spiderling to consume. It must be on the same Nest as this BroodMother.
-- @treturn bool True if the Spiderling was consumed. False otherwise.
function BroodMother:consume(spiderling)
    return not not (self:_runOnServer("consume", {
        spiderling = spiderling,
    }))
end

--- Spawns a new Spiderling on the same Nest as this BroodMother, consuming an egg.
-- @tparam string spiderlingType The string name of the Spiderling class you want to Spawn. Must be 'Spitter', 'Weaver', or 'Cutter'.
-- @treturn Spiderling The newly spwaned Spiderling if successful. nil otherwise.
function BroodMother:spawn(spiderlingType)
    return (self:_runOnServer("spawn", {
        spiderlingType = spiderlingType,
    }))
end

--- (inherited) Adds a message to this GameObject's logs. Intended for your own debugging purposes, as strings stored here are saved in the gamelog.
-- @function BroodMother:log
-- @see GameObject:log
-- @tparam string message A string to add to this GameObject's log. Intended for debugging.


-- <<-- Creer-Merge: functions -->> - Code you add between this comment and the end comment will be preserved between Creer re-runs.
-- if you want to add any client side logic this is where you can add them
-- <<-- /Creer-Merge: functions -->>

return BroodMother
