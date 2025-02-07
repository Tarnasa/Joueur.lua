-- Game: Collect of the most of the rarest mineral orbiting aroung the sun and outcompete your competetor.
-- DO NOT MODIFY THIS FILE
-- Never try to directly create an instance of this class, or modify its member variables.
-- Instead, you should only be reading its variables and calling its functions.


local class = require("joueur.utilities.class")
local BaseGame = require("joueur.baseGame")

-- <<-- Creer-Merge: requires -->> - Code you add between this comment and the end comment will be preserved between Creer re-runs.
-- you can add additional require(s) here
-- <<-- /Creer-Merge: requires -->>

--- Collect of the most of the rarest mineral orbiting aroung the sun and outcompete your competetor.
-- @classmod Game
local Game = class(BaseGame)

-- initializes a Game with basic logic as provided by the Creer code generator
function Game:init(...)
    BaseGame.init(self, ...)

    --- The name of this game, "{game_name}".
    -- @field[string] self.name
    -- The following values should get overridden when delta states are merged, but we set them here as a reference for you to see what variables this class has.

    --- All the celestial bodies in the game. The first two are planets and the third is the sun. The fourth is the VP asteroid. Everything else is normal asteroids.
    self.bodies = Table()
    --- The player whose turn it is currently. That player can send commands. Other players cannot.
    self.currentPlayer = nil
    --- The current turn number, starting at 0 for the first player's turn.
    self.currentTurn = 0
    --- The cost of dashing.
    self.dashCost = 0
    --- The distance traveled each turn by dashing.
    self.dashDistance = 0
    --- A mapping of every game object's ID to the actual game object. Primarily used by the server and client to easily refer to the game objects via ID.
    self.gameObjects = Table()
    --- The value of every unit of genarium.
    self.genariumValue = 0
    --- A array-like table of all jobs. first item is corvette, second is missileboat, third is martyr, fourth is transport, and fifth is miner.
    self.jobs = Table()
    --- The value of every unit of legendarium.
    self.legendariumValue = 0
    --- The highest amount of material, that can be in a asteroid.
    self.maxAsteroid = 0
    --- The maximum number of turns before the game will automatically end.
    self.maxTurns = 100
    --- The smallest amount of material, that can be in a asteroid.
    self.minAsteroid = 0
    --- The rate at which miners grab minerals from asteroids.
    self.miningSpeed = 0
    --- The amount of mythicite that spawns at the start of the game.
    self.mythiciteAmount = 0
    --- The number of orbit updates you cannot mine the mithicite asteroid.
    self.orbitsProtected = 0
    --- The rarity modifier of the most common ore. This controls how much spawns.
    self.oreRarityGenarium = 0
    --- The rarity modifier of the rarest ore. This controls how much spawns.
    self.oreRarityLegendarium = 0
    --- The rarity modifier of the second rarest ore. This controls how much spawns.
    self.oreRarityRarium = 0
    --- The amount of energy a planet can hold at once.
    self.planetEnergyCap = 0
    --- The amount of energy the planets restore each round.
    self.planetRechargeRate = 0
    --- List of all the players in the game.
    self.players = Table()
    --- The standard size of ships.
    self.projectileRadius = 0
    --- The amount of distance missiles travel through space.
    self.projectileSpeed = 0
    --- Every projectile in the game.
    self.projectiles = Table()
    --- The value of every unit of rarium.
    self.rariumValue = 0
    --- The regeneration rate of asteroids.
    self.regenerateRate = 0
    --- A unique identifier for the game instance that is being played.
    self.session = ""
    --- The standard size of ships.
    self.shipRadius = 0
    --- The size of the map in the X direction.
    self.sizeX = 0
    --- The size of the map in the Y direction.
    self.sizeY = 0
    --- The amount of time (in nano-seconds) added after each player performs a turn.
    self.timeAddedPerTurn = 0
    --- The number of turns it takes for a asteroid to orbit the sun. (Asteroids move after each players turn).
    self.turnsToOrbit = 0
    --- Every Unit in the game.
    self.units = Table()



    self.name = "Stardash"

    self._gameObjectClasses = {
        Body = require("games.stardash.body"),
        GameObject = require("games.stardash.gameObject"),
        Job = require("games.stardash.job"),
        Player = require("games.stardash.player"),
        Projectile = require("games.stardash.projectile"),
        Unit = require("games.stardash.unit"),
    }
end


-- <<-- Creer-Merge: functions -->> - Code you add between this comment and the end comment will be preserved between Creer re-runs.
-- if you want to add any client side logic this is where you can add them
-- <<-- /Creer-Merge: functions -->>

return Game
