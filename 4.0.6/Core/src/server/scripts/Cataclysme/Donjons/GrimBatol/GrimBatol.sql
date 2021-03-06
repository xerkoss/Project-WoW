-- Valiona spawning is now handled over the Script
DELETE FROM `creature` WHERE `id` = 40320 AND `map` = 670;

-- Who added SmartAI to Valiona? ^^
UPDATE `creature_template` SET `AIName`='', `ScriptName`='mob_valiona_gb' WHERE `entry`=40320 LIMIT 1;
DELETE FROM `smart_scripts` WHERE `entryorguid` = 40320;

-- Changes Inhabit Type so that Valiona is able to Fly
UPDATE `creature_template` SET `InhabitType`=5 WHERE `entry`=40320 LIMIT 1;

-- Add Scriptname to the invoked Flame Spirit
UPDATE `creature_template` SET `ScriptName`='mob_invoked_flame_spirit' WHERE `entry`=40357 LIMIT 1;

-- Fixes wrong Faction & Display ID of the Invocation of FLame and the Portal Trigger
UPDATE `creature_template` SET `modelid1`=11686, `modelid2`=0 WHERE `entry`=40355 LIMIT 1; -- (now it is invisible)
UPDATE `creature_template` SET `modelid2`=0, `faction_A`=14, `faction_H`=14 WHERE `entry`=40357 LIMIT 1;

-- Sets Vehicle ID for Valiona
UPDATE `creature_template` SET `VehicleId`="0" WHERE `entry`=40320 LIMIT 1;

-- Updates Healt of the Invocation of Flame to Blizzlike Values
UPDATE `creature_template` SET `Health_mod`=0.4174, `exp`=3 WHERE `entry`=40357 LIMIT 1;

-- Updates Level and Rank of the Invocation of Flame
UPDATE `creature_template` SET `minlevel`=85, `maxlevel`=85, `rank`=3 WHERE `entry`=40357 LIMIT 1;

-- Updates Model ID of Seeping Twilight (now it is invisible)
UPDATE `creature_template` SET `modelid1`=11686, `modelid2`=0 WHERE `entry`=40365 LIMIT 1;

-- --------------------------------

-- Forgemaster Throngus (Grim Batol) Updates
-- Fire Patch
-- Makes the Fire invisible
UPDATE `creature_template` SET `modelid1`=11686, `modelid2`=0 WHERE `entry`=48711 LIMIT 1;

-- Twilight Archer
-- Inserts Scriptname
UPDATE `creature_template` SET `ScriptName`='mob_twilight_archer' WHERE `entry`=40197 LIMIT 1;

-- Changes Inhabit Type so that the Twilight Archer are able to Fly
UPDATE `creature_template` SET `InhabitType`=7 WHERE `entry`=40197 LIMIT 1;

-- Makes the Twilight Archer invisible
UPDATE `creature_template` SET `modelid1`=11686, `modelid2`=0 WHERE `entry`=40197 LIMIT 1;

-- Faction fix
UPDATE `creature_template` SET `faction_A`=14, `faction_H`=14 WHERE `entry`=40197 LIMIT 1;

-- --------------------------------

-- Erudax (Grim Batol) Updates

SET @ERUDAX_GUID := 1051910;

-- Sets Scriptname of Faceless Corruptor and Alexstraszas Eggs
UPDATE `creature_template` SET `ScriptName`='mob_faceless' WHERE `entry`=40600 LIMIT 1;
UPDATE `creature_template` SET `ScriptName`='mob_faceless' WHERE `entry`=48844 LIMIT 1;
UPDATE `creature_template` SET `ScriptName`='mob_alexstraszas_eggs' WHERE `entry`=40486 LIMIT 1;
UPDATE `creature_template` SET `ScriptName`='mob_shadow_gale_stalker' WHERE `entry`=40567 LIMIT 1;

-- Erudax
-- The Waypoint of Erudax are not Blizzlike!!!!
-- On the Blizz Servers Erudax is standing still in the Room
DELETE FROM `creature_addon` WHERE `guid`=@ERUDAX_GUID LIMIT 1;
DELETE FROM `waypoint_data` WHERE `id`=10000310;

UPDATE `creature` SET `position_x`= -777.094, `position_y`=-825.152, `position_z`=233.233, `orientation`=0 WHERE `guid`= @ERUDAX_GUID LIMIT 1;

-- Faction fix for Difficult entry 2 (now he can be healed with Umbral Mending on Heroic Mode)
UPDATE `creature_template` SET `faction_A`=16, `faction_H`=16 WHERE `entry`=48822 LIMIT 1;

-- Faceless Corruptor
-- Faction & Level fix
UPDATE `creature_template` SET `faction_A`=16, `faction_H`=16 WHERE `entry`=40600 LIMIT 1;
UPDATE `creature_template` SET `faction_A`=16, `faction_H`=16 WHERE `entry`=48844 LIMIT 1;

UPDATE `creature_template` SET `minlevel`=83, `maxlevel`=83 WHERE `entry`=40600 LIMIT 1;
UPDATE `creature_template` SET `minlevel`=85, `maxlevel`=85 WHERE `entry`=48844 LIMIT 1;

UPDATE `creature_template` SET `rank`=1 WHERE `entry`=40600 LIMIT 1;
UPDATE `creature_template` SET `rank`=1 WHERE `entry`=48844 LIMIT 1;

-- Health Fix
UPDATE `creature_template` SET `Health_mod`=2.8874, `exp`=3 WHERE `entry`=40600 LIMIT 1;
UPDATE `creature_template` SET `Health_mod`=1.6917, `exp`=3 WHERE `entry`=48844 LIMIT 1;

-- Difficult entry fix
UPDATE `creature_template` SET `difficulty_entry_1`=48844 WHERE `entry`=40600 LIMIT 1;

-- Twilight Hatchlings
-- Faction fix
UPDATE `creature_template` SET `faction_A`=16, `faction_H`=16 WHERE `entry`=39388 LIMIT 1;
UPDATE `creature_template` SET `faction_A`=16, `faction_H`=16 WHERE `entry`=48832 LIMIT 1;

-- Health Fix (values are not Blizzlike!!!)
UPDATE `creature_template` SET `Health_mod`=0.5589, `exp`=3 WHERE `entry`=39388 LIMIT 1;
UPDATE `creature_template` SET `Health_mod`=0.7, `exp`=3 WHERE `entry`=48832 LIMIT 1;
-- Difficult entry fix`ark_db`
UPDATE `creature_template` SET `difficulty_entry_1`=48832 WHERE `entry`=39388 LIMIT 1;

-- Level fix for NH & HC
UPDATE `creature_template` SET `minlevel`=83, `maxlevel`=83 WHERE `entry`=39388 LIMIT 1;
UPDATE `creature_template` SET `minlevel`=85, `maxlevel`=85 WHERE `entry`=48832 LIMIT 1;

-- SmartAI for Twilight Hatchlings that they cast Twilight Blast
-- NH
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=39388 LIMIT 1;
DELETE FROM `smart_scripts` WHERE `entryorguid`=39388;

INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES (39388, 0, 2, 0, 0, 0, 100, 0, 5000, 5000, 5000, 5000, 11, 92949, 2, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Erudax-Twilight Hatchlings Cast Twilight Blast (NH)');

-- HC
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=48832 LIMIT 1;
DELETE FROM `smart_scripts` WHERE `entryorguid`=48832;

INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES (48832, 0, 0, 0, 0, 0, 100, 0, 5000, 5000, 5000, 5000, 11, 92949, 2, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Erudax-Twilight Hatchlings Cast Twilight Blast (HC');

-- Alexstraszas Eggs
-- Faction Fix - That the Facless are able to kill them
UPDATE `creature_template` SET `faction_A`=14, `faction_H`=14 WHERE `entry`=40486 LIMIT 1;

-- Health Fix
UPDATE `creature_template` SET `Health_mod`=0.8459, `exp`=3 WHERE `entry`=40486 LIMIT 1;

-- Level Fix
UPDATE `creature_template` SET `minlevel`=85, `maxlevel`=85 WHERE `entry`=40486 LIMIT 1;
UPDATE `creature_template` SET `rank`=1 WHERE `entry`=40486 LIMIT 1;

-- Faceless spawn Stalker
-- Scale fix (it is too little)
UPDATE `creature_template` SET `scale`=3 WHERE `entry`=44314 LIMIT 1;

-- Makes the Stalker Invisible
UPDATE `creature_template` SET `modelid1`=11686, `modelid2`=0 WHERE `entry`=44314 LIMIT 1;

-- Shadow Gale Stalker
-- Makes the Stalker Invisible
UPDATE `creature_template` SET `modelid1`=11686, `modelid2`=0 WHERE `entry`=40567 LIMIT 1;