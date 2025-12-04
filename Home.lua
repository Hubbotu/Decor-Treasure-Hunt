local addonName = "TreasureAssistant"
TreasureAssistantDB = TreasureAssistantDB or {}
TreasureAssistantDB.pos = TreasureAssistantDB.pos or nil

local MAP_NAMES = {
    [2352] = "Founder's Point",      -- Alliance
    [2351] = "Razorwind Shores",     -- Horde
}

-- ========== TREASURE QUEST DATA ==========
local allianceQuests = {
    { id = 92437, name = "Sturdy Wooden Bookcase", uiMapID = 2352, x = 0.632, y = 0.383 },
    { id = 92961, name = "Sturdy Wooden Shelf", uiMapID = 2352, x = 0.581, y = 0.301 },
    { id = 92962, name = "Sturdy Wooden Interior Door", uiMapID = 2352, x = 0.692, y = 0.267 },
    { id = 92963, name = "Goldshire Window", uiMapID = 2352, x = 0.631, y = 0.467 },
    { id = 92964, name = "Tall Sturdy Wooden Bookcase", uiMapID = 2352, x = 0.648, y = 0.509 },
    { id = 92965, name = "Sturdy Wooden Chair", uiMapID = 2352, x = 0.595, y = 0.524 },
    { id = 92966, name = "Stormwind Interior Narrow Wall", uiMapID = 2352, x = 0.669, y = 0.570 },
    { id = 92967, name = "Stormwind Interior Doorway", uiMapID = 2352, x = 0.583, y = 0.650 },
    { id = 92968, name = "Stormwind Interior Wall", uiMapID = 2352, x = 0.528, y = 0.668 },
    { id = 92969, name = "Sturdy Wooden Bench", uiMapID = 2352, x = 0.542, y = 0.736 },
    { id = 92979, name = "Wicker Basket", uiMapID = 2352, x = 0.616, y = 0.794 },
    { id = 92978, name = "Reinforced Wooden Chest", uiMapID = 2352, x = 0.542, y = 0.736 },
    { id = 92977, name = "Iron-Reinforced Cupboard", uiMapID = 2352, x = 0.645, y = 0.856 },
    { id = 92976, name = "Stormwind Beam Platform", uiMapID = 2352, x = 0.477, y = 0.619 },
    { id = 92975, name = "Stormwind Round Platform", uiMapID = 2352, x = 0.499, y = 0.566 },
    { id = 92974, name = "Stormwind Large Platform", uiMapID = 2352, x = 0.549, y = 0.506 },
    { id = 92973, name = "Small Wooden Stool", uiMapID = 2352, x = 0.463, y = 0.580 },
    { id = 92972, name = "Small Wooden Nightstand", uiMapID = 2352, x = 0.454, y = 0.644 },
    { id = 92971, name = "Carved Wooden Crate", uiMapID = 2352, x = 0.408, y = 0.613 },
    { id = 92970, name = "Tall Sturdy Wooden Chair", uiMapID = 2352, x = 0.391, y = 0.599 },
    { id = 92989, name = "Short Wooden Cabinet", uiMapID = 2352, x = 0.339, y = 0.728 },
    { id = 92988, name = "Three-Candle Wrought Iron Chandelier", uiMapID = 2352, x = 0.346, y = 0.602 },
    { id = 92987, name = "Wrought Iron Floor Lamp", uiMapID = 2352, x = 0.366, y = 0.578 },
    { id = 92986, name = "Wrought Iron Chandelier", uiMapID = 2352, x = 0.366, y = 0.542 },
    { id = 92985, name = "Wooden Chamberstick", uiMapID = 2352, x = 0.371, y = 0.459 },
    { id = 92984, name = "Sturdy Wooden Bed", uiMapID = 2352, x = 0.426, y = 0.538 },
    { id = 92983, name = "Covered Wooden Table", uiMapID = 2352, x = 0.425, y = 0.447 },
    { id = 92982, name = "Sturdy Fireplace", uiMapID = 2352, x = 0.610, y = 0.820 },
    { id = 92981, name = "Wide Charming Couch", uiMapID = 2352, x = 0.298, y = 0.484 },
    { id = 92980, name = "Iron-Reinforced Standing Mirror", uiMapID = 2352, x = 0.285, y = 0.448 },
    { id = 92999, name = "Carved Wooden Bar Table", uiMapID = 2352, x = 0.283, y = 0.401 },
    { id = 92998, name = "Large Covered Wooden Table", uiMapID = 2352, x = 0.262, y = 0.379 },
    { id = 92997, name = "Large Sturdy Wooden Table", uiMapID = 2352, x = 0.210, y = 0.300 },
    { id = 92996, name = "Charming Couch", uiMapID = 2352, x = 0.290, y = 0.281 },
    { id = 92995, name = "Elegant Table Lamp", uiMapID = 2352, x = 0.309, y = 0.311 },
    { id = 92994, name = "Bel'ameth Interior Wall", uiMapID = 2352, x = 0.369, y = 0.328 },
    { id = 92993, name = "Bel'ameth Round Interior Pillar", uiMapID = 2352, x = 0.399, y = 0.320 },
    { id = 92992, name = "Bel'ameth Interior Doorway", uiMapID = 2352, x = 0.409, y = 0.283 },
    { id = 92991, name = "Bel'ameth Beam Platform", uiMapID = 2352, x = 0.491, y = 0.271 },
    { id = 92990, name = "Bel'ameth Round Platform", uiMapID = 2352, x = 0.497, y = 0.425 },
    { id = 93009, name = "Bel'ameth Large Platform", uiMapID = 2352, x = 0.536, y = 0.419 },
    { id = 93008, name = "Ornate Stonework Fireplace", uiMapID = 2352, x = 0.520, y = 0.290 },
    { id = 93007, name = "Gemmed Elven Chest", uiMapID = 2352, x = 0.573, y = 0.392 },
    { id = 93006, name = "Small Elegant Padded Chair", uiMapID = 2352, x = 0.536, y = 0.397 },
    { id = 93005, name = "Grand Elven Bookcase", uiMapID = 2352, x = 0.603, y = 0.568 },
    { id = 93004, name = "Circular Elven Table", uiMapID = 2352, x = 0.5533, y = 0.3994 },
    { id = 93003, name = "Elegant Padded Chaise", uiMapID = 2352, x = 0.5660, y = 0.2750 },
    { id = 93002, name = "Elegant Elven Desk", uiMapID = 2352, x = 0.5770, y = 0.4200 },
    { id = 93001, name = "Elven Floral Window", uiMapID = 2352, x = 0.5680, y = 0.5230 },
    { id = 93000, name = "Elegant Padded Footstool", uiMapID = 2352, x = 0.5900, y = 0.4570 },
}

local hordeQuests = {
    { id = 93073, name = "Orgrimmar Interior Doorway", uiMapID = 2351, x = 0.535, y = 0.500 },
    { id = 93074, name = "Orgrimmar Interior Wall", uiMapID = 2351, x = 0.556, y = 0.499 },
    { id = 93075, name = "Orgrimmar Round Interior Pillar", uiMapID = 2351, x = 0.564, y = 0.479 },
    { id = 93077, name = "Rugged Stool", uiMapID = 2351, x = 0.580, y = 0.489 },
    { id = 93078, name = "Iron Chain Chandelier", uiMapID = 2351, x = 0.561, y = 0.370 },
    { id = 93079, name = "Iron-Reinforced Door", uiMapID = 2351, x = 0.635, y = 0.488 },
    { id = 93080, name = "Iron-Studded Wooden Window", uiMapID = 2351, x = 0.653, y = 0.580 },
    { id = 93081, name = "Orgrimmar Chair", uiMapID = 2351, x = 0.720, y = 0.500 },
    { id = 93082, name = "Rugged Brazier", uiMapID = 2351, x = 0.708, y = 0.527 },
    { id = 93083, name = "Orgrimmar Nightstand", uiMapID = 2351, x = 0.721, y = 0.418 },
    { id = 93084, name = "Durable Wooden Chest", uiMapID = 2351, x = 0.607, y = 0.645 },
    { id = 93085, name = "Orgrimmar Beam Platform", uiMapID = 2351, x = 0.586, y = 0.560 },
    { id = 93087, name = "Orgrimmar Round Platform", uiMapID = 2351, x = 0.555, y = 0.524 },
    { id = 93088, name = "Orgrimmar Large Platform", uiMapID = 2351, x = 0.643, y = 0.537 },
    { id = 93091, name = "High-Backed Orgrimmar Chair", uiMapID = 2351, x = 0.646, y = 0.580 },
    { id = 93097, name = "Short Orgrimmar Bench", uiMapID = 2351, x = 0.584, y = 0.651 },
    { id = 93098, name = "Iron-Reinforced Crate", uiMapID = 2351, x = 0.700, y = 0.708 },
    { id = 93099, name = "Large Orgrimmar Bookcase", uiMapID = 2351, x = 0.681, y = 0.757 },
    { id = 93100, name = "Short Orgrimmar Bookcase", uiMapID = 2351, x = 0.648, y = 0.730 },
    { id = 93101, name = "Tusked Candleholder", uiMapID = 2351, x = 0.618, y = 0.784 },
    { id = 93102, name = "Horned Hanging Sconce", uiMapID = 2351, x = 0.620, y = 0.887 },
    { id = 93103, name = "Spiky Banded Barrel", uiMapID = 2351, x = 0.479, y = 0.862 },
    { id = 93104, name = "Horned Banded Barrel", uiMapID = 2351, x = 0.586, y = 0.830 },
    { id = 93105, name = "Crude Banded Crate", uiMapID = 2351, x = 0.538, y = 0.820 },
    { id = 93106, name = "Small Orgrimmar Chair", uiMapID = 2351, x = 0.521, y = 0.818 },
    { id = 93107, name = "Razorwind Storage Table", uiMapID = 2351, x = 0.534, y = 0.846 },
    { id = 93108, name = "Hide-Covered Wall Shelf", uiMapID = 2351, x = 0.503, y = 0.830 },
    { id = 93109, name = "Orgrimmar Bureaucrat's Desk", uiMapID = 2351, x = 0.478, y = 0.886 },
    { id = 93110, name = "Tusked Fireplace", uiMapID = 2351, x = 0.442, y = 0.867 },
    { id = 93111, name = "Orgrimmar Tusked Bed", uiMapID = 2351, x = 0.398, y = 0.728 },
    { id = 93115, name = "Razorwind Bar Table", uiMapID = 2351, x = 0.421, y = 0.663 },
    { id = 93131, name = "Wide Hide-Covered Bench", uiMapID = 2351, x = 0.440, y = 0.660 },
    { id = 93132, name = "Razorwind Wall Mirror", uiMapID = 2351, x = 0.424, y = 0.504 },
    { id = 93133, name = "Long Orgrimmar Bench", uiMapID = 2351, x = 0.516, y = 0.826 },
    { id = 93134, name = "Lovely Elven Shelf", uiMapID = 2351, x = 0.452, y = 0.563 },
    { id = 93135, name = "Silvermoon Round Interior Pillar", uiMapID = 2351, x = 0.454, y = 0.573 },
    { id = 93136, name = "Silvermoon Interior Wall", uiMapID = 2351, x = 0.471, y = 0.596 },
    { id = 93137, name = "Silvermoon Interior Doorway", uiMapID = 2351, x = 0.518, y = 0.752 },
    { id = 93138, name = "Silvermoon Large Platform", uiMapID = 2351, x = 0.599, y = 0.761 },
    { id = 93139, name = "Silvermoon Round Platform", uiMapID = 2351, x = 0.645, y = 0.691 },
    { id = 93140, name = "Silvermoon Beam Platform", uiMapID = 2351, x = 0.578, y = 0.590 },
    { id = 93141, name = "Elegant Elven Chandelier", uiMapID = 2351, x = 0.505, y = 0.796 },
    { id = 93142, name = "Open Elegant Elven Barrel", uiMapID = 2351, x = 0.508, y = 0.615 },
    { id = 93143, name = "Elegant Padded Chair", uiMapID = 2351, x = 0.495, y = 0.610 },
    { id = 93147, name = "Carved Elven Bookcase", uiMapID = 2351, x = 0.509, y = 0.947 },
    { id = 93148, name = "Elegant Almond Table", uiMapID = 2351, x = 0.432, y = 0.694 },
    { id = 93149, name = "Elegant Padded Divan", uiMapID = 2351, x = 0.392, y = 0.740 },
    { id = 93150, name = "Elegant Wooden Dresser", uiMapID = 2351, x = 0.446, y = 0.576 },
    { id = 93151, name = "Elegant Curved Table", uiMapID = 2351, x = 0.400, y = 0.785 },
    { id = 93152, name = "Small Elegant End Table", uiMapID = 2351, x = 0.580, y = 0.690 },
}

-- ========== HELPERS ==========
local function GetFactionQuests()
    if UnitFactionGroup("player") == "Horde" then
        return hordeQuests, #hordeQuests
    else
        return allianceQuests, #allianceQuests
    end
end

local function IsQuestComplete(questID)
    if not questID or not C_QuestLog.IsQuestFlaggedCompleted then return false end
    return C_QuestLog.IsQuestFlaggedCompleted(questID)
end

local function IsQuestAccepted(questID)
    if not questID or not C_QuestLog.GetLogIndexForQuestID then return false end
    return C_QuestLog.GetLogIndexForQuestID(questID) ~= nil
end

local function GetActiveTreasureQuest()
    local quests = GetFactionQuests()
    for _, q in ipairs(quests) do
        if IsQuestAccepted(q.id) then
            return q
        end
    end
    return nil
end

local function GetProgress()
    local quests, total = GetFactionQuests()
    local completed = 0
    for _, q in ipairs(quests) do
        if IsQuestComplete(q.id) then
            completed = completed + 1
        end
    end
    return completed, total
end

-- ========== WAYPOINT & CHAT LINK ==========
local function SetWaypointAndAnnounce(quest)
    if not quest then return end

    local success, waypoint = pcall(C_Map.SetUserWaypoint, UiMapPoint.CreateFromCoordinates(quest.uiMapID, quest.x, quest.y))
    if success and waypoint then
        C_SuperTrack.SetSuperTrackedUserWaypoint(true)
    else
        return
    end

    local mapName = MAP_NAMES[quest.uiMapID] or "Unknown Zone"
    local coordX = string.format("%.1f", quest.x * 100)
    local coordY = string.format("%.1f", quest.y * 100)

    local link = string.format(
        "\124cffffff00\124Hworldmap:%d:%d:%d\124h[\124A:Waypoint-MapPin-ChatIcon:13:13:0:0\124a %s @ %s,%s in %s]\124h\124r",
        quest.uiMapID, quest.x * 10000, quest.y * 10000, quest.name, coordX, coordY, mapName
    )

    print(string.format("|cfffed000TreasureAssistant:|r Waypoint set → %s (%s,%s)", quest.name, coordX, coordY))
    DEFAULT_CHAT_FRAME:AddMessage(link)
end

-- ========== UI FRAME ==========
local frame = CreateFrame("Frame", "TreasureAssistantFrame", UIParent, "BackdropTemplate")
frame:SetSize(340, 120)
frame:SetPoint("CENTER")
frame:SetBackdrop({
    bgFile = "Interface\\ChatFrame\\ChatFrameBackground",
    edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
    tile = true, tileSize = 16, edgeSize = 16,
    insets = { left = 4, right = 4, top = 4, bottom = 4 }
})
frame:SetBackdropColor(0, 0, 0, 0.8)
frame:SetBackdropBorderColor(0.6, 0.6, 0.6, 1)
frame:EnableMouse(true)
frame:SetMovable(true)
frame:RegisterForDrag("LeftButton")
frame:SetClampedToScreen(true)
frame:Hide()

-- Title
local title = frame:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
title:SetPoint("TOPLEFT", 12, -10)
title:SetText("Treasure Assistant")

-- Progress
local progText = frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
progText:SetPoint("TOPLEFT", title, "BOTTOMLEFT", 0, -8)
progText:SetText("Progress:")
progText:SetTextColor(0.8, 0.8, 0.8)

local progValue = frame:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
progValue:SetPoint("LEFT", progText, "RIGHT", 8, 0)

-- Active Treasure Label
local activeLabel = frame:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
activeLabel:SetPoint("TOPLEFT", progText, "BOTTOMLEFT", 0, -12)
activeLabel:SetWidth(310)
activeLabel:SetJustifyH("CENTER")
activeLabel:SetTextColor(1, 0.9, 0.5)
activeLabel:SetText("No active treasure quest")

-- Find Button
local findBtn = CreateFrame("Button", nil, frame, "UIPanelButtonTemplate")
findBtn:SetSize(180, 30)
findBtn:SetPoint("BOTTOM", 0, 12)
findBtn:SetText("Find Treasure")
findBtn:Disable()

-- Drag handling
frame:SetScript("OnDragStart", frame.StartMoving)
frame:SetScript("OnDragStop", function(self)
    self:StopMovingOrSizing()
    local point, _, relPoint, x, y = self:GetPoint()
    TreasureAssistantDB.pos = { point = point, relPoint = relPoint, x = x, y = y }
end)

local function RestorePosition()
    if TreasureAssistantDB.pos then
        frame:SetPoint(
            TreasureAssistantDB.pos.point or "CENTER",
            UIParent,
            TreasureAssistantDB.pos.relPoint or "CENTER",
            TreasureAssistantDB.pos.x or 0,
            TreasureAssistantDB.pos.y or 0
        )
    end
end

-- Button click
findBtn:SetScript("OnClick", function()
    local quest = GetActiveTreasureQuest()
    if quest then
        SetWaypointAndAnnounce(quest)
    else
        print("|cffff6666TreasureAssistant:|r No active treasure quest found.")
    end
end)

-- ========== UPDATE FUNCTION ==========
local function UpdateFrame()
    local activeQuest = GetActiveTreasureQuest()
    local completed, total = GetProgress()

    progValue:SetText(("%d / %d"):format(completed, total))

    if activeQuest then
        activeLabel:SetText(activeQuest.name)
        findBtn:Enable()
        frame:Show()
    else
        activeLabel:SetText("No active treasure quest")
        findBtn:Disable()
        frame:Hide()
    end
end

-- ========== EVENT HANDLING ==========
local eventFrame = CreateFrame("Frame")
eventFrame:RegisterEvent("ADDON_LOADED")
eventFrame:RegisterEvent("QUEST_LOG_UPDATE")
eventFrame:RegisterEvent("QUEST_ACCEPTED")
eventFrame:RegisterEvent("QUEST_TURNED_IN")
eventFrame:RegisterEvent("QUEST_REMOVED")
eventFrame:RegisterEvent("PLAYER_ENTERING_WORLD")

eventFrame:SetScript("OnEvent", function(self, event, arg1)
    if event == "ADDON_LOADED" and arg1 == addonName then
        RestorePosition()
        C_Timer.After(1, UpdateFrame)
        return
    end

    if event == "PLAYER_ENTERING_WORLD" then
        C_Timer.After(2, UpdateFrame)
        return
    end

    C_Timer.After(0.3, UpdateFrame)
end)

frame:Hide()
C_Timer.After(3, UpdateFrame)

-- ========== SLASH COMMANDS ==========
SLASH_TREASUREASSIST1 = "/ta"
SLASH_TREASUREASSIST2 = "/treasureassistant"
SlashCmdList["TREASUREASSIST"] = function(msg)
    msg = strtrim(msg or ""):lower()
    if msg == "show" then
        frame:Show()
        print("TreasureAssistant: Frame forced visible.")
    elseif msg == "hide" then
        frame:Hide()
    elseif msg == "reset" then
        TreasureAssistantDB.pos = nil
        frame:SetPoint("CENTER")
        print("TreasureAssistant: Position reset.")
    else
        print("TreasureAssistant commands: /ta show | hide | reset")
    end
end

print("|cff00ff00TreasureAssistant|r loaded. Type /ta for commands.")