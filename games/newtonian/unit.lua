-- Unit: A unit in the game. May be a manager, intern, or physicist.
-- DO NOT MODIFY THIS FILE
-- Never try to directly create an instance of this class, or modify its member variables.
-- Instead, you should only be reading its variables and calling its functions.


local class = require("joueur.utilities.class")
local GameObject = require("games.newtonian.gameObject")

-- <<-- Creer-Merge: requires -->> - Code you add between this comment and the end comment will be preserved between Creer re-runs.
-- you can add additional require(s) here
-- <<-- /Creer-Merge: requires -->>

--- A unit in the game. May be a manager, intern, or physicist.
-- @classmod Unit
local Unit = class(GameObject)

-- initializes a Unit with basic logic as provided by the Creer code generator
function Unit:init(...)
    GameObject.init(self, ...)

    -- The following values should get overridden when delta states are merged, but we set them here as a reference for you to see what variables this class has.

    --- Whether this Unit has performed its action this turn.
    self.acted = false
    --- The amount of blueium carried by this unit.
    self.blueium = 0
    --- The amount of blueium ore carried by this unit.
    self.blueiumOre = 0
    --- If a ship is on this Tile, how much health it has remaining.
    self.health = 0
    --- The Job this Unit does.
    self.job = nil
    --- How many more times this Unit may move this turn.
    self.moves = 0
    --- The Player that owns and can control this Unit.
    self.owner = nil
    --- The amount of redium carried by this unit.
    self.redium = 0
    --- The amount of redium ore carried by this unit.
    self.rediumOre = 0
    --- Duration of stun immunity.
    self.stunImmune = 0
    --- Duration the unit is stunned.
    self.stunTime = 0
    --- The Tile this Unit is on.
    self.tile = nil

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

--- Makes the unit do something to a machine on its tile. Interns sabotage, physicists run, and managers protect.
-- @tparam Tile tile The tile the unit acts on.
-- @treturn bool True if successfully acted, false otherwise.
function Unit:act(tile)
    return not not (self:_runOnServer("act", {
        tile = tile,
    }))
end

--- Attacks a unit on a ajacent tile.
-- @tparam Tile tile The Tile to attack.
-- @treturn bool True if successfully attacked, false otherwise.
function Unit:attack(tile)
    return not not (self:_runOnServer("attack", {
        tile = tile,
    }))
end

--- Drops material at the units feat
-- @tparam number amount The amount of materials to dropped. Amounts <= 0 will drop all the materials on the Unit.
-- @tparam string material The material the unit will drop.
-- @treturn bool True if successfully deposited, false otherwise.
function Unit:drop(amount, material)
    return not not (self:_runOnServer("drop", {
        amount = amount,
        material = material,
    }))
end

--- Moves this Unit from its current Tile to an adjacent Tile.
-- @tparam Tile tile The Tile this Unit should move to.
-- @treturn bool True if it moved, false otherwise.
function Unit:move(tile)
    return not not (self:_runOnServer("move", {
        tile = tile,
    }))
end

--- Picks up material at the units feat
-- @tparam number amount The amount of materials to pick up. Amounts <= 0 will pick up all the materials on the Unit.
-- @tparam string material The material the unit will pick up.
-- @treturn bool True if successfully deposited, false otherwise.
function Unit:pickup(amount, material)
    return not not (self:_runOnServer("pickup", {
        amount = amount,
        material = material,
    }))
end

--- (inherited) Adds a message to this GameObject's logs. Intended for your own debugging purposes, as strings stored here are saved in the gamelog.
-- @function Unit:log
-- @see GameObject:log
-- @tparam string message A string to add to this GameObject's log. Intended for debugging.



-- <<-- Creer-Merge: functions -->> - Code you add between this comment and the end comment will be preserved between Creer re-runs.
-- if you want to add any client side logic this is where you can add them
-- <<-- /Creer-Merge: functions -->>

return Unit
