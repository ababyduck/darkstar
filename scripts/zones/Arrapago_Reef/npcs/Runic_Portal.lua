-----------------------------------
-- Area: Arrapago Reef
--  NPC: Runic Portal
-- Arrapago Reef Teleporter Back to Aht Urgan Whitegate
-- !pos 15 -7 627 54
-----------------------------------
local ID = require("scripts/zones/Arrapago_Reef/IDs");
require("scripts/globals/besieged");
require("scripts/globals/teleports");
require("scripts/globals/missions");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    if (player:getCurrentMission(TOAU) == IMMORTAL_SENTRIES and player:getVar("AhtUrganStatus") == 1) then
        player:startEvent(111);
    elseif (player:getCurrentMission(TOAU) > IMMORTAL_SENTRIES) then
        if (hasRunicPortal(player,5) == 1) then
            player:startEvent(109);
        else
            player:startEvent(111);
        end
    else
        player:messageSpecial(ID.text.RESPONSE);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)

    if (csid == 111 and option == 1) then
        player:addNationTeleport(AHTURHGAN,32);
        dsp.teleport.toChamberOfPassage(player);
    elseif (csid == 109 and option == 1) then
        dsp.teleport.toChamberOfPassage(player);
    end

end;