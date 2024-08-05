#using scripts\common\values.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\callbacks.gsc;
#using scripts\common\utility.gsc;
#using script_2669878cf5a1b6bc;
#using script_24fbedba9a7a1ef4;
#using script_7c40fa80892a721;
#using script_371b4c2ab5861e62;
#using scripts\engine\trace.gsc;
#using scripts\cp_mp\utility\debug_utility.gsc;
#using scripts\common\ai.gsc;

#namespace agent_utils;

// Namespace agent_utils / namespace_14d36171baccf528
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa3c
// Size: 0x176
function overridetier1(agent) {
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
    grenade_type = undefined;
    grenadeammo = 0;
    var_7615a935cb1261ef = getdvarint(@"hash_261e9ce11934ffae", 50);
    if (randomintrange(0, 100) < var_7615a935cb1261ef) {
        if (isdefined(level.var_39643776a698efce)) {
            grenade_type = agent [[ level.var_39643776a698efce ]](1);
        } else {
            var_7e1ff9afa225e8a1 = ["semtex_mp", "frag_grenade_mp", "gas_mp"];
            grenade_type = random(var_7e1ff9afa225e8a1);
        }
        grenadeammo = getdvarint(@"hash_31607c7b3be624df", 1);
    }
    armor = getdvarint(@"hash_82ad0eab483e9f5a", 0);
    if (agent.var_7cea08b66b2ad878 < 0) {
        agent.var_7cea08b66b2ad878 = 0;
    }
    helmet = undefined;
    agent function_c37c4f9d687074ff(body, head, weapon, grenade_type, grenadeammo, armor);
    agentpers_setagentpersdata(agent, "tier", 1);
    agent.baseaccuracy = getdvarfloat(@"hash_8aa5333ca3f377e5", 0.66);
}

// Namespace agent_utils / namespace_14d36171baccf528
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xbba
// Size: 0x12c
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
    tbgroup = prefix + postfix;
    if (postfix == "") {
        return;
    }
    if (!threatbiasgroupexists(tbgroup)) {
        createthreatbiasgroup(tbgroup);
        function_ad06babcffc3a43b(tbgroup);
    }
    agent setthreatbiasgroup(tbgroup);
}

// Namespace agent_utils / namespace_14d36171baccf528
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xcee
// Size: 0x36
function function_ad06babcffc3a43b(tbgroup) {
    setthreatbias(tbgroup, "Drone", getdvarint(@"hash_4620216a9470ae72", -5000));
    if (issubstr(tbgroup, "tier1")) {
    }
}

// Namespace agent_utils / namespace_14d36171baccf528
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xd2c
// Size: 0x17c
function overridetier2(agent) {
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
        grenade_type = agent [[ level.var_39643776a698efce ]](2);
    } else {
        var_7e1ff9afa225e8a1 = ["semtex_mp", "frag_grenade_mp", "smoke_grenade_mp", "concussion_grenade_mp", "flash_grenade_mp", "gas_mp", "decoy_grenade_mp"];
        grenade_type = random(var_7e1ff9afa225e8a1);
    }
    grenadeammo = getdvarint(@"hash_31607d7b3be62712", 2);
    armor = getdvarint(@"hash_82ad0dab483e9d27", 100);
    if (agent.var_7cea08b66b2ad878 < 0) {
        agent.var_7cea08b66b2ad878 = 1;
    }
    helmet = level.var_6855c201495094b6["tier2"];
    agent function_c37c4f9d687074ff(body, head, weapon, grenade_type, grenadeammo, armor, helmet);
    agentpers_setagentpersdata(agent, "tier", 2);
    agent.baseaccuracy = getdvarfloat(@"hash_8aa5303ca3f3714c", 0.9);
}

// Namespace agent_utils / namespace_14d36171baccf528
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xeb0
// Size: 0x1bd
function overridetier3(agent, noweaponchange) {
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
        grenade_type = agent [[ level.var_39643776a698efce ]](3);
    } else {
        var_7e1ff9afa225e8a1 = ["thermite_mp", "semtex_mp", "frag_grenade_mp", "smoke_grenade_mp", "concussion_grenade_mp", "flash_grenade_mp", "snapshot_grenade_mp", "gas_mp", "decoy_grenade_mp"];
        grenade_type = random(var_7e1ff9afa225e8a1);
    }
    grenadeammo = getdvarint(@"hash_31607e7b3be62945", 4);
    armor = getdvarint(@"hash_82ad0cab483e9af4", 250);
    if (iscp()) {
        agent.var_7cea08b66b2ad878 = 0;
    } else if (agent.var_7cea08b66b2ad878 < 0) {
        agent.var_7cea08b66b2ad878 = 2;
    }
    helmet = level.var_6855c201495094b6["tier3"];
    agent function_c37c4f9d687074ff(body, head, weapon, grenade_type, grenadeammo, armor, helmet);
    agentpers_setagentpersdata(agent, "tier", 3);
    agent.baseaccuracy = getdvarfloat(@"hash_8aa5313ca3f3737f", 1.3);
    agent.var_cbd87a0bc497b778 = 1;
}

// Namespace agent_utils / namespace_14d36171baccf528
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1075
// Size: 0x37e
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
    geartype = var_57accdc40b2f50e[3];
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
    if (isdefined(geartype)) {
        agent setclothtype(geartype);
    }
    var_40e4760e91ebbfb8 = ["thermite_mp", "semtex_mp", "smoke_grenade_mp", "concussion_grenade_mp", "flash_grenade_mp", "gas_mp"];
    grenade_type = function_ba0801276542946b(var_40e4760e91ebbfb8);
    grenadeammo = getdvarint(@"hash_537fa443ce212a8a", 3);
    agent.baseaccuracy *= getdvarfloat(@"hash_54eaf02373da456d", 2);
    agent agent_sethealth(int(agent.health * getdvarfloat(@"hash_14fc69230fc4ed30", 1.33)));
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

// Namespace agent_utils / namespace_14d36171baccf528
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x13fb
// Size: 0x114
function function_5ca105062ad7729(agenttype, var_84ecaeab58167d39) {
    switch (var_84ecaeab58167d39) {
    case 1: 
        headmodel = random(["head_sp_opforce_grunt_var_01_civ_nohair", "head_sp_opforce_grunt_var_01_civ_nohair", "head_sp_opforce_grunt_var_01_civ_nohair", "head_sp_opforce_grunt_var_01_civ_nohair", "head_sp_opforce_al_qatala_ar_2_1"]);
        clothtype = "flowing";
        geartype = "strapsgr";
        return ["body_sp_opforce_al_qatala_tier_1_hardened_1_1", headmodel, clothtype, geartype];
    case 2: 
        clothtype = "vestlight";
        geartype = "millghtgr";
        return ["body_sp_opforce_al_qatala_tier_2_hardened_1_1", undefined, clothtype, geartype];
    case 3: 
        clothtype = "vestheavy";
        geartype = "milmedgr";
        return ["body_sp_opforce_al_qatala_tier_3_hardened_1_1", undefined, clothtype, geartype];
    }
    return [undefined, undefined];
}

// Namespace agent_utils / namespace_14d36171baccf528
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1518
// Size: 0x23a
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
    } else if (getdvar(@"hash_7611a2790a0bf7fe", "br") == "dmz") {
        agentpers_setagentpersdata(agent, "dropWeapon", 0);
    }
    if (getdvarint(@"hash_60645ea7f5bb11f6", 1) == 1) {
        agent.var_2d670e4d288c86fb = 1;
    } else {
        agent.var_2d670e4d288c86fb = 0;
    }
    body = undefined;
    head = undefined;
    grenade_type = function_ba0801276542946b();
    grenadeammo = getdvarint(@"hash_537fa443ce212a8a", 4);
    if (isdefined(level.var_5463147f04a33d36)) {
        armor = level.var_5463147f04a33d36;
    }
    armor = 2500;
    helmethealth = getdvarint(@"hash_4cea285ee071705e", 2500);
    agent.var_895dae193cfaac3a = 1;
    agent function_c37c4f9d687074ff(body, head, weapon, grenade_type, grenadeammo, armor, helmethealth, 0);
    agent.var_98add129a7ecb962 = 0;
    agent.allowpain = 1;
    if (isdefined(level.var_87deb8f6a4c7d50e)) {
        agent.var_2626d6897d71b728 = level.var_87deb8f6a4c7d50e;
    }
    agent.var_f2a62f02827daaa5 = 1;
    agent.baseaccuracy = getdvarfloat(@"hash_bf81930e3ff6d7eb", 1.2);
}

// Namespace agent_utils / namespace_14d36171baccf528
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x175a
// Size: 0xa7
function overrideriotshield(agent) {
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

// Namespace agent_utils / namespace_14d36171baccf528
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1809
// Size: 0x123
function function_77ffe273ea3ec3a3(agent, noweaponchange) {
    if (!isdefined(agent)) {
        return;
    }
    body = "body_mp_eastern_velikan_1_1";
    head = "head_mp_eastern_velikan_1_1";
    weapon = undefined;
    if (!istrue(noweaponchange)) {
        weapon = namespace_e0ee43ef2dddadaa::buildweapon("iw9_lm_mkilo3_mp", ["none", "none", "none", "none", "none", "none"], "none", "none");
    }
    grenade_type = function_ba0801276542946b();
    grenadeammo = getdvarint(@"hash_537fa443ce212a8a", 4);
    armor = 3000;
    helmet = 1;
    agent function_c37c4f9d687074ff(body, head, weapon, grenade_type, grenadeammo, armor, helmet, 0);
    agent.var_f2a62f02827daaa5 = 1;
    agent.baseaccuracy = getdvarfloat(@"hash_298d4ea8b0934e31", 1.2);
}

// Namespace agent_utils / namespace_14d36171baccf528
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1934
// Size: 0xe3
function function_852d353c00b3d5a1(agent, noweaponchange) {
    if (!isdefined(agent)) {
        return;
    }
    if (isint(agent)) {
        return;
    }
    body = "body_mp_eastern_rodion_7_1";
    head = "head_mp_eastern_rodion_7_1";
    weapon = undefined;
    grenade_type = "smoke_grenade_mp";
    grenadeammo = getdvarint(@"hash_96aa0c082c47cdcc", 4);
    armor = 500;
    helmet = level.var_6855c201495094b6["tier3"];
    agent function_c37c4f9d687074ff(undefined, undefined, weapon, grenade_type, grenadeammo, armor, helmet);
    agentpers_setagentpersdata(agent, "tier", 3);
    agent.baseaccuracy = getdvarfloat(@"hash_8aa5313ca3f3737f", 1.1);
}

// Namespace agent_utils / namespace_14d36171baccf528
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1a1f
// Size: 0x2e9
function overridespecial(agent, weaponstyle) {
    body = "body_mp_milsim_balkan_sf_1_1";
    head = "head_mp_milsim_balkan_sf_1_1";
    weapon = namespace_e0ee43ef2dddadaa::buildweapon("iw9_sm_aviktor_mp", ["thermal01", "none", "none", "none", "silencer01_sm", "laserirsmg"], "none", "none");
    grenade_type = "frag_grenade_mp";
    if (!isdefined(weaponstyle)) {
        weaponstyle = random(["smg", "shotgun", "sniper"]);
    }
    switch (weaponstyle) {
    case #"hash_23209741b93850b5": 
        body = "body_mp_eastern_nikto_2_1";
        head = "head_mp_eastern_nikto_3_1";
        weapon = namespace_e0ee43ef2dddadaa::buildweapon("iw9_sh_charlie725_mp", ["none", "none", "none", "none", "none", "none"], "none", "none");
        grenade_type = "molotov_mp";
        break;
    case #"hash_6191aaef9f922f96": 
        body = "body_mp_eastern_azur_8_1";
        head = "head_mp_eastern_azur_8_1";
        weapon = namespace_e0ee43ef2dddadaa::buildweapon("iw8_sn_alpha50_mp", ["none", "none", "none", "laserir", "none", "none"], "none", "none");
        grenade_type = "frag_grenade_mp";
        break;
    case #"hash_900cb96c552c5e8e": 
        body = "body_mp_eastern_rodion_7_1";
        head = "head_mp_eastern_rodion_7_1";
        weapon = namespace_e0ee43ef2dddadaa::buildweapon("iw9_sm_aviktor", ["thermal01", "none", "none", "none", "silencer01_sm", "laserir_box"], "none", "none");
        grenade_type = "smoke_grenade_mp";
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
    agent function_c37c4f9d687074ff(body, head, weapon, grenade_type, grenadeammo, armor, helmet);
    if (scripts\engine\utility::issharedfuncdefined("ai", "dropLootOnAgentDeath")) {
        agent thread [[ scripts\engine\utility::getsharedfunc("ai", "dropLootOnAgentDeath") ]](agent, agent.agent_type, groupname);
    }
}

// Namespace agent_utils / namespace_14d36171baccf528
// Params 8, eflags: 0x0
// Checksum 0x0, Offset: 0x1d10
// Size: 0x2ed
function function_c37c4f9d687074ff(body, head, weapon, grenade_type, grenadeammo, armor, helmet, blockexecution) {
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
        old_pos = undefined;
        weaponname = undefined;
        if (isdefined(self.weapon)) {
            self takeweapon(self.weapon);
            weaponname = getcompleteweaponname(self.weapon);
            if (isdefined(self.weaponinfo[weaponname])) {
                old_pos = self.weaponinfo[weaponname].position;
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
        if (isdefined(self.a.weaponpos[old_pos])) {
            weaponname = getcompleteweaponname(self.weapon);
            self.weaponinfo[weaponname].position = old_pos;
            self.a.weaponpos[old_pos] = weapon;
        }
    }
    if (isdefined(grenade_type)) {
        if (!isdefined(level.var_e36af3bfa3484a15)) {
            level.var_e36af3bfa3484a15 = [];
        }
        if (!isdefined(level.var_e36af3bfa3484a15[grenade_type])) {
            level.var_e36af3bfa3484a15[grenade_type] = makeweapon(grenade_type);
        }
        self.grenadeweapon = level.var_e36af3bfa3484a15[grenade_type];
        if (!isdefined(grenadeammo)) {
            grenadeammo = 2;
        }
        self.grenadeammo = grenadeammo;
    }
    if (isdefined(armor)) {
        if (utility::iscp()) {
            if (armor > 0) {
                self.equip_armor = 1;
                self.armor_health = armor;
            }
        }
        self.armorhealth = int(armor);
        self.maxarmorhealth = int(armor);
        self.var_8c5c47f81a1869e5 = &namespace_daa149ca485fd50a::function_7d0d24665d72f13c;
    }
    if (isdefined(helmet)) {
        self.helmethealth = helmet;
        self.var_cfc69e5588a5bed6 = helmet;
        self.var_cd6a3a50f09688b9 = &namespace_daa149ca485fd50a::function_59ea6b2f800cb082;
    }
    if (istrue(blockexecution)) {
        function_1c3709e864d4e8d5(1);
    }
    if (isdefined(armor) && armor > 0) {
        function_1920867ddf76810c(self, armor);
    }
}

// Namespace agent_utils / namespace_14d36171baccf528
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2005
// Size: 0x89
function function_b535fe740f1cf507() {
    if (isdefined(self.armorhealth)) {
        var_4ef15edd83080359 = self.var_dcade5065ea1a44;
        if (!isdefined(var_4ef15edd83080359)) {
            var_4ef15edd83080359 = getdvarint(@"hash_a69c6853620fc61f", 200);
        }
        newhealth = min(self.armorhealth + var_4ef15edd83080359, self.maxarmorhealth);
        namespace_f8d3520d3483c1::setArmorHealth(newhealth);
        self.var_7cea08b66b2ad878 -= 1;
        self.var_27266ececc1bdbe5 = gettime();
    }
}

// Namespace agent_utils / namespace_14d36171baccf528
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2096
// Size: 0x45
function function_1c3709e864d4e8d5(bool) {
    if (bool) {
        self.blockexecution = 1;
        val::set("agent_blockExecution", "execution_victim", 0);
        return;
    }
    self.blockexecution = 0;
    val::reset_all("agent_blockExecution");
}

// Namespace agent_utils / namespace_14d36171baccf528
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x20e3
// Size: 0x165
function function_1920867ddf76810c(agent, armor) {
    if (issubstr(agent.agent_type, "riotshield")) {
        agent.var_9aa77ab756fdca82 = 0;
        agent.minpaindamage = 0;
        return;
    }
    if (issubstr(agent.agent_type, "tier3")) {
        agent.var_9aa77ab756fdca82 = 600;
        agent.var_43e2ad424676b8d4 = 1;
        agent.var_98add129a7ecb962 = 0;
        return;
    }
    if (isdefined(armor) && armor > 0) {
        var_17b4196235199ba8 = [0, 40, 80];
        var_bbd534a2a8d03eaa = random(var_17b4196235199ba8);
        agent.var_9aa77ab756fdca82 = 240 + var_bbd534a2a8d03eaa;
        agent.var_43e2ad424676b8d4 = 50;
        agent.var_98add129a7ecb962 = 0;
        return;
    }
    if (agent.var_d5e499e7fe2c490b) {
        agent.var_43e2ad424676b8d4 = 10;
        function_c00e1d676844f7ae(agent);
        return;
    }
    var_17b4196235199ba8 = [0, 50, 80];
    var_bbd534a2a8d03eaa = random(var_17b4196235199ba8);
    agent.var_9aa77ab756fdca82 = 100 + var_bbd534a2a8d03eaa;
    agent.var_43e2ad424676b8d4 = 10;
    agent.var_98add129a7ecb962 = 0;
}

// Namespace agent_utils / namespace_14d36171baccf528
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2250
// Size: 0x84
function function_c00e1d676844f7ae(agent) {
    if (issubstr(agent.agent_type, "tier1")) {
        agent.var_9aa77ab756fdca82 = 100;
        return;
    }
    if (issubstr(agent.agent_type, "tier2")) {
        agent.var_9aa77ab756fdca82 = 240;
        return;
    }
    if (issubstr(agent.agent_type, "tier3")) {
        agent.var_9aa77ab756fdca82 = 600;
    }
}

// Namespace agent_utils / namespace_14d36171baccf528
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x22dc
// Size: 0x4c
function function_ea83c1b372e16f6d(agent, var_80f4bde7090a4773) {
    if (isagent(agent)) {
        agent.var_80f4bde7090a4773 = var_80f4bde7090a4773;
        return;
    }
    if (isint(agent)) {
        level.var_879053468f168806[agent].var_80f4bde7090a4773 = var_80f4bde7090a4773;
    }
}

// Namespace agent_utils / namespace_14d36171baccf528
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2330
// Size: 0x8f
function function_ba0801276542946b(var_7e1ff9afa225e8a1) {
    if (isdefined(var_7e1ff9afa225e8a1)) {
        return random(var_7e1ff9afa225e8a1);
    }
    if (!isdefined(level.var_61312c4c9c8a7cae)) {
        level.var_61312c4c9c8a7cae = ["thermite_mp", "semtex_mp", "frag_grenade_mp", "smoke_grenade_mp", "concussion_grenade_mp", "flash_grenade_mp", "snapshot_grenade_mp", "gas_mp", "decoy_grenade_mp"];
    }
    return random(level.var_61312c4c9c8a7cae);
}

// Namespace agent_utils / namespace_14d36171baccf528
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x23c8
// Size: 0x7a
function function_f5d160902133558() {
    assert(isdefined(level.agentarray));
    level.var_d7b3bd9ad64c74b = [];
    foreach (agent in level.agentarray) {
        level.var_d7b3bd9ad64c74b[agent getentitynumber()] = [];
    }
}

// Namespace agent_utils / namespace_14d36171baccf528
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x244a
// Size: 0x25
function function_d0563dc9eeac7ff0(agent) {
    if (!isdefined(level.var_d7b3bd9ad64c74b)) {
        function_f5d160902133558();
    }
    return agent getentitynumber();
}

// Namespace agent_utils / namespace_14d36171baccf528
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2478
// Size: 0x43
function agentpers_setagentpersdata(agent, key, value) {
    if (!isdefined(level.var_d7b3bd9ad64c74b)) {
        function_f5d160902133558();
    }
    level.var_d7b3bd9ad64c74b[agent getentitynumber()][key] = value;
}

// Namespace agent_utils / namespace_14d36171baccf528
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x24c3
// Size: 0x39
function agentpers_getagentpersdata(agent, key) {
    if (!isdefined(level.var_d7b3bd9ad64c74b)) {
        function_f5d160902133558();
    }
    return level.var_d7b3bd9ad64c74b[agent getentitynumber()][key];
}

// Namespace agent_utils / namespace_14d36171baccf528
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2505
// Size: 0x32
function function_b894b8689a6055f3(agent) {
    if (!isdefined(level.var_d7b3bd9ad64c74b)) {
        function_f5d160902133558();
    }
    return level.var_d7b3bd9ad64c74b[agent getentitynumber()].size == 0;
}

// Namespace agent_utils / namespace_14d36171baccf528
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2540
// Size: 0x31
function function_51de6da7b0dcf26f(agent) {
    if (!isdefined(level.var_d7b3bd9ad64c74b)) {
        function_f5d160902133558();
    }
    level.var_d7b3bd9ad64c74b[agent getentitynumber()] = [];
}

// Namespace agent_utils / namespace_14d36171baccf528
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2579
// Size: 0x48
function function_3bdeb9edd6c6f0a() {
    level.var_c7796321c3d97413 = [];
    level.var_c7796321c3d97413[1] = ["firebug"];
    level.var_c7796321c3d97413[2] = [];
    level.var_c7796321c3d97413[3] = ["strikeunit"];
}

// Namespace agent_utils / namespace_14d36171baccf528
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x25c9
// Size: 0x2e5
function function_c26ef480e88413bf(agent, aitype) {
    if (issubstr(aitype, "firebug")) {
        agent thread function_36613ffb5ebe56(agent);
        return;
    }
    if (issubstr(aitype, "strike")) {
        agent thread function_9ca698cdffe22968(agent);
        return;
    }
    if (getdvarint(@"hash_b0e7edf188ddb934", 0) == 1 && !issubstr(aitype, "riotshield") && issubstr(aitype, "biolab")) {
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
        return;
    }
    if (agent.subclass == "tier1") {
        agent.var_4268b42fc89d0be9 = getdvarfloat(@"hash_6f6b0fce63d51e11", 0.07);
        agent.var_8a783f4c73c2ae91 = getdvarfloat(@"hash_2e0c4c6766ac7ffe", 0.00015);
        return;
    }
    if (agent.subclass == "tier2") {
        agent.var_4268b42fc89d0be9 = getdvarfloat(@"hash_6f6b0cce63d51778", 0.05);
        agent.var_8a783f4c73c2ae91 = getdvarfloat(@"hash_2e0c4b6766ac7dcb", 0.0001);
        return;
    }
    if (agent.subclass == "tier3") {
        agent.suppressionthreshold = 0.5;
        agent.suppressiondecrement = 0.15;
        agent.var_2a4784c6cc07ca59 = 0.05;
        agent.var_4268b42fc89d0be9 = getdvarfloat(@"hash_6f6b0dce63d519ab", 0.04);
        agent.var_8a783f4c73c2ae91 = getdvarfloat(@"hash_2e0c4a6766ac7b98", 5e-05);
        agent.aggressivemode = 1;
    }
}

// Namespace agent_utils / namespace_14d36171baccf528
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x28b6
// Size: 0x297
function function_36613ffb5ebe56(agent) {
    agent endon("death");
    agent endon("stop_throwing");
    standardwaittime = 0.5;
    grenadetype = "molotov_mp";
    grenades = 8;
    var_b98850b58450bf4b = gettime();
    namespace_14d36171baccf528::agentpers_setagentpersdata(self, "throwingScriptGrenade", 0);
    namespace_14d36171baccf528::function_c37c4f9d687074ff(undefined, undefined, undefined, grenadetype, grenades);
    level thread function_d3f59232689f12a0(agent);
    while (true) {
        if (gettime() >= var_b98850b58450bf4b) {
            if (!isdefined(agent.enemy)) {
                wait standardwaittime;
                continue;
            }
            if (isdefined(self.node) && distancesquared(self.origin, self.node.origin) > 1048576 || isdefined(self.pathgoalpos)) {
                wait standardwaittime;
                continue;
            }
            disttoenemy = distancesquared(agent.origin, agent.enemy.origin);
            if (disttoenemy < 65536 || disttoenemy > 2250000) {
                wait standardwaittime;
                continue;
            }
            if (!agent cansee(agent.enemy)) {
                wait standardwaittime;
                continue;
            }
            starttrace = agent.origin;
            endtrace = starttrace + (0, 0, 128);
            trace = scripts\engine\trace::ray_trace(starttrace, endtrace, agent);
            if (trace["hittype"] != "hittype_none" && isdefined(trace["position"])) {
                wait standardwaittime;
                continue;
            }
            starttrace = agent.origin + (0, 0, 100);
            vect = vectornormalize(agent.enemy.origin - starttrace);
            vect = (vect[0], vect[1], 0) + (0, 0, 1);
            endtrace = starttrace + vect * 1000;
            trace = scripts\engine\trace::ray_trace(starttrace, endtrace, agent);
            if (trace["hittype"] != "hittype_none" && isdefined(trace["position"])) {
                wait standardwaittime;
                continue;
            }
            agent thread function_ae99616202575e39(agent.enemy.origin, grenadetype, 64);
            var_b98850b58450bf4b = gettime() + randomintrange(2, 3) * 1000;
            grenades--;
        }
        if (grenades == 0) {
            return;
        }
        wait standardwaittime;
    }
}

// Namespace agent_utils / namespace_14d36171baccf528
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2b55
// Size: 0x13f
function function_d3f59232689f12a0(agent) {
    killer, meansofdeath = agent waittill("death");
    var_c524724829b57a7e = agent doinglongdeath();
    if (!var_c524724829b57a7e && namespace_14d36171baccf528::agentpers_getagentpersdata(agent, "throwingScriptGrenade")) {
        right = anglestoright(agent.angles);
        grenadelocation = agent.origin + anglestoforward(agent.angles) * 5 + right * 20 + (0, 0, 60);
        throwvect = (0, 0, 200) + right * randomfloatrange(-100, 100);
        grenade = agent launchgrenade("molotov_mp", grenadelocation, throwvect);
        grenade.var_88fe704adf00eadf = 1;
        grenade.owner = agent;
        wait 0.1;
        if (scripts\engine\utility::issharedfuncdefined("pyro", "molotov_used")) {
            agent thread [[ scripts\engine\utility::getsharedfunc("pyro", "molotov_used") ]](grenade);
        }
        wait 1;
        grenade notify("missile_stuck");
    }
}

// Namespace agent_utils / namespace_14d36171baccf528
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2c9c
// Size: 0x4b4
function function_9ca698cdffe22968(agent, var_37d7c6423323a19e) {
    agent endon("death");
    agent endon("stop_throwing");
    standardwaittime = 0.5;
    grenadetype = "smoke_grenade_mp";
    grenades = 8;
    var_b98850b58450bf4b = gettime();
    namespace_14d36171baccf528::agentpers_setagentpersdata(self, "throwingScriptGrenade", 0);
    if (!istrue(var_37d7c6423323a19e)) {
        agent.baseaccuracy = getdvarfloat(@"hash_8aa5313ca3f3737f", 1.1);
        armor = 500;
        helmet = level.var_6855c201495094b6["tier3"];
        weapon = namespace_e0ee43ef2dddadaa::buildweapon("iw9_ar_mike4_mp", ["laserbox_hip04", "none", "none", "none", "silencer01_ar", "none"], "none", "none");
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
    while (true) {
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
                wait standardwaittime;
                continue;
            }
            if (isdefined(agent function_92435c7a6ae85c3c())) {
                wait standardwaittime;
                continue;
            }
            if (isdefined(self.node) && distancesquared(self.origin, self.node.origin) > 1048576 || isdefined(self.pathgoalpos)) {
                wait standardwaittime;
                continue;
            }
            disttoenemy = distancesquared(agent.origin, agent.enemy.origin);
            if (disttoenemy < 16384 || disttoenemy > 1960000) {
                wait standardwaittime;
                continue;
            }
            if (!agent cansee(agent.enemy)) {
                wait standardwaittime;
                continue;
            }
            starttrace = agent.origin;
            endtrace = starttrace + (0, 0, 128);
            trace = scripts\engine\trace::ray_trace(starttrace, endtrace, agent);
            if (trace["hittype"] != "hittype_none" && isdefined(trace["position"])) {
                wait standardwaittime;
                continue;
            }
            starttrace = agent.origin + (0, 0, 100);
            vect = vectornormalize(agent.enemy.origin - starttrace);
            vect = (vect[0], vect[1], 0) + (0, 0, 1);
            endtrace = starttrace + vect * 1000;
            trace = scripts\engine\trace::ray_trace(starttrace, endtrace, agent);
            if (trace["hittype"] != "hittype_none" && isdefined(trace["position"])) {
                wait standardwaittime;
                continue;
            }
            toenemy = vectornormalize(agent.enemy.origin - agent.origin);
            disttoenemy = sqrt(disttoenemy);
            halfdist = disttoenemy / 2;
            targetorigin = agent.origin + toenemy * halfdist + (0, 0, 32);
            agent thread function_ae99616202575e39(targetorigin, grenadetype, 128);
            var_b98850b58450bf4b = gettime() + randomintrange(2, 5) * 1000;
            grenades--;
        }
        if (grenades == 0) {
            return;
        }
        wait standardwaittime;
    }
}

// Namespace agent_utils / namespace_14d36171baccf528
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3158
// Size: 0x21
function turnonlaser() {
    wait 1;
    while (true) {
        self laseron();
        wait 3;
        self laseroff();
        wait 3;
    }
}

// Namespace agent_utils / namespace_14d36171baccf528
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x3181
// Size: 0x129
function function_ae99616202575e39(targetorigin, grenadetype, offsetdist) {
    self endon("death");
    namespace_14d36171baccf528::agentpers_setagentpersdata(self, "throwingScriptGrenade", 1);
    if (isdefined(offsetdist)) {
        offsetdist = min(abs(offsetdist), 256);
        targetorigin += (randomfloatrange(-1 * offsetdist, offsetdist), randomfloatrange(-1 * offsetdist, offsetdist), randomfloatrange(-1 * offsetdist, offsetdist));
    }
    var_57acbdc40b2f2db = function_cf56c061947ef668(self.origin, targetorigin);
    offsetvect = var_57acbdc40b2f2db[2];
    var_7adb38055d0917f = var_57acbdc40b2f2db[1];
    animname = var_57acbdc40b2f2db[0];
    var_57ad0dc40b2fdda = function_a615009e6466353a(self, targetorigin, grenadetype, offsetvect);
    throwvect = var_57ad0dc40b2fdda[1];
    launchpos = var_57ad0dc40b2fdda[0];
    self.var_ca01d1496480b62c = targetorigin;
    self.var_624efed57c34c807 = throwvect;
    function_4cb4bb1cff15b987();
    self.var_ca01d1496480b62c = undefined;
    self.var_624efed57c34c807 = undefined;
}

// Namespace agent_utils / namespace_14d36171baccf528
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x32b2
// Size: 0x9d
function function_4cb4bb1cff15b987() {
    timeoutnotify = "ai_forceThrowGrenade_timeout";
    finishnotify = "ai_forceThrowGrenade_finish";
    ctimeout = 6;
    self endon(timeoutnotify);
    childthread function_d34200a799950385(ctimeout, timeoutnotify, finishnotify);
    while (!istrue(self.isholdinggrenade) && isdefined(self.var_ca01d1496480b62c)) {
        waitframe();
    }
    namespace_14d36171baccf528::agentpers_setagentpersdata(self, "throwingScriptGrenade", 1);
    while (istrue(self.isholdinggrenade) && isdefined(self.var_ca01d1496480b62c)) {
        waitframe();
    }
    namespace_14d36171baccf528::agentpers_setagentpersdata(self, "throwingScriptGrenade", 0);
    self notify(finishnotify);
}

// Namespace agent_utils / namespace_14d36171baccf528
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x3357
// Size: 0x24
function function_d34200a799950385(t, notifyname, endonname) {
    self endon(endonname);
    wait t;
    self notify(notifyname);
}

// Namespace agent_utils / namespace_14d36171baccf528
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x3383
// Size: 0x68
function private function_e4e4fefd625a2580(agent) {
    if (isdefined(agent.node)) {
        assert(isdefined(agent.node.angles));
        return anglestoforward(agent.node.angles);
    }
    return anglestoforward(agent.angles);
}

// Namespace agent_utils / namespace_14d36171baccf528
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x33f3
// Size: 0xb7
function function_a615009e6466353a(thrower, targetorigin, grenadetype, var_55fba01075efacdb) {
    offset = (0, 0, 100);
    if (isdefined(var_55fba01075efacdb)) {
        offset = var_55fba01075efacdb;
    }
    launchpos = thrower.origin + offset;
    throwvect = targetorigin - launchpos;
    throwvect = vectornormalize(throwvect);
    throwvect = (throwvect[0], throwvect[1], 0) + (0, 0, 1);
    dist = distance2d(launchpos, targetorigin);
    throwvect = throwvect * dist * function_1bc68105415d304(grenadetype, dist);
    return [launchpos, throwvect];
}

// Namespace agent_utils / namespace_14d36171baccf528
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x34b3
// Size: 0x13
function function_ee72700f22a0e304(thrower, grenadetype) {
    
}

// Namespace agent_utils / namespace_14d36171baccf528
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x34ce
// Size: 0x85
function private function_1bc68105415d304(grenade_type, distancetotarget) {
    switch (grenade_type) {
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
    }
}

// Namespace agent_utils / namespace_14d36171baccf528
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x355b
// Size: 0xa8
function function_cf56c061947ef668(sourceorigin, targetorigin) {
    var_6647d06f6e45486c = distance2dsquared(self.origin, targetorigin);
    if (var_6647d06f6e45486c < 262144) {
        return ["grenade_throw_short", 0.6, (0, 10, 50)];
    } else {
        return ["grenade_throw", 0.5, (0, 0, 100)];
    }
    return ["grenade_throw", 0.5, (0, 0, 100)];
}

// Namespace agent_utils / namespace_14d36171baccf528
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x360c
// Size: 0x2a7
function function_13812f40f38587c4(agenttype, origin, var_451a9d27d63c746b) {
    infopackage = function_2b0e82156fa6075b(var_451a9d27d63c746b);
    function_760792071513b00d(var_451a9d27d63c746b);
    if (!isdefined(infopackage)) {
        println("<dev string:x1c>");
        return;
    }
    aitype = infopackage.aitype;
    origin = infopackage.origin;
    angles = infopackage.angles;
    priority = function_72d6808216b4d44(infopackage.priority);
    category = infopackage.category;
    subcategory = infopackage.subcategory;
    groupname = infopackage.groupname;
    team = function_30a0d7ca3fae40cc(undefined, infopackage.aitype);
    destination = undefined;
    poiname = infopackage.poi;
    skipstealth = infopackage.skipstealth;
    behaviorpackage = infopackage.behaviorpackage;
    var_80f4bde7090a4773 = infopackage.var_80f4bde7090a4773;
    spawnfunctions = infopackage.functionsonspawn;
    agentStruct = infopackage.agentStruct;
    threatbiasgroup = infopackage.threatbiasgroup;
    var_8a76b06617613d30 = getsharedfunc("ai_mp_controller", "ai_mp_requestSpawnAgent");
    agent = [[ var_8a76b06617613d30 ]](aitype, origin, angles, priority, category, subcategory, groupname, team, destination, poiname, skipstealth, 1, undefined, var_80f4bde7090a4773, undefined, undefined, threatbiasgroup);
    if (isdefined(agent)) {
        agent.behaviorpackage = behaviorpackage;
        function_3ea1225bf6192343(agent, agentStruct);
        behavior_executebehaviorpackage = getsharedfunc("ai_mp_controller", "behavior_executeBehaviorPackage");
        [[ behavior_executebehaviorpackage ]](agent);
        agent.functionsonspawn = spawnfunctions;
        function_e662189d61d1874e(agent);
        return;
    }
    if (isdefined(agentStruct)) {
        if (isdefined(agentStruct.group)) {
            [[ agentStruct.var_9e729433fd479f19 ]](agentStruct, var_451a9d27d63c746b);
            return;
        }
        if (isdefined(level.var_59cffb78293fe83c) && isdefined(level.var_59cffb78293fe83c.var_9e729433fd479f19)) {
            [[ level.var_59cffb78293fe83c.var_9e729433fd479f19 ]](agentStruct, var_451a9d27d63c746b);
        }
    }
}

// Namespace agent_utils / namespace_14d36171baccf528
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x38bb
// Size: 0x2ed
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
    skipstealth = !agent.stealth_enabled;
    behaviorpackage = agent.behaviorpackage;
    var_80f4bde7090a4773 = agent.var_80f4bde7090a4773;
    spawnfunctions = agent.functionsonspawn;
    agentStruct = function_12ee2283db699727(agent);
    if (isdefined(behaviorpackage) && behaviorpackage.behavior == "cqb" && isdefined(behaviorpackage.cqbnodes)) {
        foreach (node in behaviorpackage.cqbnodes) {
            if (isdefined(node)) {
                node.claimed = 0;
            }
        }
    }
    infopackage = function_e83d1f023a2609ff(aitype, origin, angles, priority, category, subcategory, groupname, team, destination, poiname, skipstealth, behaviorpackage, var_80f4bde7090a4773, spawnfunctions, agentStruct);
    function_7a9172605e0228df(var_451a9d27d63c746b, infopackage);
    subArea_findAndAssignForDormancyID = getsharedfunc("ai_mp_controller", "subArea_findAndAssignForDormancyID");
    [[ subArea_findAndAssignForDormancyID ]](origin, poiname, destination, var_451a9d27d63c746b);
    priority_setByDormancyId = getsharedfunc("ai_mp_controller", "priority_setByDormancyId");
    [[ priority_setByDormancyId ]](var_451a9d27d63c746b, priority);
    var_58f203b26c3a3f8a = getsharedfunc("ai_mp_controller", "ai_registerAgent");
    [[ var_58f203b26c3a3f8a ]](var_451a9d27d63c746b, category, subcategory, poiname);
    if (isdefined(agentStruct)) {
        if (isdefined(agentStruct.group)) {
            [[ agentStruct.var_90ccd093de8c8c55 ]](agent, var_451a9d27d63c746b);
            return;
        }
        if (isdefined(level.var_59cffb78293fe83c) && isdefined(level.var_59cffb78293fe83c.var_90ccd093de8c8c55)) {
            [[ level.var_59cffb78293fe83c.var_90ccd093de8c8c55 ]](agent, var_451a9d27d63c746b);
        }
    }
}

// Namespace agent_utils / namespace_14d36171baccf528
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3bb0
// Size: 0x94
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
    }
}

// Namespace agent_utils / namespace_14d36171baccf528
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3c4c
// Size: 0x80
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
    }
}

// Namespace agent_utils / namespace_14d36171baccf528
// Params 13, eflags: 0x0
// Checksum 0x0, Offset: 0x3cd4
// Size: 0xd0
function function_e2fa9b378bbf03a6(aitype, origin, angles, priority, category, subcategory, groupname, team, destination, poiname, skipstealth, behaviorpackage, threatbiasgroup) {
    priority = function_b6131256ee347e8d(priority);
    infopackage = function_e83d1f023a2609ff(aitype, origin, angles, priority, category, subcategory, groupname, team, destination, poiname, skipstealth, behaviorpackage, undefined, undefined, undefined, threatbiasgroup);
    var_451a9d27d63c746b = function_4476b9b75cb95d99(origin, aitype, priority);
    assert(var_451a9d27d63c746b >= 0, "We've run out of dormancy IDs!");
    function_7a9172605e0228df(var_451a9d27d63c746b, infopackage);
    return var_451a9d27d63c746b;
}

// Namespace agent_utils / namespace_14d36171baccf528
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3dad
// Size: 0x63
function function_b04c0433e8107615() {
    level.var_74e9c02b56e4ba52 = &function_13812f40f38587c4;
    level.var_8a42b71f799936ad = &function_9fa011b7807309a8;
    level.var_fe093e9b2b6c3751 = getdvarint(@"hash_320c4db6af00b215", 0);
    level.var_53db9bacadef066d = spawnstruct();
    level.var_53db9bacadef066d.var_d4053e1a1d2983ce = 0;
    level.var_879053468f168806 = [];
}

// Namespace agent_utils / namespace_14d36171baccf528
// Params 16, eflags: 0x0
// Checksum 0x0, Offset: 0x3e18
// Size: 0x175
function function_e83d1f023a2609ff(aitype, origin, angles, priority, category, subcategory, groupname, team, destination, poiname, skipstealth, behaviorpackage, var_80f4bde7090a4773, spawnfunctions, agentStruct, threatbiasgroup) {
    infopackage = spawnstruct();
    infopackage.aitype = aitype;
    infopackage.origin = origin;
    infopackage.angles = angles;
    infopackage.priority = function_b6131256ee347e8d(priority);
    infopackage.category = category;
    infopackage.subcategory = subcategory;
    infopackage.groupname = groupname;
    infopackage.team = team;
    infopackage.destination = destination;
    infopackage.poi = poiname;
    infopackage.skipstealth = skipstealth;
    infopackage.behaviorpackage = behaviorpackage;
    infopackage.var_80f4bde7090a4773 = var_80f4bde7090a4773;
    infopackage.functionsonspawn = spawnfunctions;
    infopackage.agentStruct = agentStruct;
    infopackage.threatbiasgroup = threatbiasgroup;
    return infopackage;
}

// Namespace agent_utils / namespace_14d36171baccf528
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3f96
// Size: 0x20
function function_7a9172605e0228df(var_451a9d27d63c746b, infopackage) {
    level.var_879053468f168806[var_451a9d27d63c746b] = infopackage;
}

// Namespace agent_utils / namespace_14d36171baccf528
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3fbe
// Size: 0x16
function function_2b0e82156fa6075b(var_451a9d27d63c746b) {
    return level.var_879053468f168806[var_451a9d27d63c746b];
}

// Namespace agent_utils / namespace_14d36171baccf528
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3fdd
// Size: 0x1f
function function_b27fe8a834c5edda() {
    assert(isdefined(level.var_879053468f168806));
    return level.var_879053468f168806.size;
}

// Namespace agent_utils / namespace_14d36171baccf528
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4005
// Size: 0x34
function function_3b45c895d8d984ee() {
    if (!isdefined(level.var_88655f45c7beb22a)) {
        level.var_88655f45c7beb22a = getdvarint(@"hash_ee8cf30f1e199e42", 200) - 1;
    }
    return level.var_88655f45c7beb22a;
}

// Namespace agent_utils / namespace_14d36171baccf528
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4042
// Size: 0xed
function function_4e065f1747aadd51(var_451a9d27d63c746b, category) {
    function_ee990c1808df152b(var_451a9d27d63c746b);
    infopackage = function_2b0e82156fa6075b(var_451a9d27d63c746b);
    if (istrue(level.var_45ca3cfb9dca4f97)) {
        level thread scripts\cp_mp\utility\debug_utility::drawsphere(infopackage.origin, 64, 500, (1, 0, 0));
    }
    if (isdefined(infopackage) && isdefined(infopackage.agentStruct)) {
        if (isdefined(infopackage.agentStruct.group)) {
            [[ infopackage.agentStruct.ondeath ]](var_451a9d27d63c746b);
        } else if (isdefined(level.var_59cffb78293fe83c) && isdefined(level.var_59cffb78293fe83c.ondeath)) {
            [[ level.var_59cffb78293fe83c.ondeath ]](var_451a9d27d63c746b);
        }
    }
    function_760792071513b00d(var_451a9d27d63c746b);
}

// Namespace agent_utils / namespace_14d36171baccf528
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4137
// Size: 0xbd
function function_760792071513b00d(var_451a9d27d63c746b, category) {
    if (!isdefined(category)) {
        category = function_2b0e82156fa6075b(var_451a9d27d63c746b).poi;
    }
    priorityfunc = getsharedfunc("ai_mp_controller", "priority_removeByDormancyId");
    [[ priorityfunc ]](var_451a9d27d63c746b);
    deregisterfunc = getsharedfunc("ai_mp_controller", "ai_deregisterAgent");
    [[ deregisterfunc ]](var_451a9d27d63c746b, category);
    subarea = level.var_879053468f168806[var_451a9d27d63c746b].subarea;
    if (isdefined(subarea)) {
        var_589fe1386325a0cc = getsharedfunc("ai_mp_controller", "subArea_removeAgentFrom");
        [[ var_589fe1386325a0cc ]](var_451a9d27d63c746b, subarea);
    }
    level.var_879053468f168806[var_451a9d27d63c746b] = undefined;
}

// Namespace agent_utils / namespace_14d36171baccf528
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x41fc
// Size: 0x82
function function_e662189d61d1874e(agent) {
    if (!isagent(agent)) {
        return;
    }
    if (isdefined(agent.functionsonspawn)) {
        for (i = 0; i < 24; i++) {
            var_964917a4edc12525 = 1 << i;
            if (var_964917a4edc12525 > agent.functionsonspawn) {
                break;
            }
            if ((agent.functionsonspawn & var_964917a4edc12525) == var_964917a4edc12525) {
                agent thread [[ level.var_5dbbd87fd9e2457f[i] ]](agent);
            }
        }
    }
}

// Namespace agent_utils / namespace_14d36171baccf528
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x4286
// Size: 0x120
function function_58aab2edaec2599f(agent, functionstring, function) {
    if (!isdefined(function) || !isfunction(function) || !isdefined(agent) || !isdefined(functionstring) || !isstring(functionstring)) {
        return;
    }
    function_a1acc0cc2a3cfeaa(functionstring, function);
    if (isagent(agent)) {
        if (!isdefined(agent.functionsonspawn)) {
            agent.functionsonspawn = 0;
        }
        agent.functionsonspawn |= 1 << level.var_8cfccf3b774f4458[functionstring].index;
        return;
    }
    if (isint(agent)) {
        if (!isdefined(level.var_879053468f168806[agent].functionsonspawn)) {
            level.var_879053468f168806[agent].functionsonspawn = 0;
        }
        level.var_879053468f168806[agent].functionsonspawn = level.var_879053468f168806[agent].functionsonspawn | 1 << level.var_8cfccf3b774f4458[functionstring].index;
    }
}

// Namespace agent_utils / namespace_14d36171baccf528
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x43ae
// Size: 0x138
function function_97fbd14bbcf19d9c(agent, functionstring, function) {
    if (!isdefined(function) || !isfunction(function) || !isdefined(agent) || !isdefined(functionstring) || !isstring(functionstring)) {
        return;
    }
    function_a1acc0cc2a3cfeaa(functionstring, function);
    if (isagent(agent)) {
        if (!isdefined(agent.functionsonspawn)) {
            agent.functionsonspawn = 0;
        } else {
            agent.functionsonspawn &= ~(1 << level.var_8cfccf3b774f4458[functionstring].index);
        }
        return;
    }
    if (isint(agent) && isdefined(level.var_879053468f168806[agent])) {
        if (!isdefined(level.var_879053468f168806[agent].functionsonspawn)) {
            level.var_879053468f168806[agent].functionsonspawn = 0;
            return;
        }
        level.var_879053468f168806[agent].functionsonspawn = level.var_879053468f168806[agent].functionsonspawn & ~(1 << level.var_8cfccf3b774f4458[functionstring].index);
    }
}

// Namespace agent_utils / namespace_14d36171baccf528
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x44ee
// Size: 0xe8
function private function_a1acc0cc2a3cfeaa(functionstring, function) {
    if (!isdefined(level.var_8cfccf3b774f4458)) {
        level.var_8cfccf3b774f4458 = [];
    }
    if (!isdefined(level.var_5dbbd87fd9e2457f)) {
        level.var_5dbbd87fd9e2457f = [];
    }
    if (!isdefined(level.var_8cfccf3b774f4458[functionstring])) {
        funcstruct = spawnstruct();
        funcstruct.func = function;
        funcstruct.index = level.var_8cfccf3b774f4458.size;
        assert(funcstruct.index < 24, "There are more than 24 dormancy functions. We've run out of bits!");
        level.var_8cfccf3b774f4458[functionstring] = funcstruct;
    }
    index = level.var_8cfccf3b774f4458[functionstring].index;
    if (!isdefined(level.var_5dbbd87fd9e2457f[index])) {
        level.var_5dbbd87fd9e2457f[index] = function;
    }
}

// Namespace agent_utils / namespace_14d36171baccf528
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x45de
// Size: 0xd4
function function_f3d88b5d7353a90(array, agent) {
    newarray = [];
    foreach (item in array) {
        if (isagent(agent) && isagent(item) && agent != item) {
            newarray[newarray.size] = item;
            continue;
        }
        if (isagent(agent) && isint(item) || isint(agent) && isagent(item)) {
            newarray[newarray.size] = item;
            continue;
        }
        if (isint(agent) && isint(item) && agent != item) {
            newarray[newarray.size] = item;
        }
    }
    return newarray;
}

// Namespace agent_utils / namespace_14d36171baccf528
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x46bb
// Size: 0x1f
function agent_sethealth(health) {
    self.health = health;
    self.maxhealth = health;
}

// Namespace agent_utils / namespace_14d36171baccf528
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x46e2
// Size: 0x67
function function_3ea1225bf6192343(agent, struct) {
    if (isagent(agent)) {
        agent.agentStruct = struct;
        agentpers_setagentpersdata(agent, "agentStruct", struct);
        return;
    }
    if (isint(agent)) {
        info = function_2b0e82156fa6075b(agent);
        if (isdefined(info)) {
            info.agentStruct = struct;
        }
    }
}

// Namespace agent_utils / namespace_14d36171baccf528
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4751
// Size: 0x4b
function function_12ee2283db699727(agent) {
    if (isagent(agent)) {
        return agentpers_getagentpersdata(agent, "agentStruct");
    }
    if (isint(agent)) {
        info = function_2b0e82156fa6075b(agent);
        return info.agentStruct;
    }
}

// Namespace agent_utils / namespace_14d36171baccf528
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x47a4
// Size: 0x314
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

// Namespace agent_utils / namespace_14d36171baccf528
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4ac0
// Size: 0xb2
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

// Namespace agent_utils / namespace_14d36171baccf528
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4b7a
// Size: 0x35
function function_223455a2aefd83e4() {
    for (i = 0; i < level.players.size; i++) {
        self getenemyinfo(level.players[i]);
    }
}

// Namespace agent_utils / namespace_14d36171baccf528
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4bb7
// Size: 0x67
function gethealthmax(aitype) {
    if (!isdefined(aitype)) {
        return;
    }
    if (issubstr(aitype, "tier1")) {
        return level.var_d0f9a08690a8075[0];
    }
    if (issubstr(aitype, "tier2")) {
        return level.var_d0f9a08690a8075[1];
    }
    if (issubstr(aitype, "tier3")) {
        return level.var_d0f9a08690a8075[2];
    }
}

// Namespace agent_utils / namespace_14d36171baccf528
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x4c27
// Size: 0x43f
function function_6f88796d2f078da4(aigroup, aileaders, squadleaderfunc) {
    squadleader = random(aigroup);
    if (isdefined(aileaders)) {
        if (isarray(aileaders)) {
            squadleader = random(aileaders);
        } else {
            squadleader = aileaders;
        }
    }
    if (isdefined(squadleaderfunc)) {
        level thread [[ squadleaderfunc ]](squadleader);
    }
    /#
        if (getdvarint(@"hash_4fa5a6d9e7fb5284", 0) > 0) {
            squadleader hudoutlineenable("<dev string:x6f>");
        }
    #/
    while (true) {
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
                        if (getdvar(@"hash_4fa5a6d9e7fb5284") != "<dev string:x85>") {
                            ai hudoutlineenable("<dev string:x86>");
                        }
                    #/
                    ai setgoalentity(squadleader);
                    ai.goalent = squadleader;
                }
                var_84031f98354ed18 = 0;
                players = level.players;
                if (function_a794fcf9545f2062()) {
                    team = ai.team;
                    players = function_b1eef70090b5b7b5(squadleader.origin, squadleader.goalradius, function_869ccb4e3451b8c6(["etype_player"]), [], team);
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
            if (isdefined(aileaders)) {
                alive = 0;
                foreach (guy in aileaders) {
                    if (!isalive(guy) || guy.health < 1) {
                        continue;
                    }
                    alive = 1;
                }
                if (alive) {
                    if (isarray(aileaders)) {
                        squadleader = random(aileaders);
                    } else {
                        squadleader = aileaders;
                    }
                }
            }
            /#
                if (getdvar(@"hash_4fa5a6d9e7fb5284") != "<dev string:x85>") {
                    squadleader hudoutlineenable("<dev string:x6f>");
                }
            #/
            if (isdefined(squadleaderfunc)) {
                level thread [[ squadleaderfunc ]](squadleader);
            }
        }
        wait 1;
    }
}

// Namespace agent_utils / namespace_14d36171baccf528
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x506e
// Size: 0x5c
function function_e942bea168527f6(trigger) {
    enabled = getdvarint(@"hash_3d2d2d527cf543f9", 1);
    if (!enabled) {
        return;
    }
    if (issharedfuncdefined("game", "makeEnterExitTrigger")) {
        [[ getsharedfunc("game", "makeEnterExitTrigger") ]](trigger, &function_3739410667dca712, &function_9643c9b25f0e0c84);
    }
}

// Namespace agent_utils / namespace_14d36171baccf528
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x50d2
// Size: 0xf9
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
    soldier.var_d1c85ffae04d3ae0.default_arch = soldier getbasearchetype();
    soldier.var_d1c85ffae04d3ae0.var_98add129a7ecb962 = soldier.var_98add129a7ecb962;
    var_2186ab5345fa2b64 = "soldier_water";
    if (soldier.var_d1c85ffae04d3ae0.default_arch == "juggernaut") {
        var_2186ab5345fa2b64 = "juggernaut_water";
    }
    soldier setoverridearchetype("default", var_2186ab5345fa2b64, 0);
    soldier.var_98add129a7ecb962 = 0;
}

// Namespace agent_utils / namespace_14d36171baccf528
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x51d3
// Size: 0xfa
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
    archtoset = "soldier";
    if (isdefined(soldier.var_d1c85ffae04d3ae0) && isdefined(soldier.var_d1c85ffae04d3ae0.default_arch)) {
        archtoset = soldier.var_d1c85ffae04d3ae0.default_arch;
    }
    soldier setoverridearchetype("default", archtoset, 0);
    if (isdefined(soldier.var_d1c85ffae04d3ae0) && isdefined(soldier.var_d1c85ffae04d3ae0.var_98add129a7ecb962)) {
        soldier.var_98add129a7ecb962 = soldier.var_d1c85ffae04d3ae0.var_98add129a7ecb962;
    }
}

// Namespace agent_utils / namespace_14d36171baccf528
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x52d5
// Size: 0x4a
function function_f0cb3329588d4015(soldier) {
    enabled = getdvarint(@"hash_cb527a1b28e21dfd", 0);
    if (!enabled) {
        return false;
    }
    arch = soldier getbasearchetype();
    if (arch == "juggernaut") {
        return false;
    }
    return true;
}

// Namespace agent_utils / namespace_14d36171baccf528
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x5328
// Size: 0x12f
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
        }
    }
    if (!isdefined(nationality)) {
        if (issubstr(agent_type, "_aq")) {
            return "team_hundred_ninety_five";
        }
        if (issubstr(agent_type, "_ru") || issubstr(agent_type, "_mx") || issubstr(agent_type, "_cartel")) {
            return "team_hundred_ninety_four";
        }
        if (issubstr(agent_type, "_biolab")) {
            return "team_hundred_ninety_seven";
        }
        if (issubstr(agent_type, "_pmc")) {
            return "team_hundred_ninety_eight";
        }
        if (issubstr(agent_type, "_merc")) {
            return "team_hundred_ninety_nine";
        }
        return "team_hundred_ninety_five";
    }
}

// Namespace agent_utils / namespace_14d36171baccf528
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x545f
// Size: 0x3b
function function_9a024cd909d6e0a3(func) {
    if (!isdefined(level.var_8c2b0fd37157f872)) {
        level.var_8c2b0fd37157f872 = [];
    }
    level.var_8c2b0fd37157f872 = array_add(level.var_8c2b0fd37157f872, func);
}

// Namespace agent_utils / namespace_14d36171baccf528
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x54a2
// Size: 0xb9
function function_8ca4e221673e423c() {
    map = [];
    foreach (arr in level.agent_definition) {
        if (isdefined(arr["subclass"])) {
            var_3edaf5784c67ba1d = arr["subclass"];
            map[var_3edaf5784c67ba1d.name] = default_to(map[var_3edaf5784c67ba1d.name], []);
            map[var_3edaf5784c67ba1d.name] = array_add(map[var_3edaf5784c67ba1d.name], aitype);
        }
    }
    return map;
}

// Namespace agent_utils / namespace_14d36171baccf528
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5564
// Size: 0x129
function function_3290e192ac188e2d(subclass) {
    level.var_382c29cdfee879a = default_to(level.var_382c29cdfee879a, 0);
    if (!isdefined(level.var_c841584ec7126408) || level.var_382c29cdfee879a != level.agent_definition.size) {
        level.var_382c29cdfee879a = level.agent_definition.size;
        level.var_c841584ec7126408 = [];
        foreach (arr in level.agent_definition) {
            if (isdefined(arr["subclass"])) {
                subname = arr["subclass"].name;
                if (!isdefined(level.var_c841584ec7126408[subname])) {
                    level.var_c841584ec7126408[subname] = [];
                }
                level.var_c841584ec7126408[subname][level.var_c841584ec7126408[subname].size] = aitype;
            }
        }
    }
    if (isdefined(level.var_c841584ec7126408[subclass])) {
        return level.var_c841584ec7126408[subclass];
    }
    return [];
}

// Namespace agent_utils / namespace_14d36171baccf528
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5696
// Size: 0xee
function function_7056963336f2bbec(bnocorpse) {
    /#
        if (!isdefined(self.group)) {
            assertex(self.birthtime < gettime(), "<dev string:x9c>", "<dev string:xcd>", self.origin);
        } else {
            assertex(self.birthtime < gettime(), "<dev string:xcf>" + self.group.group_name, "<dev string:xcd>", self.origin);
        }
    #/
    if (self.birthtime >= gettime()) {
        waitframe();
    }
    if (istrue(bnocorpse)) {
        self.nocorpse = 1;
    }
    self.died_poorly = 1;
    self.died_poorly_health = self.health;
    self.var_f543095c3ca1b743 = 1;
    if (isdefined(self.magic_bullet_shield)) {
        scripts\common\ai::stop_magic_bullet_shield();
    }
    self kill();
}

// Namespace agent_utils / namespace_14d36171baccf528
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x578c
// Size: 0xb
function despawnagent() {
    function_7056963336f2bbec(1);
}

// Namespace agent_utils / namespace_14d36171baccf528
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x579f
// Size: 0xcc
function getaverageorigin(ent_array) {
    avg_origin = (0, 0, 0);
    if (!ent_array.size) {
        return undefined;
    }
    foreach (ent in ent_array) {
        avg_origin += ent.origin;
    }
    avg_x = int(avg_origin[0] / ent_array.size);
    avg_y = int(avg_origin[1] / ent_array.size);
    avg_z = int(avg_origin[2] / ent_array.size);
    avg_origin = (avg_x, avg_y, avg_z);
    return avg_origin;
}

// Namespace agent_utils / namespace_14d36171baccf528
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5874
// Size: 0x36
function function_9ec5f9cfc835208e() {
    if (scripts\engine\utility::issharedfuncdefined("dmz_threat_bias", "init")) {
        level thread [[ scripts\engine\utility::getsharedfunc("dmz_threat_bias", "init") ]]();
        return;
    }
    level thread function_b54b8baa376d3dbb();
}

// Namespace agent_utils / namespace_14d36171baccf528
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x58b2
// Size: 0x161
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
    if (scripts\engine\utility::issharedfuncdefined("dmz_threat_bias", "customNationality")) {
        level thread [[ scripts\engine\utility::getsharedfunc("dmz_threat_bias", "customNationality") ]]();
    }
    level thread function_255e967912274247();
}

// Namespace agent_utils / namespace_14d36171baccf528
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5a1b
// Size: 0x5b
function function_255e967912274247() {
    level waittill("matchStartTimer_done");
    foreach (player in level.players) {
        namespace_14d36171baccf528::function_3a458af8ab69f4e(player);
    }
}

// Namespace agent_utils / namespace_14d36171baccf528
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5a7e
// Size: 0x12
function function_841f001ae930b5e4(group) {
    createthreatbiasgroup(group);
}

// Namespace agent_utils / namespace_14d36171baccf528
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x5a98
// Size: 0x80
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

// Namespace agent_utils / namespace_14d36171baccf528
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x5b20
// Size: 0x21
function function_ca2adce5c7865c20(player, group) {
    if (!isdefined(player)) {
        return;
    }
    player setthreatbiasgroup(group);
}

// Namespace agent_utils / namespace_14d36171baccf528
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x5b49
// Size: 0x37
function function_b5ff3bfb184d0d01(groupa, groupb, bias) {
    if (!isdefined(groupa) || !isdefined(groupb)) {
        return;
    }
    if (!isdefined(bias)) {
        return;
    }
    setthreatbias(groupa, groupb, bias);
}

// Namespace agent_utils / namespace_14d36171baccf528
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x5b88
// Size: 0x28
function function_3acce87fed325c8f(var_b3962262ba71d0ad, var_32a96bf508fbd2f) {
    if (!isdefined(var_b3962262ba71d0ad) || !isdefined(var_32a96bf508fbd2f)) {
        return;
    }
    setignoremegroup(var_b3962262ba71d0ad, var_32a96bf508fbd2f);
}

// Namespace agent_utils / namespace_14d36171baccf528
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x5bb8
// Size: 0x20
function function_46c0de7595d8cab2(player, group) {
    return player.var_c6f91882127b4281[group];
}

// Namespace agent_utils / namespace_14d36171baccf528
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x5be1
// Size: 0x2a
function function_ab491b16f8423c8e(player, group, status) {
    player.var_c6f91882127b4281[group] = status;
}

// Namespace agent_utils / namespace_14d36171baccf528
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5c13
// Size: 0x79
function function_ed5140c225d4f337(player) {
    groupname = "player";
    foreach (group in level.var_e354254e70a6b849) {
        groupname = groupname + "_" + group + function_46c0de7595d8cab2(player, group);
    }
    return groupname;
}

// Namespace agent_utils / namespace_14d36171baccf528
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5c95
// Size: 0x8c
function function_3a458af8ab69f4e(player) {
    player.var_c6f91882127b4281 = [];
    foreach (group in level.var_e354254e70a6b849) {
        player.var_c6f91882127b4281[group] = 1;
    }
    startinggroup = function_ed5140c225d4f337(player);
    function_ca2adce5c7865c20(player, startinggroup);
}

// Namespace agent_utils / namespace_14d36171baccf528
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5d29
// Size: 0x26
function function_1bca33010b895b0b(nationality) {
    switch (nationality) {
    case #"hash_19b89634f50eeda4": 
        return "sc";
    }
}

