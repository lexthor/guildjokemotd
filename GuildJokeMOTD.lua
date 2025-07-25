local motdUpdated = false  -- Flag to prevent duplicate updates

local function UpdateGuildMOTD()
    if motdUpdated then return end  -- Prevent updating if it's already done
    if IsInGuild() and CanEditMOTD() and #JokeList > 0 then
        -- local randomJoke = "Today's fun Joke: " .. JokeList[math.random(#JokeList)]
        local randomJoke = JokeList[math.random(#JokeList)]
        
        -- Force update MoTD immediately
        GuildSetMOTD(randomJoke)
        print("|cff33ff99Guild MOTD Updated:|r " .. randomJoke)

        motdUpdated = true  -- Mark as updated to avoid duplicate updates
    end
end

local frame = CreateFrame("FRAME")
frame:RegisterEvent("PLAYER_LOGIN")
frame:RegisterEvent("PLAYER_LOGOUT")  -- Register event to reset the flag

frame:SetScript("OnEvent", function(self, event, ...)
    if event == "PLAYER_LOGIN" then
        -- Immediately attempt to set the MoTD
        UpdateGuildMOTD()
    elseif event == "PLAYER_LOGOUT" then
        -- Reset the flag when the player logs out
        motdUpdated = false
    end
end)
