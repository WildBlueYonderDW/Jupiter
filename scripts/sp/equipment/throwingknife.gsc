#using scripts\engine\utility.gsc;
#using scripts\engine\sp\utility.gsc;
#using scripts\sp\utility.gsc;
#using scripts\sp\equipment\offhands.gsc;
#using scripts\sp\loot.gsc;
#using scripts\sp\player\cursor_hint.gsc;

#namespace throwingknife;

// Namespace throwingknife / scripts\sp\equipment\throwingknife
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x200
// Size: 0x3b
function precache(offhand) {
    setdvarifuninitialized(@"hash_425b104730459f47", 0);
    /#
        setdvarifuninitialized(@"hash_a8d9e3f367c7effc", 0);
    #/
    registeroffhandfirefunc(offhand, &throwingknifefiremain);
}

// Namespace throwingknife / scripts\sp\equipment\throwingknife
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x243
// Size: 0x1b7
function throwingknifefiremain(grenade, weapon) {
    if (!isdefined(grenade)) {
        return;
    }
    grenade.targetname = "offhand_throwingknife";
    if (getdvarint(@"hash_425b104730459f47") == 1) {
        grenade hudoutline_enable("outline_depth_cyan");
    }
    stuckto, stuckpart, null, null, position, normal = grenade waittill("missile_stuck");
    if (isdefined(stuckpart) && function_28eeffcb2337321e(stuckpart)) {
        stuckpart = function_f28fd66285fa2c9(stuckpart);
    }
    if (isdefined(stuckto) && isai(stuckto)) {
        if (isdefined(stuckpart)) {
            stuckto do_damage(2000, position, level.player, grenade, "MOD_IMPACT", weapon.basename, stuckpart);
        } else {
            stuckto do_damage(2000, position, level.player, grenade, "MOD_IMPACT", weapon.basename);
        }
    }
    grenade hide();
    var_a2301015c1ab039e = grenade.origin;
    var_a2301015c1ab039e += rotatevector((2, 0, 0), grenade.angles);
    var_9770ec8f19981834 = vectortoangles(-1 * normal);
    var_840da51fcf30ff7e = scripts\sp\loot::spawnlootitem("throwingknife", var_a2301015c1ab039e, var_9770ec8f19981834, 0, 1, !isdefined(stuckto), isdefined(stuckto));
    if (isdefined(stuckto) && !isai(stuckto)) {
        var_840da51fcf30ff7e linkto(stuckto);
    }
    var_840da51fcf30ff7e thread function_4158556b23018384(weapon);
    grenade delete();
}

// Namespace throwingknife / scripts\sp\equipment\throwingknife
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x402
// Size: 0x75
function function_4158556b23018384(var_626f13d105079101) {
    self endon("delete");
    self makeunusable();
    scripts\sp\player\cursor_hint::remove_cursor_hint();
    trigger = spawn("trigger_radius", self.origin, 0, 64, 64);
    trigger.targetname = "dropped_knife";
    trigger enablelinkto();
    trigger linkto(self);
    self.knife_trigger = trigger;
    function_c48e47edf7202570(var_626f13d105079101);
}

// Namespace throwingknife / scripts\sp\equipment\throwingknife
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x47f
// Size: 0xde
function function_c48e47edf7202570(var_626f13d105079101) {
    lootname = ter_op(var_626f13d105079101.basename == "throwingknife_kitchen", "Kitchen Throwing Knife", "Throwing Knife");
    while (true) {
        player = self.knife_trigger waittill("trigger");
        if (!isdefined(player)) {
            break;
        }
        if (isplayer(player)) {
            if (scripts\sp\loot::function_edf54aa6c57adb98("throwingknife") < scripts\sp\loot::function_57888d406854dc7f("throwingknife")) {
                weaponname = scripts\sp\loot::getoffhandweaponname("throwingknife");
                if (player_has_equipment(weaponname)) {
                    scripts\sp\loot::lootfuncandnotification("throwingknife");
                    function_47048f2dd7d4d220();
                    player notify("player_throwingKnifePickedUp");
                    break;
                }
            }
            if (level.script == "wounded") {
                player notify("throwingknife_pickup_add_to_crafting_inventory", self);
            }
        }
    }
}

// Namespace throwingknife / scripts\sp\equipment\throwingknife
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x565
// Size: 0x25
function function_47048f2dd7d4d220() {
    if (isdefined(self.knife_trigger)) {
        self.knife_trigger delete();
    }
    self delete();
}

/#

    // Namespace throwingknife / scripts\sp\equipment\throwingknife
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x592
    // Size: 0x1f
    function function_77f29d1ed8e5ad4c() {
        while (true) {
            sphere(self.origin, 64);
            waitframe();
        }
    }

#/

// Namespace throwingknife / scripts\sp\equipment\throwingknife
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5b9
// Size: 0x3a0
function function_73b30a27a6d8f81c() {
    var_375c5ff0a6f238ac = function_9d30fd63965bafa9("bullet", self);
    if (isdefined(level.stealth)) {
        var_375c5ff0a6f238ac = function_61b03c8c194a6733(ter_op(flag("stealth_spotted"), "spotted", "hidden"), "bullet");
    }
    var_fbe5ade21bd0d394 = var_375c5ff0a6f238ac * var_375c5ff0a6f238ac;
    self endon("missile_stuck");
    startpos = self.origin;
    endpos = startpos;
    var_508d7f61241d178b = level.player getgunangles();
    var_11c23bc7142b47f0 = 18;
    var_ed80e26dc25b5432 = 60;
    increment = (var_ed80e26dc25b5432 - var_11c23bc7142b47f0) / 2;
    var_e36f4333eb9fdaf4 = [];
    /#
        if (getdvarint(@"hash_a8d9e3f367c7effc")) {
            thread draw_line_for_time(startpos + anglestoright(var_508d7f61241d178b) * 1000, startpos + anglestoleft(var_508d7f61241d178b) * 1000, 1, 0, 1, 10);
        }
    #/
    waitframe();
    while (isdefined(self)) {
        startpos = endpos;
        endpos = self.origin;
        var_508d7f61241d178b = vectortoangles(endpos - startpos);
        var_6df2b5e4b03e9ea = vectortoangles(startpos - endpos);
        /#
            if (getdvarint(@"hash_a8d9e3f367c7effc")) {
                thread draw_line_for_time(endpos + anglestoright(var_6df2b5e4b03e9ea) * 1000, endpos + anglestoleft(var_6df2b5e4b03e9ea) * 1000, 1, 1, 0, 10);
            }
        #/
        foreach (guy in getaiarray("axis", "team3")) {
            if (array_contains(var_e36f4333eb9fdaf4, guy)) {
                continue;
            }
            max_z = guy.origin[2] + var_ed80e26dc25b5432;
            for (origin = guy.origin + (0, 0, var_11c23bc7142b47f0); origin[2] <= max_z; origin += (0, 0, increment)) {
                success = 0;
                if (distancesquared(origin, endpos) <= var_fbe5ade21bd0d394) {
                    success = 1;
                    /#
                        if (getdvarint(@"hash_a8d9e3f367c7effc")) {
                            thread draw_circle(endpos, var_375c5ff0a6f238ac, (1, 1, 1), 1, 0, 200);
                        }
                    #/
                }
                if (!success) {
                    if (!within_fov(startpos, var_508d7f61241d178b, origin, 0)) {
                        continue;
                    }
                    if (!within_fov(endpos, var_6df2b5e4b03e9ea, origin, 0)) {
                        continue;
                    }
                }
                if (!success) {
                    vector = vectorfromlinetopoint(startpos, endpos, origin);
                    success = lengthsquared(vector) <= var_fbe5ade21bd0d394;
                    /#
                        if (success && getdvarint(@"hash_a8d9e3f367c7effc")) {
                            thread draw_line_for_time(startpos, endpos, 1, 1, 1, 10);
                            thread draw_line_for_time(origin, origin - vector, 1, 0, 0, 10);
                            thread draw_line_for_time(origin - vector, endpos, 1, 0.5, 0, 10);
                            thread draw_circle(origin, 5, (1, 0, 0), 1, 0, 200);
                        }
                    #/
                }
                if (success) {
                    guy notify("bulletwhizby", level.player, distance(endpos, origin), endpos, endpos - startpos);
                    if (isdefined(guy.stealth)) {
                        guy aieventlistenerevent("bulletwhizby", level.player, endpos);
                    }
                    var_e36f4333eb9fdaf4[var_e36f4333eb9fdaf4.size] = guy;
                    break;
                }
            }
        }
        waitframe();
    }
}

// Namespace throwingknife / scripts\sp\equipment\throwingknife
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x961
// Size: 0xd7
function function_6566a2af1f779902() {
    ais = getaiunittypearray("bad_guys");
    var_eb5c16e9978852e3 = function_9d30fd63965bafa9("silenced_shot_impact", self);
    var_a3b2bf368419be73 = squared(var_eb5c16e9978852e3);
    foreach (ai in ais) {
        if (!isalive(ai)) {
            continue;
        }
        if (distancesquared(ai.origin, self.origin) > var_a3b2bf368419be73) {
            continue;
        }
        if (!ai hastacvis(self.origin)) {
            continue;
        }
        ai aieventlistenerevent("silenced_shot_impact", self, self.origin);
    }
}

