local function loadAddon()
    print("[NoMoreJobCommands] Loading addon...")
    include("server/sv_init.lua")
end

if SERVER then
    hook.Add("postLoadCustomDarkRPItems", "NoMoreJobCmds.waitforDarkRP", loadAddon)
end