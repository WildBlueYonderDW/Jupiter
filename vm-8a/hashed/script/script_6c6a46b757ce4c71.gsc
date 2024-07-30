#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_54f6d121e91434f8;
#using scripts\common\devgui.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using script_35de402efc5acfb3;
#using script_2ad704f5066d8674;
#using script_7c03ab87c5f9f420;
#using scripts\common\callbacks.gsc;
#using script_371b4c2ab5861e62;
#using scripts\mp\damage.gsc;
#using script_24fbedba9a7a1ef4;
#using scripts\mp\mp_agent_damage.gsc;
#using script_c11d6400ba31ed7;
#using script_f4e8d02d2f70888;
#using scripts\mp\weapons.gsc;
#using script_22f1701e151b9d12;

#namespace ob_humans;

// Namespace ob_humans / namespace_27209657e8dae5bb
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x83e
// Size: 0x179
function function_45657962a8ad47e() {
    if (!isdefined(level.ob)) {
        level.ob = spawnstruct();
    }
    level.ob.var_506f0668e5da48f6 = getdvarint(@"hash_1e4e78ceaf845f5f", 29);
    level.ob.var_b41ff23edfc2a824 = getdvarint(@"hash_7394d714a0c59e97", 36);
    level.ob.var_3ea1ae1f102fe42e = getdvarint(@"hash_9bf73053c1203c33", 75);
    level.ob.var_e01042a086f3924d = getdvarint(@"hash_eec3a89c0b85e9e2", 16);
    level.ob.var_275ff1f85d1b4c1c = getdvarint(@"hash_e1b898f78901bc1f", 75);
    level.ob.var_e77101a6fc828c03 = getdvarint(@"hash_15496964c5680db4", 90);
    level.ob.var_bbdcdae3439d9cec = getdvarfloat(@"hash_df75a70307e74432", 0.6);
    flag_wait("ai_spawn_director_initialized");
    function_a4b670d860d7cf61();
    function_425f70bba2ca4d6b();
    function_90faf3f11984372a(3.45, 1, 1);
    function_e00cc8c1c5cc38fb(1);
    setdvar(@"hash_f40118cb927a0802", 1);
    setdvar(@"hash_877c52caf0f9aa8c", 40);
    /#
        function_3a2ca530d33dbb7c();
    #/
}

// Namespace ob_humans / namespace_27209657e8dae5bb
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x9bf
// Size: 0x79
function private function_a4b670d860d7cf61() {
    level.var_aa78677d2156e18 = &function_20f21f6a7707e19;
    namespace_378f8281e2d12ced::init_battlechatter();
    namespace_e60d0883fe817ff2::main();
    registersharedfunc("disguise", "disguiseNationalityOverride", &function_d76746a809428932);
    registersharedfunc("disguise", "disguiseOnUsed", &function_5555a1ab2616c388);
    registersharedfunc("disguise", "disguiseOff", &function_1aa05b7937a3b1a2);
    setdvar(@"hash_8303972c0cfbece0", 0);
    level thread namespace_c39580665208f0a4::function_83599506981c29cd();
}

// Namespace ob_humans / namespace_27209657e8dae5bb
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa40
// Size: 0xa1c
function function_20f21f6a7707e19() {
    level.battlechatter.eventstrings["rvnv"]["low_ammo"] = ["b035_defz_blam"];
    level.battlechatter.eventstrings["rvnv"]["left"] = ["b035_defz_blft"];
    level.battlechatter.eventstrings["rvnv"]["right"] = ["b035_defz_brgt"];
    level.battlechatter.eventstrings["rvnv"]["high"] = ["b035_defz_bhgh"];
    level.battlechatter.eventstrings["rvnv"]["order_attack"] = ["b035_defz_batk"];
    level.battlechatter.eventstrings["rvnv"]["using_smoke"] = ["b035_defz_busm"];
    level.battlechatter.eventstrings["rvnv"]["using_flash"] = ["b035_defz_bufl"];
    level.battlechatter.eventstrings["rvnv"]["using_grenade"] = ["b035_defz_bugr"];
    level.battlechatter.eventstrings["rvnv"]["using_molotov"] = ["b035_defz_buml"];
    level.battlechatter.eventstrings["rvnv"]["reloading"] = ["b035_defz_brld"];
    level.battlechatter.eventstrings["rvnv"]["moving"] = ["b035_defz_bmov"];
    level.battlechatter.eventstrings["rvnv"]["enemy_using_flash"] = ["b035_defz_befl"];
    level.battlechatter.eventstrings["rvnv"]["enemy_using_grenade"] = ["b035_defz_begr"];
    level.battlechatter.eventstrings["rvnv"]["enemy_using_molotov"] = ["b035_defz_beml"];
    level.battlechatter.eventstrings["rvnv"]["enemy_using_rpg"] = ["b035_defz_berp"];
    level.battlechatter.eventstrings["rvnv"]["enemy_attacking"] = ["b035_defz_beat"];
    level.battlechatter.eventstrings["rvnv"]["enemy_soldier"] = ["b035_defz_besd"];
    level.battlechatter.eventstrings["rvnv"]["enemy_soldiers"] = ["b035_defz_besm"];
    level.battlechatter.eventstrings["rvnv"]["aquired_target"] = ["b035_defz_btac"];
    level.battlechatter.eventstrings["rvnv"]["youre_exposed"] = ["b035_defz_bexp"];
    level.battlechatter.eventstrings["rvnv"]["target_covered"] = ["b035_defz_btcv"];
    level.battlechatter.eventstrings["rvnv"]["killfirm_enemy"] = ["b035_defz_bkfe"];
    level.battlechatter.eventstrings["rvnv"]["killfirm_target"] = ["b035_defz_bkft"];
    level.battlechatter.eventstrings["rvnv"]["killfirm_helo"] = ["b035_defz_bkfh"];
    level.battlechatter.eventstrings["rvnv"]["praise"] = ["b035_defz_bprs"];
    level.battlechatter.eventstrings["rvnv"]["wounded"] = ["b035_defz_bwnd"];
    level.battlechatter.eventstrings["rvnv"]["enemy_sniper"] = ["b035_defz_besn"];
    level.battlechatter.eventstrings["rvnv"]["checkfire"] = ["b035_defz_bchk"];
    level.battlechatter.eventstrings["rvnv"]["reviver"] = ["b035_defz_brvg"];
    level.battlechatter.eventstrings["jans"]["low_ammo"] = ["b017_exfa_blam"];
    level.battlechatter.eventstrings["jans"]["left"] = ["b017_exfa_blft"];
    level.battlechatter.eventstrings["jans"]["right"] = ["b017_exfa_brgt"];
    level.battlechatter.eventstrings["jans"]["high"] = ["b017_exfa_bhgh"];
    level.battlechatter.eventstrings["jans"]["order_attack"] = ["b017_exfa_batk"];
    level.battlechatter.eventstrings["jans"]["using_smoke"] = ["b017_exfa_busm"];
    level.battlechatter.eventstrings["jans"]["using_flash"] = ["b017_exfa_bufl"];
    level.battlechatter.eventstrings["jans"]["using_grenade"] = ["b017_exfa_bugr"];
    level.battlechatter.eventstrings["jans"]["using_molotov"] = ["b017_exfa_buml"];
    level.battlechatter.eventstrings["jans"]["reloading"] = ["b017_exfa_brld"];
    level.battlechatter.eventstrings["jans"]["moving"] = ["b017_exfa_bmov"];
    level.battlechatter.eventstrings["jans"]["enemy_using_flash"] = ["b017_exfa_befl"];
    level.battlechatter.eventstrings["jans"]["enemy_using_grenade"] = ["b017_exfa_begr"];
    level.battlechatter.eventstrings["jans"]["enemy_using_molotov"] = ["b017_exfa_beml"];
    level.battlechatter.eventstrings["jans"]["enemy_using_rpg"] = ["b017_exfa_berp"];
    level.battlechatter.eventstrings["jans"]["enemy_attacking"] = ["b017_exfa_beat"];
    level.battlechatter.eventstrings["jans"]["enemy_soldier"] = ["b017_exfa_besd"];
    level.battlechatter.eventstrings["jans"]["enemy_soldiers"] = ["b017_exfa_besm"];
    level.battlechatter.eventstrings["jans"]["aquired_target"] = ["b017_exfa_btac"];
    level.battlechatter.eventstrings["jans"]["youre_exposed"] = ["b017_exfa_bexp"];
    level.battlechatter.eventstrings["jans"]["target_covered"] = ["b017_exfa_btcv"];
    level.battlechatter.eventstrings["jans"]["killfirm_enemy"] = ["b017_exfa_bkfe"];
    level.battlechatter.eventstrings["jans"]["killfirm_target"] = ["b017_exfa_bkft"];
    level.battlechatter.eventstrings["jans"]["killfirm_helo"] = ["b017_exfa_bkfh"];
    level.battlechatter.eventstrings["jans"]["praise"] = ["b017_exfa_bprs"];
    level.battlechatter.eventstrings["jans"]["wounded"] = ["b017_exfa_bwnd"];
    level.battlechatter.eventstrings["jans"]["enemy_sniper"] = ["b017_exfa_besn"];
    level.battlechatter.eventstrings["jans"]["checkfire"] = ["b017_exfa_bchk"];
    level.battlechatter.eventstrings["jans"]["need_revive"] = ["b017_exfa_bdwn"];
    level.battlechatter.eventstrings["jans"]["been_revived"] = ["b017_exfa_brvd"];
    level.battlechatter.eventstrings["jans"]["reviver"] = ["b017_exfa_brvg"];
    namespace_378f8281e2d12ced::addevent("need_revive", "need_revive", 0, 2, 5);
    namespace_378f8281e2d12ced::addevent("been_revived", "been_revived", 0, 2, 5);
    namespace_378f8281e2d12ced::addevent("reviver", "reviver", 0, 2, 5);
}

// Namespace ob_humans / namespace_27209657e8dae5bb
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1464
// Size: 0xac
function private function_425f70bba2ca4d6b() {
    level scripts\common\callbacks::add("on_agent_spawned", &function_7e2e3e062b49f13b);
    registersharedfunc("ai_mp_controller", "agentPers_getAgentPersData", &namespace_14d36171baccf528::agentpers_getagentpersdata);
    registersharedfunc("ai_mp_controller", "agentPers_setAgentPersData", &namespace_14d36171baccf528::agentpers_setagentpersdata);
    registersharedfunc("ai_mp_controller", "handleDamageFeedback", &scripts\mp\damage::handledamagefeedback);
    registersharedfunc("vehicle_damage", "modifyVehicleDamage", &function_431dee4c36d7e3ba);
    level.agent_funcs["soldier"]["on_damaged"] = &namespace_daa149ca485fd50a::callbacksoldieragentdamaged;
    level.agent_funcs["soldier"]["gametype_on_killed"] = &scripts\mp\mp_agent_damage::callbacksoldieragentgametypekilled;
    level.createrpgrepulsors = 0;
}

// Namespace ob_humans / namespace_27209657e8dae5bb
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1518
// Size: 0x1bd
function private function_7e2e3e062b49f13b(params) {
    agent = params.agent;
    if (agent.unittype == "soldier") {
        if (isdefined(agent.subclass)) {
            switch (agent.subclass) {
            case #"hash_91cd18ea8bf6d95": 
                function_125032d40c0a1677(agent);
                break;
            case #"hash_5a24fffee0d81302":
            case #"hash_6bd0663d453b9ee4":
            case #"hash_e907579ab7e94379":
            case #"hash_ef4c998bcc00f823":
            case #"hash_f4609eba318d1829": 
                function_125033d40c0a18aa(agent);
                break;
            case #"hash_3c0ffb3dab1a9835":
            case #"hash_806a6487959205af":
            case #"hash_c9beeb2ff7f370db": 
                function_125034d40c0a1add(agent);
                break;
            case #"hash_3794ac3fadfffd9c": 
                function_65162bac204e8044(agent);
            case #"hash_b32707f6c3892f15": 
                function_3043f74f8b90b7dd(agent);
            default: 
                break;
            }
        }
        agent thread namespace_fe5fbd2b56f035f::addtosquad();
        if (is_equal(agent.agent_type, "actor_jup_ob_ally_ava_base")) {
            agent namespace_2fdc8e343bfb2334::function_848612e5b224425b("jans", "b017", "b017");
        }
        if (is_equal(agent.agent_type, "actor_jup_ob_ally_ravenov_base")) {
            agent namespace_2fdc8e343bfb2334::function_848612e5b224425b("rvnv", "b035", "b035");
        }
        agent thread scripts\mp\weapons::watchgrenadeusage();
        agent.var_8c5c47f81a1869e5 = &namespace_daa149ca485fd50a::function_7d0d24665d72f13c;
        agent.var_cd6a3a50f09688b9 = &namespace_daa149ca485fd50a::function_59ea6b2f800cb082;
        agent.dontdamageriotshield = 1;
    }
}

// Namespace ob_humans / namespace_27209657e8dae5bb
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x16dd
// Size: 0xe8
function private function_3043f74f8b90b7dd(agent) {
    agent.var_2d670e4d288c86fb = 1;
    agent.var_526f1dcf41e8b261 = getdvarfloat(@"hash_1adf88fd35fbac70", 5.8);
    agent.var_46f376c7b944859b = getdvarfloat(@"hash_10cacdc3eb0966e", 3.3);
    if (isdefined(agent.armorhealth) && agent.armorhealth > 0) {
        agent.minpaindamage = int(agent.armorhealth / 2);
    }
    agent.baseaccuracy = getdvarfloat(@"hash_a02664619d86b8c9", 0.85);
    agent.var_4268b42fc89d0be9 = 0.08;
    agent.var_8a783f4c73c2ae91 = 0.0003;
    agent.var_e89cb8048a26c2c5 = 0.7;
}

// Namespace ob_humans / namespace_27209657e8dae5bb
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x17cd
// Size: 0xa7
function private function_65162bac204e8044(agent) {
    agent.var_9aa77ab756fdca82 = 100;
    agent.var_43e2ad424676b8d4 = 60;
    agent.paincooldown = 3000;
    agent.baseaccuracy = getdvarfloat(@"hash_a02664619d86b8c9", 0.85);
    agent.var_526f1dcf41e8b261 = getdvarfloat(@"hash_1adf88fd35fbac70", 5.8);
    agent.var_4268b42fc89d0be9 = 0.04;
    agent.var_8a783f4c73c2ae91 = 0.0001;
    agent.var_e89cb8048a26c2c5 = 0.4;
}

// Namespace ob_humans / namespace_27209657e8dae5bb
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x187c
// Size: 0x14f
function private function_125032d40c0a1677(agent) {
    agent.var_9aa77ab756fdca82 = 10;
    agent.var_43e2ad424676b8d4 = 10;
    agent.baseaccuracy = getdvarfloat(@"hash_a02661619d86b230", 0.55);
    agent.var_526f1dcf41e8b261 = getdvarfloat(@"hash_d402fcc65515a733", 3);
    agent.var_4268b42fc89d0be9 = getdvarfloat(@"hash_8dfb6d4ecad5411b", 0.12);
    agent.var_8a783f4c73c2ae91 = 0.0006;
    agent.var_e89cb8048a26c2c5 = 0.7;
    agent function_8bbcaeb23a1512ef("all", 1);
    agent function_859a90c664dba240(1);
    agent function_136adff8f817fad6(0);
    if (function_ec3aea190c440d29(@"hash_e5a2fe52e7fd74d7")) {
        agent.maxarmorhealth = getdvarint(@"hash_e5a2fe52e7fd74d7");
        agent.armorhealth = getdvarint(@"hash_e5a2fe52e7fd74d7");
    }
    if (function_ec3aea190c440d29(@"hash_bcd6c3f5ca11d056")) {
        agent.health = getdvarint(@"hash_bcd6c3f5ca11d056");
        agent.maxhealth = getdvarint(@"hash_bcd6c3f5ca11d056");
    }
}

// Namespace ob_humans / namespace_27209657e8dae5bb
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x19d3
// Size: 0x1e1
function private function_125033d40c0a18aa(agent) {
    agent.var_9aa77ab756fdca82 = 150;
    agent.var_43e2ad424676b8d4 = 30;
    agent.baseaccuracy = getdvarfloat(@"hash_a02664619d86b8c9", 0.85);
    agent.var_526f1dcf41e8b261 = getdvarfloat(@"hash_1adf88fd35fbac70", 5.8);
    agent.suppressionthreshold = 0.4;
    agent.suppressiondecrement = 0.2;
    agent.var_2a4784c6cc07ca59 = 0.05;
    if (agent.subclass == "ob_sniper") {
        agent function_9215ce6fc83759b9(4646);
        agent function_d493e7fe15e5eaf4("jup_sandbox_sniper");
        setdvarifuninitialized(@"hash_de2405a9f72799dd", agent.baseaccuracy);
        agent.baseaccuracy = getdvarfloat(@"hash_de2405a9f72799dd");
    }
    agent.var_4268b42fc89d0be9 = getdvarfloat(@"hash_29c7e9e562be2374", 0.04);
    agent.var_8a783f4c73c2ae91 = 0.0001;
    agent.var_e89cb8048a26c2c5 = 0.6;
    agent function_8bbcaeb23a1512ef("all", 1);
    agent function_859a90c664dba240(1);
    agent function_136adff8f817fad6(1);
    if (function_ec3aea190c440d29(@"hash_c8e0804febe485ce")) {
        agent.maxarmorhealth = getdvarint(@"hash_c8e0804febe485ce");
        agent.armorhealth = getdvarint(@"hash_c8e0804febe485ce");
    }
    if (function_ec3aea190c440d29(@"hash_7366919330cee7b1")) {
        agent.maxhealth = getdvarint(@"hash_7366919330cee7b1");
        agent.health = getdvarint(@"hash_7366919330cee7b1");
    }
}

// Namespace ob_humans / namespace_27209657e8dae5bb
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1bbc
// Size: 0x1cf
function private function_125034d40c0a1add(agent) {
    agent.var_9aa77ab756fdca82 = 450;
    agent.var_43e2ad424676b8d4 = 100;
    agent.baseaccuracy = getdvarfloat(@"hash_a02663619d86b696", 1.15);
    agent.aggressivemode = 1;
    agent.var_cbd87a0bc497b778 = 1;
    agent.var_526f1dcf41e8b261 = getdvarfloat(@"hash_9fb6065532820021", 8.6);
    agent.suppressionthreshold = 0.25;
    agent.suppressiondecrement = 0.25;
    agent.var_2a4784c6cc07ca59 = 0.05;
    agent.var_4268b42fc89d0be9 = getdvarfloat(@"hash_28d87a7d205c119", 0.02);
    agent.var_8a783f4c73c2ae91 = 8e-05;
    agent.var_e89cb8048a26c2c5 = 0.4;
    agent.var_98add129a7ecb962 = 0;
    if (agent.subclass == "ob_tactician") {
        agent.disablelmgmount = 1;
    }
    agent function_8bbcaeb23a1512ef("all", 1);
    agent function_859a90c664dba240(1);
    agent function_136adff8f817fad6(1);
    if (function_ec3aea190c440d29(@"hash_4227d53e5aece55d")) {
        agent.maxarmorhealth = getdvarint(@"hash_4227d53e5aece55d");
        agent.armorhealth = getdvarint(@"hash_4227d53e5aece55d");
    }
    if (function_ec3aea190c440d29(@"hash_ac59bb34c9d0f0bc")) {
        agent.maxhealth = getdvarint(@"hash_ac59bb34c9d0f0bc");
        agent.health = getdvarint(@"hash_ac59bb34c9d0f0bc");
    }
}

// Namespace ob_humans / namespace_27209657e8dae5bb
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1d93
// Size: 0xcb
function private function_431dee4c36d7e3ba(inflictor, objweapon, damage) {
    if (!isdefined(inflictor) || !isagent(inflictor)) {
        return damage;
    }
    isplayervehicle = isdefined(self) && isdefined(self.owner) && isplayer(self.owner);
    if (!isplayervehicle) {
        return damage;
    }
    maxdamage = undefined;
    if (isdefined(objweapon)) {
        class = weaponclass(objweapon);
        if (isdefined(class)) {
            switch (class) {
            case #"hash_690c0d6a821b42e": 
                maxdamage = level.var_9cf526926a72864c;
                break;
            default: 
                break;
            }
        }
    }
    if (isdefined(maxdamage)) {
        return min(damage, maxdamage);
    }
    return damage;
}

// Namespace ob_humans / namespace_27209657e8dae5bb
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e66
// Size: 0x185
function function_cf5321434f9b38c1(idamage, smeansofdeath, objweapon) {
    maxdamage = undefined;
    invehicle = player_utility::isinvehicle();
    if (invehicle && isdefined(level.ob.var_bbdcdae3439d9cec)) {
        idamage = int(idamage * level.ob.var_bbdcdae3439d9cec);
    }
    class = weaponclass(objweapon);
    switch (class) {
    case #"hash_8cdaf2e4ecfe5b51":
    case #"hash_fa24dff6bd60a12d": 
        maxdamage = level.ob.var_b41ff23edfc2a824;
        break;
    case #"hash_6191aaef9f922f96": 
        maxdamage = level.ob.var_3ea1ae1f102fe42e;
        break;
    case #"hash_690c0d6a821b42e": 
        maxdamage = level.ob.var_e01042a086f3924d;
        break;
    default: 
        if (isexplosivedamagemod(smeansofdeath)) {
            maxdamage = level.ob.var_275ff1f85d1b4c1c;
        } else if (smeansofdeath == "MOD_MELEE") {
            maxdamage = level.ob.var_e77101a6fc828c03;
        } else if (smeansofdeath == "MOD_SUICIDE") {
            maxdamage = idamage;
        } else {
            maxdamage = level.ob.var_506f0668e5da48f6;
        }
        break;
    }
    if (isdefined(maxdamage)) {
        idamage = min(idamage, maxdamage);
    }
    return idamage;
}

// Namespace ob_humans / namespace_27209657e8dae5bb
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1ff4
// Size: 0x7
function private function_d76746a809428932() {
    return "shadowcompany";
}

// Namespace ob_humans / namespace_27209657e8dae5bb
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2004
// Size: 0x1a
function private function_5555a1ab2616c388() {
    function_f3bb4f4911a1beb2("player", "setIgnoredByMercs", "disguise", 1);
}

// Namespace ob_humans / namespace_27209657e8dae5bb
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2026
// Size: 0x19
function private function_1aa05b7937a3b1a2() {
    function_f3bb4f4911a1beb2("player", "setIgnoredByMercs", "disguise", 0);
}

// Namespace ob_humans / namespace_27209657e8dae5bb
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x2047
// Size: 0x2
function private function_c3a8389891d2f901() {
    
}

/#

    // Namespace ob_humans / namespace_27209657e8dae5bb
    // Params 0, eflags: 0x4
    // Checksum 0x0, Offset: 0x2051
    // Size: 0x1ac
    function private function_3a2ca530d33dbb7c() {
        thread function_bc8f27e3d1eef91e();
        devgui::function_6e7290c8ee4f558b("<dev string:x1c>");
        devgui::function_b23a59dfb4ca49a1("<dev string:x30>", "<dev string:x42>", &function_ef3da4a8b1880c27);
        devgui::function_b23a59dfb4ca49a1("<dev string:x67>", "<dev string:x75>", &function_ef3da4a8b1880c27);
        devgui::function_b23a59dfb4ca49a1("<dev string:x9b>", "<dev string:xa8>", &function_ef3da4a8b1880c27);
        devgui::function_b23a59dfb4ca49a1("<dev string:xcd>", "<dev string:xdd>", &function_ef3da4a8b1880c27);
        devgui::function_b23a59dfb4ca49a1("<dev string:x105>", "<dev string:x114>", &function_ef3da4a8b1880c27);
        devgui::function_b23a59dfb4ca49a1("<dev string:x13b>", "<dev string:x14e>", &function_ef3da4a8b1880c27);
        devgui::function_b23a59dfb4ca49a1("<dev string:x176>", "<dev string:x188>", &function_ef3da4a8b1880c27);
        devgui::function_b23a59dfb4ca49a1("<dev string:x1af>", "<dev string:x1ca>", &function_ef3da4a8b1880c27);
        devgui::function_b23a59dfb4ca49a1("<dev string:x1f0>", "<dev string:x20f>", &function_ef3da4a8b1880c27);
        devgui::function_b23a59dfb4ca49a1("<dev string:x236>", "<dev string:x23e>", &function_ef3da4a8b1880c27);
        devgui::function_b23a59dfb4ca49a1("<dev string:x260>", "<dev string:x270>", &function_ef3da4a8b1880c27);
        devgui::function_b23a59dfb4ca49a1("<dev string:x294>", "<dev string:x29e>", &function_ef3da4a8b1880c27);
        devgui::function_b23a59dfb4ca49a1("<dev string:x2bf>", "<dev string:x2da>", &function_ef3da4a8b1880c27);
        devgui::function_b23a59dfb4ca49a1("<dev string:x300>", "<dev string:x307>", &function_ef3da4a8b1880c27);
        devgui::function_b23a59dfb4ca49a1("<dev string:x328>", "<dev string:x32f>", &function_ef3da4a8b1880c27);
        devgui::function_b23a59dfb4ca49a1("<dev string:x350>", "<dev string:x359>", &function_ef3da4a8b1880c27);
        devgui::function_b23a59dfb4ca49a1("<dev string:x37c>", "<dev string:x383>", &function_ef3da4a8b1880c27);
        devgui::function_b23a59dfb4ca49a1("<dev string:x3a4>", "<dev string:x3a9>", &function_ef3da4a8b1880c27);
        devgui::function_fe953f000498048f();
    }

    // Namespace ob_humans / namespace_27209657e8dae5bb
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x2205
    // Size: 0x9a
    function function_ef3da4a8b1880c27(spawntag) {
        firstplayer = level.players[0];
        playerforward = anglestoforward(firstplayer.angles);
        offsetposition = firstplayer.origin + playerforward * 100 + (0, 0, 10);
        encounterid = namespace_614554f86e52695c::spawn_request("<dev string:x3c8>", offsetposition, 32, 0, 1, 0);
        function_d37068aac7785c04(encounterid, spawntag[0], 1);
        function_fc38783a3da0bc71(encounterid, 1);
    }

    // Namespace ob_humans / namespace_27209657e8dae5bb
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x22a7
    // Size: 0x101
    function function_bc8f27e3d1eef91e() {
        level endon("<dev string:x3e7>");
        setdevdvarifuninitialized(@"hash_f9e17cb98b253864", 0);
        var_4aedb83e4489153d = 1;
        while (true) {
            if (int(getunarchiveddebugdvar(@"hash_f9e17cb98b253864", "<dev string:x3f2>")) > 0 && var_4aedb83e4489153d) {
                var_4aedb83e4489153d = 0;
                setdvar(@"hash_f51f34be092e6691", 1);
                setdvar(@"hash_c5b31ff1b47a0f69", 1);
                setdvar(@"hash_f245a011cef948e0", 1);
                setdvar(@"hash_c7b59c90cd6d06bb", 1);
            }
            if (int(getunarchiveddebugdvar(@"hash_f9e17cb98b253864", "<dev string:x3f2>")) == 0 && !var_4aedb83e4489153d) {
                var_4aedb83e4489153d = 1;
                setdvar(@"hash_f51f34be092e6691", 0);
                setdvar(@"hash_c5b31ff1b47a0f69", 0);
                setdvar(@"hash_f245a011cef948e0", 0);
                setdvar(@"hash_c7b59c90cd6d06bb", 0);
            }
            waitframe();
        }
    }

    // Namespace ob_humans / namespace_27209657e8dae5bb
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x23b0
    // Size: 0x1b1
    function function_d170903981c617de(player) {
        var_557c51a81144b954 = 0;
        if (isdefined(player.activities) && isdefined(player.activities.var_6ff9941006fb29cd)) {
            var_557c51a81144b954 = player.activities.var_6ff9941006fb29cd.size;
        }
        function_5c0adb7451b9af7a(player, "<dev string:x3f4>" + var_557c51a81144b954 + "<dev string:x417>");
        if (var_557c51a81144b954 > 0) {
            foreach (var_85afed0f5a7270c4, var_3433cfdaabb0b969 in player.activities.var_6ff9941006fb29cd) {
                var_e8b975085b1b28e3 = player.activities.var_6346961d07f668fe == var_85afed0f5a7270c4;
                activityinstance = level.activities.instances[var_85afed0f5a7270c4];
                if (isdefined(activityinstance)) {
                    activitytag = activityinstance.varianttag;
                    activitytype = activityinstance.type;
                    var_8a82ef4a9c0fccc2 = 0;
                    if (isdefined(activityinstance.var_741c4f3150e30c83)) {
                        var_8a82ef4a9c0fccc2 = function_93587d5ba6247f36(activityinstance.var_741c4f3150e30c83, player);
                    }
                    function_5c0adb7451b9af7a(player, "<dev string:x420>" + activitytag + "<dev string:x443>" + activitytype + "<dev string:x44d>" + "<dev string:x44f>" + var_e8b975085b1b28e3 + "<dev string:x44d>" + "<dev string:x45a>" + var_8a82ef4a9c0fccc2 + "<dev string:x44d>");
                }
            }
        }
    }

    // Namespace ob_humans / namespace_27209657e8dae5bb
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x2569
    // Size: 0x5e
    function function_629369a1a5cd2636(text) {
        shouldlog = int(getdvar(@"hash_6e561210fe14f90c", 0));
        if (shouldlog > 0) {
            if (isstartstr(text, "<dev string:x471>")) {
                println("<dev string:x473>" + text);
                return;
            }
            println("<dev string:x481>" + text);
        }
    }

    // Namespace ob_humans / namespace_27209657e8dae5bb
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0x25cf
    // Size: 0x4b
    function function_f7e877aa7e97d952(activityinstance, text) {
        if (isdefined(activityinstance) && isdefined(activityinstance.varianttag)) {
            function_629369a1a5cd2636("<dev string:x471>" + activityinstance.varianttag + "<dev string:x490>" + text);
        }
    }

    // Namespace ob_humans / namespace_27209657e8dae5bb
    // Params 2, eflags: 0x0
    // Checksum 0x0, Offset: 0x2622
    // Size: 0x45
    function function_5c0adb7451b9af7a(player, text) {
        if (isdefined(player) && isplayer(player)) {
            function_629369a1a5cd2636("<dev string:x493>" + player.clientid + "<dev string:x490>" + text);
        }
    }

    // Namespace ob_humans / namespace_27209657e8dae5bb
    // Params 3, eflags: 0x0
    // Checksum 0x0, Offset: 0x266f
    // Size: 0x75
    function function_dd0ceeddc603cb3e(player, activityinstance, text) {
        if (isdefined(player) && isplayer(player) && isdefined(activityinstance) && isdefined(activityinstance.varianttag)) {
            function_629369a1a5cd2636("<dev string:x493>" + player.clientid + "<dev string:x49c>" + activityinstance.varianttag + "<dev string:x490>" + text);
        }
    }

#/
