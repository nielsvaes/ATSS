AIR = {
    small    = 1,
    medium   = 2,
    large    = 4,
    huge     = 8,
    threat   = "AIR THREAT",
    spawner  = "AIR THREAT SPAWNER",
    rookie   = "AIR ROOKIE",
    trained  = "AIR TRAINED",
    veteran  = "AIR VETERAN",
    ace      = "AIR ACE",
    random   = "AIR RANDOM",
}

GROUND = {
    small      = 1,
    medium     = 2,
    large      = 4,
    huge       = 8,
    threat     = "GROUND THREAT",
    spawner    = "GROUND THREAT SPAWNER",
    average    = "GROUND AVERAGE",
    good       = "GROUND GOOD",
    high       = "GROUND HIGH",
    excellent  = "GROUND EXCELLENT",
    random     = "GROUND RANDOM",
}

SHIP = {
    small      = 1,
    medium     = 2,
    large      = 4,
    huge       = 8,
    threat     = "SHIP THREAT",
    spawner    = "SHIP THREAT SPAWNER",
    average    = "SHIP AVERAGE",
    good       = "SHIP GOOD",
    high       = "SHIP HIGH",
    excellent  = "SHIP EXCELLENT",
    random     = "SHIP RANDOM",
}

THREAT_ZONE = {
    A2A       = "ZONE A2A",
    A2G       = "ZONE A2G",
    A2SHIP    = "ZONE A2SHIP",
}

THREAT_TYPE = {
    AIR        = "AIR",
    GROUND     = "GROUND",
    SHIP       = "SHIP"
}

DEFAULTS = {
    spawn_min = 1,
    spawn_max = 4
}

PAYLOADS = {}
PAYLOADS.AIRPLANES = {}
PAYLOADS.AIRPLANES.FA18 = {
    {
        [1] = {
            ["CLSID"] = "{5CE2FF2A-645A-4197-B48D-8720AC69394F}",
        },
        [2] = {
            ["CLSID"] = "{FPU_8A_FUEL_TANK}",
        },
        [3] = {
            ["CLSID"] = "LAU-115_2*LAU-127_AIM-9L",
        },
        [4] = {
            ["CLSID"] = "LAU-115_2*LAU-127_AIM-9L",
        },
        [5] = {
            ["CLSID"] = "{FPU_8A_FUEL_TANK}",
        },
        [6] = {
            ["CLSID"] = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}",
        },
        [7] = {
            ["CLSID"] = "{FPU_8A_FUEL_TANK}",
        },
        [8] = {
            ["CLSID"] = "{5CE2FF2A-645A-4197-B48D-8720AC69394F}",
        },
        [9] = {
            ["CLSID"] = "{5CE2FF2A-645A-4197-B48D-8720AC69394F}",
        },
    },
    {
        [1] = {
            ["CLSID"] = "{B06DD79A-F21E-4EB9-BD9D-AB3844618C93}",
            ["num"] = 7,
        },
        [2] = {
            ["CLSID"] = "{B06DD79A-F21E-4EB9-BD9D-AB3844618C93}",
            ["num"] = 3,
        },
        [3] = {
            ["CLSID"] = "{B06DD79A-F21E-4EB9-BD9D-AB3844618C93}",
            ["num"] = 8,
        },
        [4] = {
            ["CLSID"] = "{B06DD79A-F21E-4EB9-BD9D-AB3844618C93}",
            ["num"] = 2,
        },
        [5] = {
            ["CLSID"] = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}",
            ["num"] = 4,
        },
        [6] = {
            ["CLSID"] = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}",
            ["num"] = 6,
        },
        [7] = {
            ["CLSID"] = "{5CE2FF2A-645A-4197-B48D-8720AC69394F}",
            ["num"] = 1,
        },
        [8] = {
            ["CLSID"] = "{5CE2FF2A-645A-4197-B48D-8720AC69394F}",
            ["num"] = 9,
        },
    },
    {
        [1] = {
            ["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
            ["num"] = 1,
        },
        [2] = {
            ["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
            ["num"] = 9,
        },
        [3] = {
            ["CLSID"] = "{LAU-115 - AIM-7M}",
            ["num"] = 2,
        },
        [4] = {
            ["CLSID"] = "{8D399DDA-FF81-4F14-904D-099B34FE7918}",
            ["num"] = 4,
        },
        [5] = {
            ["CLSID"] = "{FPU_8A_FUEL_TANK}",
            ["num"] = 5,
        },
        [6] = {
            ["CLSID"] = "{8D399DDA-FF81-4F14-904D-099B34FE7918}",
            ["num"] = 6,
        },
        [7] = {
            ["CLSID"] = "{LAU-115 - AIM-7M}",
            ["num"] = 8,
        },
        [8] = {
            ["CLSID"] = "{FPU_12_FUEL_TANKHighVis}",
            ["num"] = 3,
        },
        [9] = {
            ["CLSID"] = "{FPU_12_FUEL_TANKHighVis}",
            ["num"] = 7,
        },
    }
}





MESSAGE:New("Constants loaded", 5):ToAll()