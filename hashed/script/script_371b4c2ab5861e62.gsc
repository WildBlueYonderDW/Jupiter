// mwiii decomp prototype
#using script_3b64eb40368c1450;
#using scripts\engine\utility.gsc;
#using script_4c770a9a4ad7659c;
#using scripts\common\utility.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using script_2669878cf5a1b6bc;
#using script_24fbedba9a7a1ef4;
#using script_7c40fa80892a721;
#using script_371b4c2ab5861e62;
#using scripts\engine\trace.gsc;
#using scripts\asm\asm_bb.gsc;
#using scripts\cp_mp\utility\debug_utility.gsc;
#using scripts\common\ai.gsc;

#namespace namespace_fb05e1623b934e8;

// Namespace namespace_fb05e1623b934e8/namespace_14d36171baccf528
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xac7
// Size: 0x177
function function_dc01679146e5f53c(agent) {
    if (!isdefined(agent)) {
        return;
    }
    if (isint(agent)) {
        return;
    }
    agent.var_685390c6753c2cc7 = 1;
    body = undefined;
    head = undefined;
    weapon = undefined;
    var_a664aad02ee98bd2 = undefined;
    grenadeammo = 0;
    var_7615a935cb1261ef = getdvarint(@"hash_261e9ce11934ffae", 50);
    if (randomintrange(0, 100) < var_7615a935cb1261ef) {
        if (isdefined(level.var_39643776a698efce)) {
            var_a664aad02ee98bd2 = agent [[ level.var_39643776a698efce ]](1);
        } else {
            var_7e1ff9afa225e8a1 = [0:"semtex_mp", 1:"frag_grenade_mp", 2:"gas_mp"];
            var_a664aad02ee98bd2 = random(var_7e1ff9afa225e8a1);
        }
        grenadeammo = getdvarint(@"hash_31607c7b3be624df", 1);
    }
    armor = getdvarint(@"hash_82ad0eab483e9f5a", 0);
    if (agent.var_7cea08b66b2ad878 < 0) {
        agent.var_7cea08b66b2ad878 = 0;
    }
    helmet = undefined;
    agent function_c37c4f9d687074ff(body, head, weapon, var_a664aad02ee98bd2, grenadeammo, armor);
    agentpers_setagentpersdata(agent, "tier", 1);
    agent.baseaccuracy = getdvarfloat(@"hash_8aa5333ca3f377e5", 0.66);
}

// Namespace namespace_fb05e1623b934e8/namespace_14d36171baccf528
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xc45
// Size: 0x12d
function function_198f5137d137e72f(agent, var_80f4bde7090a4773) {
    prefix = "agent_";
    postfix = "";
    if (issubstr(agent.agent_type, "jugg")) {
        postfix = "jugg";
    } else if (issubstr(agent.agent_type, "tier1")) {
        postfix = "tier1";
    } else if (issubstr(agent.agent_type, "tier2")) {
        postfix = "tier2";
    } else if (issubstr(agent.agent_type, "tier3")) {
        postfix = "tier3";
    }
    if (issubstr(agent.agent_type, "riotshield")) {
        postfix = "riotshield";
    }
    if (isdefined(var_80f4bde7090a4773) && tolower(var_80f4bde7090a4773) == "elite") {
        postfix = "elite";
    }
    var_aa795f8c795aa60e = prefix + postfix;
    if (postfix == "") {
        return;
    }
    if (!threatbiasgroupexists(var_aa795f8c795aa60e)) {
        createthreatbiasgroup(var_aa795f8c795aa60e);
        function_ad06babcffc3a43b(var_aa795f8c795aa60e);
    }
    agent setthreatbiasgroup(var_aa795f8c795aa60e);
}

// Namespace namespace_fb05e1623b934e8/namespace_14d36171baccf528
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd79
// Size: 0x37
function function_ad06babcffc3a43b(var_aa795f8c795aa60e) {
    setthreatbias(var_aa795f8c795aa60e, "Drone", getdvarint(@"hash_4620216a9470ae72", -5000));
    if (issubstr(var_aa795f8c795aa60e, "tier1")) {
    }
}

// Namespace namespace_fb05e1623b934e8/namespace_14d36171baccf528
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdb7
// Size: 0x17d
function function_dc016a9146e5fbd5(agent) {
    if (!isdefined(agent)) {
        return;
    }
    if (isint(agent)) {
        return;
    }
    agent.var_685390c6753c2cc7 = 1;
    body = undefined;
    head = undefined;
    weapon = undefined;
    if (isdefined(level.var_39643776a698efce)) {
        var_a664aad02ee98bd2 = agent [[ level.var_39643776a698efce ]](2);
    } else {
        var_7e1ff9afa225e8a1 = [0:"semtex_mp", 1:"frag_grenade_mp", 2:"smoke_grenade_mp", 3:"concussion_grenade_mp", 4:"flash_grenade_mp", 5:"gas_mp", 6:"decoy_grenade_mp"];
        var_a664aad02ee98bd2 = random(var_7e1ff9afa225e8a1);
    }
    grenadeammo = getdvarint(@"hash_31607d7b3be62712", 2);
    armor = getdvarint(@"hash_82ad0dab483e9d27", 100);
    if (agent.var_7cea08b66b2ad878 < 0) {
        agent.var_7cea08b66b2ad878 = 1;
    }
    helmet = level.var_6855c201495094b6["tier2"];
    agent function_c37c4f9d687074ff(body, head, weapon, var_a664aad02ee98bd2, grenadeammo, armor, helmet);
    agentpers_setagentpersdata(agent, "tier", 2);
    agent.baseaccuracy = getdvarfloat(@"hash_8aa5303ca3f3714c", 0.9);
}

// Namespace namespace_fb05e1623b934e8/namespace_14d36171baccf528
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf3b
// Size: 0x1be
function function_dc01699146e5f9a2(agent, var_6c149286380290a2) {
    if (!isdefined(agent)) {
        return;
    }
    if (isint(agent)) {
        return;
    }
    agent.var_282d867559c07771 = 1;
    body = undefined;
    head = undefined;
    weapon = undefined;
    if (isdefined(level.var_39643776a698efce)) {
        var_a664aad02ee98bd2 = agent [[ level.var_39643776a698efce ]](3);
    } else {
        var_7e1ff9afa225e8a1 = [0:"thermite_mp", 1:"semtex_mp", 2:"frag_grenade_mp", 3:"smoke_grenade_mp", 4:"concussion_grenade_mp", 5:"flash_grenade_mp", 6:"snapshot_grenade_mp", 7:"gas_mp", 8:"decoy_grenade_mp"];
        var_a664aad02ee98bd2 = random(var_7e1ff9afa225e8a1);
    }
    grenadeammo = getdvarint(@"hash_31607e7b3be62945", 4);
    armor = getdvarint(@"hash_82ad0cab483e9af4", 250);
    if (iscp()) {
        agent.var_7cea08b66b2ad878 = 0;
    } else if (agent.var_7cea08b66b2ad878 < 0) {
        agent.var_7cea08b66b2ad878 = 2;
    }
    helmet = level.var_6855c201495094b6["tier3"];
    agent function_c37c4f9d687074ff(body, head, weapon, var_a664aad02ee98bd2, grenadeammo, armor, helmet);
    agentpers_setagentpersdata(agent, "tier", 3);
    agent.baseaccuracy = getdvarfloat(@"hash_8aa5313ca3f3737f", 1.3);
    agent.var_cbd87a0bc497b778 = 1;
}

// Namespace namespace_fb05e1623b934e8/namespace_14d36171baccf528
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1100
// Size: 0x37f
function function_1828f1e20e52b418(agent, var_84ecaeab58167d39) {
    if (!isdefined(agent)) {
        return;
    }
    function_ea83c1b372e16f6d(agent, "elite");
    if (isint(agent)) {
        return;
    }
    if (issubstr(agent.agent_type, "merc")) {
        return;
    }
    if (issubstr(agent.agent_type, "ru")) {
        return;
    }
    if (issubstr(agent.agent_type, "cartel")) {
        return;
    }
    if (issubstr(agent.agent_type, "pmc")) {
        return;
    }
    agent.var_685390c6753c2cc7 = 1;
    if (!isdefined(var_84ecaeab58167d39)) {
        if (isdefined(agent.subarea) && isdefined(agent.subarea.var_7da9883d4168b7f1)) {
            var_84ecaeab58167d39 = agent.subarea.var_7da9883d4168b7f1.var_84ecaeab58167d39;
        }
        if (!isdefined(var_84ecaeab58167d39)) {
            return;
        }
    }
    var_57accdc40b2f50e = function_5ca105062ad7729(agent.agent_type, var_84ecaeab58167d39);
    var_400ef51562606e7a = var_57accdc40b2f50e[3];
    clothtype = var_57accdc40b2f50e[2];
    head = var_57accdc40b2f50e[1];
    body = var_57accdc40b2f50e[0];
    armor = undefined;
    switch (var_84ecaeab58167d39) {
    case 3:
        armor = getdvarint(@"hash_82ad0cab483e9af4", 250) + getdvarint(@"hash_be76a857caf140ec", 100);
        break;
    case 2:
        armor = getdvarint(@"hash_82ad0dab483e9d27", 100) + getdvarint(@"hash_be76a857caf140ec", 100);
        break;
    default:
        break;
    }
    agent function_c37c4f9d687074ff(body, head, undefined, undefined, undefined, armor, undefined);
    if (isdefined(clothtype)) {
        agent setclothtype(clothtype);
    }
    if (isdefined(var_400ef51562606e7a)) {
        agent setclothtype(var_400ef51562606e7a);
    }
    var_40e4760e91ebbfb8 = [0:"thermite_mp", 1:"semtex_mp", 2:"smoke_grenade_mp", 3:"concussion_grenade_mp", 4:"flash_grenade_mp", 5:"gas_mp"];
    var_a664aad02ee98bd2 = function_ba0801276542946b(var_40e4760e91ebbfb8);
    grenadeammo = getdvarint(@"hash_537fa443ce212a8a", 3);
    agent.baseaccuracy = agent.baseaccuracy * getdvarfloat(@"hash_54eaf02373da456d", 2);
    agent function_20381a5ca18027ff(int(agent.health * getdvarfloat(@"hash_14fc69230fc4ed30", 1.33)));
    string = "MP_DMZ_MISSIONS/ELITE_GENERIC";
    agentpers_setagentpersdata(agent, "elite", 1);
    rarity = undefined;
    switch (var_84ecaeab58167d39) {
    case 1:
        rarity = 2;
        string = "MP_DMZ_MISSIONS/ELITE_TIER1";
        break;
    case 2:
        rarity = 2;
        string = "MP_DMZ_MISSIONS/ELITE_TIER2";
        break;
    case 3:
        rarity = 3;
        string = "MP_DMZ_MISSIONS/ELITE_TIER3";
        break;
    }
    if (getdvarint(@"hash_49b37fc622a4d585", 0) == 1) {
        agent function_3de79443c911d4a5(1, 3, string);
    }
}

// Namespace namespace_fb05e1623b934e8/namespace_14d36171baccf528
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1486
// Size: 0x115
function function_5ca105062ad7729(agenttype, var_84ecaeab58167d39) {
    switch (var_84ecaeab58167d39) {
    case 1:
        headmodel = random([0:"head_sp_opforce_grunt_var_01_civ_nohair", 1:"head_sp_opforce_grunt_var_01_civ_nohair", 2:"head_sp_opforce_grunt_var_01_civ_nohair", 3:"head_sp_opforce_grunt_var_01_civ_nohair", 4:"head_sp_opforce_al_qatala_ar_2_1"]);
        clothtype = "flowing";
        var_400ef51562606e7a = "strapsgr";
        return [0:"body_sp_opforce_al_qatala_tier_1_hardened_1_1", 1:headmodel, 2:clothtype, 3:var_400ef51562606e7a];
    case 2:
        clothtype = "vestlight";
        var_400ef51562606e7a = "millghtgr";
        return [0:"body_sp_opforce_al_qatala_tier_2_hardened_1_1", 1:undefined, 2:clothtype, 3:var_400ef51562606e7a];
    case 3:
        clothtype = "vestheavy";
        var_400ef51562606e7a = "milmedgr";
        return [0:"body_sp_opforce_al_qatala_tier_3_hardened_1_1", 1:undefined, 2:clothtype, 3:var_400ef51562606e7a];
        break;
    }
    return [0:undefined, 1:undefined];
}

// Namespace namespace_fb05e1623b934e8/namespace_14d36171baccf528
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15a3
// Size: 0x22e
function function_e43f4000cac35ba2(agent, weapon) {
    if (!isdefined(agent)) {
        return;
    }
    agent.var_7d606bec79308eb5 = 1200;
    agent.var_85a0f6383a5dd784 = 512;
    agent.goalheight = 1000;
    agent.var_685390c6753c2cc7 = 0;
    if (utility::iscp()) {
        if (isdefined(level.var_96d46b3de782e4e7)) {
            agent.var_7d606bec79308eb5 = level.var_96d46b3de782e4e7;
        } else {
            agent.var_7d606bec79308eb5 = 512;
        }
        if (isdefined(level.var_47247decd7164a0e)) {
            agent.var_85a0f6383a5dd784 = level.var_47247decd7164a0e;
        } else {
            agent.var_85a0f6383a5dd784 = 350;
        }
    } else if (namespace_36f464722d326bbe::function_6c1fce6f6b8779d5() == "dmz") {
        agentpers_setagentpersdata(agent, "dropWeapon", 0);
    }
    if (getdvarint(@"hash_60645ea7f5bb11f6", 1) == 1) {
        agent.var_2d670e4d288c86fb = 1;
    } else {
        agent.var_2d670e4d288c86fb = 0;
    }
    body = undefined;
    head = undefined;
    var_a664aad02ee98bd2 = function_ba0801276542946b();
    grenadeammo = getdvarint(@"hash_537fa443ce212a8a", 4);
    if (isdefined(level.var_5463147f04a33d36)) {
        armor = level.var_5463147f04a33d36;
    }
    armor = 2500;
    helmethealth = getdvarint(@"hash_4cea285ee071705e", 2500);
    agent.var_895dae193cfaac3a = 1;
    agent function_c37c4f9d687074ff(body, head, weapon, var_a664aad02ee98bd2, grenadeammo, armor, helmethealth, 0);
    agent.var_98add129a7ecb962 = 0;
    agent.allowpain = 1;
    if (isdefined(level.var_87deb8f6a4c7d50e)) {
        agent.var_2626d6897d71b728 = level.var_87deb8f6a4c7d50e;
    }
    agent.var_f2a62f02827daaa5 = 1;
    agent.baseaccuracy = getdvarfloat(@"hash_bf81930e3ff6d7eb", 1.2);
}

// Namespace namespace_fb05e1623b934e8/namespace_14d36171baccf528
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17d8
// Size: 0xa8
function function_c6ebe7215624d5a2(agent) {
    if (!isdefined(agent)) {
        return;
    }
    agent.var_2d670e4d288c86fb = 1;
    if (isdefined(agent.armorhealth) && agent.armorhealth > 0) {
        agent.minpaindamage = int(agent.armorhealth / 2);
    }
    agent enabletraversals(0);
    if (isdefined(level.var_719b61ca626125ff)) {
        agent.var_2626d6897d71b728 = level.var_719b61ca626125ff;
    }
    agent.baseaccuracy = getdvarfloat(@"hash_48f1ebb27eaa1abb", 0.8);
}

// Namespace namespace_fb05e1623b934e8/namespace_14d36171baccf528
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1887
// Size: 0x124
function function_77ffe273ea3ec3a3(agent, var_6c149286380290a2) {
    if (!isdefined(agent)) {
        return;
    }
    body = "body_mp_eastern_velikan_1_1";
    head = "head_mp_eastern_velikan_1_1";
    weapon = undefined;
    if (!istrue(var_6c149286380290a2)) {
        weapon = namespace_e0ee43ef2dddadaa::buildweapon("iw9_lm_mkilo3_mp", [0:"none", 1:"none", 2:"none", 3:"none", 4:"none", 5:"none"], "none", "none");
    }
    var_a664aad02ee98bd2 = function_ba0801276542946b();
    grenadeammo = getdvarint(@"hash_537fa443ce212a8a", 4);
    armor = 3000;
    helmet = 1;
    agent function_c37c4f9d687074ff(body, head, weapon, var_a664aad02ee98bd2, grenadeammo, armor, helmet, 0);
    agent.var_f2a62f02827daaa5 = 1;
    agent.baseaccuracy = getdvarfloat(@"hash_298d4ea8b0934e31", 1.2);
}

// Namespace namespace_fb05e1623b934e8/namespace_14d36171baccf528
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x19b2
// Size: 0xe4
function function_852d353c00b3d5a1(agent, var_6c149286380290a2) {
    if (!isdefined(agent)) {
        return;
    }
    if (isint(agent)) {
        return;
    }
    body = "body_mp_eastern_rodion_7_1";
    head = "head_mp_eastern_rodion_7_1";
    weapon = undefined;
    var_a664aad02ee98bd2 = "smoke_grenade_mp";
    grenadeammo = getdvarint(@"hash_96aa0c082c47cdcc", 4);
    armor = 500;
    helmet = level.var_6855c201495094b6["tier3"];
    agent function_c37c4f9d687074ff(undefined, undefined, weapon, var_a664aad02ee98bd2, grenadeammo, armor, helmet);
    agentpers_setagentpersdata(agent, "tier", 3);
    agent.baseaccuracy = getdvarfloat(@"hash_8aa5313ca3f3737f", 1.1);
}

// Namespace namespace_fb05e1623b934e8/namespace_14d36171baccf528
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a9d
// Size: 0x2ea
function function_2c222aa74d0401f4(agent, var_cdf5b236e13a9cae) {
    body = "body_mp_milsim_balkan_sf_1_1";
    head = "head_mp_milsim_balkan_sf_1_1";
    weapon = namespace_e0ee43ef2dddadaa::buildweapon("iw9_sm_aviktor_mp", [0:"thermal01", 1:"none", 2:"none", 3:"none", 4:"silencer01_sm", 5:"laserirsmg"], "none", "none");
    var_a664aad02ee98bd2 = "frag_grenade_mp";
    if (!isdefined(var_cdf5b236e13a9cae)) {
        var_cdf5b236e13a9cae = random([0:"smg", 1:"shotgun", 2:"sniper"]);
    }
    switch (var_cdf5b236e13a9cae) {
    case #"hash_23209741b93850b5":
        body = "body_mp_eastern_nikto_2_1";
        head = "head_mp_eastern_nikto_3_1";
        weapon = namespace_e0ee43ef2dddadaa::buildweapon("iw9_sh_charlie725_mp", [0:"none", 1:"none", 2:"none", 3:"none", 4:"none", 5:"none"], "none", "none");
        var_a664aad02ee98bd2 = "molotov_mp";
        break;
    case #"hash_6191aaef9f922f96":
        body = "body_mp_eastern_azur_8_1";
        head = "head_mp_eastern_azur_8_1";
        weapon = namespace_e0ee43ef2dddadaa::buildweapon("iw8_sn_alpha50_mp", [0:"none", 1:"none", 2:"none", 3:"laserir", 4:"none", 5:"none"], "none", "none");
        var_a664aad02ee98bd2 = "frag_grenade_mp";
        break;
    case #"hash_900cb96c552c5e8e":
        body = "body_mp_eastern_rodion_7_1";
        head = "head_mp_eastern_rodion_7_1";
        weapon = namespace_e0ee43ef2dddadaa::buildweapon("iw9_sm_aviktor", [0:"thermal01", 1:"none", 2:"none", 3:"none", 4:"silencer01_sm", 5:"laserir_box"], "none", "none");
        var_a664aad02ee98bd2 = "smoke_grenade_mp";
        break;
    default:
        break;
    }
    agentpers_setagentpersdata(agent, "dropWeapon", 0);
    grenadeammo = getdvarint(@"hash_537fa443ce212a8a", 4);
    armor = 300;
    helmet = 1;
    groupname = undefined;
    if (isdefined(agent.script_stealthgroup)) {
        groupname = agent.script_stealthgroup;
    }
    agent function_c37c4f9d687074ff(body, head, weapon, var_a664aad02ee98bd2, grenadeammo, armor, helmet);
    if (namespace_3c37cb17ade254d::issharedfuncdefined("ai", "dropLootOnAgentDeath")) {
        agent thread [[ namespace_3c37cb17ade254d::getsharedfunc("ai", "dropLootOnAgentDeath") ]](agent, agent.agent_type, groupname);
    }
}

// Namespace namespace_fb05e1623b934e8/namespace_14d36171baccf528
// Params 8, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d8e
// Size: 0x2ee
function function_c37c4f9d687074ff(body, head, weapon, var_a664aad02ee98bd2, grenadeammo, armor, helmet, var_e7df46025ec50eac) {
    if (isdefined(body)) {
        self setmodel(body);
    }
    if (isdefined(head)) {
        if (isdefined(self.headmodel)) {
            self detach(self.headmodel);
        }
        self attach(head, "", 1);
        self.headmodel = head;
    }
    if (isdefined(weapon)) {
        var_b003e2c45a4bf6f7 = undefined;
        weaponname = undefined;
        if (isdefined(self.weapon)) {
            self takeweapon(self.weapon);
            weaponname = getcompleteweaponname(self.weapon);
            if (isdefined(self.weaponinfo[weaponname])) {
                var_b003e2c45a4bf6f7 = self.weaponinfo[weaponname].position;
                self.weaponinfo = array_remove_key(self.weaponinfo, weaponname);
            }
        }
        self.weapon = weapon;
        utility::initweapon(self.weapon);
        agentpers_setagentpersdata(self, "weapon", weapon);
        self giveweapon(self.weapon);
        self setspawnweapon(self.weapon);
        self.bulletsinclip = weaponclipsize(self.weapon);
        self.primaryweapon = self.weapon;
        if (isdefined(self.a.weaponpos[var_b003e2c45a4bf6f7])) {
            weaponname = getcompleteweaponname(self.weapon);
            self.weaponinfo[weaponname].position = var_b003e2c45a4bf6f7;
            self.a.weaponpos[var_b003e2c45a4bf6f7] = weapon;
        }
    }
    if (isdefined(var_a664aad02ee98bd2)) {
        if (!isdefined(level.var_e36af3bfa3484a15)) {
            level.var_e36af3bfa3484a15 = [];
        }
        if (!isdefined(level.var_e36af3bfa3484a15[var_a664aad02ee98bd2])) {
            level.var_e36af3bfa3484a15[var_a664aad02ee98bd2] = makeweapon(var_a664aad02ee98bd2);
        }
        self.grenadeweapon = level.var_e36af3bfa3484a15[var_a664aad02ee98bd2];
        if (!isdefined(grenadeammo)) {
            grenadeammo = 2;
        }
        self.grenadeammo = grenadeammo;
    }
    if (isdefined(armor)) {
        if (utility::iscp()) {
            if (armor > 0) {
                self.equip_armor = 1;
                self.var_b5218cf00dad94ef = armor;
            }
        }
        self.armorhealth = int(armor);
        self.var_8790c077c95db752 = int(armor);
        self.var_8c5c47f81a1869e5 = &namespace_daa149ca485fd50a::function_7d0d24665d72f13c;
    }
    if (isdefined(helmet)) {
        self.helmethealth = helmet;
        self.var_cfc69e5588a5bed6 = helmet;
        self.var_cd6a3a50f09688b9 = &namespace_daa149ca485fd50a::function_59ea6b2f800cb082;
    }
    if (istrue(var_e7df46025ec50eac)) {
        function_1c3709e864d4e8d5(1);
    }
    if (isdefined(armor) && armor > 0) {
        function_1920867ddf76810c(self, armor);
    }
}

// Namespace namespace_fb05e1623b934e8/namespace_14d36171baccf528
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2083
// Size: 0x8a
function function_b535fe740f1cf507() {
    if (isdefined(self.armorhealth)) {
        var_4ef15edd83080359 = self.var_dcade5065ea1a44;
        if (!isdefined(var_4ef15edd83080359)) {
            var_4ef15edd83080359 = getdvarint(@"hash_a69c6853620fc61f", 200);
        }
        newhealth = min(self.armorhealth + var_4ef15edd83080359, self.var_8790c077c95db752);
        namespace_f8d3520d3483c1::setarmorhealth(newhealth);
        self.var_7cea08b66b2ad878 = self.var_7cea08b66b2ad878 - 1;
        self.var_27266ececc1bdbe5 = gettime();
    }
}

// Namespace namespace_fb05e1623b934e8/namespace_14d36171baccf528
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2114
// Size: 0x46
function function_1c3709e864d4e8d5(bool) {
    if (bool) {
        self.var_e7df46025ec50eac = 1;
        val::set("agent_blockExecution", "execution_victim", 0);
    } else {
        self.var_e7df46025ec50eac = 0;
        val::function_c9d0b43701bdba00("agent_blockExecution");
    }
}

// Namespace namespace_fb05e1623b934e8/namespace_14d36171baccf528
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2161
// Size: 0x166
function function_1920867ddf76810c(agent, armor) {
    if (issubstr(agent.agent_type, "riotshield")) {
        agent.var_9aa77ab756fdca82 = 0;
        agent.minpaindamage = 0;
    } else if (issubstr(agent.agent_type, "tier3")) {
        agent.var_9aa77ab756fdca82 = 600;
        agent.var_43e2ad424676b8d4 = 1;
        agent.var_98add129a7ecb962 = 0;
    } else if (isdefined(armor) && armor > 0) {
        var_17b4196235199ba8 = [0:0, 1:40, 2:80];
        var_bbd534a2a8d03eaa = random(var_17b4196235199ba8);
        agent.var_9aa77ab756fdca82 = 240 + var_bbd534a2a8d03eaa;
        agent.var_43e2ad424676b8d4 = 50;
        agent.var_98add129a7ecb962 = 0;
    } else if (agent.var_d5e499e7fe2c490b) {
        agent.var_43e2ad424676b8d4 = 10;
        function_c00e1d676844f7ae(agent);
    } else {
        var_17b4196235199ba8 = [0:0, 1:50, 2:80];
        var_bbd534a2a8d03eaa = random(var_17b4196235199ba8);
        agent.var_9aa77ab756fdca82 = 100 + var_bbd534a2a8d03eaa;
        agent.var_43e2ad424676b8d4 = 10;
        agent.var_98add129a7ecb962 = 0;
    }
}

// Namespace namespace_fb05e1623b934e8/namespace_14d36171baccf528
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x22ce
// Size: 0x85
function function_c00e1d676844f7ae(agent) {
    if (issubstr(agent.agent_type, "tier1")) {
        agent.var_9aa77ab756fdca82 = 100;
    } else if (issubstr(agent.agent_type, "tier2")) {
        agent.var_9aa77ab756fdca82 = 240;
    } else if (issubstr(agent.agent_type, "tier3")) {
        agent.var_9aa77ab756fdca82 = 600;
    }
}

// Namespace namespace_fb05e1623b934e8/namespace_14d36171baccf528
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x235a
// Size: 0x4d
function function_ea83c1b372e16f6d(agent, var_80f4bde7090a4773) {
    if (isagent(agent)) {
        agent.var_80f4bde7090a4773 = var_80f4bde7090a4773;
    } else if (isint(agent)) {
        level.var_879053468f168806[agent].var_80f4bde7090a4773 = var_80f4bde7090a4773;
    }
}

// Namespace namespace_fb05e1623b934e8/namespace_14d36171baccf528
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x23ae
// Size: 0x90
function function_ba0801276542946b(var_7e1ff9afa225e8a1) {
    if (isdefined(var_7e1ff9afa225e8a1)) {
        return random(var_7e1ff9afa225e8a1);
    }
    if (!isdefined(level.var_61312c4c9c8a7cae)) {
        level.var_61312c4c9c8a7cae = [0:"thermite_mp", 1:"semtex_mp", 2:"frag_grenade_mp", 3:"smoke_grenade_mp", 4:"concussion_grenade_mp", 5:"flash_grenade_mp", 6:"snapshot_grenade_mp", 7:"gas_mp", 8:"decoy_grenade_mp"];
    }
    return random(level.var_61312c4c9c8a7cae);
}

// Namespace namespace_fb05e1623b934e8/namespace_14d36171baccf528
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2446
// Size: 0x7f
function function_f5d160902133558() {
    /#
        assert(isdefined(level.agentarray));
    #/
    level.var_d7b3bd9ad64c74b = [];
    foreach (agent in level.agentarray) {
        level.var_d7b3bd9ad64c74b[agent getentitynumber()] = [];
    }
}

// Namespace namespace_fb05e1623b934e8/namespace_14d36171baccf528
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x24cc
// Size: 0x26
function function_d0563dc9eeac7ff0(agent) {
    if (!isdefined(level.var_d7b3bd9ad64c74b)) {
        function_f5d160902133558();
    }
    return agent getentitynumber();
}

// Namespace namespace_fb05e1623b934e8/namespace_14d36171baccf528
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x24fa
// Size: 0x44
function agentpers_setagentpersdata(agent, key, value) {
    if (!isdefined(level.var_d7b3bd9ad64c74b)) {
        function_f5d160902133558();
    }
    level.var_d7b3bd9ad64c74b[agent getentitynumber()][key] = value;
}

// Namespace namespace_fb05e1623b934e8/namespace_14d36171baccf528
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2545
// Size: 0x3a
function agentpers_getagentpersdata(agent, key) {
    if (!isdefined(level.var_d7b3bd9ad64c74b)) {
        function_f5d160902133558();
    }
    return level.var_d7b3bd9ad64c74b[agent getentitynumber()][key];
}

// Namespace namespace_fb05e1623b934e8/namespace_14d36171baccf528
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2587
// Size: 0x33
function function_b894b8689a6055f3(agent) {
    if (!isdefined(level.var_d7b3bd9ad64c74b)) {
        function_f5d160902133558();
    }
    return level.var_d7b3bd9ad64c74b[agent getentitynumber()].size == 0;
}

// Namespace namespace_fb05e1623b934e8/namespace_14d36171baccf528
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x25c2
// Size: 0x32
function function_51de6da7b0dcf26f(agent) {
    if (!isdefined(level.var_d7b3bd9ad64c74b)) {
        function_f5d160902133558();
    }
    level.var_d7b3bd9ad64c74b[agent getentitynumber()] = [];
}

// Namespace namespace_fb05e1623b934e8/namespace_14d36171baccf528
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x25fb
// Size: 0x49
function function_3bdeb9edd6c6f0a() {
    level.var_c7796321c3d97413 = [];
    level.var_c7796321c3d97413[1] = [0:"firebug"];
    level.var_c7796321c3d97413[2] = [];
    level.var_c7796321c3d97413[3] = [0:"strikeunit"];
}

// Namespace namespace_fb05e1623b934e8/namespace_14d36171baccf528
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x264b
// Size: 0x2e6
function function_c26ef480e88413bf(agent, aitype) {
    if (issubstr(aitype, "firebug")) {
        agent thread function_36613ffb5ebe56(agent);
    } else if (issubstr(aitype, "strike")) {
        agent thread function_9ca698cdffe22968(agent);
    } else if (getdvarint(@"hash_b0e7edf188ddb934", 0) == 1 && !issubstr(aitype, "riotshield") && issubstr(aitype, "biolab")) {
        agent.var_7cea08b66b2ad878 = 0;
        if (isdefined(agent.subclass)) {
            if (agent.subclass == "tier2") {
                agent.suppressionthreshold = 0.8;
                agent.suppressiondecrement = 0.07;
                agent.var_2a4784c6cc07ca59 = 0.25;
                agent.var_cbd87a0bc497b778 = 1;
                agent.var_4268b42fc89d0be9 = 0.03;
                agent.var_8a783f4c73c2ae91 = 5e-05;
                agent.aggressivemode = 1;
            } else if (agent.subclass == "tier3") {
                agent.suppressionthreshold = 0.4;
                agent.suppressiondecrement = 0.2;
                agent.var_2a4784c6cc07ca59 = 0.05;
                agent.var_cbd87a0bc497b778 = 1;
                agent.var_4268b42fc89d0be9 = 0.015;
                agent.var_8a783f4c73c2ae91 = 1e-05;
                agent.aggressivemode = 1;
            }
        }
    } else if (agent.subclass == "tier1") {
        agent.var_4268b42fc89d0be9 = getdvarfloat(@"hash_6f6b0fce63d51e11", 0.07);
        agent.var_8a783f4c73c2ae91 = getdvarfloat(@"hash_2e0c4c6766ac7ffe", 0.00015);
    } else if (agent.subclass == "tier2") {
        agent.var_4268b42fc89d0be9 = getdvarfloat(@"hash_6f6b0cce63d51778", 0.05);
        agent.var_8a783f4c73c2ae91 = getdvarfloat(@"hash_2e0c4b6766ac7dcb", 0.0001);
    } else if (agent.subclass == "tier3") {
        agent.suppressionthreshold = 0.5;
        agent.suppressiondecrement = 0.15;
        agent.var_2a4784c6cc07ca59 = 0.05;
        agent.var_4268b42fc89d0be9 = getdvarfloat(@"hash_6f6b0dce63d519ab", 0.04);
        agent.var_8a783f4c73c2ae91 = getdvarfloat(@"hash_2e0c4a6766ac7b98", 5e-05);
        agent.aggressivemode = 1;
    }
}

// Namespace namespace_fb05e1623b934e8/namespace_14d36171baccf528
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2938
// Size: 0x298
function function_36613ffb5ebe56(agent) {
    agent endon("death");
    agent endon("stop_throwing");
    var_ee09091efeca0364 = 0.5;
    grenadetype = "molotov_mp";
    grenades = 8;
    var_b98850b58450bf4b = gettime();
    namespace_14d36171baccf528::agentpers_setagentpersdata(self, "throwingScriptGrenade", 0);
    namespace_14d36171baccf528::function_c37c4f9d687074ff(undefined, undefined, undefined, grenadetype, grenades);
    level thread function_d3f59232689f12a0(agent);
    while (1) {
        if (gettime() >= var_b98850b58450bf4b) {
            if (!isdefined(agent.enemy)) {
                wait(var_ee09091efeca0364);
                continue;
            }
            if (isdefined(self.node) && distancesquared(self.origin, self.node.origin) > 1048576 || isdefined(self.pathgoalpos)) {
                wait(var_ee09091efeca0364);
                continue;
            }
            var_f2bc2e4b8d09e518 = distancesquared(agent.origin, agent.enemy.origin);
            if (var_f2bc2e4b8d09e518 < 65536 || var_f2bc2e4b8d09e518 > 2250000) {
                wait(var_ee09091efeca0364);
                continue;
            }
            if (!agent cansee(agent.enemy)) {
                wait(var_ee09091efeca0364);
                continue;
            }
            starttrace = agent.origin;
            endtrace = starttrace + (0, 0, 128);
            trace = namespace_2a184fc4902783dc::ray_trace(starttrace, endtrace, agent);
            if (trace["hittype"] != "hittype_none" && isdefined(trace["position"])) {
                wait(var_ee09091efeca0364);
                continue;
            }
            starttrace = agent.origin + (0, 0, 100);
            var_96020725b7899b37 = vectornormalize(agent.enemy.origin - starttrace);
            var_96020725b7899b37 = (var_96020725b7899b37[0], var_96020725b7899b37[1], 0) + (0, 0, 1);
            endtrace = starttrace + var_96020725b7899b37 * 1000;
            trace = namespace_2a184fc4902783dc::ray_trace(starttrace, endtrace, agent);
            if (trace["hittype"] != "hittype_none" && isdefined(trace["position"])) {
                wait(var_ee09091efeca0364);
                continue;
            }
            agent thread function_ae99616202575e39(agent.enemy.origin, grenadetype, 64);
            var_b98850b58450bf4b = gettime() + randomintrange(2, 3) * 1000;
            grenades--;
        }
        if (grenades == 0) {
            return;
        }
        wait(var_ee09091efeca0364);
    }
}

// Namespace namespace_fb05e1623b934e8/namespace_14d36171baccf528
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2bd7
// Size: 0x140
function function_d3f59232689f12a0(agent) {
    meansofdeath = killer = agent waittill("death");
    var_c524724829b57a7e = agent doinglongdeath();
    if (!var_c524724829b57a7e && namespace_14d36171baccf528::agentpers_getagentpersdata(agent, "throwingScriptGrenade")) {
        right = anglestoright(agent.angles);
        var_2c04bf9a8ce4f0b2 = agent.origin + anglestoforward(agent.angles) * 5 + right * 20 + (0, 0, 60);
        var_56ebcb2d4fcb8071 = (0, 0, 200) + right * randomfloatrange(-100, 100);
        grenade = agent launchgrenade("molotov_mp", var_2c04bf9a8ce4f0b2, var_56ebcb2d4fcb8071);
        grenade.var_88fe704adf00eadf = 1;
        grenade.owner = agent;
        wait(0.1);
        if (namespace_3c37cb17ade254d::issharedfuncdefined("pyro", "molotov_used")) {
            agent thread [[ namespace_3c37cb17ade254d::getsharedfunc("pyro", "molotov_used") ]](grenade);
        }
        wait(1);
        grenade notify("missile_stuck");
    }
}

// Namespace namespace_fb05e1623b934e8/namespace_14d36171baccf528
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d1e
// Size: 0x4b5
function function_9ca698cdffe22968(agent, var_37d7c6423323a19e) {
    agent endon("death");
    agent endon("stop_throwing");
    var_ee09091efeca0364 = 0.5;
    grenadetype = "smoke_grenade_mp";
    grenades = 8;
    var_b98850b58450bf4b = gettime();
    namespace_14d36171baccf528::agentpers_setagentpersdata(self, "throwingScriptGrenade", 0);
    if (!istrue(var_37d7c6423323a19e)) {
        agent.baseaccuracy = getdvarfloat(@"hash_8aa5313ca3f3737f", 1.1);
        armor = 500;
        helmet = level.var_6855c201495094b6["tier3"];
        weapon = namespace_e0ee43ef2dddadaa::buildweapon("iw9_ar_mike4_mp", [0:"laserbox_hip04", 1:"none", 2:"none", 3:"none", 4:"silencer01_ar", 5:"none"], "none", "none");
    } else {
        armor = undefined;
        helmet = undefined;
        weapon = undefined;
    }
    namespace_14d36171baccf528::function_c37c4f9d687074ff(undefined, undefined, weapon, grenadetype, grenades, armor, helmet);
    if (!istrue(var_37d7c6423323a19e)) {
        agent laseron();
    }
    var_54a2636d2994800f = 75;
    var_3af61c217d8e61b = 15000;
    var_a08068bfbcf2dde = undefined;
    while (1) {
        if (isdefined(agent.enemy) && !isdefined(var_a08068bfbcf2dde) && agent cansee(agent.enemy)) {
            var_a08068bfbcf2dde = gettime();
            if (randomint(100) < var_54a2636d2994800f) {
                magicgrenademanual("smoke_grenade_mp", agent.origin, (0, 0, -10), 0.5);
                thread play_sound_in_space("smoke_grenade_expl_trans", agent.origin);
            }
            var_b98850b58450bf4b = gettime() + randomintrange(2, 5) * 1000;
        } else if (!isdefined(agent.enemy) && isdefined(var_a08068bfbcf2dde) && var_a08068bfbcf2dde + var_3af61c217d8e61b < gettime()) {
            var_a08068bfbcf2dde = undefined;
        }
        if (gettime() >= var_b98850b58450bf4b) {
            if (!isdefined(agent.enemy)) {
                wait(var_ee09091efeca0364);
                continue;
            }
            if (isdefined(agent function_92435c7a6ae85c3c())) {
                wait(var_ee09091efeca0364);
                continue;
            }
            if (isdefined(self.node) && distancesquared(self.origin, self.node.origin) > 1048576 || isdefined(self.pathgoalpos)) {
                wait(var_ee09091efeca0364);
                continue;
            }
            var_f2bc2e4b8d09e518 = distancesquared(agent.origin, agent.enemy.origin);
            if (var_f2bc2e4b8d09e518 < 16384 || var_f2bc2e4b8d09e518 > 1960000) {
                wait(var_ee09091efeca0364);
                continue;
            }
            if (!agent cansee(agent.enemy)) {
                wait(var_ee09091efeca0364);
                continue;
            }
            starttrace = agent.origin;
            endtrace = starttrace + (0, 0, 128);
            trace = namespace_2a184fc4902783dc::ray_trace(starttrace, endtrace, agent);
            if (trace["hittype"] != "hittype_none" && isdefined(trace["position"])) {
                wait(var_ee09091efeca0364);
                continue;
            }
            starttrace = agent.origin + (0, 0, 100);
            var_96020725b7899b37 = vectornormalize(agent.enemy.origin - starttrace);
            var_96020725b7899b37 = (var_96020725b7899b37[0], var_96020725b7899b37[1], 0) + (0, 0, 1);
            endtrace = starttrace + var_96020725b7899b37 * 1000;
            trace = namespace_2a184fc4902783dc::ray_trace(starttrace, endtrace, agent);
            if (trace["hittype"] != "hittype_none" && isdefined(trace["position"])) {
                wait(var_ee09091efeca0364);
                continue;
            }
            toenemy = vectornormalize(agent.enemy.origin - agent.origin);
            var_f2bc2e4b8d09e518 = sqrt(var_f2bc2e4b8d09e518);
            var_ae64fc8ead2542d0 = var_f2bc2e4b8d09e518 / 2;
            targetorigin = agent.origin + toenemy * var_ae64fc8ead2542d0 + (0, 0, 32);
            agent thread function_ae99616202575e39(targetorigin, grenadetype, 128);
            var_b98850b58450bf4b = gettime() + randomintrange(2, 5) * 1000;
            grenades--;
        }
        if (grenades == 0) {
            return;
        }
        wait(var_ee09091efeca0364);
    }
}

// Namespace namespace_fb05e1623b934e8/namespace_14d36171baccf528
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x31da
// Size: 0x22
function turnonlaser() {
    wait(1);
    while (1) {
        self laseron();
        wait(3);
        self laseroff();
        wait(3);
    }
}

// Namespace namespace_fb05e1623b934e8/namespace_14d36171baccf528
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3203
// Size: 0x17a
function function_ae99616202575e39(targetorigin, grenadetype, var_d2666395e6cf4732, var_98f696231283e8b6) {
    self endon("death");
    namespace_14d36171baccf528::agentpers_setagentpersdata(self, "throwingScriptGrenade", 1);
    if (isdefined(var_d2666395e6cf4732)) {
        var_d2666395e6cf4732 = min(abs(var_d2666395e6cf4732), 256);
        targetorigin = targetorigin + (randomfloatrange(-1 * var_d2666395e6cf4732, var_d2666395e6cf4732), randomfloatrange(-1 * var_d2666395e6cf4732, var_d2666395e6cf4732), randomfloatrange(-1 * var_d2666395e6cf4732, var_d2666395e6cf4732));
    }
    stance = namespace_28edc79fcf2fe234::bb_getrequestedstance();
    if (isdefined(self.currentpose)) {
        stance = self.currentpose;
    }
    if (!isdefined(stance)) {
        stance = "stand";
    }
    if (!isdefined(var_98f696231283e8b6) || var_98f696231283e8b6 == 1) {
        var_57acbdc40b2f2db = function_36398e8700c62090(self.origin, targetorigin, stance);
        var_472050d5ebcf25b8 = var_57acbdc40b2f2db[2];
        var_7adb38055d0917f = var_57acbdc40b2f2db[1];
        animname = var_57acbdc40b2f2db[0];
        var_57ad0dc40b2fdda = function_a615009e6466353a(self, targetorigin, grenadetype, var_472050d5ebcf25b8);
        var_56ebcb2d4fcb8071 = var_57ad0dc40b2fdda[1];
        launchpos = var_57ad0dc40b2fdda[0];
    }
    self.var_ca01d1496480b62c = targetorigin;
    self.var_624efed57c34c807 = var_56ebcb2d4fcb8071;
    function_4cb4bb1cff15b987();
    self.var_ca01d1496480b62c = undefined;
    self.var_624efed57c34c807 = undefined;
}

// Namespace namespace_fb05e1623b934e8/namespace_14d36171baccf528
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3384
// Size: 0x9e
function function_4cb4bb1cff15b987() {
    var_22019a90f96bd145 = "ai_forceThrowGrenade_timeout";
    var_9e4e6b6ca639af0b = "ai_forceThrowGrenade_finish";
    var_18d67196c117e2c1 = 6;
    self endon(var_22019a90f96bd145);
    childthread function_d34200a799950385(var_18d67196c117e2c1, var_22019a90f96bd145, var_9e4e6b6ca639af0b);
    while (!istrue(self.isholdinggrenade) && isdefined(self.var_ca01d1496480b62c)) {
        waitframe();
    }
    namespace_14d36171baccf528::agentpers_setagentpersdata(self, "throwingScriptGrenade", 1);
    while (istrue(self.isholdinggrenade) && isdefined(self.var_ca01d1496480b62c)) {
        waitframe();
    }
    namespace_14d36171baccf528::agentpers_setagentpersdata(self, "throwingScriptGrenade", 0);
    self notify(var_9e4e6b6ca639af0b);
}

// Namespace namespace_fb05e1623b934e8/namespace_14d36171baccf528
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3429
// Size: 0x25
function function_d34200a799950385(t, notifyname, var_cb57658b734d4b0c) {
    self endon(var_cb57658b734d4b0c);
    wait(t);
    self notify(notifyname);
}

// Namespace namespace_fb05e1623b934e8/namespace_14d36171baccf528
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x3455
// Size: 0x69
function private function_e4e4fefd625a2580(agent) {
    if (isdefined(agent.node)) {
        /#
            assert(isdefined(agent.node.angles));
        #/
        return anglestoforward(agent.node.angles);
    } else {
        return anglestoforward(agent.angles);
    }
}

// Namespace namespace_fb05e1623b934e8/namespace_14d36171baccf528
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x34c5
// Size: 0xb8
function function_a615009e6466353a(thrower, targetorigin, grenadetype, var_55fba01075efacdb) {
    offset = (0, 0, 100);
    if (isdefined(var_55fba01075efacdb)) {
        offset = var_55fba01075efacdb;
    }
    launchpos = thrower.origin + offset;
    var_56ebcb2d4fcb8071 = targetorigin - launchpos;
    var_56ebcb2d4fcb8071 = vectornormalize(var_56ebcb2d4fcb8071);
    var_56ebcb2d4fcb8071 = (var_56ebcb2d4fcb8071[0], var_56ebcb2d4fcb8071[1], 0) + (0, 0, 1);
    dist = distance2d(launchpos, targetorigin);
    var_56ebcb2d4fcb8071 = var_56ebcb2d4fcb8071 * dist * function_1bc68105415d304(grenadetype, dist);
    return [0:launchpos, 1:var_56ebcb2d4fcb8071];
}

// Namespace namespace_fb05e1623b934e8/namespace_14d36171baccf528
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3585
// Size: 0x14
function function_ee72700f22a0e304(thrower, grenadetype) {
    
}

// Namespace namespace_fb05e1623b934e8/namespace_14d36171baccf528
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x35a0
// Size: 0x86
function private function_1bc68105415d304(var_a664aad02ee98bd2, distancetotarget) {
    switch (var_a664aad02ee98bd2) {
    case #"hash_5e4ccaa178cac19c":
        return 0.75;
    case #"hash_4cd748aa3895508a":
        return 600;
    case #"hash_ab3485fa6834de47":
        if (isdefined(distancetotarget) && distancetotarget < 512) {
            return 0.8;
        }
        return 0.6;
    case #"hash_34e7a4cd11aed6bc":
        return 180;
    default:
        return 0.6;
        break;
    }
}

// Namespace namespace_fb05e1623b934e8/namespace_14d36171baccf528
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x362d
// Size: 0x83
function function_cf56c061947ef668(var_5b18ecaacd37d496, targetorigin) {
    distancetotarget = distance2dsquared(var_5b18ecaacd37d496, targetorigin);
    if (isdefined(distancetotarget) && distancetotarget < 262144) {
        return [0:"grenade_throw_short", 1:0.6, 2:(0, 10, 50)];
    } else {
        return [0:"grenade_throw", 1:0.5, 2:(0, 0, 100)];
    }
}

// Namespace namespace_fb05e1623b934e8/namespace_14d36171baccf528
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x36b7
// Size: 0x138
function function_36398e8700c62090(var_5b18ecaacd37d496, targetorigin, stance) {
    distancetotarget = distance2dsquared(var_5b18ecaacd37d496, targetorigin);
    var_378e8f5de64e9bc8 = function_f56559d00da52270(var_5b18ecaacd37d496, targetorigin, stance);
    switch (stance) {
    case #"hash_d91940431ed7c605":
        if (isdefined(distancetotarget) && distancetotarget < 16384) {
            return [0:"grenade_prone_throw", 1:0.6, 2:var_378e8f5de64e9bc8];
            goto LOC_00000089;
        }
        return [0:"grenade_prone_throw", 1:0.5, 2:var_378e8f5de64e9bc8];
    case #"hash_3fed0cbd303639eb":
    LOC_00000089:
        if (isdefined(distancetotarget) && distancetotarget < 16384) {
            return [0:"grenade_crouch_throw", 1:0.6, 2:var_378e8f5de64e9bc8];
            goto LOC_000000cc;
        }
        return [0:"grenade_crouch_throw", 1:0.5, 2:var_378e8f5de64e9bc8];
    default:
    LOC_000000cc:
        if (isdefined(distancetotarget) && distancetotarget < 16384) {
            return [0:"grenade_throw_short", 1:0.6, 2:var_378e8f5de64e9bc8];
        } else {
            return [0:"grenade_throw", 1:0.5, 2:var_378e8f5de64e9bc8];
        }
        break;
    }
}

// Namespace namespace_fb05e1623b934e8/namespace_14d36171baccf528
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x37f6
// Size: 0x9d
function function_f56559d00da52270(var_5b18ecaacd37d496, targetorigin, stance) {
    distancetotarget = distance2dsquared(var_5b18ecaacd37d496, targetorigin);
    switch (stance) {
    case #"hash_d91940431ed7c605":
        return getgrenadethrowoffset("exposed_prone_throw_grenade", 0);
    case #"hash_3fed0cbd303639eb":
        return getgrenadethrowoffset("exposed_crouch_throw_grenade", 0);
    default:
        if (isdefined(distancetotarget) && distancetotarget < 16384) {
            return getgrenadethrowoffset("exposed_throw_grenade", 1);
        } else {
            return getgrenadethrowoffset("exposed_throw_grenade", 0);
        }
        break;
    }
}

// Namespace namespace_fb05e1623b934e8/namespace_14d36171baccf528
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x389a
// Size: 0x2a8
function function_13812f40f38587c4(agenttype, origin, var_451a9d27d63c746b) {
    var_7d2909fdc2b71387 = function_2b0e82156fa6075b(var_451a9d27d63c746b);
    function_760792071513b00d(var_451a9d27d63c746b);
    if (!isdefined(var_7d2909fdc2b71387)) {
        /#
            println("head_sp_opforce_al_qatala_ar_2_1");
        #/
        return;
    }
    aitype = var_7d2909fdc2b71387.aitype;
    origin = var_7d2909fdc2b71387.origin;
    angles = var_7d2909fdc2b71387.angles;
    priority = function_72d6808216b4d44(var_7d2909fdc2b71387.priority);
    category = var_7d2909fdc2b71387.category;
    subcategory = var_7d2909fdc2b71387.subcategory;
    groupname = var_7d2909fdc2b71387.groupname;
    team = function_30a0d7ca3fae40cc(undefined, var_7d2909fdc2b71387.aitype);
    destination = undefined;
    poiname = var_7d2909fdc2b71387.poi;
    var_f891e067b8802c0d = var_7d2909fdc2b71387.var_f891e067b8802c0d;
    var_f8bc7ecdd324dd79 = var_7d2909fdc2b71387.var_f8bc7ecdd324dd79;
    var_80f4bde7090a4773 = var_7d2909fdc2b71387.var_80f4bde7090a4773;
    var_8124e3f14d523a45 = var_7d2909fdc2b71387.var_324dfdee5bdf702e;
    agentstruct = var_7d2909fdc2b71387.agentstruct;
    threatbiasgroup = var_7d2909fdc2b71387.threatbiasgroup;
    var_8a76b06617613d30 = getsharedfunc("ai_mp_controller", "ai_mp_requestSpawnAgent");
    agent = [[ var_8a76b06617613d30 ]](aitype, origin, angles, priority, category, subcategory, groupname, team, destination, poiname, var_f891e067b8802c0d, 1, undefined, var_80f4bde7090a4773, undefined, undefined, threatbiasgroup);
    if (isdefined(agent)) {
        agent.var_f8bc7ecdd324dd79 = var_f8bc7ecdd324dd79;
        function_3ea1225bf6192343(agent, agentstruct);
        behavior_executebehaviorpackage = getsharedfunc("ai_mp_controller", "behavior_executeBehaviorPackage");
        [[ behavior_executebehaviorpackage ]](agent);
        agent.var_324dfdee5bdf702e = var_8124e3f14d523a45;
        function_e662189d61d1874e(agent);
    } else if (isdefined(agentstruct)) {
        if (isdefined(agentstruct.group)) {
            [[ agentstruct.var_9e729433fd479f19 ]](agentstruct, var_451a9d27d63c746b);
        } else if (isdefined(level.var_59cffb78293fe83c) && isdefined(level.var_59cffb78293fe83c.var_9e729433fd479f19)) {
            [[ level.var_59cffb78293fe83c.var_9e729433fd479f19 ]](agentstruct, var_451a9d27d63c746b);
        }
    }
}

// Namespace namespace_fb05e1623b934e8/namespace_14d36171baccf528
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3b49
// Size: 0x2f2
function function_9fa011b7807309a8(agent, var_451a9d27d63c746b) {
    aitype = agent.agent_type;
    origin = agent.origin;
    angles = agent.angles;
    priority = agent.priority;
    category = agent.category;
    subcategory = agent.subcategory;
    groupname = agent.script_stealthgroup;
    destination = undefined;
    poiname = agent.poi;
    team = agent.team;
    var_f891e067b8802c0d = !agent.stealth_enabled;
    var_f8bc7ecdd324dd79 = agent.var_f8bc7ecdd324dd79;
    var_80f4bde7090a4773 = agent.var_80f4bde7090a4773;
    var_8124e3f14d523a45 = agent.var_324dfdee5bdf702e;
    agentstruct = function_12ee2283db699727(agent);
    if (isdefined(var_f8bc7ecdd324dd79) && var_f8bc7ecdd324dd79.behavior == "cqb" && isdefined(var_f8bc7ecdd324dd79.var_f1548c57038e1b7a)) {
        foreach (node in var_f8bc7ecdd324dd79.var_f1548c57038e1b7a) {
            if (isdefined(node)) {
                node.claimed = 0;
            }
        }
    }
    var_7d2909fdc2b71387 = function_e83d1f023a2609ff(aitype, origin, angles, priority, category, subcategory, groupname, team, destination, poiname, var_f891e067b8802c0d, var_f8bc7ecdd324dd79, var_80f4bde7090a4773, var_8124e3f14d523a45, agentstruct);
    function_7a9172605e0228df(var_451a9d27d63c746b, var_7d2909fdc2b71387);
    subarea_findandassignfordormancyid = getsharedfunc("ai_mp_controller", "subArea_findAndAssignForDormancyID");
    [[ subarea_findandassignfordormancyid ]](origin, poiname, destination, var_451a9d27d63c746b);
    priority_setbydormancyid = getsharedfunc("ai_mp_controller", "priority_setByDormancyId");
    [[ priority_setbydormancyid ]](var_451a9d27d63c746b, priority);
    var_58f203b26c3a3f8a = getsharedfunc("ai_mp_controller", "ai_registerAgent");
    [[ var_58f203b26c3a3f8a ]](var_451a9d27d63c746b, category, subcategory, poiname);
    if (isdefined(agentstruct)) {
        if (isdefined(agentstruct.group)) {
            [[ agentstruct.var_90ccd093de8c8c55 ]](agent, var_451a9d27d63c746b);
        } else if (isdefined(level.var_59cffb78293fe83c) && isdefined(level.var_59cffb78293fe83c.var_90ccd093de8c8c55)) {
            [[ level.var_59cffb78293fe83c.var_90ccd093de8c8c55 ]](agent, var_451a9d27d63c746b);
        }
    }
}

// Namespace namespace_fb05e1623b934e8/namespace_14d36171baccf528
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3e42
// Size: 0x95
function function_b6131256ee347e8d(priority) {
    if (isint(priority)) {
        return ter_op(priority < 0, 0, ter_op(priority > 5, 5, priority));
    }
    switch (tolower(priority)) {
    case #"hash_c49f372eec1c61c":
        return 1;
    case #"hash_7e89154a96f625d":
        return 2;
    case #"hash_c71b112fe04823d6":
        return 3;
    case #"hash_2f27546c22430661":
        return 4;
    case #"hash_1de65f6f9597841f":
        return 5;
    default:
        return 5;
        break;
    }
}

// Namespace namespace_fb05e1623b934e8/namespace_14d36171baccf528
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3ede
// Size: 0x81
function function_72d6808216b4d44(importance) {
    switch (importance) {
    case 1:
        return "absolute";
    case 2:
        return "high";
    case 3:
        return "medium";
    case 4:
        return "low";
    case 5:
        return "filler";
    default:
        return "filler";
        break;
    }
}

// Namespace namespace_fb05e1623b934e8/namespace_14d36171baccf528
// Params 13, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3f66
// Size: 0xd1
function function_e2fa9b378bbf03a6(aitype, origin, angles, priority, category, subcategory, groupname, team, destination, poiname, var_f891e067b8802c0d, var_f8bc7ecdd324dd79, threatbiasgroup) {
    priority = function_b6131256ee347e8d(priority);
    var_7d2909fdc2b71387 = function_e83d1f023a2609ff(aitype, origin, angles, priority, category, subcategory, groupname, team, destination, poiname, var_f891e067b8802c0d, var_f8bc7ecdd324dd79, undefined, undefined, undefined, threatbiasgroup);
    var_451a9d27d63c746b = function_4476b9b75cb95d99(origin, aitype, priority);
    /#
        assert(var_451a9d27d63c746b >= 0, "We've run out of dormancy IDs!");
    #/
    function_7a9172605e0228df(var_451a9d27d63c746b, var_7d2909fdc2b71387);
    return var_451a9d27d63c746b;
}

// Namespace namespace_fb05e1623b934e8/namespace_14d36171baccf528
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x403f
// Size: 0x64
function function_b04c0433e8107615() {
    level.var_74e9c02b56e4ba52 = &function_13812f40f38587c4;
    level.var_8a42b71f799936ad = &function_9fa011b7807309a8;
    level.var_fe093e9b2b6c3751 = getdvarint(@"hash_320c4db6af00b215", 0);
    level.var_53db9bacadef066d = spawnstruct();
    level.var_53db9bacadef066d.var_d4053e1a1d2983ce = 0;
    level.var_879053468f168806 = [];
}

// Namespace namespace_fb05e1623b934e8/namespace_14d36171baccf528
// Params 16, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x40aa
// Size: 0x176
function function_e83d1f023a2609ff(aitype, origin, angles, priority, category, subcategory, groupname, team, destination, poiname, var_f891e067b8802c0d, var_f8bc7ecdd324dd79, var_80f4bde7090a4773, var_8124e3f14d523a45, agentstruct, threatbiasgroup) {
    var_7d2909fdc2b71387 = spawnstruct();
    var_7d2909fdc2b71387.aitype = aitype;
    var_7d2909fdc2b71387.origin = origin;
    var_7d2909fdc2b71387.angles = angles;
    var_7d2909fdc2b71387.priority = function_b6131256ee347e8d(priority);
    var_7d2909fdc2b71387.category = category;
    var_7d2909fdc2b71387.subcategory = subcategory;
    var_7d2909fdc2b71387.groupname = groupname;
    var_7d2909fdc2b71387.team = team;
    var_7d2909fdc2b71387.destination = destination;
    var_7d2909fdc2b71387.poi = poiname;
    var_7d2909fdc2b71387.var_f891e067b8802c0d = var_f891e067b8802c0d;
    var_7d2909fdc2b71387.var_f8bc7ecdd324dd79 = var_f8bc7ecdd324dd79;
    var_7d2909fdc2b71387.var_80f4bde7090a4773 = var_80f4bde7090a4773;
    var_7d2909fdc2b71387.var_324dfdee5bdf702e = var_8124e3f14d523a45;
    var_7d2909fdc2b71387.agentstruct = agentstruct;
    var_7d2909fdc2b71387.threatbiasgroup = threatbiasgroup;
    return var_7d2909fdc2b71387;
}

// Namespace namespace_fb05e1623b934e8/namespace_14d36171baccf528
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4228
// Size: 0x21
function function_7a9172605e0228df(var_451a9d27d63c746b, var_7d2909fdc2b71387) {
    level.var_879053468f168806[var_451a9d27d63c746b] = var_7d2909fdc2b71387;
}

// Namespace namespace_fb05e1623b934e8/namespace_14d36171baccf528
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4250
// Size: 0x17
function function_2b0e82156fa6075b(var_451a9d27d63c746b) {
    return level.var_879053468f168806[var_451a9d27d63c746b];
}

// Namespace namespace_fb05e1623b934e8/namespace_14d36171baccf528
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x426f
// Size: 0x20
function function_b27fe8a834c5edda() {
    /#
        assert(isdefined(level.var_879053468f168806));
    #/
    return level.var_879053468f168806.size;
}

// Namespace namespace_fb05e1623b934e8/namespace_14d36171baccf528
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4297
// Size: 0x35
function function_3b45c895d8d984ee() {
    if (!isdefined(level.var_88655f45c7beb22a)) {
        level.var_88655f45c7beb22a = getdvarint(@"hash_ee8cf30f1e199e42", 200) - 1;
    }
    return level.var_88655f45c7beb22a;
}

// Namespace namespace_fb05e1623b934e8/namespace_14d36171baccf528
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x42d4
// Size: 0xee
function function_4e065f1747aadd51(var_451a9d27d63c746b, category) {
    function_ee990c1808df152b(var_451a9d27d63c746b);
    var_7d2909fdc2b71387 = function_2b0e82156fa6075b(var_451a9d27d63c746b);
    if (istrue(level.var_45ca3cfb9dca4f97)) {
        level thread namespace_f2ffc0540883e1ad::drawsphere(var_7d2909fdc2b71387.origin, 64, 500, (1, 0, 0));
    }
    if (isdefined(var_7d2909fdc2b71387) && isdefined(var_7d2909fdc2b71387.agentstruct)) {
        if (isdefined(var_7d2909fdc2b71387.agentstruct.group)) {
            [[ var_7d2909fdc2b71387.agentstruct.ondeath ]](var_451a9d27d63c746b);
        } else if (isdefined(level.var_59cffb78293fe83c) && isdefined(level.var_59cffb78293fe83c.ondeath)) {
            [[ level.var_59cffb78293fe83c.ondeath ]](var_451a9d27d63c746b);
        }
    }
    function_760792071513b00d(var_451a9d27d63c746b);
}

// Namespace namespace_fb05e1623b934e8/namespace_14d36171baccf528
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x43c9
// Size: 0xbe
function function_760792071513b00d(var_451a9d27d63c746b, category) {
    if (!isdefined(category)) {
        category = function_2b0e82156fa6075b(var_451a9d27d63c746b).poi;
    }
    var_f7fd7a99aa002217 = getsharedfunc("ai_mp_controller", "priority_removeByDormancyId");
    [[ var_f7fd7a99aa002217 ]](var_451a9d27d63c746b);
    var_8632846f44f043e5 = getsharedfunc("ai_mp_controller", "ai_deregisterAgent");
    [[ var_8632846f44f043e5 ]](var_451a9d27d63c746b, category);
    subarea = level.var_879053468f168806[var_451a9d27d63c746b].subarea;
    if (isdefined(subarea)) {
        var_589fe1386325a0cc = getsharedfunc("ai_mp_controller", "subArea_removeAgentFrom");
        [[ var_589fe1386325a0cc ]](var_451a9d27d63c746b, subarea);
    }
    level.var_879053468f168806[var_451a9d27d63c746b] = undefined;
}

// Namespace namespace_fb05e1623b934e8/namespace_14d36171baccf528
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x448e
// Size: 0x83
function function_e662189d61d1874e(agent) {
    if (!isagent(agent)) {
        return;
    }
    if (isdefined(agent.var_324dfdee5bdf702e)) {
        for (i = 0; i < 24; i++) {
            var_964917a4edc12525 = 1 << i;
            if (var_964917a4edc12525 > agent.var_324dfdee5bdf702e) {
                break;
            }
            if ((agent.var_324dfdee5bdf702e & var_964917a4edc12525) == var_964917a4edc12525) {
                agent thread [[ level.var_5dbbd87fd9e2457f[i] ]](agent);
            }
        }
    }
}

// Namespace namespace_fb05e1623b934e8/namespace_14d36171baccf528
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4518
// Size: 0x121
function function_58aab2edaec2599f(agent, var_53bd93219c031c08, function) {
    if (!isdefined(function) || !isfunction(function) || !isdefined(agent) || !isdefined(var_53bd93219c031c08) || !isstring(var_53bd93219c031c08)) {
        return;
    }
    function_a1acc0cc2a3cfeaa(var_53bd93219c031c08, function);
    if (isagent(agent)) {
        if (!isdefined(agent.var_324dfdee5bdf702e)) {
            agent.var_324dfdee5bdf702e = 0;
        }
        agent.var_324dfdee5bdf702e = agent.var_324dfdee5bdf702e | 1 << level.var_8cfccf3b774f4458[var_53bd93219c031c08].index;
    } else if (isint(agent)) {
        if (!isdefined(level.var_879053468f168806[agent].var_324dfdee5bdf702e)) {
            level.var_879053468f168806[agent].var_324dfdee5bdf702e = 0;
        }
        level.var_879053468f168806[agent].var_324dfdee5bdf702e = level.var_879053468f168806[agent].var_324dfdee5bdf702e | 1 << level.var_8cfccf3b774f4458[var_53bd93219c031c08].index;
    }
}

// Namespace namespace_fb05e1623b934e8/namespace_14d36171baccf528
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4640
// Size: 0x139
function function_97fbd14bbcf19d9c(agent, var_53bd93219c031c08, function) {
    if (!isdefined(function) || !isfunction(function) || !isdefined(agent) || !isdefined(var_53bd93219c031c08) || !isstring(var_53bd93219c031c08)) {
        return;
    }
    function_a1acc0cc2a3cfeaa(var_53bd93219c031c08, function);
    if (isagent(agent)) {
        if (!isdefined(agent.var_324dfdee5bdf702e)) {
            agent.var_324dfdee5bdf702e = 0;
        } else {
            agent.var_324dfdee5bdf702e = agent.var_324dfdee5bdf702e & ~(1 << level.var_8cfccf3b774f4458[var_53bd93219c031c08].index);
        }
    } else if (isint(agent) && isdefined(level.var_879053468f168806[agent])) {
        if (!isdefined(level.var_879053468f168806[agent].var_324dfdee5bdf702e)) {
            level.var_879053468f168806[agent].var_324dfdee5bdf702e = 0;
        } else {
            level.var_879053468f168806[agent].var_324dfdee5bdf702e = level.var_879053468f168806[agent].var_324dfdee5bdf702e & ~(1 << level.var_8cfccf3b774f4458[var_53bd93219c031c08].index);
        }
    }
}

// Namespace namespace_fb05e1623b934e8/namespace_14d36171baccf528
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4780
// Size: 0xe9
function private function_a1acc0cc2a3cfeaa(var_53bd93219c031c08, function) {
    if (!isdefined(level.var_8cfccf3b774f4458)) {
        level.var_8cfccf3b774f4458 = [];
    }
    if (!isdefined(level.var_5dbbd87fd9e2457f)) {
        level.var_5dbbd87fd9e2457f = [];
    }
    if (!isdefined(level.var_8cfccf3b774f4458[var_53bd93219c031c08])) {
        var_93f937d4c731de92 = spawnstruct();
        var_93f937d4c731de92.func = function;
        var_93f937d4c731de92.index = level.var_8cfccf3b774f4458.size;
        /#
            assert(var_93f937d4c731de92.index < 24, "There are more than 24 dormancy functions. We've run out of bits!");
        #/
        level.var_8cfccf3b774f4458[var_53bd93219c031c08] = var_93f937d4c731de92;
    }
    index = level.var_8cfccf3b774f4458[var_53bd93219c031c08].index;
    if (!isdefined(level.var_5dbbd87fd9e2457f[index])) {
        level.var_5dbbd87fd9e2457f[index] = function;
    }
}

// Namespace namespace_fb05e1623b934e8/namespace_14d36171baccf528
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4870
// Size: 0xd9
function function_f3d88b5d7353a90(array, agent) {
    newarray = [];
    foreach (item in array) {
        if (isagent(agent) && isagent(item) && agent != item) {
            newarray[newarray.size] = item;
        } else if (isagent(agent) && isint(item) || isint(agent) && isagent(item)) {
            newarray[newarray.size] = item;
        } else if (isint(agent) && isint(item) && agent != item) {
            newarray[newarray.size] = item;
        }
    }
    return newarray;
}

// Namespace namespace_fb05e1623b934e8/namespace_14d36171baccf528
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4951
// Size: 0x20
function function_20381a5ca18027ff(health) {
    self.health = health;
    self.maxhealth = health;
}

// Namespace namespace_fb05e1623b934e8/namespace_14d36171baccf528
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4978
// Size: 0x68
function function_3ea1225bf6192343(agent, struct) {
    if (isagent(agent)) {
        agent.agentstruct = struct;
        agentpers_setagentpersdata(agent, "agentStruct", struct);
    } else if (isint(agent)) {
        info = function_2b0e82156fa6075b(agent);
        if (isdefined(info)) {
            info.agentstruct = struct;
        }
    }
}

// Namespace namespace_fb05e1623b934e8/namespace_14d36171baccf528
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x49e7
// Size: 0x4c
function function_12ee2283db699727(agent) {
    if (isagent(agent)) {
        return agentpers_getagentpersdata(agent, "agentStruct");
    } else if (isint(agent)) {
        info = function_2b0e82156fa6075b(agent);
        return info.agentstruct;
    }
}

// Namespace namespace_fb05e1623b934e8/namespace_14d36171baccf528
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4a3a
// Size: 0x315
function function_a09756b37f2e0681() {
    level.var_6855c201495094b6 = [];
    level.var_6855c201495094b6["tier2"] = getdvarint(@"hash_7e5512406a54dd39", 1);
    level.var_6855c201495094b6["tier3"] = getdvarint(@"hash_7e5511406a54db06", 3);
    level.var_6855c201495094b6["jugg"] = getdvarint(@"hash_bc69c0296b829cc6", 10);
    level.var_9f0b40fbeb9cdde2 = [];
    level.var_9f0b40fbeb9cdde2["ar"] = [];
    level.var_9f0b40fbeb9cdde2["ar"]["maxfaceenemydist"] = 400;
    level.var_9f0b40fbeb9cdde2["ar"]["maxfacenewenemydist"] = 80;
    level.var_9f0b40fbeb9cdde2["lmg"] = [];
    level.var_9f0b40fbeb9cdde2["lmg"]["maxfaceenemydist"] = 512;
    level.var_9f0b40fbeb9cdde2["lmg"]["maxfacenewenemydist"] = 80;
    level.var_9f0b40fbeb9cdde2["shotgun"] = [];
    level.var_9f0b40fbeb9cdde2["shotgun"]["maxfaceenemydist"] = 80;
    level.var_9f0b40fbeb9cdde2["shotgun"]["maxfacenewenemydist"] = 16;
    level.var_9f0b40fbeb9cdde2["smg"] = [];
    level.var_9f0b40fbeb9cdde2["smg"]["maxfaceenemydist"] = 320;
    level.var_9f0b40fbeb9cdde2["smg"]["maxfacenewenemydist"] = 32;
    level.var_9f0b40fbeb9cdde2["sniper"] = [];
    level.var_9f0b40fbeb9cdde2["sniper"]["maxfaceenemydist"] = 32;
    level.var_9f0b40fbeb9cdde2["sniper"]["maxfacenewenemydist"] = 50;
    level.var_9f0b40fbeb9cdde2["rpg"] = [];
    level.var_9f0b40fbeb9cdde2["rpg"]["maxfaceenemydist"] = 32;
    level.var_9f0b40fbeb9cdde2["rpg"]["maxfacenewenemydist"] = 50;
    level.var_9f0b40fbeb9cdde2["firebug"] = [];
    level.var_9f0b40fbeb9cdde2["firebug"]["maxfaceenemydist"] = 320;
    level.var_9f0b40fbeb9cdde2["firebug"]["maxfacenewenemydist"] = 32;
    level.var_9f0b40fbeb9cdde2["jugg"] = [];
    level.var_9f0b40fbeb9cdde2["jugg"]["maxfaceenemydist"] = 2048;
    level.var_9f0b40fbeb9cdde2["jugg"]["maxfacenewenemydist"] = 512;
    level.var_d0f9a08690a8075 = [];
    level.var_d0f9a08690a8075[0] = getdvarint(@"hash_9f60e77c0e91da76", -1);
    level.var_d0f9a08690a8075[1] = getdvarint(@"hash_9f60e67c0e91d843", -1);
    level.var_d0f9a08690a8075[2] = getdvarint(@"hash_9f60e57c0e91d610", -1);
    function_468420ffd9205765(getdvarint(@"hash_39fe1e5fe7d89e6e", 8) * 1000);
    function_9f617bb5cf59dbf0(getdvarint(@"hash_fa88bd128990512b", 200));
}

// Namespace namespace_fb05e1623b934e8/namespace_14d36171baccf528
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4d56
// Size: 0xb3
function function_77b8b5af85f319d8(valuearray) {
    if (isdefined(valuearray["maxfaceenemydist"])) {
        self.maxfaceenemydist = valuearray["maxfaceenemydist"];
    }
    if (isdefined(valuearray["maxfacenewenemydist"])) {
        self.maxfacenewenemydist = valuearray["maxfacenewenemydist"];
    }
    if (isdefined(valuearray["maxengagementdist"]) && isdefined(valuearray["maxengagementfalloff"])) {
        self setengagementmaxdist(valuearray["maxengagementdist"], valuearray["maxengagementfalloff"]);
    }
    if (isdefined(valuearray["minengagementdist"]) && isdefined(valuearray["minengagementfalloff"])) {
        self setengagementmindist(valuearray["minengagementdist"], valuearray["minengagementfalloff"]);
    }
    if (isdefined(valuearray["maxengagementshootdist"])) {
        self function_9215ce6fc83759b9(valuearray["maxengagementshootdist"]);
    }
}

// Namespace namespace_fb05e1623b934e8/namespace_14d36171baccf528
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4e10
// Size: 0x36
function function_223455a2aefd83e4() {
    for (i = 0; i < level.players.size; i++) {
        self getenemyinfo(level.players[i]);
    }
}

// Namespace namespace_fb05e1623b934e8/namespace_14d36171baccf528
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4e4d
// Size: 0x68
function function_fb117f8ce12c38e9(aitype) {
    if (!isdefined(aitype)) {
        return;
    }
    if (issubstr(aitype, "tier1")) {
        return level.var_d0f9a08690a8075[0];
    } else if (issubstr(aitype, "tier2")) {
        return level.var_d0f9a08690a8075[1];
    } else if (issubstr(aitype, "tier3")) {
        return level.var_d0f9a08690a8075[2];
    }
}

// Namespace namespace_fb05e1623b934e8/namespace_14d36171baccf528
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x4ebd
// Size: 0x450
function function_6f88796d2f078da4(aigroup, var_b5db8d5bf4b6b13f, var_b81088b6a13a4e22) {
    squadleader = random(aigroup);
    if (isdefined(var_b5db8d5bf4b6b13f)) {
        if (isarray(var_b5db8d5bf4b6b13f)) {
            squadleader = random(var_b5db8d5bf4b6b13f);
        } else {
            squadleader = var_b5db8d5bf4b6b13f;
        }
    }
    if (isdefined(var_b81088b6a13a4e22)) {
        level thread [[ var_b81088b6a13a4e22 ]](squadleader);
    }
    /#
        if (getdvarint(@"hash_4fa5a6d9e7fb5284", 0) > 0) {
            squadleader hudoutlineenable("ai_deregisterAgent");
        }
    #/
    while (1) {
        var_53e80078572723e9 = 0;
        foreach (ai in aigroup) {
            if (!isalive(ai) || ai.health < 1) {
                continue;
            }
            var_53e80078572723e9 = 1;
        }
        if (!var_53e80078572723e9) {
            return;
        }
        if (isdefined(squadleader) && isalive(squadleader)) {
            foreach (ai in aigroup) {
                if (!isdefined(ai)) {
                    continue;
                }
                if (ai == squadleader) {
                    continue;
                }
                if (!isalive(ai) || ai.health < 1) {
                    continue;
                }
                if (!isdefined(ai.goalent) || ai.goalent != squadleader) {
                    /#
                        if (getdvar(@"hash_4fa5a6d9e7fb5284") != "soldier") {
                            ai hudoutlineenable("team_hundred_ninety_five");
                        }
                    #/
                    ai setgoalentity(squadleader);
                    ai.goalent = squadleader;
                }
                var_84031f98354ed18 = 0;
                players = level.players;
                if (function_a794fcf9545f2062()) {
                    team = ai.team;
                    players = function_b1eef70090b5b7b5(squadleader.origin, squadleader.goalradius, function_869ccb4e3451b8c6([0:"etype_player"]), [], team);
                    if (players.size) {
                        var_84031f98354ed18 = 1;
                    }
                } else {
                    foreach (player in players) {
                        if (distance2dsquared(squadleader.origin, player.origin) < squared(squadleader.goalradius)) {
                            var_84031f98354ed18 = 1;
                        }
                    }
                }
                ai.goalradius = 256;
                if (var_84031f98354ed18 || distance2dsquared(squadleader.origin, ai.origin) < squared(ai.goalradius)) {
                    if (distance2dsquared(squadleader.origin, ai.origin) < squared(ai.goalradius)) {
                        ai.goalradius = 1200;
                    }
                }
            }
        } else {
            aigroup = array_removeundefined(aigroup);
            if (!aigroup.size) {
                return;
            }
            squadleader = random(aigroup);
            if (isdefined(var_b5db8d5bf4b6b13f)) {
                alive = 0;
                foreach (guy in var_b5db8d5bf4b6b13f) {
                    if (!isalive(guy) || guy.health < 1) {
                        continue;
                    }
                    alive = 1;
                }
                if (alive) {
                    if (isarray(var_b5db8d5bf4b6b13f)) {
                        squadleader = random(var_b5db8d5bf4b6b13f);
                    } else {
                        squadleader = var_b5db8d5bf4b6b13f;
                    }
                }
            }
            /#
                if (getdvar(@"hash_4fa5a6d9e7fb5284") != "soldier") {
                    squadleader hudoutlineenable("ai_deregisterAgent");
                }
            #/
            if (isdefined(var_b81088b6a13a4e22)) {
                level thread [[ var_b81088b6a13a4e22 ]](squadleader);
            }
        }
        wait(1);
    }
}

// Namespace namespace_fb05e1623b934e8/namespace_14d36171baccf528
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5314
// Size: 0x5d
function function_e942bea168527f6(trigger) {
    enabled = getdvarint(@"hash_3d2d2d527cf543f9", 1);
    if (!enabled) {
        return;
    }
    if (issharedfuncdefined("game", "makeEnterExitTrigger")) {
        [[ getsharedfunc("game", "makeEnterExitTrigger") ]](trigger, &function_3739410667dca712, &function_9643c9b25f0e0c84);
    }
}

// Namespace namespace_fb05e1623b934e8/namespace_14d36171baccf528
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5378
// Size: 0xfa
function function_3739410667dca712(soldier, trigger) {
    if (!isagent(soldier)) {
        return;
    }
    if (!isalive(soldier)) {
        return;
    }
    if (istrue(soldier.var_ed331803db44891b)) {
        soldier.var_e1b2653a504955e9 = 1;
        soldier allowedstances("stand");
    }
    if (function_f0cb3329588d4015(soldier)) {
        return;
    }
    soldier.var_d1c85ffae04d3ae0 = spawnstruct();
    soldier.var_d1c85ffae04d3ae0.var_b6af6a0de2c14dc3 = soldier getbasearchetype();
    soldier.var_d1c85ffae04d3ae0.var_98add129a7ecb962 = soldier.var_98add129a7ecb962;
    var_2186ab5345fa2b64 = "soldier_water";
    if (soldier.var_d1c85ffae04d3ae0.var_b6af6a0de2c14dc3 == "juggernaut") {
        var_2186ab5345fa2b64 = "juggernaut_water";
    }
    soldier setoverridearchetype("default", var_2186ab5345fa2b64, 0);
    soldier.var_98add129a7ecb962 = 0;
}

// Namespace namespace_fb05e1623b934e8/namespace_14d36171baccf528
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5479
// Size: 0xfb
function function_9643c9b25f0e0c84(soldier, trigger) {
    if (!isagent(soldier)) {
        return;
    }
    if (!isalive(soldier)) {
        return;
    }
    if (istrue(soldier.var_e1b2653a504955e9)) {
        soldier allowedstances("crouch", "stand");
    }
    if (function_f0cb3329588d4015(soldier)) {
        return;
    }
    var_5def1ec79437ce3c = "soldier";
    if (isdefined(soldier.var_d1c85ffae04d3ae0) && isdefined(soldier.var_d1c85ffae04d3ae0.var_b6af6a0de2c14dc3)) {
        var_5def1ec79437ce3c = soldier.var_d1c85ffae04d3ae0.var_b6af6a0de2c14dc3;
    }
    soldier setoverridearchetype("default", var_5def1ec79437ce3c, 0);
    if (isdefined(soldier.var_d1c85ffae04d3ae0) && isdefined(soldier.var_d1c85ffae04d3ae0.var_98add129a7ecb962)) {
        soldier.var_98add129a7ecb962 = soldier.var_d1c85ffae04d3ae0.var_98add129a7ecb962;
    }
}

// Namespace namespace_fb05e1623b934e8/namespace_14d36171baccf528
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x557b
// Size: 0x4b
function function_f0cb3329588d4015(soldier) {
    enabled = getdvarint(@"hash_cb527a1b28e21dfd", 0);
    if (!enabled) {
        return 0;
    }
    var_435a2cfd34cf4935 = soldier getbasearchetype();
    if (var_435a2cfd34cf4935 == "juggernaut") {
        return 0;
    }
    return 1;
}

// Namespace namespace_fb05e1623b934e8/namespace_14d36171baccf528
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x55ce
// Size: 0x130
function function_30a0d7ca3fae40cc(nationality, agent_type) {
    if (isdefined(nationality)) {
        switch (nationality) {
        case #"hash_fa18d1f6bd5790c7":
            return "team_hundred_ninety_five";
        case #"hash_3931080a2ee4d716":
        case #"hash_fa24c0f6bd607060":
        case #"hash_fa53bdf6bd853c80":
            return "team_hundred_ninety_four";
        case #"hash_4bc0839e1ade7b30":
            return "team_hundred_ninety_seven";
        case #"hash_8915246c51a3d9ff":
            return "team_hundred_ninety_eight";
        case #"hash_19b89634f50eeda4":
            return "team_hundred_ninety_nine";
            break;
        }
    }
    if (!isdefined(nationality)) {
        if (issubstr(agent_type, "_aq")) {
            return "team_hundred_ninety_five";
        } else if (issubstr(agent_type, "_ru") || issubstr(agent_type, "_mx") || issubstr(agent_type, "_cartel")) {
            return "team_hundred_ninety_four";
        } else if (issubstr(agent_type, "_biolab")) {
            return "team_hundred_ninety_seven";
        } else if (issubstr(agent_type, "_pmc")) {
            return "team_hundred_ninety_eight";
        } else if (issubstr(agent_type, "_merc")) {
            return "team_hundred_ninety_nine";
        } else {
            return "team_hundred_ninety_five";
        }
    }
}

// Namespace namespace_fb05e1623b934e8/namespace_14d36171baccf528
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5705
// Size: 0x3c
function function_9a024cd909d6e0a3(func) {
    if (!isdefined(level.var_8c2b0fd37157f872)) {
        level.var_8c2b0fd37157f872 = [];
    }
    level.var_8c2b0fd37157f872 = array_add(level.var_8c2b0fd37157f872, func);
}

// Namespace namespace_fb05e1623b934e8/namespace_14d36171baccf528
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5748
// Size: 0xbe
function function_8ca4e221673e423c() {
    map = [];
    foreach (aitype, arr in level.agent_definition) {
        if (isdefined(arr["subclass"])) {
            var_3edaf5784c67ba1d = arr["subclass"];
            map[var_3edaf5784c67ba1d.name] = function_53c4c53197386572(map[var_3edaf5784c67ba1d.name], []);
            map[var_3edaf5784c67ba1d.name] = array_add(map[var_3edaf5784c67ba1d.name], aitype);
        }
    }
    return map;
}

// Namespace namespace_fb05e1623b934e8/namespace_14d36171baccf528
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x580e
// Size: 0x12e
function function_3290e192ac188e2d(subclass) {
    level.var_382c29cdfee879a = function_53c4c53197386572(level.var_382c29cdfee879a, 0);
    if (!isdefined(level.var_c841584ec7126408) || level.var_382c29cdfee879a != level.agent_definition.size) {
        level.var_382c29cdfee879a = level.agent_definition.size;
        level.var_c841584ec7126408 = [];
        foreach (aitype, arr in level.agent_definition) {
            if (isdefined(arr["subclass"])) {
                var_c1ad5e12dcb42dea = arr["subclass"].name;
                if (!isdefined(level.var_c841584ec7126408[var_c1ad5e12dcb42dea])) {
                    level.var_c841584ec7126408[var_c1ad5e12dcb42dea] = [];
                }
                level.var_c841584ec7126408[var_c1ad5e12dcb42dea][level.var_c841584ec7126408[var_c1ad5e12dcb42dea].size] = aitype;
            }
        }
    }
    if (isdefined(level.var_c841584ec7126408[subclass])) {
        return level.var_c841584ec7126408[subclass];
    }
    return [];
}

// Namespace namespace_fb05e1623b934e8/namespace_14d36171baccf528
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5944
// Size: 0xef
function function_7056963336f2bbec(var_30bd1ac19a67631a) {
    /#
        if (!isdefined(self.group)) {
            /#
                assertex(self.birthtime < gettime(), "player_hs0_sc0", "<unknown string>", self.origin);
            #/
        } else {
            /#
                assertex(self.birthtime < gettime(), "<unknown string>" + self.group.group_name, "<unknown string>", self.origin);
            #/
        }
    #/
    if (self.birthtime >= gettime()) {
        waitframe();
    }
    if (istrue(var_30bd1ac19a67631a)) {
        self.nocorpse = 1;
    }
    self.died_poorly = 1;
    self.died_poorly_health = self.health;
    self.var_f543095c3ca1b743 = 1;
    if (isdefined(self.magic_bullet_shield)) {
        namespace_6205bc7c5e394598::stop_magic_bullet_shield();
    }
    self kill();
}

// Namespace namespace_fb05e1623b934e8/namespace_14d36171baccf528
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5a3a
// Size: 0xc
function despawnagent() {
    function_7056963336f2bbec(1);
}

// Namespace namespace_fb05e1623b934e8/namespace_14d36171baccf528
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5a4d
// Size: 0xd1
function getaverageorigin(ent_array) {
    var_d8de9486a89d3332 = (0, 0, 0);
    if (!ent_array.size) {
        return undefined;
    }
    foreach (ent in ent_array) {
        var_d8de9486a89d3332 = var_d8de9486a89d3332 + ent.origin;
    }
    var_16c3b0338e3e0298 = int(var_d8de9486a89d3332[0] / ent_array.size);
    var_16c3b1338e3e04cb = int(var_d8de9486a89d3332[1] / ent_array.size);
    var_16c3b2338e3e06fe = int(var_d8de9486a89d3332[2] / ent_array.size);
    var_d8de9486a89d3332 = (var_16c3b0338e3e0298, var_16c3b1338e3e04cb, var_16c3b2338e3e06fe);
    return var_d8de9486a89d3332;
}

// Namespace namespace_fb05e1623b934e8/namespace_14d36171baccf528
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5b26
// Size: 0x37
function function_9ec5f9cfc835208e() {
    if (namespace_3c37cb17ade254d::issharedfuncdefined("dmz_threat_bias", "init")) {
        level thread [[ namespace_3c37cb17ade254d::getsharedfunc("dmz_threat_bias", "init") ]]();
    } else {
        level thread function_b54b8baa376d3dbb();
    }
}

// Namespace namespace_fb05e1623b934e8/namespace_14d36171baccf528
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5b64
// Size: 0x162
function function_b54b8baa376d3dbb() {
    level.var_e354254e70a6b849 = [];
    level.var_e354254e70a6b849[level.var_e354254e70a6b849.size] = "hs";
    level.var_e354254e70a6b849[level.var_e354254e70a6b849.size] = "sc";
    namespace_14d36171baccf528::function_841f001ae930b5e4("enemy");
    namespace_14d36171baccf528::function_841f001ae930b5e4("huntSquad");
    namespace_14d36171baccf528::function_841f001ae930b5e4("ai_phalanx");
    namespace_14d36171baccf528::function_841f001ae930b5e4("ai_black_mous");
    namespace_14d36171baccf528::function_841f001ae930b5e4("ai_white_lotus");
    namespace_14d36171baccf528::function_841f001ae930b5e4("player_hs0_sc0");
    namespace_14d36171baccf528::function_841f001ae930b5e4("player_hs1_sc0");
    namespace_14d36171baccf528::function_841f001ae930b5e4("player_hs0_sc1");
    namespace_14d36171baccf528::function_841f001ae930b5e4("player_hs1_sc1");
    function_3acce87fed325c8f("huntSquad", "enemy");
    function_3acce87fed325c8f("enemy", "huntSquad");
    function_3acce87fed325c8f("player_hs1_sc0", "huntSquad");
    function_3acce87fed325c8f("player_hs1_sc1", "huntSquad");
    var_55daed3b1eccb970 = getdvarint(@"hash_4620216a9470ae72", -5000);
    function_b5ff3bfb184d0d01("enemy", "Drone", var_55daed3b1eccb970);
    function_b5ff3bfb184d0d01("huntSquad", "Drone", var_55daed3b1eccb970);
    if (namespace_3c37cb17ade254d::issharedfuncdefined("dmz_threat_bias", "customNationality")) {
        level thread [[ namespace_3c37cb17ade254d::getsharedfunc("dmz_threat_bias", "customNationality") ]]();
    }
    level thread function_255e967912274247();
}

// Namespace namespace_fb05e1623b934e8/namespace_14d36171baccf528
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5ccd
// Size: 0x60
function function_255e967912274247() {
    level waittill("matchStartTimer_done");
    foreach (player in level.players) {
        namespace_14d36171baccf528::function_3a458af8ab69f4e(player);
    }
}

// Namespace namespace_fb05e1623b934e8/namespace_14d36171baccf528
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5d34
// Size: 0x13
function function_841f001ae930b5e4(group) {
    createthreatbiasgroup(group);
}

// Namespace namespace_fb05e1623b934e8/namespace_14d36171baccf528
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5d4e
// Size: 0x81
function function_58203c3739d2d0c6(agent, group, var_33d9708e7f06d603) {
    if (!isdefined(agent)) {
        return;
    }
    if (istrue(agent.var_daf4907411a07a6c)) {
        return;
    }
    if (isagent(agent)) {
        agent setthreatbiasgroup(group);
    } else if (isint(agent)) {
        package = function_2b0e82156fa6075b(agent);
        package.threatbiasgroup = group;
    }
    if (istrue(var_33d9708e7f06d603)) {
        agent.var_daf4907411a07a6c = 1;
    }
}

// Namespace namespace_fb05e1623b934e8/namespace_14d36171baccf528
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5dd6
// Size: 0x22
function function_ca2adce5c7865c20(player, group) {
    if (!isdefined(player)) {
        return;
    }
    player setthreatbiasgroup(group);
}

// Namespace namespace_fb05e1623b934e8/namespace_14d36171baccf528
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5dff
// Size: 0x38
function function_b5ff3bfb184d0d01(var_e59027b19d80c1eb, var_e59028b19d80c41e, bias) {
    if (!isdefined(var_e59027b19d80c1eb) || !isdefined(var_e59028b19d80c41e)) {
        return;
    }
    if (!isdefined(bias)) {
        return;
    }
    setthreatbias(var_e59027b19d80c1eb, var_e59028b19d80c41e, bias);
}

// Namespace namespace_fb05e1623b934e8/namespace_14d36171baccf528
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5e3e
// Size: 0x29
function function_3acce87fed325c8f(var_b3962262ba71d0ad, var_32a96bf508fbd2f) {
    if (!isdefined(var_b3962262ba71d0ad) || !isdefined(var_32a96bf508fbd2f)) {
        return;
    }
    setignoremegroup(var_b3962262ba71d0ad, var_32a96bf508fbd2f);
}

// Namespace namespace_fb05e1623b934e8/namespace_14d36171baccf528
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5e6e
// Size: 0x21
function function_46c0de7595d8cab2(player, group) {
    return player.var_c6f91882127b4281[group];
}

// Namespace namespace_fb05e1623b934e8/namespace_14d36171baccf528
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5e97
// Size: 0x2b
function function_ab491b16f8423c8e(player, group, status) {
    player.var_c6f91882127b4281[group] = status;
}

// Namespace namespace_fb05e1623b934e8/namespace_14d36171baccf528
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5ec9
// Size: 0x7e
function function_ed5140c225d4f337(player) {
    groupname = "player";
    foreach (group in level.var_e354254e70a6b849) {
        groupname = groupname + "_" + group + function_46c0de7595d8cab2(player, group);
    }
    return groupname;
}

// Namespace namespace_fb05e1623b934e8/namespace_14d36171baccf528
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5f4f
// Size: 0x91
function function_3a458af8ab69f4e(player) {
    player.var_c6f91882127b4281 = [];
    foreach (group in level.var_e354254e70a6b849) {
        player.var_c6f91882127b4281[group] = 1;
    }
    var_cc91f3eaeb2c809c = function_ed5140c225d4f337(player);
    function_ca2adce5c7865c20(player, var_cc91f3eaeb2c809c);
}

// Namespace namespace_fb05e1623b934e8/namespace_14d36171baccf528
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5fe7
// Size: 0x27
function function_1bca33010b895b0b(nationality) {
    switch (nationality) {
    case #"hash_19b89634f50eeda4":
        return "sc";
        break;
    }
}

