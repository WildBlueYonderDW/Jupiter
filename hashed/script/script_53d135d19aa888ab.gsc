// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_3b64eb40368c1450;
#using script_22f1701e151b9d12;
#using scripts\engine\trace.gsc;
#using script_2304453c69e996e2;
#using scripts\mp\damage.gsc;
#using scripts\mp\utility\player.gsc;
#using script_7e41e37180e554f;
#using script_2047cdbf5176ba0;
#using script_208955cb4d2c8fb3;
#using script_6df6604a74a7a9c7;
#using scripts\mp\utility\debug.gsc;
#using scripts\common\anim.gsc;
#using script_edb8e725d068ac9;
#using script_7005217d66fc0ff2;
#using script_2669878cf5a1b6bc;
#using script_371b4c2ab5861e62;
#using script_42adcce5878f583;
#using script_24fbedba9a7a1ef4;

#namespace namespace_ab40422080f04421;

// Namespace namespace_ab40422080f04421/namespace_4d170f5e4f63c2bd
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0x341
// Size: 0x4c
function autoexec main() {
    namespace_87d75ea764a6d2fd::function_37ae676661b1fbef("AllForOne", "WARLORD_ALLFORONE");
    namespace_87d75ea764a6d2fd::function_56e8f78ce1511d35("AllForOne", &function_82a88d7e4d54f038);
    namespace_87d75ea764a6d2fd::function_dbfada6bda9049b3("AllForOne", &function_325892ecd89575e1);
    namespace_3c37cb17ade254d::registersharedfunc("warlords", "tile_a_warlord_registration", &function_a2a8b2608a9edf57);
}

// Namespace namespace_ab40422080f04421/namespace_4d170f5e4f63c2bd
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x394
// Size: 0x37
function private function_a2a8b2608a9edf57() {
    if (!istrue(namespace_3c37cb17ade254d::function_f3bb4f4911a1beb2("warlords", "warlordIsDisabled", "WARLORD_ALLFORONE"))) {
        namespace_609d2ee77dae3d8c::function_447c6ab4bea16b52("objective", "REV_OB_WARLORD", &namespace_75b9b66caa533c31::function_8abadf3d8f19384a, &namespace_21bf7da565c2f6ec::function_fd69cf02ba4d90a2);
    }
}

// Namespace namespace_ab40422080f04421/namespace_4d170f5e4f63c2bd
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3d2
// Size: 0x351
function function_82a88d7e4d54f038(agent, userdata) {
    var_3ecf047d758de560 = namespace_87d75ea764a6d2fd::function_ce3f50617905370d(agent);
    var_3ecf047d758de560.var_f64d092b9829f981 = [];
    var_3ecf047d758de560.var_f16e24e60b9de7d5 = [];
    var_3ecf047d758de560.var_646f92cd1f221082 = [];
    var_7960ef8469c176de = namespace_87d75ea764a6d2fd::function_b14ea143c425c696(agent);
    var_7960ef8469c176de.var_29e8dc80c773ec6a = 0;
    var_7960ef8469c176de.var_640e7d92eea3d37 = 0;
    var_7960ef8469c176de.var_b5739f387f466219 = 0;
    var_7960ef8469c176de.var_f840f6c26bf8c8b3 = [];
    var_7960ef8469c176de.var_d719e4c5096c522e = [];
    /#
        setdvarifuninitialized(@"hash_1423e3b1f1835994", 350);
        setdvarifuninitialized(@"hash_1e6e7fa974d6933a", 750);
        setdvarifuninitialized(@"hash_69ea888aa7700368", 1500);
        setdvarifuninitialized(@"hash_c62ee53c1f036633", 0);
    #/
    function_22bbd2d65e43a26b(agent);
    function_77d09d16e6dea696(agent);
    var_7960ef8469c176de.var_f840f6c26bf8c8b3 = var_3ecf047d758de560.var_e6013eac45290cab.var_71fe27b31a7295b9 namespace_6c6964e55ab1bec8::function_954eb52ab4cdeb46("grenade_spot", "targetname");
    var_7960ef8469c176de.var_d719e4c5096c522e = var_3ecf047d758de560.var_e6013eac45290cab.var_71fe27b31a7295b9 namespace_6c6964e55ab1bec8::function_954eb52ab4cdeb46("grenade_spawn", "targetname");
    if (getdvarfloat(@"hash_6494d9d3c82ad345", 1)) {
        agent thread function_f8cdf72bdf211373();
    }
    if (agent.armorhealth > 0) {
        agent.var_a4738c70736d3a61 = &warlord_damaged;
    }
    var_c7a28b3147a5fb77 = function_f159c10d5cf8f0b4("auto_afo_closet", "targetname");
    if (isdefined(var_c7a28b3147a5fb77)) {
        foreach (var_de05f6641f8085de in var_c7a28b3147a5fb77) {
            agent thread function_f6b236a9e4b842ea(var_de05f6641f8085de);
        }
    }
    var_c7a28b3147a5fb77 = function_f159c10d5cf8f0b4("warlord_allforone_encounter", "targetname");
    if (isarray(var_c7a28b3147a5fb77) && var_c7a28b3147a5fb77.size > 0) {
        foreach (var_6eb75fcdfcedae08 in var_c7a28b3147a5fb77) {
            if (var_6eb75fcdfcedae08.script_noteworthy == "auto_afo_closet_entrance") {
                agent thread function_f6b236a9e4b842ea(var_6eb75fcdfcedae08);
            }
        }
    }
    agent.dontmelee = 1;
    agent.var_7cea08b66b2ad878 = 0;
    agent.var_c6ec05f768303aaf = 0;
    agent.var_56556ae2f14239f6 = 0;
    agent.var_942e0b541df033d5 = 0;
    agent.var_3e90c8305bbecde3 = 1;
    agent.badplaceawareness = 0;
    agent.guid = agent getuniqueid();
    specialweapon = namespace_e0ee43ef2dddadaa::buildweapon_blueprint("jup_jp09_sh_oromeo12", undefined, undefined, 7, undefined, undefined);
    weapon = specialweapon;
    agent namespace_14d36171baccf528::function_c37c4f9d687074ff(undefined, undefined, weapon, undefined, undefined, undefined, undefined, 1);
    agent.var_4c72897b1b21ab7f = 1;
}

// Namespace namespace_ab40422080f04421/namespace_4d170f5e4f63c2bd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x72a
// Size: 0x189
function function_f8cdf72bdf211373() {
    level endon("game_ended");
    self endon("death");
    while (1) {
        if (isdefined(self.enemy)) {
            if (self.grenadeammo == 0) {
                self.grenadeammo++;
            }
            var_5e278ffbef0cd8e4 = getdvarint(@"hash_3517ae04300073fe", 10);
            wait(var_5e278ffbef0cd8e4);
            players = function_2b2c04ddfc825d3(self.ob.var_7960ef8469c176de.var_f840f6c26bf8c8b3);
            players = array_randomize(players);
            for (i = 0; i < players.size; i++) {
                var_106a5458182a46f7 = function_4d046f33253e46e0(players[i].origin, self.ob.var_7960ef8469c176de.var_f840f6c26bf8c8b3, 262144);
                var_2936aa44ec8bed9 = function_4d046f33253e46e0(var_106a5458182a46f7.origin, self.ob.var_7960ef8469c176de.var_d719e4c5096c522e, 262144);
                self.var_43ae9f4734246fb0 = 1;
                wait(3.5);
                grenade = self magicgrenade(var_2936aa44ec8bed9.origin, var_106a5458182a46f7.origin, 2.4, 1);
                if (!isdefined(grenade)) {
                    continue;
                }
                wait(0.5);
                self.var_43ae9f4734246fb0 = 0;
                break;
            }
        }
        wait(0.1);
    }
}

// Namespace namespace_ab40422080f04421/namespace_4d170f5e4f63c2bd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8ba
// Size: 0xbe
function function_2b2c04ddfc825d3(points) {
    /#
        assert(isdefined(points) && isarray(points));
    #/
    var_4e370d802b13596c = 240;
    var_c6d2d8bec48ba085 = [];
    foreach (point in points) {
        players = getplayersinradius(point.origin, point.radius, var_4e370d802b13596c, 1);
        if (!isdefined(players)) {
            continue;
        }
        var_c6d2d8bec48ba085 = array_combine_unique(var_c6d2d8bec48ba085, players);
    }
    return var_c6d2d8bec48ba085;
}

// Namespace namespace_ab40422080f04421/namespace_4d170f5e4f63c2bd
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x980
// Size: 0xc4
function function_325892ecd89575e1(agent, userdata) {
    agent.ob.var_7960ef8469c176de = spawnstruct();
    agent.ob.var_a2293a1278075bfe = "AllForOne";
    function_22bbd2d65e43a26b(agent);
    warlord = namespace_87d75ea764a6d2fd::function_7f4ff5bee712266d(agent);
    if (isdefined(warlord) && isdefined(agent.var_d7f4a1b60f84e53f)) {
        if (issubstr(agent.var_d7f4a1b60f84e53f, "2f_dormitory")) {
            warlord.var_56556ae2f14239f6++;
            warlord.var_942e0b541df033d5++;
            agent thread function_fb8ebd4c04df224e(warlord);
        }
        agent function_85e7c2baf116abf8(warlord);
        agent function_741a41cd8e7cacd0(200);
    }
}

// Namespace namespace_ab40422080f04421/namespace_4d170f5e4f63c2bd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa4b
// Size: 0x19
function function_22bbd2d65e43a26b(agent) {
    agent.var_685390c6753c2cc7 = 0;
}

// Namespace namespace_ab40422080f04421/namespace_4d170f5e4f63c2bd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa6b
// Size: 0xb0
function function_77d09d16e6dea696(warlord) {
    var_a2c67007523099d6 = function_f159c10d5cf8f0b4("warlord_allforone_encounter", "targetname");
    if (isarray(var_a2c67007523099d6) && var_a2c67007523099d6.size > 0) {
        foreach (var_c50f59673b4204a1 in var_a2c67007523099d6) {
            if (var_c50f59673b4204a1.script_noteworthy == "auto_afo_barkVO_balcony") {
                warlord thread function_e7f383d618470607(var_a2c67007523099d6[0]);
                break;
            }
        }
    } else {
        /#
            assertmsg("Failed to find valid All For One Bark VO trigger");
        #/
    }
}

// Namespace namespace_ab40422080f04421/namespace_4d170f5e4f63c2bd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb22
// Size: 0x6e
function function_e7f383d618470607(var_c50f59673b4204a1) {
    level endon("game_ended");
    self endon("death");
    while (1) {
        ent = var_c50f59673b4204a1 waittill("trigger");
        if (isplayer(ent)) {
            if (!istrue(self.var_5e279f07bbad64ae)) {
                self.var_5e279f07bbad64ae = 1;
                namespace_dc53a27a8db8e6bf::function_42f4a9aee5b6c6d3();
                thread function_c06825d6f9a3aac7();
                break;
            }
        }
        wait(0.1);
    }
}

// Namespace namespace_ab40422080f04421/namespace_4d170f5e4f63c2bd
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xb97
// Size: 0x4e
function private function_f6b236a9e4b842ea(var_de05f6641f8085de) {
    level endon("game_ended");
    self endon("death");
    while (1) {
        ent = var_de05f6641f8085de waittill("trigger");
        if (isplayer(ent)) {
            function_19be9e67c6b8fcaf();
            break;
        }
        wait(0.1);
    }
}

// Namespace namespace_ab40422080f04421/namespace_4d170f5e4f63c2bd
// Params 14, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbec
// Size: 0xf3
function warlord_damaged(inflictor, attacker, damage, dflags, meansofdeath, objweapon, point, dir, hitloc, timeoffset, modelindex, var_799f234362adb813, partname, eventid) {
    damage = namespace_ad1f398af6f48cb1::function_395c3a00db83ba6(damage, meansofdeath, objweapon);
    namespace_daa149ca485fd50a::function_dffac413ed66bcd0(inflictor, attacker, damage, dflags, meansofdeath, objweapon, point, dir, hitloc, timeoffset, modelindex, var_799f234362adb813, partname);
    if (self.armorhealth <= 600 && isdefined(self.ob) && !istrue(self.ob.var_698ab4f1074b4f37)) {
        function_19be9e67c6b8fcaf(1);
        self.ob.var_698ab4f1074b4f37 = 1;
    }
}

// Namespace namespace_ab40422080f04421/namespace_4d170f5e4f63c2bd
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xce6
// Size: 0x78
function private function_c06825d6f9a3aac7() {
    self endon("death");
    level endon("game_ended");
    warlord = namespace_87d75ea764a6d2fd::function_7f4ff5bee712266d(self);
    while (isdefined(warlord)) {
        if (istrue(warlord.var_56556ae2f14239f6) && warlord.var_56556ae2f14239f6 > 0 && istrue(warlord.var_942e0b541df033d5) && warlord.var_942e0b541df033d5 <= 1) {
            function_19be9e67c6b8fcaf();
            break;
        }
        waitframe();
    }
}

// Namespace namespace_ab40422080f04421/namespace_4d170f5e4f63c2bd
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xd65
// Size: 0x42
function private function_fb8ebd4c04df224e(warlord) {
    level endon("game_ended");
    if (!isdefined(warlord)) {
        return;
    }
    self waittill("death");
    if (isdefined(warlord) && isdefined(warlord.var_942e0b541df033d5)) {
        warlord.var_942e0b541df033d5--;
    }
}

// Namespace namespace_ab40422080f04421/namespace_4d170f5e4f63c2bd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdae
// Size: 0x7e
function function_19be9e67c6b8fcaf(var_1f55566be45b01f4) {
    warlord = namespace_87d75ea764a6d2fd::function_7f4ff5bee712266d(self);
    if (!isdefined(warlord) || warlord.var_c6ec05f768303aaf) {
        return;
    }
    encounterid = namespace_614554f86e52695c::function_54da428ad4a96f2e("ai_encounter:enc_ob_activity_warlord_allforone_closet", warlord.origin, 1024, 1, 1, 0);
    if (isdefined(encounterid)) {
        warlord.var_c6ec05f768303aaf = 1;
        if (istrue(var_1f55566be45b01f4)) {
            warlord thread function_ae665ae169e5a53a();
        }
    }
}

// Namespace namespace_ab40422080f04421/namespace_4d170f5e4f63c2bd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe33
// Size: 0x43
function function_ae665ae169e5a53a() {
    level endon("game_ended");
    self endon("death");
    self.var_43ae9f4734246fb0 = 1;
    var_c25ffec52f8668aa = getdvarint(@"hash_e3fb3f771a0cb64", 7);
    wait(var_c25ffec52f8668aa);
    self.var_43ae9f4734246fb0 = 0;
}

// Namespace namespace_ab40422080f04421/namespace_4d170f5e4f63c2bd
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe7d
// Size: 0x33
function function_1f13aaf6c3fa00e3() {
    level endon("game_ended");
    self endon("death");
    utility::waittill_any_4("stealth_investigate", "stealth_hunt", "stealth_combat", "startCombatRush");
    function_a9f5229ecf5cca14();
}

// Namespace namespace_ab40422080f04421/namespace_4d170f5e4f63c2bd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xeb7
// Size: 0xbb
function function_a9f5229ecf5cca14() {
    var_7fbda6e97e426016 = 0;
    foreach (var_e6013eac45290cab in level.ob.var_7dd4780d4e4bff4d) {
        if (var_e6013eac45290cab.var_deb7b68f91016a2e.size > 0 && issubstr(var_e6013eac45290cab.var_626b45032e1892da, "ALLFORONE")) {
            self setgoalvolumeauto(var_e6013eac45290cab.var_deb7b68f91016a2e[0]);
            var_7fbda6e97e426016 = 1;
            break;
        }
    }
    /#
        assertex(istrue(var_7fbda6e97e426016), "ERROR - Could not find a valid goal volume for All For One within the activity instance data!");
    #/
}

