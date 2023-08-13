Config = {}

Config.BlacklistedWords = {
    "nig",
    "adolf",
    "cheater",
    "admin"
}

Config.CustomBanFunction = function (id, reason)
    print("Kicked Player due to blacklisted ESX Ingame Name. Name: " ..GetPlayerName(id).. "(" ..id.. ")")
    DropPlayer(id, reason)
end