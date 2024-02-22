// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using script_608c50392df8c7d1;
#using script_5762ac2f22202ba2;
#using script_247745a526421ba7;
#using script_1ed1214969b5eba7;
#using scripts\cp_mp\emp_debuff.gsc;
#using script_736dec95a49487a6;
#using scripts\cp_mp\entityheadicons.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\cp_mp\challenges.gsc;
#using scripts\cp_mp\utility\train_utility.gsc;
#using scripts\engine\trace.gsc;

#namespace namespace_4eb3d972f35e69d5;

// Namespace namespace_4eb3d972f35e69d5/namespace_e551c0aff94f6c9f
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0x5f1
// Size: 0x2f
function autoexec main() {
    registersharedfunc("super_comm_scrambler", "init", &function_902e316237968d37);
    registersharedfunc("super_comm_scrambler", "get_and_handle_killstreak_blocking", &function_2ed5e780857f0eaf);
}

// Namespace namespace_4eb3d972f35e69d5/namespace_e551c0aff94f6c9f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x627
// Size: 0x64
function function_902e316237968d37() {
    level.var_4e74070c2484e644 = [];
    if (issharedfuncdefined("team_utility", "joinrTeamAggregator")) {
        [[ getsharedfunc("team_utility", "joinTeamAggregator") ]](&function_5bb22bae2eafed7);
    }
    registersharedfunc("super_comm_scrambler", "commScrambler_used", &commscrambler_used);
    registersharedfunc("super_comm_scrambler", "commScrambler_onHacked", &commscrambler_onhacked);
}

// Namespace namespace_4eb3d972f35e69d5/namespace_e551c0aff94f6c9f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x692
// Size: 0x32c
function commscrambler_used(grenade) {
    grenade endon("death");
    level endon("game_ended");
    grenade.owner = self;
    grenade.issuper = 1;
    grenade.superid = level.superglobals.staticsuperdata["super_comm_scrambler"].id;
    grenade.bundle = namespace_4a3033eafa6fd07::function_bf9c7e9dd30180e3("super_comm_scrambler");
    grenade setscriptablepartstate("visibility", "show", 0);
    grenade thread function_cbc5bc96e58659c7();
    grenade thread function_44a7cc547d0a4415();
    grenade thread function_cf6202f14a8176f(self);
    stuckto = grenade waittill("missile_stuck");
    grenade function_d25ff4a17fd8fb37(stuckto);
    if (issharedfuncdefined("weapons", "onEquipmentPlanted")) {
        self [[ getsharedfunc("weapons", "onEquipmentPlanted") ]](grenade, "equip_comm_scrambler", &function_4ee728f14862d601);
    }
    grenade setscriptablepartstate("activate", "activate", 0);
    level.var_4e74070c2484e644[grenade getentitynumber()] = grenade;
    if (issharedfuncdefined("emp", "setEMP_Applied_Callback")) {
        grenade [[ getsharedfunc("emp", "setEMP_Applied_Callback") ]](&function_2233a8cd9c48a336);
    }
    if (issharedfuncdefined("emp", "setEMP_Cleared_Callback")) {
        grenade [[ getsharedfunc("emp", "setEMP_Cleared_Callback") ]](&function_93e55db60b551e17);
    }
    grenade namespace_5a51aa78ea0b1b9f::set_apply_emp_callback(&function_2233a8cd9c48a336);
    grenade namespace_5a51aa78ea0b1b9f::set_clear_emp_callback(&function_93e55db60b551e17);
    grenade namespace_b6b4a3ac458ab6e2::function_172d848d58051fdf(&function_89a8296f4d744235);
    grenade function_e26cc89366241706();
    grenade.isactive = 1;
    grenade.headiconid = grenade namespace_7bdde15c3500a23f::setheadicon_factionimage(0, 20, undefined, undefined, undefined, undefined, 1);
    if (issharedfuncdefined("game", "createObjective")) {
        grenade.minimapid = grenade [[ getsharedfunc("game", "createObjective") ]]("jup_hud_icon_minimap_fieldupgrade_commscrambler", grenade.team, 0, 1, 1);
        triggerradius = getdvarfloat(@"hash_304ea9c01d3fa58b", grenade.bundle.var_783b73889965c476);
        grenade namespace_36f464722d326bbe::function_6b6b6273f8180522("TestCircle", grenade.origin, triggerradius);
        grenade namespace_36f464722d326bbe::function_6988310081de7b45();
    }
    grenade function_c3decb14deedd3d2();
    grenade setscriptablepartstate("enemies_present", "not_present", 0);
    grenade childthread function_b181719d99fb654e();
    grenade childthread function_a7a8818b75adcad8();
    if (!isai(self) && istrue(grenade.bundle.var_a6682e1889a48304) && issharedfuncdefined("player", "doScoreEvent")) {
        grenade childthread function_8a689b49bffeed79();
        grenade.var_2020fa0ae4d1323d = 0;
        grenade.var_4b15951dd656dcc0 = [];
        grenade childthread function_71f37f039649db2c();
        grenade childthread function_50c6e9ffe406b26e();
        grenade childthread function_3aed59109065b38a();
    }
    namespace_aad14af462a74d08::function_d997435895422ecc("super_comm_scrambler", function_e2ff8f4b4e94f723(#"hash_83a2d67994d7e295", #"use"));
}

// Namespace namespace_4eb3d972f35e69d5/namespace_e551c0aff94f6c9f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9c5
// Size: 0xe3
function function_4ee728f14862d601(var_4fac8b8ce36e09f1) {
    var_cbf7be4f62a0ddb2 = 0.1;
    moving_platform = undefined;
    var_34a47d4b8f3a4596 = undefined;
    thread function_1d4ab8d63dbf796e(var_cbf7be4f62a0ddb2, var_4fac8b8ce36e09f1);
    if (isdefined(self)) {
        fxorigin = self.origin;
        var_92246546867d1d04 = anglestoforward(self.angles);
        fxup = anglestoup(self.angles);
        var_dfdfaa4e665b31fc = self getlinkedparent();
        if (isdefined(var_dfdfaa4e665b31fc)) {
            moving_platform = var_dfdfaa4e665b31fc;
            var_34a47d4b8f3a4596 = moving_platform.origin - fxorigin;
        }
        self setscriptablepartstate("destroy", "active", 0);
        if (isdefined(moving_platform) && isent(moving_platform)) {
            fxorigin = moving_platform.origin - var_34a47d4b8f3a4596;
        }
    }
}

// Namespace namespace_4eb3d972f35e69d5/namespace_e551c0aff94f6c9f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xaaf
// Size: 0x126
function function_1d4ab8d63dbf796e(var_cbf7be4f62a0ddb2, var_4fac8b8ce36e09f1) {
    self notify("death");
    wait(var_cbf7be4f62a0ddb2);
    self.isdestroyed = 1;
    self setcandamage(0);
    self.exploding = 1;
    if (isdefined(self.owner) && issharedfuncdefined("weapons", "removeEquip")) {
        self.owner [[ getsharedfunc("weapons", "removeEquip") ]](self);
    }
    function_e016066e327d42b6();
    function_2eff4cd94c3243e8();
    namespace_36f464722d326bbe::function_af5604ce591768e1();
    if (issharedfuncdefined("dlog", "fieldUpgradeExpired")) {
        [[ getsharedfunc("dlog", "fieldUpgradeExpired") ]](self.owner, self.superid, self.usedcount, istrue(var_4fac8b8ce36e09f1));
    }
    function_d82a67223a4e56d9();
    level.var_4e74070c2484e644[self getentitynumber()] = undefined;
    self.owner namespace_aad14af462a74d08::function_d997435895422ecc("super_comm_scrambler", function_e2ff8f4b4e94f723(#"hash_83a2d67994d7e295", #"end"), self.usedcount);
    self delete();
}

// Namespace namespace_4eb3d972f35e69d5/namespace_e551c0aff94f6c9f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbdc
// Size: 0x81
function function_d82a67223a4e56d9() {
    if (!isdefined(self.trigger)) {
        return;
    }
    foreach (id, player in self.trigger.playersintrigger) {
        player function_95b4fc5672916c93(self, id);
    }
    self.trigger delete();
}

// Namespace namespace_4eb3d972f35e69d5/namespace_e551c0aff94f6c9f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc64
// Size: 0x197
function function_c3decb14deedd3d2() {
    triggerradius = getdvarint(@"hash_304ea9c01d3fa58b", self.bundle.var_783b73889965c476);
    triggerheight = getdvarint(@"hash_d9d5ba0482f401a", self.bundle.var_1836009701d3c8b);
    spawnpoint = (self.origin[0], self.origin[1], self.origin[2] - triggerheight / 2);
    self.trigger = spawn("trigger_radius", spawnpoint, 0, triggerradius, triggerheight);
    self.trigger.playersintrigger = [];
    self.trigger.var_854cf4c64f4bdd9f = [];
    self.trigger.var_a81e3fef4236357a = [];
    self.trigger enablelinkto();
    self.trigger linkto(self);
    /#
        if (getdvarint(@"hash_7a6de10a710dbdbe", 0) == 1) {
            end = (self.origin[0], self.origin[1], self.origin[2] + triggerheight / 2);
            lifetime = getdvarint(@"hash_2467b36602d82d7f", self.bundle.var_a6cdc017c04a56de);
            cylinder(spawnpoint, end, triggerradius, (1, 0, 0), 0, 20 * lifetime);
        }
    #/
}

// Namespace namespace_4eb3d972f35e69d5/namespace_e551c0aff94f6c9f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe02
// Size: 0xe9
function function_b181719d99fb654e() {
    while (1) {
        self.trigger waittill("trigger");
        var_5fd22bb97d499b04 = self.trigger getistouchingentities(level.players);
        foreach (player in var_5fd22bb97d499b04) {
            if (!isalive(player)) {
                continue;
            }
            entitynumber = player getentitynumber();
            if (!array_contains_key(self.trigger.playersintrigger, entitynumber)) {
                self.trigger.playersintrigger[entitynumber] = player;
                if (self.isactive) {
                    player function_ac6ba9556aa071b2(self, entitynumber);
                }
            }
        }
    }
}

// Namespace namespace_4eb3d972f35e69d5/namespace_e551c0aff94f6c9f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xef2
// Size: 0x124
function function_ac6ba9556aa071b2(grenade, id) {
    if (isenemy(grenade.owner)) {
        if (grenade.trigger.var_a81e3fef4236357a.size == 0) {
            grenade setscriptablepartstate("enemies_present", "present", 0);
        }
        grenade.trigger.var_a81e3fef4236357a = function_6d6af8144a5131f1(grenade.trigger.var_a81e3fef4236357a, id);
        if (!isdefined(self.var_13c9d77f4a31f4cd)) {
            self.var_13c9d77f4a31f4cd = [];
        }
        self.var_13c9d77f4a31f4cd = function_6d6af8144a5131f1(self.var_13c9d77f4a31f4cd, grenade);
        self setclientomnvar("ui_gameplay_comm_scrambler_active", 1);
        self playsoundtoplayer("eqp_comm_scrambler_ui_enemyscrambled_transient", self);
    } else {
        grenade.trigger.var_854cf4c64f4bdd9f = function_6d6af8144a5131f1(grenade.trigger.var_854cf4c64f4bdd9f, id);
        self setplayerghost(1);
        self setplayeradvanceduavdot(1);
        self.var_8d9c40fe23269431 = 1;
    }
}

// Namespace namespace_4eb3d972f35e69d5/namespace_e551c0aff94f6c9f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x101d
// Size: 0x125
function function_a7a8818b75adcad8() {
    while (1) {
        foreach (id, player in self.trigger.playersintrigger) {
            if (!isdefined(player)) {
                self.trigger.playersintrigger[id] = undefined;
                self.trigger.var_854cf4c64f4bdd9f = array_remove(self.trigger.var_854cf4c64f4bdd9f, id);
                self.trigger.var_a81e3fef4236357a = array_remove(self.trigger.var_a81e3fef4236357a, id);
            } else if (!player istouching(self.trigger) || !player namespace_f8065cafc523dba5::_isalive()) {
                self.trigger.playersintrigger[id] = undefined;
                if (self.isactive) {
                    player function_95b4fc5672916c93(self, id);
                }
            }
        }
        waitframe();
    }
}

// Namespace namespace_4eb3d972f35e69d5/namespace_e551c0aff94f6c9f
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1149
// Size: 0x12a
function function_95b4fc5672916c93(grenade, id, owner) {
    if (!isdefined(owner)) {
        owner = grenade.owner;
    }
    if (isenemy(owner)) {
        grenade.trigger.var_a81e3fef4236357a = array_remove(grenade.trigger.var_a81e3fef4236357a, id);
        if (grenade.trigger.var_a81e3fef4236357a.size == 0) {
            grenade setscriptablepartstate("enemies_present", "not_present", 0);
        }
        if (isdefined(self.var_13c9d77f4a31f4cd)) {
            self.var_13c9d77f4a31f4cd = array_remove(self.var_13c9d77f4a31f4cd, grenade);
        } else {
            /#
                assertmsg("self.enemyCommScramblersInRange is undefined inside commScrambler_remove_trigger_effects, did we somehow miss calling commScrambler_add_trigger_effects?");
            #/
        }
        self setclientomnvar("ui_gameplay_comm_scrambler_active", 0);
    } else {
        grenade.trigger.var_854cf4c64f4bdd9f = array_remove(grenade.trigger.var_854cf4c64f4bdd9f, id);
        self setplayerghost(0);
        self setplayeradvanceduavdot(0);
        self.var_8d9c40fe23269431 = 0;
    }
}

// Namespace namespace_4eb3d972f35e69d5/namespace_e551c0aff94f6c9f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x127a
// Size: 0xc0
function function_2ed5e780857f0eaf(var_16efcf27e6efcbe8) {
    if (isdefined(self.var_13c9d77f4a31f4cd) && self.var_13c9d77f4a31f4cd.size > 0) {
        if (issharedfuncdefined("hud", "showErrorMessage")) {
            self [[ getsharedfunc("hud", "showErrorMessage") ]]("SUPER_MP/COMM_SCRAMBLER_KILLSTREAK_BLOCKED_MESSAGE");
        }
        self playsoundtoplayer("eqp_comm_scrambler_ui_killstreak_disabled", self);
        foreach (var_19555c1df203e02c in self.var_13c9d77f4a31f4cd) {
            var_19555c1df203e02c notify("killstreak_blocked", self);
        }
        return 1;
    } else {
        return 0;
    }
}

// Namespace namespace_4eb3d972f35e69d5/namespace_e551c0aff94f6c9f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1341
// Size: 0xc5
function function_8a689b49bffeed79() {
    self.var_9a1a850927bb996f = [];
    while (1) {
        var_e7e26d136416c9bc = self waittill("killstreak_blocked");
        playerentitynum = var_e7e26d136416c9bc getentitynumber();
        currenttime = gettime();
        mintime = self.bundle.var_c5ae6960f76c1782 * 1000;
        if (!array_contains_key(self.var_9a1a850927bb996f, playerentitynum) || currenttime - self.var_9a1a850927bb996f[playerentitynum] > mintime) {
            self.var_9a1a850927bb996f[playerentitynum] = currenttime;
            self.owner thread [[ getsharedfunc("player", "doScoreEvent") ]](#"hash_f3628c75d8e3e7c3");
        }
    }
}

// Namespace namespace_4eb3d972f35e69d5/namespace_e551c0aff94f6c9f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x140d
// Size: 0x1a2
function function_71f37f039649db2c() {
    var_fd999362783c862f = self.bundle.var_c93862714a3e756e * 1000;
    while (1) {
        var_294e2c9657f8efff = gettime() - self.var_2020fa0ae4d1323d;
        if (var_294e2c9657f8efff < var_fd999362783c862f) {
            wait((var_fd999362783c862f - var_294e2c9657f8efff) / 1000);
        }
        if (self.isactive) {
            var_7b847e685b032554 = 0;
            if (level.teambased) {
                var_7b847e685b032554 = function_53c4c53197386572(level.activeuavs[self.owner.team], 0);
            } else {
                var_7b847e685b032554 = function_53c4c53197386572(level.activeuavs[self.owner.guid], 0);
            }
            hasuav = level.totalactiveuavs - var_7b847e685b032554 > 0;
            if (!hasuav) {
                var_71f10319cd3043a9 = 0;
                if (level.teambased) {
                    var_71f10319cd3043a9 = function_53c4c53197386572(level.activeadvanceduavs[self.owner.team], 0);
                } else {
                    var_71f10319cd3043a9 = function_53c4c53197386572(level.activeadvanceduavs[self.owner.guid], 0);
                }
                hasuav = level.activeadvanceduavcount - var_71f10319cd3043a9 > 0;
            }
            if (hasuav) {
                var_88859a5a22b4de6e = array_difference(self.trigger.var_854cf4c64f4bdd9f, self.var_4b15951dd656dcc0);
                if (var_88859a5a22b4de6e.size > 0) {
                    function_e082ef4196a28f0b(var_88859a5a22b4de6e);
                }
            }
        }
        wait(0.5);
    }
}

// Namespace namespace_4eb3d972f35e69d5/namespace_e551c0aff94f6c9f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15b6
// Size: 0x5d
function function_50c6e9ffe406b26e() {
    while (1) {
        var_9f47268324f609b3 = pingplayer = var_616fb367fca3720a = level waittill("portable_radar_ping");
        if (self.isactive && pingplayer isenemy(self.owner)) {
            function_721fd61e3d39a6fc(var_616fb367fca3720a, var_9f47268324f609b3);
        }
    }
}

// Namespace namespace_4eb3d972f35e69d5/namespace_e551c0aff94f6c9f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x161a
// Size: 0x94
function function_3aed59109065b38a() {
    while (1) {
        var_9f47268324f609b3 = var_7f0ede6a47b0eb6c = var_616fb367fca3720a = level waittill("portable_radar_ping_team");
        if (isint(var_616fb367fca3720a) && isvector(var_7f0ede6a47b0eb6c) && isstring(var_9f47268324f609b3)) {
            temp = var_7f0ede6a47b0eb6c;
            var_7f0ede6a47b0eb6c = var_9f47268324f609b3;
            var_9f47268324f609b3 = var_616fb367fca3720a;
            var_616fb367fca3720a = temp;
        }
        if (self.isactive && var_7f0ede6a47b0eb6c != self.owner.team) {
            function_721fd61e3d39a6fc(var_616fb367fca3720a, var_9f47268324f609b3);
        }
    }
}

// Namespace namespace_4eb3d972f35e69d5/namespace_e551c0aff94f6c9f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16b5
// Size: 0x14e
function function_721fd61e3d39a6fc(var_616fb367fca3720a, var_9f47268324f609b3) {
    var_fd999362783c862f = self.bundle.var_c93862714a3e756e * 1000;
    var_294e2c9657f8efff = gettime() - self.var_2020fa0ae4d1323d;
    if (var_294e2c9657f8efff < var_fd999362783c862f) {
        return;
    }
    var_5826f64c707f910b = array_difference(self.trigger.var_854cf4c64f4bdd9f, self.var_4b15951dd656dcc0);
    var_b9f63f8c68e691de = [];
    foreach (var_508f4872bf68fa46 in var_5826f64c707f910b) {
        var_433f5b38c7205a99 = self.trigger.playersintrigger[var_508f4872bf68fa46];
        var_8081987ef05481dd = distancesquared(var_433f5b38c7205a99.origin, var_616fb367fca3720a);
        var_3b85a2c354f9ce88 = float(var_9f47268324f609b3 * var_9f47268324f609b3);
        if (var_8081987ef05481dd < var_3b85a2c354f9ce88) {
            var_b9f63f8c68e691de = function_6d6af8144a5131f1(var_b9f63f8c68e691de, var_508f4872bf68fa46);
        }
    }
    if (var_b9f63f8c68e691de.size > 0) {
        function_e082ef4196a28f0b(var_b9f63f8c68e691de);
    }
}

// Namespace namespace_4eb3d972f35e69d5/namespace_e551c0aff94f6c9f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x180a
// Size: 0x59
function function_e082ef4196a28f0b(var_88859a5a22b4de6e) {
    self.owner thread [[ getsharedfunc("player", "doScoreEvent") ]](#"hash_a292bcf7d6cdc45");
    self.var_2020fa0ae4d1323d = gettime();
    self.var_4b15951dd656dcc0 = array_combine(self.var_4b15951dd656dcc0, var_88859a5a22b4de6e);
}

// Namespace namespace_4eb3d972f35e69d5/namespace_e551c0aff94f6c9f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x186a
// Size: 0xe7
function function_741968e8ad6d8f0a(isactive) {
    if (isactive == self.isactive) {
        return;
    }
    if (isactive) {
        self.isactive = 1;
        foreach (id, player in self.trigger.playersintrigger) {
            player function_ac6ba9556aa071b2(self, id);
        }
    } else {
        self.isactive = 0;
        foreach (id, player in self.trigger.playersintrigger) {
            player function_95b4fc5672916c93(self, id);
        }
    }
}

// Namespace namespace_4eb3d972f35e69d5/namespace_e551c0aff94f6c9f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1958
// Size: 0x4d
function function_e26cc89366241706() {
    if (issharedfuncdefined("damage", "monitorDamage")) {
        self thread [[ getsharedfunc("damage", "monitorDamage") ]](self.bundle.maxhealth, "hitequip", &function_5013def65fabcc8a, &function_79a97ee01dc267d3);
    }
}

// Namespace namespace_4eb3d972f35e69d5/namespace_e551c0aff94f6c9f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19ac
// Size: 0x28
function function_5013def65fabcc8a(data) {
    function_1b38460f9db6a610(data.attacker);
    thread function_4ee728f14862d601(1);
}

// Namespace namespace_4eb3d972f35e69d5/namespace_e551c0aff94f6c9f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x19db
// Size: 0x40
function function_38c09c457c05cec6() {
    if (isdefined(self.outlineid)) {
        if (issharedfuncdefined("outline", "outlineDisable")) {
            [[ getsharedfunc("outline", "outlineDisable") ]](self.outlineid, self);
        }
    }
}

// Namespace namespace_4eb3d972f35e69d5/namespace_e551c0aff94f6c9f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a22
// Size: 0x51
function function_e016066e327d42b6() {
    if (isdefined(self.headiconid)) {
        namespace_7bdde15c3500a23f::setheadicon_deleteicon(self.headiconid);
        self.headiconid = undefined;
    }
    if (isdefined(self.headiconfaction)) {
        namespace_7bdde15c3500a23f::setheadicon_deleteicon(self.headiconfaction);
        self.headiconfaction = undefined;
    }
}

// Namespace namespace_4eb3d972f35e69d5/namespace_e551c0aff94f6c9f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a7a
// Size: 0x8e
function function_1b38460f9db6a610(attacker) {
    if (!isdefined(self.owner) || namespace_f8065cafc523dba5::playersareenemies(self.owner, attacker)) {
        attacker notify("destroyed_equipment");
        if (issharedfuncdefined("player", "doScoreEvent")) {
            attacker thread [[ getsharedfunc("player", "doScoreEvent") ]](#"destroyed_equipment");
        }
        if (issharedfuncdefined("battlechatter", "equipmentDestroyed")) {
            [[ getsharedfunc("battlechatter", "equipmentDestroyed") ]](self);
        }
    }
}

// Namespace namespace_4eb3d972f35e69d5/namespace_e551c0aff94f6c9f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b0f
// Size: 0x14
function function_141dc243d9b500e1(data) {
    function_4ee728f14862d601(0);
}

// Namespace namespace_4eb3d972f35e69d5/namespace_e551c0aff94f6c9f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b2a
// Size: 0xd0
function function_384bb480ddf5851c(data) {
    owner = self.owner;
    if (!isdefined(owner)) {
        return;
    }
    var_19163e14365d9264 = undefined;
    if (issharedfuncdefined("player", "getCurrentSuper")) {
        var_19163e14365d9264 = owner [[ getsharedfunc("player", "getCurrentSuper") ]]();
    }
    if (isdefined(var_19163e14365d9264) && level.allowsupers) {
        var_19163e14365d9264.wasrefunded = 1;
        if (issharedfuncdefined("supers", "getSuperPointsNeeded") && issharedfuncdefined("supers", "setSuperBasePoints")) {
            owner [[ getsharedfunc("supers", "setSuperBasePoints") ]](owner [[ getsharedfunc("supers", "getSuperPointsNeeded") ]]());
        }
    }
    function_4ee728f14862d601(0);
}

// Namespace namespace_4eb3d972f35e69d5/namespace_e551c0aff94f6c9f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c01
// Size: 0xba
function function_d25ff4a17fd8fb37(stuckto) {
    data = spawnstruct();
    data.linkparent = stuckto;
    data.deathoverridecallback = &function_141dc243d9b500e1;
    data.invalidparentoverridecallback = &function_384bb480ddf5851c;
    data.endonstring = "death";
    data.validateaccuratetouching = 1;
    if (isdefined(stuckto) && namespace_9db09f982acd35b4::is_train_ent(stuckto)) {
        data.var_49cb2c45d3230ed8 = 1;
        self function_7e73001e97fe87b9(1);
    }
    if (issharedfuncdefined("game", "handlemovingplatforms")) {
        self thread [[ getsharedfunc("game", "handlemovingplatforms") ]](data);
    }
}

// Namespace namespace_4eb3d972f35e69d5/namespace_e551c0aff94f6c9f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1cc2
// Size: 0x12f
function function_cf6202f14a8176f(player) {
    self endon("death");
    self endon("missile_stuck");
    player endon("disconnect");
    msg = waittill_any_timeout_1(2, "touching_platform");
    if (msg == "timeout") {
        return;
    }
    groundentity = undefined;
    ignoreents = vehicle_getarrayinradius(self.origin, 500, 500);
    ignoreents[ignoreents.size] = self;
    var_fbcabd62b8f66eb8 = namespace_2a184fc4902783dc::create_contents(0, 1, 1, 1, 0, 1, 1, 0, 1);
    tracestart = self.origin;
    var_3a7f0173b03f5767 = -2000;
    traceend = self.origin + (0, 0, var_3a7f0173b03f5767);
    traceresults = namespace_2a184fc4902783dc::ray_trace(tracestart, traceend, ignoreents, var_fbcabd62b8f66eb8);
    if (traceresults["fraction"] < 1) {
        groundentity = traceresults["entity"];
        if (isdefined(groundentity)) {
            if (namespace_9db09f982acd35b4::is_train_ent(groundentity)) {
                self.origin = player.origin;
            }
        }
    }
}

// Namespace namespace_4eb3d972f35e69d5/namespace_e551c0aff94f6c9f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1df8
// Size: 0x6d
function function_cbc5bc96e58659c7() {
    self endon("death");
    if (issharedfuncdefined("hostmigration", "waitLongDurationWithPause")) {
        [[ getsharedfunc("hostmigration", "waitLongDurationWithPause") ]](getdvarfloat(@"hash_2467b36602d82d7f", self.bundle.var_a6cdc017c04a56de));
    }
    if (isdefined(self) && !istrue(self.isdestroyed)) {
        thread function_4ee728f14862d601(0);
    }
}

// Namespace namespace_4eb3d972f35e69d5/namespace_e551c0aff94f6c9f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e6c
// Size: 0x4c
function function_44a7cc547d0a4415() {
    self endon("death");
    self endon("comm_scrambler_hacked");
    self.owner waittill_any_return_no_endon_death_3("disconnect", "joined_team", "joined_spectators");
    if (isdefined(self) && !istrue(self.isdestroyed)) {
        thread function_4ee728f14862d601(0);
    }
}

// Namespace namespace_4eb3d972f35e69d5/namespace_e551c0aff94f6c9f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ebf
// Size: 0x64
function function_2233a8cd9c48a336(data) {
    function_741968e8ad6d8f0a(0);
    if (isdefined(data.attacker)) {
        if (namespace_3c37cb17ade254d::issharedfuncdefined("player", "doScoreEvent")) {
            data.attacker thread [[ namespace_3c37cb17ade254d::getsharedfunc("player", "doScoreEvent") ]]("disabled_comm_scrambler", undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined, 1);
        }
    }
}

// Namespace namespace_4eb3d972f35e69d5/namespace_e551c0aff94f6c9f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f2a
// Size: 0x15
function function_93e55db60b551e17(data) {
    function_741968e8ad6d8f0a(1);
}

// Namespace namespace_4eb3d972f35e69d5/namespace_e551c0aff94f6c9f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f46
// Size: 0x34
function function_89a8296f4d744235(data) {
    attacker = data.attacker;
    function_1b38460f9db6a610(attacker);
    thread function_4ee728f14862d601(1);
}

// Namespace namespace_4eb3d972f35e69d5/namespace_e551c0aff94f6c9f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f81
// Size: 0x67
function function_5bb22bae2eafed7(player) {
    foreach (var_19555c1df203e02c in level.var_4e74070c2484e644) {
        if (isdefined(var_19555c1df203e02c)) {
            var_19555c1df203e02c function_7b2d108a7fefb17(player);
        }
    }
}

// Namespace namespace_4eb3d972f35e69d5/namespace_e551c0aff94f6c9f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1fef
// Size: 0x5e
function function_4957058182ec35a8() {
    foreach (player in level.players) {
        if (!isdefined(player)) {
            return;
        }
        function_7b2d108a7fefb17(player);
    }
}

// Namespace namespace_4eb3d972f35e69d5/namespace_e551c0aff94f6c9f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2054
// Size: 0xdf
function function_7b2d108a7fefb17(player) {
    if (!isdefined(self)) {
        return;
    }
    if (!isdefined(self.owner)) {
        return;
    }
    if (!isdefined(player)) {
        return;
    }
    var_d39dea1586e13c6c = self.headiconfaction;
    if (!isdefined(var_d39dea1586e13c6c)) {
        return;
    }
    isfriendly = undefined;
    if (issharedfuncdefined("player", "isFriendly")) {
        isfriendly = [[ getsharedfunc("player", "isFriendly") ]](self.owner.team, player);
    }
    isused = isdefined(self.playersused) && isdefined(self.playersused[player getentitynumber()]);
    if (isfriendly && !isused) {
        namespace_7bdde15c3500a23f::setheadicon_removeclientfrommask(var_d39dea1586e13c6c, player);
    } else if (isfriendly) {
        namespace_7bdde15c3500a23f::setheadicon_addclienttomask(var_d39dea1586e13c6c, player);
    } else {
        namespace_7bdde15c3500a23f::setheadicon_removeclientfrommask(var_d39dea1586e13c6c, player);
    }
}

// Namespace namespace_4eb3d972f35e69d5/namespace_e551c0aff94f6c9f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x213a
// Size: 0x10e
function commscrambler_onhacked(newowner, var_c0f9139ffd72e62d) {
    function_2eff4cd94c3243e8();
    if (issharedfuncdefined("game", "createObjective")) {
        self.minimapid = self [[ getsharedfunc("game", "createObjective") ]]("jup_hud_icon_minimap_fieldupgrade_commscrambler", self.team, 0, 1, 1);
    }
    foreach (id, player in self.trigger.playersintrigger) {
        player function_95b4fc5672916c93(self, id, var_c0f9139ffd72e62d);
    }
    self.trigger.playersintrigger = [];
    self.trigger.var_854cf4c64f4bdd9f = [];
    self.trigger.var_a81e3fef4236357a = [];
    self notify("comm_scrambler_hacked");
    thread function_44a7cc547d0a4415();
}

