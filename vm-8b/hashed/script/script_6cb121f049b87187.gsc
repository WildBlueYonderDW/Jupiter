#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\callbacks.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\stats.gsc;
#using scripts\mp\gameobjects.gsc;
#using scripts\mp\objidpoolmanager.gsc;
#using scripts\cp_mp\challenges.gsc;

#namespace countdown;

// Namespace countdown / namespace_caa20322e8a4324d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3ec
// Size: 0xed
function init() {
    level.lootitems = [];
    SetDvars();
    level.var_82b5ecc31717c4d4 = getdvarint(@"hash_fba804ece774767a", 0) == 1;
    level.conf_fx["vanish"] = loadfx("vfx/core/impacts/small_snowhit");
    level.var_78a0087bea386662 = spawnstruct();
    level.var_78a0087bea386662.var_d04b4a9729479cad = &function_d04b4a9729479cad;
    level.var_78a0087bea386662.var_c80fb54710c9e5aa = &function_c80fb54710c9e5aa;
    level.var_78a0087bea386662.var_e807776b16dce7d4 = &function_52ecb2291cfdb603;
    level.var_78a0087bea386662.var_d70ec56158c8530b = &function_fba8eb934ad3b08b;
    level.var_78a0087bea386662.onuse = &function_f1e11c45881efcf0;
    level callback::add("player_disconnect", &onplayerdisconnect);
    thread function_899920a5f5f76a4b();
}

// Namespace countdown / namespace_caa20322e8a4324d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4e1
// Size: 0x72
function SetDvars() {
    setdvarifuninitialized(@"hash_c98b32754e2d7c86", 0.25);
    setdvarifuninitialized(@"hash_f305666815da5e5f", 0.25);
    setdvarifuninitialized(@"hash_805ad2ae010a9d84", 0.25);
    setdvarifuninitialized(@"hash_d1deadfc50d1019d", 0.25);
    if (getgametype() == "xfire") {
        setdvarifuninitialized(@"hash_30ac4415ff58708e", 1);
    }
}

// Namespace countdown / namespace_caa20322e8a4324d
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x55b
// Size: 0x66e
function function_7502f58e600e74a2(victim, attacker, victimnotification, meansofdeath) {
    var_2db3d5c614236fa9 = victim function_2db3d5c614236fa9(attacker);
    if (!var_2db3d5c614236fa9) {
        return;
    }
    if (isagent(victim)) {
        return;
    }
    if (isagent(attacker) && isdefined(attacker.owner)) {
        attacker = attacker.owner;
    }
    var_8b7d4a024c529d6f = function_bc3c5e354753e249()[2];
    upangles = (0, 0, 0);
    var_650440c6a1642e7e = victim.angles;
    if (victim scripts\mp\gameobjects::touchingarbitraryuptrigger()) {
        var_650440c6a1642e7e = victim getworldupreferenceangles();
        upangles = anglestoup(var_650440c6a1642e7e);
        if (upangles[2] < 0) {
            var_8b7d4a024c529d6f *= -1;
        }
    }
    useteam = "any";
    reward = [[ level.var_78a0087bea386662.var_e807776b16dce7d4 ]]();
    rewardcount = [[ level.var_78a0087bea386662.var_d70ec56158c8530b ]](reward);
    if (isdefined(level.lootitems[victim.guid])) {
        function_4ebd84f3e771db5(victim.guid, 1);
    }
    visuals = [];
    visuals[0] = spawnscriptable([[ level.var_78a0087bea386662.var_d04b4a9729479cad ]](), (0, 0, 0));
    visuals[0] [[ level.var_78a0087bea386662.var_c80fb54710c9e5aa ]](reward);
    visuals[0] setasgametypeobjective();
    trigger = spawn("trigger_radius", (0, 0, 0), 0, 32, 32);
    if (victim scripts\mp\gameobjects::touchingarbitraryuptrigger()) {
        if (upangles[2] < 0) {
            visuals[0].angles = var_650440c6a1642e7e;
        }
    }
    usetime = 0;
    level.lootitems[victim.guid] = scripts\mp\gameobjects::createuseobject(useteam, trigger, visuals, (0, 0, 16));
    level.lootitems[victim.guid].onuse = level.var_78a0087bea386662.onuse;
    level.lootitems[victim.guid] scripts\mp\gameobjects::setusetime(usetime);
    level.lootitems[victim.guid].victim = victim;
    level.lootitems[victim.guid].victimteam = victim.team;
    level.lootitems[victim.guid].offset3d = (0, 0, 24);
    scripts\mp\objidpoolmanager::update_objective_setzoffset(level.lootitems[victim.guid].objidnum, level.lootitems[victim.guid].offset3d[2]);
    attacker thread function_b08b83755bcac562(level.lootitems[victim.guid]);
    pos = victim.origin + (0, 0, var_8b7d4a024c529d6f);
    level.lootitems[victim.guid].curorigin = pos;
    level.lootitems[victim.guid].trigger.origin = pos;
    level.lootitems[victim.guid].visuals[0].origin = pos;
    level.lootitems[victim.guid] scripts\mp\gameobjects::initializetagpathvariables();
    level.lootitems[victim.guid] scripts\mp\gameobjects::allowuse(useteam);
    level.lootitems[victim.guid].attacker = attacker;
    level.lootitems[victim.guid].attackerteam = attacker.team;
    level.lootitems[victim.guid].ownerteam = "neutral";
    level.lootitems[victim.guid].reward = reward;
    level.lootitems[victim.guid].rewardcount = rewardcount;
    if (isdefined(level.lootitems[victim.guid].objidnum) && level.lootitems[victim.guid].objidnum != -1) {
        objid = level.lootitems[victim.guid].objidnum;
        state = "current";
        if (!istrue(level.var_82b5ecc31717c4d4)) {
            state = "active";
        }
        scripts\mp\objidpoolmanager::update_objective_state(objid, state);
        scripts\mp\objidpoolmanager::update_objective_position(objid, victim.origin + (0, 0, 36));
        scripts\mp\objidpoolmanager::update_objective_setbackground(objid, 1);
        scripts\mp\objidpoolmanager::objective_set_play_intro(level.lootitems[victim.guid].objidnum, 0);
        scripts\mp\objidpoolmanager::objective_set_play_outro(level.lootitems[victim.guid].objidnum, 0);
        scripts\mp\objidpoolmanager::function_98ba077848896a3(level.lootitems[victim.guid].objidnum, 0);
        scripts\mp\objidpoolmanager::function_f21e9b2e78de984b(level.lootitems[victim.guid].objidnum, 800, 1600);
    }
    level notify(victimnotification, level.lootitems[victim.guid]);
}

// Namespace countdown / namespace_caa20322e8a4324d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xbd1
// Size: 0xc5
function function_2db3d5c614236fa9(attacker) {
    if (getgametype() == "br") {
        return false;
    }
    if (isdefined(self.switching_teams)) {
        return false;
    }
    if (isdefined(attacker) && attacker == self) {
        return false;
    }
    if (level.teambased && isdefined(attacker) && isdefined(attacker.team) && attacker.team == self.team) {
        return false;
    }
    if (isdefined(attacker) && !isdefined(attacker.team) && (attacker.classname == "trigger_hurt" || attacker.classname == "worldspawn")) {
        return false;
    }
    if (isreallyalive(self)) {
        return false;
    }
    return true;
}

// Namespace countdown / namespace_caa20322e8a4324d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc9f
// Size: 0xf
function function_bc3c5e354753e249() {
    return (0, 0, 36);
}

// Namespace countdown / namespace_caa20322e8a4324d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xcb7
// Size: 0xc9
function function_22bd898a1e929cf2() {
    self.attacker = undefined;
    self notify("reset");
    self.visuals[0] setscriptablepartstate([[ level.var_78a0087bea386662.var_d04b4a9729479cad ]](), "hidden");
    self.curorigin = (0, 0, 1000);
    self.trigger.origin = (0, 0, 1000);
    self.visuals[0].origin = (0, 0, 1000);
    scripts\mp\gameobjects::allowuse("none");
    if (self.objidnum != -1) {
        scripts\mp\objidpoolmanager::update_objective_state(self.objidnum, "done");
    }
}

// Namespace countdown / namespace_caa20322e8a4324d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xd88
// Size: 0x30c
function function_f1e11c45881efcf0(player) {
    if (isdefined(player.owner)) {
        player = player.owner;
    }
    switch (self.reward) {
    case 1: 
        if (!isdefined(player.var_b982ceb2ab8a2f94)) {
            player.var_b982ceb2ab8a2f94 = 0;
        }
        player.var_b982ceb2ab8a2f94 += self.rewardcount;
        if (!isdefined(level.var_73dbc3b2132b4b04)) {
            level.var_73dbc3b2132b4b04 = 0;
        }
        level.var_73dbc3b2132b4b04 += self.rewardcount;
        player scripts\cp_mp\challenges::function_8359cadd253f9604(player, "event_countdown_pickup_0", self.rewardcount);
        break;
    case 2: 
        if (!isdefined(player.var_67439179191b54a3)) {
            player.var_67439179191b54a3 = 0;
        }
        player.var_67439179191b54a3 += self.rewardcount;
        if (!isdefined(level.var_b6930f6a626cecb7)) {
            level.var_b6930f6a626cecb7 = 0;
        }
        level.var_b6930f6a626cecb7 += self.rewardcount;
        player scripts\cp_mp\challenges::function_8359cadd253f9604(player, "event_countdown_pickup_1", self.rewardcount);
        break;
    case 3: 
        if (!isdefined(player.var_4fc80c2800aff392)) {
            player.var_4fc80c2800aff392 = 0;
        }
        player.var_4fc80c2800aff392 += self.rewardcount;
        if (!isdefined(level.var_1337e1a54678ffc2)) {
            level.var_1337e1a54678ffc2 = 0;
        }
        level.var_1337e1a54678ffc2 += self.rewardcount;
        player scripts\cp_mp\challenges::function_8359cadd253f9604(player, "event_countdown_pickup_2", self.rewardcount);
        break;
    case 4: 
        if (!isdefined(player.var_fc45de226f41cf01)) {
            player.var_fc45de226f41cf01 = 0;
        }
        player.var_fc45de226f41cf01 += self.rewardcount;
        if (!isdefined(level.var_d01465a3daf800ed)) {
            level.var_d01465a3daf800ed = 0;
        }
        level.var_d01465a3daf800ed += self.rewardcount;
        player scripts\cp_mp\challenges::function_8359cadd253f9604(player, "event_countdown_pickup_3", self.rewardcount);
        break;
    }
    player function_77f5f08a39a2d9f8(self.reward, self.rewardcount);
    player playsoundtoplayer("mp_countdown_dna_pickup_player", player);
    player playsoundtoteam("mp_countdown_dna_pickup_enemy", getotherteam(player.team)[0], player);
    player playsoundtoteam("mp_countdown_dna_pickup_ally", player.team, player);
    thread function_4ebd84f3e771db5(self.victim.guid, undefined, player);
}

// Namespace countdown / namespace_caa20322e8a4324d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x109c
// Size: 0x4f
function function_b08b83755bcac562(lootitem) {
    level endon("game_ended");
    self endon("disconnect");
    lootitem endon("death");
    while (true) {
        self waittill("joined_team");
        thread function_4ebd84f3e771db5(lootitem.victim.guid, 1);
    }
}

// Namespace countdown / namespace_caa20322e8a4324d
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x10f3
// Size: 0x122
function function_4ebd84f3e771db5(guid, var_3737240cefe2c793, collector) {
    if (isdefined(level.lootitems[guid])) {
        level.lootitems[guid] scripts\mp\gameobjects::allowuse("none");
        playfx(level.conf_fx["vanish"], level.lootitems[guid].curorigin);
        level.lootitems[guid] notify("reset");
        waitframe();
        if (!isdefined(level.lootitems[guid])) {
            return;
        }
        level.lootitems[guid] notify("death");
        for (i = 0; i < level.lootitems[guid].visuals.size; i++) {
            level.lootitems[guid].visuals[i] freescriptable();
        }
        if (!isdefined(level.lootitems[guid].skipminimapids)) {
            level.lootitems[guid] thread scripts\mp\gameobjects::deleteuseobject();
        }
        level.lootitems[guid] = undefined;
    }
}

// Namespace countdown / namespace_caa20322e8a4324d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x121d
// Size: 0x7
function function_d04b4a9729479cad() {
    return "countdown_loot";
}

// Namespace countdown / namespace_caa20322e8a4324d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x122d
// Size: 0x85
function function_c80fb54710c9e5aa(reward) {
    scriptablename = [[ level.var_78a0087bea386662.var_d04b4a9729479cad ]]();
    if (reward == 1) {
        self setscriptablepartstate(scriptablename, "blue");
        return;
    }
    if (reward == 2) {
        self setscriptablepartstate(scriptablename, "orange");
        return;
    }
    if (reward == 3) {
        self setscriptablepartstate(scriptablename, "yellow");
        return;
    }
    if (reward == 4) {
        self setscriptablepartstate(scriptablename, "magenta");
    }
}

// Namespace countdown / namespace_caa20322e8a4324d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x12ba
// Size: 0x8d
function function_52ecb2291cfdb603() {
    values = [1, 2, 3, 4];
    weights = [getdvarfloat(@"hash_c98b32754e2d7c86"), getdvarfloat(@"hash_f305666815da5e5f"), getdvarfloat(@"hash_805ad2ae010a9d84"), getdvarfloat(@"hash_d1deadfc50d1019d")];
    reward = weighted_array_randomize(values, weights);
    return reward;
}

// Namespace countdown / namespace_caa20322e8a4324d
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1350
// Size: 0x89
function weighted_array_randomize(array, weights) {
    assert(array.size == weights.size);
    var_13acbd53528ed1ff = 0;
    for (i = 0; i < weights.size; i++) {
        var_13acbd53528ed1ff += weights[i];
    }
    random_weight = randomfloat(var_13acbd53528ed1ff);
    var_98abcc65d2b0707d = 0;
    for (i = 0; i < array.size; i++) {
        var_98abcc65d2b0707d += weights[i];
        if (var_98abcc65d2b0707d >= random_weight) {
            return array[i];
        }
    }
}

// Namespace countdown / namespace_caa20322e8a4324d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x13e1
// Size: 0x1c2
function function_fba8eb934ad3b08b(reward) {
    if (isdefined(reward)) {
        switch (reward) {
        case 1: 
            var_57f7615bfae4f666 = hashcat(@"hash_5cb5d505bd928620", getbasegametype(), "_reward_0_amount");
            var_d7d1886440562afd = getdvarint(var_57f7615bfae4f666, 17);
            if (!isdefined(level.var_ea10260a5b2419f9)) {
                level.var_ea10260a5b2419f9 = 0;
            }
            level.var_ea10260a5b2419f9 += var_d7d1886440562afd;
            break;
        case 2: 
            var_57f7615bfae4f666 = hashcat(@"hash_5cb5d505bd928620", getbasegametype(), "_reward_1_amount");
            var_d7d1886440562afd = getdvarint(var_57f7615bfae4f666, 17);
            if (!isdefined(level.var_3125ff37539a8b02)) {
                level.var_3125ff37539a8b02 = 0;
            }
            level.var_3125ff37539a8b02 += var_d7d1886440562afd;
            break;
        case 3: 
            var_57f7615bfae4f666 = hashcat(@"hash_5cb5d505bd928620", getbasegametype(), "_reward_2_amount");
            var_d7d1886440562afd = getdvarint(var_57f7615bfae4f666, 15);
            if (!isdefined(level.var_7fbee291ee102c6b)) {
                level.var_7fbee291ee102c6b = 0;
            }
            level.var_7fbee291ee102c6b += var_d7d1886440562afd;
            break;
        case 4: 
            var_57f7615bfae4f666 = hashcat(@"hash_5cb5d505bd928620", getbasegametype(), "_reward_3_amount");
            var_d7d1886440562afd = getdvarint(var_57f7615bfae4f666, 17);
            if (!isdefined(level.var_6141ba5646bcb9c4)) {
                level.var_6141ba5646bcb9c4 = 0;
            }
            level.var_6141ba5646bcb9c4 += var_d7d1886440562afd;
            break;
        default: 
            var_d7d1886440562afd = 17;
            break;
        }
        return var_d7d1886440562afd;
    }
    return 17;
}

// Namespace countdown / namespace_caa20322e8a4324d
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x15ab
// Size: 0x274
function function_77f5f08a39a2d9f8(reward, amount) {
    if (!isdefined(self.pers["event_collectables"])) {
        self.pers["event_collectables"] = [];
    }
    switch (reward) {
    case 1: 
        if (!isdefined(self.pers["event_collectables"]["total_collectable_1"])) {
            self.pers["event_collectables"]["total_collectable_1"] = 0;
        }
        self.pers["event_collectables"]["total_collectable_1"] = self.pers["event_collectables"]["total_collectable_1"] + amount;
        self setclientomnvar("ui_collectable_1", self.pers["event_collectables"]["total_collectable_1"]);
        break;
    case 2: 
        if (!isdefined(self.pers["event_collectables"]["total_collectable_2"])) {
            self.pers["event_collectables"]["total_collectable_2"] = 0;
        }
        self.pers["event_collectables"]["total_collectable_2"] = self.pers["event_collectables"]["total_collectable_2"] + amount;
        self setclientomnvar("ui_collectable_2", self.pers["event_collectables"]["total_collectable_2"]);
        break;
    case 3: 
        if (!isdefined(self.pers["event_collectables"]["total_collectable_3"])) {
            self.pers["event_collectables"]["total_collectable_3"] = 0;
        }
        self.pers["event_collectables"]["total_collectable_3"] = self.pers["event_collectables"]["total_collectable_3"] + amount;
        self setclientomnvar("ui_collectable_3", self.pers["event_collectables"]["total_collectable_3"]);
        break;
    case 4: 
        if (!isdefined(self.pers["event_collectables"]["total_collectable_4"])) {
            self.pers["event_collectables"]["total_collectable_4"] = 0;
        }
        self.pers["event_collectables"]["total_collectable_4"] = self.pers["event_collectables"]["total_collectable_4"] + amount;
        self setclientomnvar("ui_collectable_4", self.pers["event_collectables"]["total_collectable_4"]);
        break;
    }
}

// Namespace countdown / namespace_caa20322e8a4324d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1827
// Size: 0x86
function function_899920a5f5f76a4b() {
    level endon("game_ended");
    while (!isdefined(level.players) || level.players.size < 1) {
        wait 0.5;
    }
    foreach (player in level.players) {
        player thread function_d6f787b4c0967913();
    }
}

// Namespace countdown / namespace_caa20322e8a4324d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x18b5
// Size: 0x11d
function function_d6f787b4c0967913() {
    level endon("game_ended");
    self endon("disconnect");
    while (!isdefined(self.pers)) {
        waitframe();
    }
    if (!isdefined(self.pers["event_collectables"])) {
        return;
    }
    if (isdefined(self.pers["event_collectables"]["total_collectable_1"])) {
        self setclientomnvar("ui_collectable_1", self.pers["event_collectables"]["total_collectable_1"]);
    }
    if (isdefined(self.pers["event_collectables"]["total_collectable_2"])) {
        self setclientomnvar("ui_collectable_2", self.pers["event_collectables"]["total_collectable_2"]);
    }
    if (isdefined(self.pers["event_collectables"]["total_collectable_3"])) {
        self setclientomnvar("ui_collectable_3", self.pers["event_collectables"]["total_collectable_3"]);
    }
    if (isdefined(self.pers["event_collectables"]["total_collectable_4"])) {
        self setclientomnvar("ui_collectable_4", self.pers["event_collectables"]["total_collectable_4"]);
    }
}

// Namespace countdown / namespace_caa20322e8a4324d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x19da
// Size: 0x2b
function onplayerdisconnect(params) {
    if (isdefined(self.guid)) {
        thread function_4ebd84f3e771db5(self.guid, 1);
    }
}

