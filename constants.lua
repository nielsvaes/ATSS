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

MESSAGE:New("Constants loaded", 5):ToAll()