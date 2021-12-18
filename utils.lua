ATSS_UTILS = {}

---get_groups_containing
---Returns a table of all the air to air groups that start with a given prefix
---@param substring string
function ATSS_UTILS.get_groups_containing(substring, as_strings, as_set)
    as_strings = as_strings or false
    as_set = as_set or false

    local group_set = SET_GROUP:New()
                               :FilterPrefixes(substring)
                               :FilterOnce()

    if as_set then
        return group_set
    end

    local group_array = group_set:GetSetObjects()

    if #group_array == 0 then
        env.error("CAN'T FIND ANY GROUPS WITH: (" .. substring .. ")")
    end

    if as_strings then
        local object_names = {}
        for _, group in pairs(group_array) do
            table.insert(object_names, group.GroupName)
        end

        return object_names
    else
        return group_array
    end
end


---get_zones_containing
---Returns a table of all the zones that start with a given prefix
---@param substring string
function ATSS_UTILS.get_zones_containing(substring, as_strings, as_set)
    as_strings = as_strings or false
    as_set = as_set or false

    local zone_set = SET_ZONE:New()
                             :FilterPrefixes(substring)
                             :FilterOnce()
    if as_set then
        return zone_set
    end

    local zone_array = zone_set:GetSetObjects()

    if #zone_array == 0 then
        env.error("CAN'T FIND ANY ZONES WITH: " .. substring)
    end

    if as_strings then
        local object_names = {}
        for _, zone in pairs(zone_array) do
            table.insert(object_names, zone.ZoneName)
        end

        return object_names
    else
        return zone_array
    end
end

---get_statics_containing
---Returns a table of all the air to air groups that start with a given prefix
---@param substring string
function ATSS_UTILS.get_statics_containing(substring, as_strings)
    as_strings = as_strings or false
    local static_set = SET_STATIC:New()
                                 :FilterPrefixes(substring)
                                 :FilterOnce()
    local static_array = static_set:GetSetObjects()

    if #static_array == 0 then
        env.error("CAN'T FIND ANY STATICS WITH " .. substring)
    end

    if as_strings then
        local static_names = {}
        for _, group in pairs(static_array) do
            table.insert(static_names, group.GroupName)
        end

        return static_names
    else
        return static_array
    end
end


---any_of_group_alive
---@param group_name string
---Returns true if any units of a certain group are still alive
function ATSS_UTILS.any_of_group_alive(group_name)
    local set = SET_GROUP:New()
                         :FilterPrefixes(group_name)
                         :FilterOnce()
    local alive_set = set:GetAliveSet()
    -- if we're able to loop, that means something is alive
    for _, alive_set in pairs(alive_bandit_set) do
        return true
    end
    return false
end

---set_user_flag
---Easier to read than trigger.action.setUserFlag
---@param flag_number int
---@param value int int or bool value
function ATSS_UTILS.set_user_flag(flag_number, value)
    --if not type(flag_number) == "string" then flag_number = tostring(flag_number) end

    trigger.action.setUserFlag(flag_number, value)
end

---get_user_flag
---Easier to read than trigger.action.getUserFlag
---@param flag_number int
function ATSS_UTILS.get_user_flag(flag_number)
    return trigger.misc.getUserFlag(flag_number)
end


---destroy_all_groups_containing
---Destroy all groups containing a string
---@param search_strings void
---@param message string
function ATSS_UTILS.destroy_all_groups_containing(search_strings, message)
    message = message or nil
    if type(search_strings) == "string" then
        search_strings = { search_strings }
    end

    local destroy_set = {}
    for _, search_string in pairs(search_strings) do
        destroy_set = SET_GROUP:New()
                               :FilterPrefixes(search_string)
                               :FilterOnce()
    end

    local destroyables = destroy_set:GetAliveSet()
    for _, to_destroy_group in pairs(destroyables) do
        to_destroy_group:Destroy()
    end

    if message then
        MESSAGE:New(message, 5):ToAll()
    end
end


---destroy_all_statics_containing
---Destroy all groups containing a string
---@param search_strings void
---@param message string
function ATSS_UTILS.destroy_all_statics_containing(search_strings, message)
    message = message or nil
    if type(search_strings) == "string" then
        search_strings = { search_strings }
    end

    local destroy_set = {}
    for _, search_string in pairs(search_strings) do
        destroy_set = GetStaticsContaining(search_string)
        for _, to_destroy in pairs(destroy_set) do
            to_destroy:Destroy()
        end
    end

    if message then
        MESSAGE:New(message, 5):ToAll()
    end
end


---nautical_miles_to_kilometers
---@param miles float
---Oneliner to convert nautical miles to kilometers
function ATSS_UTILS.nautical_miles_to_kilometers(miles)
    miles = miles or 0
    return miles * 1,852
end


function ATSS_UTILS.clamp(value, min, max)
    if value < min then value = min end
    if value > max then value = max end

    return value
end

---print_table
---@param table
---Oneliner to print contents of a table
function ATSS_UTILS.print_table(tbl, indent)
      if not indent then indent = 4 end
      for k, v in pairs(tbl) do
            formatting = string.rep("  ", indent) .. k .. ": "
            if type(v) == "table" then
                env.info(formatting)
                ATSS_UTILS.print_table(v, indent * 2)
            elseif type(v) == 'boolean' then
                env.info(formatting .. tostring(v))
            else
                env.info(formatting .. v)
            end
            env.info("=====================================")
      end
end

---percentage_chance
---@param chance int
---Does a random dice roll to see if something with x percent of chance will happen
function ATSS_UTILS.percentage_chance(chance)
    chance = Clamp(chance, 0, 100)
    local percentage = math.random(0, 100)
    if percentage < chance then
        return true
    end
    return false
end


---ensure_table
---@param var any
---If the variable passed is not a table, wrap it in {} to make it one
function ATSS_UTILS.ensure_table(var)
    if type(var) ~= "table" then
        var = {var}
    end
    return var
end

---shuffle_table
---@param tbl table
---Returns a shuffled table
function ATSS_UTILS.shuffle_table(tbl)
    local new_table = {}
    for _, value in ipairs(tbl) do
        local pos = math.random(1, #new_table +1)
        table.insert(new_table, pos, value)
    end
    return new_table
end

---DirName
---@param path string
---@param separator string
---Returns the parent folder of a path
function ATSS_UTILS.dir_name(path, separator)
    separator=separator or'/'
    return path:match("(.*"..separator..")")
end


---starts_with
---@param str string string to check
---@param start string character to check
---Returns true if the string starts with character
function ATSS_UTILS.starts_with(str, start)
   return str:sub(1, #start) == start
end



---ends_with
---@param str string string to check
---@param ending string character to check
---Returns true if the strings ends with character
function ATSS_UTILS.ends_with(str, ending)
   return ending == "" or str:sub(-#ending) == ending
end



---deepcopy
---@param o table
---@param seen table don't pass in argument here, used in recursive calling
function ATSS_UTILS.deepcopy(o, seen)
  seen = seen or {}
  if o == nil then return nil end
  if seen[o] then return seen[o] end

  local no
  if type(o) == 'table' then
    no = {}
    seen[o] = no

    for k, v in next, o, nil do
      no[ATSS_UTILS.deepcopy(k, seen)] = ATSS_UTILS.deepcopy(v, seen)
    end
    setmetatable(no, ATSS_UTILS.deepcopy(getmetatable(o), seen))
  else -- number, string, boolean, etc
    no = o
  end
  return no
end


MESSAGE:New("Utils loaded", 5):ToAll()