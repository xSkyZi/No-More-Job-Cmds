local jobCommands = {}
local DarkRPPrefix = GAMEMODE.Config.chatCommandPrefix


local function GetJobCmds()
    local categories = DarkRP.getCategories()

    if not categories or not categories.jobs then
        print("[NoMoreJobCommands] Invalid job categories!")
        return
    end

    for _, v in pairs(categories.jobs) do
        if #v.members < 1 then continue end

        for _, v in pairs(v.members) do
            print("[NoMoreJobCommands] Found " .. v["command"] .. " command")
            jobCommands[DarkRPPrefix .. v["command"]] = true
        end
    end
    print("[NoMoreJobCommands] Finished adding Job commands to blacklist!")
end

GetJobCmds()


hook.Add("PlayerSay", "NoMoreJobCmds.BlockJobCmds", function(ply, text)
    local cmd = string.lower(string.Trim(text))
    if jobCommands[cmd] then
        ply:ChatPrint("[NoMoreJobCommands] Job commands are disabled!")
        return ""
    end
    return text
end)