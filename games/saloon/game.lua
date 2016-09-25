-- This is a simple class to represent the Game object in the game. You can extend it by adding utility functions here in this file.

local class = require("joueur.utilities.class")
local BaseGame = require("joueur.baseGame")

-- <<-- Creer-Merge: requires -->> - Code you add between this comment and the end comment will be preserved between Creer re-runs.
-- you can add addtional require(s) here
-- <<-- /Creer-Merge: requires -->>

--- Use cowboys to have a good time and play some music on a Piano, while brawling with enemy Coyboys.
-- @classmod Game
local Game = class(BaseGame)

-- initializes a Game with basic logic as provided by the Creer code generator
function Game:init(...)
    BaseGame.init(self, ...)

    --- The name of this game, "{game_name}".
    -- @field[string] self.name
    -- The following values should get overridden when delta states are merged, but we set them here as a reference for you to see what variables this class has.

    --- All the beer Bottles currently flying across the saloon in the game.
    self.bottles = Table()
    --- Every Cowboy in the game.
    self.cowboys = Table()
    --- The player whose turn it is currently. That player can send commands. Other players cannot.
    self.currentPlayer = nil
    --- The current turn number, starting at 0 for the first player's turn.
    self.currentTurn = 0
    --- Every furnishing in the game.
    self.furnishings = Table()
    --- A mapping of every game object's ID to the actual game object. Primarily used by the server and client to easily refer to the game objects via ID.
    self.gameObjects = Table()
    --- All the jobs that Cowboys can be assigned within the saloon.
    self.jobs = Table()
    --- The number of Tiles in the map along the y (vertical) axis.
    self.mapHeight = 0
    --- The number of Tiles in the map along the x (horizontal) axis.
    self.mapWidth = 0
    --- The maximum number of Cowboys a Player can bring into the saloon.
    self.maxCowboys = 0
    --- The maximum number of turns before the game will automatically end.
    self.maxTurns = 100
    --- List of all the players in the game.
    self.players = Table()
    --- When a player's rowdyness reaches or exceeds this number their Cowboys take a collective siesta.
    self.rowdynessToSiesta = 0
    --- A unique identifier for the game instance that is being played.
    self.session = ""
    --- All the tiles in the map, stored in Row-major order. Use `x + y * mapWidth` to access the correct index.
    self.tiles = Table()



    self.name = "Saloon"

    self._gameObjectClasses = {
        Bottle = require("games.saloon.bottle"),
        Cowboy = require("games.saloon.cowboy"),
        Furnishing = require("games.saloon.furnishing"),
        GameObject = require("games.saloon.gameObject"),
        Player = require("games.saloon.player"),
        Tile = require("games.saloon.tile"),
    }
end


-- <<-- Creer-Merge: functions -->> - Code you add between this comment and the end comment will be preserved between Creer re-runs.
-- if you want to add any client side logic (such as state checking functions) this is where you can add them
-- <<-- /Creer-Merge: functions -->>

return Game