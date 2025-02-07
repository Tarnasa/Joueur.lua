-- This is where you build your AI for the Chess game.

local class = require("joueur.utilities.class")
local BaseAI = require("joueur.baseAI")

-- <<-- Creer-Merge: requires -->> - Code you add between this comment and the end comment will be preserved between Creer re-runs.
-- you can add additional require(s) here
-- <<-- /Creer-Merge: requires -->>

--- the AI functions for the Chess game.
-- @classmod AI
local AI = class(BaseAI)

--- The reference to the Game instance this AI is playing.
-- @field[Game] self.game
-- @see Game

--- The reference to the Player this AI controls in the Game.
-- @field[Player] self.player
-- @see Player

--- this is the name you send to the server to play as.
function AI:getName()
    -- <<-- Creer-Merge: get-name -->> - Code you add between this comment and the end comment will be preserved between Creer re-runs.
    return "Chess Lua Player" -- REPLACE THIS WITH YOUR TEAM NAME!
    -- <<-- /Creer-Merge: get-name -->>
end

--- this is called once the game starts and your AI knows its playerID and game. You can initialize your AI here.
function AI:start()
    -- <<-- Creer-Merge: start -->> - Code you add between this comment and the end comment will be preserved between Creer re-runs.
    -- replace with your start logic
    -- <<-- /Creer-Merge: start -->>
end

--- this is called when the game's state updates, so if you are tracking anything you can update it here.
function AI:gameUpdated()
    -- <<-- Creer-Merge: game-updated -->> - Code you add between this comment and the end comment will be preserved between Creer re-runs.
    -- replace with your game updated logic
    -- <<-- /Creer-Merge: game-updated -->>
end

--- this is called when the game ends, you can clean up your data and dump files here if need be
-- @tparam boolean won true means you won, won == false means you lost
-- @tparam string reason why you won or lost
function AI:ended(won, reason)
    -- <<-- Creer-Merge: ended -->> - Code you add between this comment and the end comment will be preserved between Creer re-runs.
    -- replace with your ended
    -- <<-- /Creer-Merge: ended -->>
end


-- Game Logic Functions: functions you must fill out to send data to the game server to actually play the game! --

--- This is called every time it is this AI.player's turn to make a move.
-- @treturn string A string in Standard Algebriac Notation (SAN) for the move you want to make. If the move is invalid or not properly formatted you will lose the game.
function AI:makeMove()
    -- <<-- Creer-Merge: makeMove -->> - Code you add between this comment and the end comment will be preserved between Creer re-runs.
    -- Put your game logic here for makeMove
    return ""
    -- <<-- /Creer-Merge: makeMove -->>
end

-- <<-- Creer-Merge: functions -->> - Code you add between this comment and the end comment will be preserved between Creer re-runs.
-- if you need additional functions for your AI you can add them here
-- <<-- /Creer-Merge: functions -->>

return AI
