-- Game: Two player grid based game where each player tries to burn down the other player's buildings. Let it burn.
-- DO NOT MODIFY THIS FILE
-- Never try to directly create an instance of this class, or modify its member variables.
-- Instead, you should only be reading its variables and calling its functions.


local class = require("joueur.utilities.class")
local BaseGame = require("joueur.baseGame")

-- <<-- Creer-Merge: requires -->> - Code you add between this comment and the end comment will be preserved between Creer re-runs.
-- you can add additional require(s) here
-- <<-- /Creer-Merge: requires -->>

--- Two player grid based game where each player tries to burn down the other player's buildings. Let it burn.
-- @classmod Game
local Game = class(BaseGame)

-- initializes a Game with basic logic as provided by the Creer code generator
function Game:init(...)
    BaseGame.init(self, ...)

    --- The name of this game, "{game_name}".
    -- @field[string] self.name
    -- The following values should get overridden when delta states are merged, but we set them here as a reference for you to see what variables this class has.

    --- How many bribes players get at the beginning of their turn, not counting their burned down Buildings.
    self.baseBribesPerTurn = 0
    --- All the buildings in the game.
    self.buildings = Table()
    --- The current Forecast, which will be applied at the end of the turn.
    self.currentForecast = nil
    --- The player whose turn it is currently. That player can send commands. Other players cannot.
    self.currentPlayer = nil
    --- The current turn number, starting at 0 for the first player's turn.
    self.currentTurn = 0
    --- All the forecasts in the game, indexed by turn number.
    self.forecasts = Table()
    --- A mapping of every game object's ID to the actual game object. Primarily used by the server and client to easily refer to the game objects via ID.
    self.gameObjects = Table()
    --- The width of the entire map along the vertical (y) axis.
    self.mapHeight = 0
    --- The width of the entire map along the horizontal (x) axis.
    self.mapWidth = 0
    --- The maximum amount of fire value for any Building.
    self.maxFire = 0
    --- The maximum amount of intensity value for any Forecast.
    self.maxForecastIntensity = 0
    --- The maximum number of turns before the game will automatically end.
    self.maxTurns = 100
    --- The next Forecast, which will be applied at the end of your opponent's turn. This is also the Forecast WeatherStations can control this turn.
    self.nextForecast = nil
    --- List of all the players in the game.
    self.players = Table()
    --- A unique identifier for the game instance that is being played.
    self.session = ""



    self.name = "Anarchy"

    self._gameObjectClasses = {
        Building = require("games.anarchy.building"),
        FireDepartment = require("games.anarchy.fireDepartment"),
        Forecast = require("games.anarchy.forecast"),
        GameObject = require("games.anarchy.gameObject"),
        Player = require("games.anarchy.player"),
        PoliceDepartment = require("games.anarchy.policeDepartment"),
        Warehouse = require("games.anarchy.warehouse"),
        WeatherStation = require("games.anarchy.weatherStation"),
    }
end


-- <<-- Creer-Merge: functions -->> - Code you add between this comment and the end comment will be preserved between Creer re-runs.
-- if you want to add any client side logic this is where you can add them
-- <<-- /Creer-Merge: functions -->>

return Game
