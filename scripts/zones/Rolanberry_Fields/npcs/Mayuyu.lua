-----------------------------------
-- Area: Rolanberry Fields
--  NPC: Mayuyu
-- Legion NPC
-- !pos 240 24.399 468
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/titles");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    local LEGENDARY = 0;
    local CAPACITY = 0;

    if (player:hasTitle(dsp.title.LEGENDARY_LEGIONNAIRE)) then
        LEGENDARY = 1;
    end

    if (player:hasKeyItem(dsp.ki.LEGION_TOME_PAGE_MAXIMUS)) then
        CAPACITY = CAPACITY+2; -- Enable 36 combatant option
    end
    if (player:hasKeyItem(dsp.ki.LEGION_TOME_PAGE_MINIMUS)) then
        CAPACITY = CAPACITY+1; -- Enable 18 combatant option
    end

    player:startEvent(8008, 0, LEGENDARY, CAPACITY);
end;

function onEventUpdate(player,csid,option)
    -- print("CSID:", csid);
    -- print("RESULT:", option);
end;

function onEventFinish(player,csid,option)
    -- print("CSID:", csid);
    -- print("RESULT:", option);

    -- Event needs work, also the Legion Pass item is "tagged" via fields not yet implemented in core.

end;