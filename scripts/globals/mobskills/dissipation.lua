---------------------------------------------
-- Dissipation
-- Dispels all buffs add terror effect
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 1
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = dsp.effect.TERROR
    MobStatusEffectMove(mob, target, typeEffect, 1, 0, 10)

    local count = target:dispelAllStatusEffect()

    if (count == 0) then
        skill:setMsg(dsp.msg.basic.SKILL_NO_EFFECT)
    else
        skill:setMsg(dsp.msg.basic.DISAPPEAR_NUM)
    end

    return count
end