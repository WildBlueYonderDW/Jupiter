#using script_16ea1b94f0f381b3;
#using script_24fbedba9a7a1ef4;
#using script_2669878cf5a1b6bc;
#using script_315e06108d117c9a;
#using script_3ed005fe9b78b9da;
#using scripts\asm\shared\mp\utility;
#using scripts\common\callbacks;
#using scripts\common\values;
#using scripts\engine\utility;
#using scripts\mp\flags;
#using scripts\mp\gametypes\gun;
#using scripts\mp\hud_message;
#using scripts\mp\mp_agent;
#using scripts\mp\mp_agent_damage;
#using scripts\mp\utility\game;
#using scripts\mp\utility\join_team_aggregator;
#using scripts\mp\utility\points;
#using scripts\mp\validation;

#namespace namespace_3edeb04dba90e80;

// Namespace namespace_3edeb04dba90e80 / namespace_61bcb863c55e8d6b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x572
// Size: 0x196
function function_3885e1d74c6f11eb() {
    level.onmaprestart = &onmaprestart;
    level.var_8b5c3bda53460402 = &function_8d9dca133b662b60;
    level.onlyroundoverride = 1;
    level thread onStartGameTypeFinished();
    level.var_44815c2275fee420 = 1;
    level.disablepersonalnuke = 1;
    function_5e5f1db1c49f9fa("default1", &function_8121c27ec4fdb19d);
    function_5e5f1db1c49f9fa("default4", &function_7ede0aa8434bebd1);
    function_5e5f1db1c49f9fa("default3", &function_1824541ee1333b93);
    function_5e5f1db1c49f9fa("default2", &function_852acf50e7345bc8);
    scripts\mp\utility\join_team_aggregator::registeronplayerjointeamcallback(&onjoinedteam);
    level.modeupdateloadoutclass = &function_ca5d00ef2a435d1f;
    level.var_7e9532b5406cfa7d = &function_7e9532b5406cfa7d;
    level callback::add("player_death", &onplayerdeath);
    level callback::add("player_spawned", &onspawnplayer);
    level callback::add("player_connect", &onplayerconnect);
    level callback::add("on_zombie_ai_killed", &function_39a600444016629e);
    registersharedfunc("escort", "isZombie", &iszombie);
    registersharedfunc("escort", "isDogZombie", &isDogZombie);
    level.var_5622bf44905e2b1a = &function_89e10e876c0c0447;
    setdvar(@"hash_3c4d1d9e67d42b87", 0);
    setdvar(@"hash_6db0c7f59c294cb4", 20);
    level thread spawn_zombies();
    /#
        setdvar(@"hash_d01570d79c646246", 1);
    #/
    level._effect["vfx_jup_mut_jugg_transform_puff"] = loadfx("vfx/jup/gameplay/mutation/vfx_jup_mut_jugg_transform_puff.vfx");
    thread initpostmain();
}

// Namespace namespace_3edeb04dba90e80 / namespace_61bcb863c55e8d6b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x710
// Size: 0x64
function function_89e10e876c0c0447() {
    var_e217fd82c718af36 = getdvarint(@"hash_c2b58986f486d692", 3);
    if (var_e217fd82c718af36 > 0) {
        level.agent_funcs["zombie"]["on_damaged"] = &namespace_daa149ca485fd50a::callbacksoldieragentdamaged;
        level.agent_funcs["zombie"]["gametype_on_killed"] = &scripts\mp\mp_agent_damage::callbacksoldieragentgametypekilled;
        level.agentskillstreakcount = var_e217fd82c718af36;
    }
}

// Namespace namespace_3edeb04dba90e80 / namespace_61bcb863c55e8d6b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x77c
// Size: 0x56
function function_f9c27bb7f1c4fedc() {
    if (!isdefined(game["switchedsides"])) {
        game["switchedsides"] = 0;
    }
    if (game["switchedsides"]) {
        oldattackers = game["attackers"];
        olddefenders = game["defenders"];
        game["attackers"] = olddefenders;
        game["defenders"] = oldattackers;
    }
}

// Namespace namespace_3edeb04dba90e80 / namespace_61bcb863c55e8d6b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7da
// Size: 0xc2
function function_7e9532b5406cfa7d() {
    foreach (weapon in self getweaponslistprimaries()) {
        if (is_equal(weapon.basename, "jup_jp36_ar_anov94_mp")) {
            if (is_equal(weapon.isalternate, 1)) {
                self switchtoweapon(weapon);
                val::set("juggernaut_mutant", "weapon_switch", 0);
                self.var_967123630ad7ddc6 = 1;
                thread function_b3529ae567aafd97();
            }
        }
    }
    playfxontag(level._effect["vfx_jup_mut_jugg_transform_puff"], self, "tag_origin");
}

// Namespace namespace_3edeb04dba90e80 / namespace_61bcb863c55e8d6b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8a4
// Size: 0x6c
function function_b3529ae567aafd97() {
    level endon("game_ended");
    self endon("death");
    self endon("disconnect");
    while (true) {
        wait 1;
        currentweapon = self getcurrentweapon();
        var_8a2ecc3a9d4c95df = weaponstartammo(currentweapon);
        clipammo = weaponclipsize(currentweapon);
        stockammo = var_8a2ecc3a9d4c95df - clipammo;
        self setweaponammoclip(currentweapon, 300);
    }
}

// Namespace namespace_3edeb04dba90e80 / namespace_61bcb863c55e8d6b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x918
// Size: 0x34
function onStartGameTypeFinished() {
    utility::flag_wait("onStartGameTypeFinished");
    level.streakglobals.streakbundles["fuel_airstrike"].kills = 6;
}

// Namespace namespace_3edeb04dba90e80 / namespace_61bcb863c55e8d6b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x954
// Size: 0x4a
function initpostmain() {
    thread namespace_579c1620477fc1a::initpostmain();
    if (!threatbiasgroupexists("player_zombie")) {
        createthreatbiasgroup("player_zombie");
    }
    if (!threatbiasgroupexists("zombie")) {
        createthreatbiasgroup("zombie");
    }
    setignoremegroup("player_zombie", "zombie");
}

// Namespace namespace_3edeb04dba90e80 / namespace_61bcb863c55e8d6b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9a6
// Size: 0x21
function function_8d9dca133b662b60(struct) {
    if (isMutationGameModeZombie()) {
        return struct;
    }
    return scripts\mp\validation::validateloadout(struct);
}

// Namespace namespace_3edeb04dba90e80 / namespace_61bcb863c55e8d6b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9cf
// Size: 0x27
function function_f69b1a88bc3add30() {
    if (threatbiasgroupexists("player_zombie")) {
        self setthreatbiasgroup("player_zombie");
    }
    self hudoutlineenable("outlinefill_depth_white");
}

// Namespace namespace_3edeb04dba90e80 / namespace_61bcb863c55e8d6b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9fe
// Size: 0x19
function function_587548933872d0b6(revived) {
    self hudoutlinedisable();
    self setthreatbiasgroup();
}

// Namespace namespace_3edeb04dba90e80 / namespace_61bcb863c55e8d6b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa1f
// Size: 0x2a
function onplayerconnect(params) {
    player = self;
    player thread scripts\mp\gametypes\gun::refillammo();
    player thread scripts\mp\gametypes\gun::refillsinglecountammo();
}

// Namespace namespace_3edeb04dba90e80 / namespace_61bcb863c55e8d6b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa51
// Size: 0x8a
function onplayerdeath(params) {
    if (isdefined(self.var_ae387c36d115328f)) {
        self unlink();
        self.var_ae387c36d115328f delete();
    }
    if (istrue(iszombie())) {
        self clearsoundsubmix("jup_mp_mutation_breath", 1);
        self clearsoundsubmix("jup_mp_mutation_hellhound_radioactive_beast", 1);
    }
    val::set("juggernaut_mutant", "weapon_switch", 1);
    self.var_967123630ad7ddc6 = 0;
    self setcamerathirdperson(0);
    self.operatorcustomization = undefined;
    self clearcustomization();
}

// Namespace namespace_3edeb04dba90e80 / namespace_61bcb863c55e8d6b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xae3
// Size: 0x13
function onjoinedteam(player) {
    player function_4f64cc518d710ee1();
}

// Namespace namespace_3edeb04dba90e80 / namespace_61bcb863c55e8d6b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xafe
// Size: 0x54
function function_4f64cc518d710ee1(halftime) {
    player = self;
    iszombie = player isMutationGameModeZombie();
    if (istrue(halftime)) {
        iszombie = !iszombie;
    }
    if (iszombie) {
        player setclientomnvar("ui_only_default_loadouts_player", 1);
        return;
    }
    player setclientomnvar("ui_only_default_loadouts_player", 0);
}

// Namespace namespace_3edeb04dba90e80 / namespace_61bcb863c55e8d6b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xb5a
// Size: 0x3a
function onspawnplayer(params) {
    scripts\mp\hud_message::function_f004ef4606b9efdc("kill");
    if (isbot(self) && isMutationGameModeZombie()) {
        thread function_7042d138b3d8a4f4();
    }
    thread onspawnfinished();
}

// Namespace namespace_3edeb04dba90e80 / namespace_61bcb863c55e8d6b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb9c
// Size: 0x48
function onspawnfinished() {
    self endon("death_or_disconnect");
    thread function_3cd7aabb0e5dd22f();
    if (!istrue(iszombie())) {
        self clearsoundsubmix("jup_mp_mutation_breath", 1);
        self clearsoundsubmix("jup_mp_mutation_hellhound_radioactive_beast", 1);
    }
    self setscriptablepartstate("mutant_cloak", "inactive");
}

// Namespace namespace_3edeb04dba90e80 / namespace_61bcb863c55e8d6b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xbec
// Size: 0x3f
function function_3cd7aabb0e5dd22f() {
    self notify("watchLoadoutChanged");
    self endon("watchLoadoutChanged");
    self endon("death_or_disconnect");
    function_4c09404e1f472457();
    while (true) {
        self waittill("giveLoadout");
        self notify("zombie_unset");
        waitframe();
        function_4c09404e1f472457();
    }
}

// Namespace namespace_3edeb04dba90e80 / namespace_61bcb863c55e8d6b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc33
// Size: 0xa0
function onmaprestart() {
    foreach (player in level.players) {
        player function_57cad676a5cbb536();
        player function_e7762eb89190b46c();
        player function_4f64cc518d710ee1(1);
        player.class = undefined;
        player.pers["class"] = undefined;
        player.pers["classCache"] = undefined;
        player.preloadedclassstruct = undefined;
    }
}

// Namespace namespace_3edeb04dba90e80 / namespace_61bcb863c55e8d6b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xcdb
// Size: 0xb
function ononeleftevent(team) {
    
}

// Namespace namespace_3edeb04dba90e80 / namespace_61bcb863c55e8d6b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xcee
// Size: 0x29
function function_61c226745cc230bd(player) {
    if (!istrue(player.hasspawned)) {
        return false;
    }
    if (!isMutationGameModeZombie()) {
        return true;
    }
    return false;
}

// Namespace namespace_3edeb04dba90e80 / namespace_61bcb863c55e8d6b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xd20
// Size: 0x4e
function function_39a600444016629e(params) {
    playerattacker = params.eattacker;
    if (!isdefined(playerattacker) || !isplayer(playerattacker)) {
        return;
    }
    if (isMutationGameMode()) {
        playerattacker thread scripts\mp\utility\points::doScoreEvent(#"hash_30bae1a5dd41a4d1");
    }
}

// Namespace namespace_3edeb04dba90e80 / namespace_61bcb863c55e8d6b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd76
// Size: 0x1f4
function function_4c09404e1f472457() {
    if (!isdefined(self.var_c59d88e3b34caa9f)) {
        self.var_c59d88e3b34caa9f = self.suit;
    }
    if (!isdefined(self.var_bd18a31e926a377f)) {
        self.var_bd18a31e926a377f = self.model;
    }
    if (iszombie()) {
        if (!isdefined(self.class)) {
            thread function_8121c27ec4fdb19d();
            return;
        }
        if (!istrue(isDogZombie())) {
            self clearsoundsubmix("jup_mp_mutation_hellhound_radioactive_beast", 1);
            self setsoundsubmix("jup_mp_mutation_breath", 0.1);
        } else if (istrue(isDogZombie())) {
            self clearsoundsubmix("jup_mp_mutation_breath", 1);
            self setsoundsubmix("jup_mp_mutation_hellhound_radioactive_beast", 0.1);
        } else {
            self clearsoundsubmix("jup_mp_mutation_breath", 1);
            self clearsoundsubmix("jup_mp_mutation_hellhound_radioactive_beast", 1);
        }
        if (!isdefined(level.var_e10b12c5cb975aa[self.class])) {
            var_4ab72a616f50b4c2 = [];
            var_4ab72a616f50b4c2[var_4ab72a616f50b4c2.size] = "default1";
            var_4ab72a616f50b4c2[var_4ab72a616f50b4c2.size] = "default3";
            var_4ab72a616f50b4c2[var_4ab72a616f50b4c2.size] = "default2";
            if (!isdefined(level.var_5f9486d264dece01)) {
                level.var_5f9486d264dece01 = 0;
            }
            if (!isdefined(self.var_72e77607f1ebe26e)) {
                self.var_6b81cdf774dac18d = var_4ab72a616f50b4c2[level.var_5f9486d264dece01];
                self.var_72e77607f1ebe26e = level.var_e10b12c5cb975aa[self.var_6b81cdf774dac18d];
                level.var_5f9486d264dece01++;
            }
            if (level.var_5f9486d264dece01 >= var_4ab72a616f50b4c2.size) {
                level.var_5f9486d264dece01 = 0;
            }
            self thread [[ self.var_72e77607f1ebe26e ]]();
            return;
        }
        if (istrue(self.isjuggernaut)) {
            return;
        }
        self thread [[ level.var_e10b12c5cb975aa[self.class] ]]();
        self setclientomnvar("ui_mutation_zombie_type", int(self.class_num));
        return;
    }
    if (istrue(self.isjuggernaut)) {
        return;
    }
    thread function_702b1da0c13a5636();
}

// Namespace namespace_3edeb04dba90e80 / namespace_61bcb863c55e8d6b
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xf72
// Size: 0x37
function function_5e5f1db1c49f9fa(class, func) {
    if (!isdefined(level.var_e10b12c5cb975aa)) {
        level.var_e10b12c5cb975aa = [];
    }
    level.var_e10b12c5cb975aa[class] = func;
}

// Namespace namespace_3edeb04dba90e80 / namespace_61bcb863c55e8d6b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xfb1
// Size: 0x2d
function function_7042d138b3d8a4f4() {
    waitframe();
    while (isdefined(self)) {
        self takeallweapons();
        self giveweapon("iw9_me_fists_mp_zmb");
        self switchtoweapon("iw9_me_fists_mp_zmb");
        wait 10;
    }
}

// Namespace namespace_3edeb04dba90e80 / namespace_61bcb863c55e8d6b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xfe6
// Size: 0x2d
function allowclasschoicefunc() {
    if (!isplayer(self)) {
        return true;
    }
    if (isbot(self)) {
        return false;
    }
    iszombie = isMutationGameModeZombie();
    return !iszombie;
}

// Namespace namespace_3edeb04dba90e80 / namespace_61bcb863c55e8d6b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x101c
// Size: 0x1be
function spawn_zombies() {
    while (!scripts\mp\flags::gameflagexists("prematch_done")) {
        waitframe();
    }
    if (!getdvarint(@"hash_edf44050ea46141c", 1)) {
        return;
    }
    scripts\mp\flags::gameflagwait("prematch_done");
    var_b054c7cee5a37e24 = getdvarint(@"hash_a66c084bb8c1534b", 20);
    var_b55db3b8e7ae1878 = getdvarint(@"hash_688285cc0b2cb55d", 325);
    while (true) {
        if (!isdefined(level.agentarray)) {
            waitframe();
            continue;
        }
        alive_enemies = scripts\mp\mp_agent::getaliveagentsofteam(game["defenders"]);
        if (alive_enemies.size < var_b054c7cee5a37e24) {
            spawnpoint = function_ca3bbb75a4e56ba2();
            if (!isdefined(spawnpoint)) {
                spawnpoint = random(getspawnarray("mp_tdm_spawn")).origin;
            }
            zombie_type = "actor_jup_spawner_zombie_base_mutation_mode_mp";
            ai = namespace_53fc9ddbb516e6e1::spawnnewaitype_sharedfunc(zombie_type, spawnpoint, (0, randomint(360), 0), game["defenders"]);
            if (isdefined(ai)) {
                ai.goalradius = 16;
                ai.stealth_enabled = 0;
                ai.pathenemyfightdist = 0;
                ai.var_b29c3655b12e292d = 0;
                ai.friendlyteam = game["attackers"];
                ai.maxhealth = var_b55db3b8e7ae1878;
                ai.health = ai.maxhealth;
                ai thread scripts\asm\shared\mp\utility::function_577d8abff6067c23("spawn", "spawn_end", undefined, undefined, "spawn_animating");
                ai utility::function_f3bb4f4911a1beb2("zombie_utils", "setMoveSpeed", "sprint", "horde_spawn", 1);
                ai setthreatbiasgroup("zombie");
            }
        }
        wait 3;
    }
}

// Namespace namespace_3edeb04dba90e80 / namespace_61bcb863c55e8d6b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x11e2
// Size: 0x7c
function function_ca3bbb75a4e56ba2() {
    randx = level.mapcenter[0] + randomintrange(-1000, 1000);
    randy = level.mapcenter[1] + randomintrange(-1000, 1000);
    var_308da6b1fed33068 = level.mapcenter[2];
    var_afaaa0a18b3fcf40 = (randx, randy, var_308da6b1fed33068);
    var_60de69d206774bb8 = getclosestpointonnavmesh(var_afaaa0a18b3fcf40);
    return var_60de69d206774bb8;
}

// Namespace namespace_3edeb04dba90e80 / namespace_61bcb863c55e8d6b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1267
// Size: 0x20
function isDogZombie() {
    return isMutationGameModeZombie() && is_equal(self.class, "default4");
}

// Namespace namespace_3edeb04dba90e80 / namespace_61bcb863c55e8d6b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1290
// Size: 0x5f
function iszombie() {
    team = self.pers["team"];
    if (!isdefined(team)) {
        team = self.sessionteam;
    }
    if (isdefined(self.bot_team)) {
        team = self.bot_team;
    }
    if (team == "none") {
        return undefined;
    }
    return is_equal(team, game["defenders"]);
}

// Namespace namespace_3edeb04dba90e80 / namespace_61bcb863c55e8d6b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x12f8
// Size: 0x1bc
function function_ca5d00ef2a435d1f(struct) {
    player = self;
    if (istrue(player.isjuggernaut)) {
        if (player isMutationGameModeZombie()) {
            struct.loadoutprimary = "jup_jp36_ar_anov94";
            struct.loadoutprimaryvariantid = 9;
            struct.loadoutprimaryattachments = [];
            struct.loadoutprimaryobject = namespace_e0ee43ef2dddadaa::buildweapon_blueprint(struct.loadoutprimary, undefined, undefined, struct.loadoutprimaryvariantid, undefined, undefined, 0);
        }
        return;
    }
    if (!player isMutationGameModeZombie()) {
        struct.loadoutkillstreak1 = "fuel_airstrike";
        struct.loadoutkillstreak2 = "remote_turret";
        struct.loadoutkillstreak3 = "juggernaut";
        return;
    }
    struct.loadoutprimary = "iw9_me_fists_mp";
    struct.loadoutprimaryattachments = [];
    struct.loadoutprimaryvariantid = -1;
    struct.loadoutprimaryobject = makeweapon(struct.loadoutprimary);
    struct.loadoutsecondary = "none";
    struct.loadoutsecondaryattachments = [];
    struct.loadoutsecondaryobject = makeweapon("none");
    struct.loadoutkillstreak1 = "none";
    struct.loadoutkillstreak2 = "none";
    struct.loadoutkillstreak3 = "juggernaut_mutant";
    struct.loadoutequipmentprimary = "none";
    struct.loadoutequipmentsecondary = "none";
    struct.loadoutfieldupgrade1 = "none";
    struct.loadoutfieldupgrade2 = "none";
}

/#

    // Namespace namespace_3edeb04dba90e80 / namespace_61bcb863c55e8d6b
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x14bc
    // Size: 0x96
    function function_a3942567e9f08fb2() {
        while (true) {
            if (getdvarint(@"hash_a5fcedd02f31dfc0", 0)) {
                val = getdvarint(@"hash_a5fcedd02f31dfc0", 0);
                setdvar(@"hash_a5fcedd02f31dfc0", 0);
                if (val == 1) {
                }
                if (val == 2) {
                    level.player thread function_7ede0aa8434bebd1();
                }
                if (val == 3) {
                    level.player thread function_7ede0aa8434bebd1();
                }
                level.player kill();
            }
            wait 0.25;
        }
    }

#/
