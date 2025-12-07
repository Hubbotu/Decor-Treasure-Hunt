local addonName = "TreasureAssistant"

TreasureAssistantDB = TreasureAssistantDB or {}
TreasureAssistantDB.pos = TreasureAssistantDB.pos or nil
TreasureAssistantDB.hidden = TreasureAssistantDB.hidden == nil and false or TreasureAssistantDB.hidden

local MAP_NAMES = {
    [2352] = "Founder's Point",      -- Alliance
    [2351] = "Razorwind Shores",     -- Horde
}

local QUEST_DATA = {
    -- Alliance
    [92437] = {name="Sturdy Wooden Bookcase",          uiMapID=2352, x=0.632, y=0.383},
    [92961] = {name="Sturdy Wooden Shelf",             uiMapID=2352, x=0.581, y=0.301},
    [92962] = {name="Sturdy Wooden Interior Door",     uiMapID=2352, x=0.692, y=0.267},
    [92963] = {name="Goldshire Window",                uiMapID=2352, x=0.631, y=0.467},
    [92964] = {name="Tall Sturdy Wooden Bookcase",     uiMapID=2352, x=0.648, y=0.509},
    [92965] = {name="Sturdy Wooden Chair",             uiMapID=2352, x=0.595, y=0.524},
    [92966] = {name="Stormwind Interior Narrow Wall", uiMapID=2352, x=0.669, y=0.570},
    [92967] = {name="Stormwind Interior Doorway",      uiMapID=2352, x=0.583, y=0.650},
    [92968] = {name="Stormwind Interior Wall",         uiMapID=2352, x=0.528, y=0.668},
    [92969] = {name="Sturdy Wooden Bench",             uiMapID=2352, x=0.555, y=0.715},
    [92979] = {name="Wicker Basket",                   uiMapID=2352, x=0.616, y=0.794},
    [92978] = {name="Reinforced Wooden Chest",         uiMapID=2352, x=0.542, y=0.736},
    [92977] = {name="Iron-Reinforced Cupboard",        uiMapID=2352, x=0.645, y=0.856},
    [92976] = {name="Stormwind Beam Platform",         uiMapID=2352, x=0.477, y=0.619},
    [92975] = {name="Stormwind Round Platform",        uiMapID=2352, x=0.499, y=0.566},
    [92974] = {name="Stormwind Large Platform",        uiMapID=2352, x=0.549, y=0.506},
    [92973] = {name="Small Wooden Stool",              uiMapID=2352, x=0.463, y=0.580},
    [92972] = {name="Small Wooden Nightstand",         uiMapID=2352, x=0.454, y=0.644},
    [92971] = {name="Carved Wooden Crate",             uiMapID=2352, x=0.408, y=0.613},
    [92970] = {name="Tall Sturdy Wooden Chair",        uiMapID=2352, x=0.391, y=0.599},
    [92989] = {name="Short Wooden Cabinet",            uiMapID=2352, x=0.339, y=0.728},
    [92988] = {name="Three-Candle Wrought Iron Chandelier", uiMapID=2352, x=0.346, y=0.602},
    [92987] = {name="Wrought Iron Floor Lamp",         uiMapID=2352, x=0.366, y=0.578},
    [92986] = {name="Wrought Iron Chandelier",         uiMapID=2352, x=0.366, y=0.542},
    [92985] = {name="Wooden Chamberstick",             uiMapID=2352, x=0.371, y=0.459},
    [92984] = {name="Sturdy Wooden Bed",               uiMapID=2352, x=0.426, y=0.538},
    [92983] = {name="Covered Wooden Table",            uiMapID=2352, x=0.425, y=0.447},
    [92982] = {name="Sturdy Fireplace",                uiMapID=2352, x=0.610, y=0.820},
    [92981] = {name="Wide Charming Couch",             uiMapID=2352, x=0.298, y=0.484},
    [92980] = {name="Iron-Reinforced Standing Mirror", uiMapID=2352, x=0.2863, y=0.4671},
    [92999] = {name="Carved Wooden Bar Table",         uiMapID=2352, x=0.283, y=0.401},
    [92998] = {name="Large Covered Wooden Table",      uiMapID=2352, x=0.262, y=0.379},
    [92997] = {name="Large Sturdy Wooden Table",       uiMapID=2352, x=0.210, y=0.300},
    [92996] = {name="Charming Couch",                  uiMapID=2352, x=0.290, y=0.281},
    [92995] = {name="Elegant Table Lamp",              uiMapID=2352, x=0.309, y=0.311},
    [92994] = {name="Bel'ameth Interior Wall",         uiMapID=2352, x=0.369, y=0.328},
    [92993] = {name="Bel'ameth Round Interior Pillar", uiMapID=2352, x=0.399, y=0.320},
    [92992] = {name="Bel'ameth Interior Doorway",      uiMapID=2352, x=0.409, y=0.283},
    [92991] = {name="Bel'ameth Beam Platform",         uiMapID=2352, x=0.491, y=0.271},
    [92990] = {name="Bel'ameth Round Platform",        uiMapID=2352, x=0.497, y=0.425},
    [93009] = {name="Bel'ameth Large Platform",        uiMapID=2352, x=0.536, y=0.419},
    [93008] = {name="Ornate Stonework Fireplace",      uiMapID=2352, x=0.520, y=0.290},
    [93007] = {name="Gemmed Elven Chest",              uiMapID=2352, x=0.573, y=0.392},
    [93006] = {name="Small Elegant Padded Chair",      uiMapID=2352, x=0.536, y=0.397},
    [93005] = {name="Grand Elven Bookcase",            uiMapID=2352, x=0.603, y=0.568},
    [93004] = {name="Circular Elven Table",            uiMapID=2352, x=0.5533,y=0.3994},
    [93003] = {name="Elegant Padded Chaise",           uiMapID=2352, x=0.5660,y=0.2750},
    [93002] = {name="Elegant Elven Desk",              uiMapID=2352, x=0.5770,y=0.4200},
    [93001] = {name="Elven Floral Window",             uiMapID=2352, x=0.5680,y=0.5230},
    [93000] = {name="Elegant Padded Footstool",        uiMapID=2352, x=0.5900,y=0.4570},

    -- Horde
    [93073] = {name="Orgrimmar Interior Doorway",      uiMapID=2351, x=0.535, y=0.500},
    [93074] = {name="Orgrimmar Interior Wall",         uiMapID=2351, x=0.556, y=0.499},
    [93075] = {name="Orgrimmar Round Interior Pillar", uiMapID=2351, x=0.564, y=0.479},
    [93077] = {name="Rugged Stool",                    uiMapID=2351, x=0.580, y=0.489},
    [93078] = {name="Iron Chain Chandelier",           uiMapID=2351, x=0.561, y=0.370},
    [93079] = {name="Iron-Reinforced Door",            uiMapID=2351, x=0.6230, y=0.4890},
    [93080] = {name="Iron-Studded Wooden Window",      uiMapID=2351, x=0.653, y=0.580},
    [93081] = {name="Orgrimmar Chair",                 uiMapID=2351, x=0.7027, y=0.4983},
    [93082] = {name="Rugged Brazier",                  uiMapID=2351, x=0.708, y=0.527},
    [93083] = {name="Orgrimmar Nightstand",            uiMapID=2351, x=0.721, y=0.418},
    [93084] = {name="Durable Wooden Chest",            uiMapID=2351, x=0.607, y=0.645},
    [93085] = {name="Orgrimmar Beam Platform",         uiMapID=2351, x=0.586, y=0.560},
    [93087] = {name="Orgrimmar Round Platform",        uiMapID=2351, x=0.555, y=0.524},
    [93088] = {name="Orgrimmar Large Platform",        uiMapID=2351, x=0.643, y=0.537},
    [93091] = {name="High-Backed Orgrimmar Chair",     uiMapID=2351, x=0.646, y=0.580},
    [93097] = {name="Short Orgrimmar Bench",           uiMapID=2351, x=0.584, y=0.651},
    [93098] = {name="Iron-Reinforced Crate",           uiMapID=2351, x=0.700, y=0.708},
    [93099] = {name="Large Orgrimmar Bookcase",        uiMapID=2351, x=0.681, y=0.757},
    [93100] = {name="Short Orgrimmar Bookcase",        uiMapID=2351, x=0.648, y=0.730},
    [93101] = {name="Tusked Candleholder",             uiMapID=2351, x=0.618, y=0.784},
    [93102] = {name="Horned Hanging Sconce",           uiMapID=2351, x=0.620, y=0.887},
    [93103] = {name="Spiky Banded Barrel",             uiMapID=2351, x=0.479, y=0.862},
    [93104] = {name="Horned Banded Barrel",            uiMapID=2351, x=0.586, y=0.830},
    [93105] = {name="Crude Banded Crate",              uiMapID=2351, x=0.538, y=0.820},
    [93106] = {name="Small Orgrimmar Chair",           uiMapID=2351, x=0.521, y=0.818},
    [93107] = {name="Razorwind Storage Table",         uiMapID=2351, x=0.534, y=0.846},
    [93108] = {name="Hide-Covered Wall Shelf",         uiMapID=2351, x=0.503, y=0.830},
    [93109] = {name="Orgrimmar Bureaucrat's Desk",     uiMapID=2351, x=0.478, y=0.886},
    [93110] = {name="Tusked Fireplace",                uiMapID=2351, x=0.442, y=0.867},
    [93111] = {name="Orgrimmar Tusked Bed",            uiMapID=2351, x=0.398, y=0.728},
    [93115] = {name="Razorwind Bar Table",             uiMapID=2351, x=0.421, y=0.663},
    [93131] = {name="Wide Hide-Covered Bench",         uiMapID=2351, x=0.440, y=0.660},
    [93132] = {name="Razorwind Wall Mirror",           uiMapID=2351, x=0.424, y=0.504},
    [93133] = {name="Long Orgrimmar Bench",            uiMapID=2351, x=0.516, y=0.826},
    [93134] = {name="Lovely Elven Shelf",              uiMapID=2351, x=0.452, y=0.563},
    [93135] = {name="Silvermoon Round Interior Pillar",uiMapID=2351, x=0.454, y=0.573},
    [93136] = {name="Silvermoon Interior Wall",        uiMapID=2351, x=0.471, y=0.596},
    [93137] = {name="Silvermoon Interior Doorway",     uiMapID=2351, x=0.518, y=0.752},
    [93138] = {name="Silvermoon Large Platform",       uiMapID=2351, x=0.599, y=0.761},
    [93139] = {name="Silvermoon Round Platform",       uiMapID=2351, x=0.645, y=0.691},
    [93140] = {name="Silvermoon Beam Platform",        uiMapID=2351, x=0.578, y=0.590},
    [93141] = {name="Elegant Elven Chandelier",        uiMapID=2351, x=0.5036, y=0.7685},
    [93142] = {name="Open Elegant Elven Barrel",       uiMapID=2351, x=0.508, y=0.615},
    [93143] = {name="Elegant Padded Chair",            uiMapID=2351, x=0.495, y=0.610},
    [93147] = {name="Carved Elven Bookcase",           uiMapID=2351, x=0.509, y=0.947},
    [93148] = {name="Elegant Almond Table",            uiMapID=2351, x=0.432, y=0.694},
    [93149] = {name="Elegant Padded Divan",            uiMapID=2351, x=0.392, y=0.740},
    [93150] = {name="Elegant Wooden Dresser",          uiMapID=2351, x=0.3937, y=0.5764},
    [93151] = {name="Elegant Curved Table",            uiMapID=2351, x=0.400, y=0.785},
    [93152] = {name="Small Elegant End Table",         uiMapID=2351, x=0.580, y=0.690},
}

-- ========== Core functions ==========
local function GetActiveTreasureQuest()
    for questID, data in pairs(QUEST_DATA) do
        if C_QuestLog.GetLogIndexForQuestID(questID) and not C_QuestLog.IsQuestFlaggedCompleted(questID) then
            return data
        end
    end
    return nil
end

local function GetProgress()
    local completed = 0
    for questID in pairs(QUEST_DATA) do
        if C_QuestLog.IsQuestFlaggedCompleted(questID) then
            completed = completed + 1
        end
    end
    return completed, select(2, next(QUEST_DATA)) and 100 or 0
end

local function SetWaypointAndAnnounce(quest)
    if not quest then return end
    C_Map.SetUserWaypoint(UiMapPoint.CreateFromCoordinates(quest.uiMapID, quest.x, quest.y))
    C_SuperTrack.SetSuperTrackedUserWaypoint(true)

    local mapName = MAP_NAMES[quest.uiMapID] or "Unknown Zone"
    local coordX = string.format("%.1f", quest.x * 100)
    local coordY = string.format("%.1f", quest.y * 100)

    local link = string.format(
        "\124cffffff00\124Hworldmap:%d:%d:%d\124h[\124A:Waypoint-MapPin-ChatIcon:13:13:0:0\124a %s @ %s,%s in %s]\124h\124r",
        quest.uiMapID, quest.x * 10000, quest.y * 10000, quest.name, coordX, coordY, mapName
    )

    print(string.format("|cfffed000TreasureAssistant:|r Waypoint set to %s (%s,%s)", quest.name, coordX, coordY))
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

local title = frame:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
title:SetPoint("TOPLEFT", 12, -10)
title:SetText("Treasure Assistant Version: 1.1.2")

local progText = frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
progText:SetPoint("TOPLEFT", title, "BOTTOMLEFT", 0, -8)
progText:SetText("Progress:")
progText:SetTextColor(0.8, 0.8, 0.8)

local progValue = frame:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
progValue:SetPoint("LEFT", progText, "RIGHT", 8, 0)

local activeLabel = frame:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
activeLabel:SetPoint("TOPLEFT", progText, "BOTTOMLEFT", 0, -5)
activeLabel:SetWidth(310)
activeLabel:SetJustifyH("CENTER")
activeLabel:SetTextColor(1, 0.9, 0.5)
activeLabel:SetText("No active treasure quest")

local findBtn = CreateFrame("Button", nil, frame, "UIPanelButtonTemplate")
findBtn:SetSize(180, 30)
findBtn:SetPoint("BOTTOM", 0, 12)
findBtn:SetText("Find Treasure")
findBtn:Disable()

findBtn:SetScript("OnClick", function()
    local quest = GetActiveTreasureQuest()
    if quest then
        SetWaypointAndAnnounce(quest)
    else
        print("|cffff6666TreasureAssistant:|r No active treasure quest found.")
    end
end)

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

-- ========== UPDATE FUNCTION ==========
local function UpdateFrame()
    local activeQuest = GetActiveTreasureQuest()
    local completed, total = GetProgress()

    progValue:SetText(("%d / %d"):format(completed, 50))

    if activeQuest and not TreasureAssistantDB.hidden then
        activeLabel:SetText(activeQuest.name)
        findBtn:Enable()
        frame:Show()
    else
        activeLabel:SetText("No active treasure quest")
        findBtn:Disable()
        frame:Hide()
    end
end

local function SafeUpdate()
    UpdateFrame()
    C_Timer.After(1, UpdateFrame)
    C_Timer.After(2, UpdateFrame)
    C_Timer.After(4, UpdateFrame)
end

-- ========== EVENT HANDLING ==========
local eventFrame = CreateFrame("Frame")
eventFrame:RegisterEvent("ADDON_LOADED")
eventFrame:RegisterEvent("QUEST_LOG_UPDATE")
eventFrame:RegisterEvent("QUEST_ACCEPTED")
eventFrame:RegisterEvent("QUEST_TURNED_IN")
eventFrame:RegisterEvent("QUEST_REMOVED")
eventFrame:RegisterEvent("PLAYER_LOGIN")

eventFrame:SetScript("OnEvent", function(self, event, arg1)
    if event == "ADDON_LOADED" and arg1 == addonName then
        RestorePosition()
        print("|cff00ff00TreasureAssistant|r loaded – type /ta for commands")
        C_Timer.After(3, SafeUpdate)
        return
    end

    if event == "QUEST_ACCEPTED" or event == "QUEST_TURNED_IN" or event == "QUEST_REMOVED" then
        SafeUpdate()
    else
        C_Timer.After(0.5, UpdateFrame)
    end
end)

-- ========== SLASH COMMANDS ==========
SLASH_TREASUREASSIST1 = "/ta"
SlashCmdList["TREASUREASSIST"] = function(msg)
    local cmd = (msg or ""):lower():match("^%s*(.-)%s*$")
    if cmd == "show" then
        TreasureAssistantDB.hidden = false
        frame:Show()
        print("|cfffed000TreasureAssistant:|r Frame shown")
    elseif cmd == "hide" then
        TreasureAssistantDB.hidden = true
        frame:Hide()
        print("|cfffed000TreasureAssistant:|r Frame hidden")
    elseif cmd == "reset" then
        TreasureAssistantDB.pos = nil
        TreasureAssistantDB.hidden = false
        frame:ClearAllPoints()
        frame:SetPoint("CENTER")
        frame:Show()
        print("|cfffed000TreasureAssistant:|r Position reset & frame shown")
    else
        print("|cfffed000TreasureAssistant|r Commands: /ta show | hide | reset")
    end
    UpdateFrame()
end

-- Final safety net
C_Timer.After(8, SafeUpdate)