#using scripts\asm\shared\utility.gsc;
#using scripts\aitypes\bt_util.gsc;
#using scripts\anim\utility_common.gsc;
#using scripts\asm\track.gsc;
#using script_3433ee6b63c7e243;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\asm\soldier\patrol.gsc;
#using scripts\aitypes\combat.gsc;
#using scripts\sp\nvg\nvg_ai.gsc;
#using scripts\sp\stealth\utility.gsc;
#using scripts\sp\spawner.gsc;
#using scripts\anim\face.gsc;
#using scripts\asm\soldier\death.gsc;

#namespace namespace_8fab733834954b35;

// Namespace namespace_8fab733834954b35 / scripts\aitypes\combat_sp
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1bb
// Size: 0x8d
function initcombatfunctions(taskid) {
    self.fngetturretaimangles = &getturretaimanglessp;
    self.fngetusedturret = &getusedturret;
    self.fnlaseron = &turnonlaser;
    self.fnlaseroff = &turnofflaser;
    self.fnsetlaserflag = &callsetlaserflag;
    self.fnsaygenericdialogue = &saygenericdialogue;
    self.fnupdatefrantic = &updatefrantic;
    scripts\asm\soldier\patrol::function_3aba5f22b60d37f5();
    initstealthfunctionssp();
    level thread scripts\aitypes\combat::low_cover_combat_areas();
    return anim.success;
}

// Namespace namespace_8fab733834954b35 / scripts\aitypes\combat_sp
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x251
// Size: 0x48
function initstealthfunctionssp() {
    self.fnstealthflashlighton = &scripts\sp\nvg\nvg_ai::flashlight_on;
    self.fnstealthflashlightoff = &scripts\sp\nvg\nvg_ai::flashlight_off;
    self.fnstealthmusictransition = &scripts\sp\stealth\utility::stealth_music_transition_sp;
    self.fnupdatelightmeter = &scripts\sp\nvg\nvg_ai::updatelightmeter;
    self.fnstealthgotonode = &scripts\sp\spawner::go_to_node;
}

// Namespace namespace_8fab733834954b35 / scripts\aitypes\combat_sp
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2a1
// Size: 0x45
function soldier_init(taskid) {
    scripts\aitypes\combat::soldier_init_common();
    self.var_cbd87a0bc497b778 = 1;
    self.var_689bf433cb5c5322 = "melee_sp";
    self enableteamwalking(1);
    self enablemissedbulletclientonly(0);
    return anim.success;
}

// Namespace namespace_8fab733834954b35 / scripts\aitypes\combat_sp
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2ef
// Size: 0x9
function turnonlaser() {
    self laserforceon();
}

// Namespace namespace_8fab733834954b35 / scripts\aitypes\combat_sp
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x300
// Size: 0x9
function turnofflaser() {
    self laserforceoff();
}

// Namespace namespace_8fab733834954b35 / scripts\aitypes\combat_sp
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x311
// Size: 0x13
function callsetlaserflag(flag) {
    self setlaserflag(flag);
}

// Namespace namespace_8fab733834954b35 / scripts\aitypes\combat_sp
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x32c
// Size: 0x13
function saygenericdialogue(typestring) {
    scripts\anim\face::saygenericdialogue(typestring);
}

// Namespace namespace_8fab733834954b35 / scripts\aitypes\combat_sp
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x347
// Size: 0x11
function getturretaimanglessp(turret) {
    return turret turretgetaim();
}

// Namespace namespace_8fab733834954b35 / scripts\aitypes\combat_sp
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x361
// Size: 0x8
function getusedturret() {
    return self getturret();
}

// Namespace namespace_8fab733834954b35 / scripts\aitypes\combat_sp
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x372
// Size: 0x23c
function updatefrantic() {
    if (self.unittype == "c6i" || actor_is3d() || self.team == "neutral") {
        return anim.success;
    }
    curtime = gettime();
    if (!isdefined(self._blackboard.franticcooldowntime) || self._blackboard.franticcooldowntime > curtime) {
        var_a4a7cbaacb7cc0cd = getaiarray(scripts\engine\utility::get_enemy_team(self.team));
        var_775b9dd7cee9529 = 0;
        timeout = 10000;
        var_8bbc3c1a2867361f = 4194304;
        var_ae15e053b9483e7c = 5;
        self._blackboard.franticcooldowntime = curtime + 10000;
        self._blackboard.franticstate = "combat";
        foreach (enemy in var_a4a7cbaacb7cc0cd) {
            dist_sqr = distancesquared(self lastknownpos(enemy), self.origin);
            if (dist_sqr > var_8bbc3c1a2867361f) {
                continue;
            }
            elapsed_time = gettime() - self lastknowntime(enemy);
            if (elapsed_time > timeout) {
                continue;
            }
            var_775b9dd7cee9529++;
            if (enemy.unittype == "c8" || enemy.unittype == "c12") {
                self._blackboard.franticstate = "frantic";
                break;
            }
            if (var_775b9dd7cee9529 >= 3) {
                self._blackboard.franticstate = "frantic";
                break;
            }
        }
        /#
            if (getdvarint(@"hash_9bbeebe174825fd4", 0) == 1) {
                thread function_5d2b29a5f8d0c582(self._blackboard.franticcooldowntime);
            }
        #/
    }
    return anim.success;
}

// Namespace namespace_8fab733834954b35 / scripts\aitypes\combat_sp
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5b7
// Size: 0x84
function soldier_damagesubparthandler(partdata) {
    switch (partdata.partname) {
    case #"hash_8a1772f5f912c880":
        if (isdefined(self.nohelmetpop) && self.nohelmetpop) {
            assertmsg("noHelmetPop is not supported for SDF enemies with helmets. Spawn nohelmet versions.");
        }
        if (isdefined(self.onlyhelmetpopondeath) && self.onlyhelmetpopondeath) {
            assertmsg("onlyHelmetPopOnDeath is not supported for SDF enemies with helmets. Spawn nohelmet versions.");
        }
        scripts\asm\soldier\death::helmetpop();
        break;
    }
}

/#

    // Namespace namespace_8fab733834954b35 / scripts\aitypes\combat_sp
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x643
    // Size: 0x7d
    function function_5d2b29a5f8d0c582(end_time) {
        self notify("<dev string:x1c>");
        self endon("<dev string:x1c>");
        self endon("<dev string:x2f>");
        while (gettime() < end_time) {
            print3d(self.origin + (0, 0, 32), self._blackboard.franticstate, (1, 0, 0), 1, 1, 1);
            wait 0.05;
        }
    }

#/
