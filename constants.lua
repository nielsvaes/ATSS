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

PLANES = {
    FA18 = "FA-18C_hornet"
}

PAYLOADS = {}
PAYLOADS.PLANES = {}

PAYLOADS.PLANES.FA18 = {}
PAYLOADS.PLANES.FA18.CAP = {
    {
        [1] = {
            ["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
            ["num"] = 1,
        },
        [2] = {
            ["CLSID"] = "{LAU-115 - AIM-7M}",
            ["num"] = 2,
        },
        [3] = {
            ["CLSID"] = "{FPU_8A_FUEL_TANK}",
            ["num"] = 3,
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
            ["CLSID"] = "{FPU_8A_FUEL_TANK}",
            ["num"] = 7,
        },
        [8] = {
            ["CLSID"] = "{LAU-115 - AIM-7M}",
            ["num"] = 8,
        },
        [9] = {
            ["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
            ["num"] = 9,
        },
    },
    {
        [1] = {
            ["CLSID"] = "{5CE2FF2A-645A-4197-B48D-8720AC69394F}",
        },
        [2] = {
            ["CLSID"] = "LAU-115_2*LAU-127_AIM-120C",
        },
        [3] = {
            ["CLSID"] = "LAU-115_2*LAU-127_AIM-120C",
        },
        [4] = {
            ["CLSID"] = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}",
        },
        [5] = {
            ["CLSID"] = "{FPU_8A_FUEL_TANK}",
        },
        [6] = {
            ["CLSID"] = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}",
        },
        [7] = {
            ["CLSID"] = "LAU-115_2*LAU-127_AIM-120C",
        },
        [8] = {
            ["CLSID"] = "LAU-115_2*LAU-127_AIM-120C",
        },
        [9] = {
            ["CLSID"] = "{5CE2FF2A-645A-4197-B48D-8720AC69394F}",
        },
    },
    {
        [1] = {
            ["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
        },
        [9] = {
            ["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
        },
        [2] = {
            ["CLSID"] = "LAU-115_2*LAU-127_AIM-120C",
        },
        [4] = {
            ["CLSID"] = "{8D399DDA-FF81-4F14-904D-099B34FE7918}",
        },
        [5] = {
            ["CLSID"] = "{FPU_8A_FUEL_TANK}",
        },
        [6] = {
            ["CLSID"] = "{8D399DDA-FF81-4F14-904D-099B34FE7918}",
        },
        [8] = {
            ["CLSID"] = "LAU-115_2*LAU-127_AIM-120C",
        },
        [3] = {
            ["CLSID"] = "{FPU_8A_FUEL_TANK}",
        },
        [7] = {
            ["CLSID"] = "{FPU_8A_FUEL_TANK}",
        },
    },
    {
        [1] = {
            ["CLSID"] = "<CLEAN>",
        },
        [9] = {
            ["CLSID"] = "<CLEAN>",
        },
        [2] = {
            ["CLSID"] = "LAU-115_2*LAU-127_AIM-120C",
        },
        [4] = {
            ["CLSID"] = "<CLEAN>",
        },
        [5] = {
            ["CLSID"] = "{FPU_8A_FUEL_TANK}",
        },
        [6] = {
            ["CLSID"] = "<CLEAN>",
        },
        [8] = {
            ["CLSID"] = "LAU-115_2*LAU-127_AIM-120C",
        },
        [3] = {
            ["CLSID"] = "{FPU_8A_FUEL_TANK}",
        },
        [7] = {
            ["CLSID"] = "{FPU_8A_FUEL_TANK}",
        },
    }
}

PAYLOADS.PLANES.F16 = {}
PAYLOADS.PLANES.F16.CAP = {
    {
        [1] = {
            ["CLSID"] = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}",
            ["num"] = 1,
        },
        [2] = {
            ["CLSID"] = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}",
            ["num"] = 2,
        },
        [3] = {
            ["CLSID"] = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}",
            ["num"] = 3,
        },
        [9] = {
            ["CLSID"] = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}",
            ["num"] = 9,
        },
        [8] = {
            ["CLSID"] = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}",
            ["num"] = 8,
        },
        [7] = {
            ["CLSID"] = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}",
            ["num"] = 7,
        },
        [4] = {
            ["CLSID"] = "{F376DBEE-4CAE-41BA-ADD9-B2910AC95DEC}",
            ["num"] = 4,
        },
        [6] = {
            ["CLSID"] = "{F376DBEE-4CAE-41BA-ADD9-B2910AC95DEC}",
            ["num"] = 6,
        },
        [5] = {
            ["CLSID"] = "<CLEAN>",
            ["num"] = 5,
        }
    },
    {
        [1] = {
            ["CLSID"] = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}",
        },
        [2] = {
            ["CLSID"] = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}",
        },
        [3] = {
            ["CLSID"] = "{5CE2FF2A-645A-4197-B48D-8720AC69394F}",
        },
        [4] = {
            ["CLSID"] = "{F376DBEE-4CAE-41BA-ADD9-B2910AC95DEC}",
        },
        [5] = {
            ["CLSID"] = "<CLEAN>",
        },
        [6] = {
            ["CLSID"] = "{F376DBEE-4CAE-41BA-ADD9-B2910AC95DEC}",
        },
        [7] = {
            ["CLSID"] = "{5CE2FF2A-645A-4197-B48D-8720AC69394F}",
        },
        [8] = {
            ["CLSID"] = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}",
        },
        [9] = {
            ["CLSID"] = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}",
        }
    },
    {
        [1] = {
            ["CLSID"] = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}",
        },
        [2] = {
            ["CLSID"] = "{5CE2FF2A-645A-4197-B48D-8720AC69394F}",
        },
        [3] = {
            ["CLSID"] = "<CLEAN>",
        },
        [4] = {
            ["CLSID"] = "<CLEAN>",
        },
        [5] = {
            ["CLSID"] = "{8A0BE8AE-58D4-4572-9263-3144C0D06364}",
        },
        [6] = {
            ["CLSID"] = "<CLEAN>",
        },
        [7] = {
            ["CLSID"] = "<CLEAN>",
        },
        [8] = {
            ["CLSID"] = "{5CE2FF2A-645A-4197-B48D-8720AC69394F}",
        },
        [9] = {
            ["CLSID"] = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}",
        }
    },
    {
        [1] = {
            ["CLSID"] = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}",
        },
        [2] = {
            ["CLSID"] = "{5CE2FF2A-645A-4197-B48D-8720AC69394F}",
        },
        [3] = {
            ["CLSID"] = "<CLEAN>",
        },
        [4] = {
            ["CLSID"] = "<CLEAN>",
        },
        [5] = {
            ["CLSID"] = "{8A0BE8AE-58D4-4572-9263-3144C0D06364}",
        },
        [6] = {
            ["CLSID"] = "<CLEAN>",
        },
        [7] = {
            ["CLSID"] = "<CLEAN>",
        },
        [8] = {
            ["CLSID"] = "{5CE2FF2A-645A-4197-B48D-8720AC69394F}",
        },
        [9] = {
            ["CLSID"] = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}",
        },
    }
}




MESSAGE:New("Constants loaded", 5):ToAll()