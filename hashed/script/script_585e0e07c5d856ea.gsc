// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using script_3b64eb40368c1450;
#using scripts\common\utility.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\gamelogic.gsc;
#using script_585e0e07c5d856ea;
#using scripts\mp\flags.gsc;
#using scripts\mp\gametypes\br_killstreaks.gsc;
#using scripts\mp\gametypes\br_gulag.gsc;
#using script_1fefb5a9d58fa8bf;
#using scripts\mp\outofbounds.gsc;
#using script_5bab271917698dc4;
#using scripts\mp\gametypes\br_gametype_dmz.gsc;
#using scripts\mp\gametypes\br_weapons.gsc;
#using scripts\mp\teamrevive.gsc;
#using scripts\mp\spectating.gsc;
#using scripts\mp\gametypes\br_gametypes.gsc;
#using scripts\mp\class.gsc;
#using script_2d9d24f7c63ac143;
#using scripts\mp\playerlogic.gsc;
#using script_7c40fa80892a721;
#using script_22f1701e151b9d12;
#using script_2669878cf5a1b6bc;
#using script_371b4c2ab5861e62;
#using script_5def7af2a9f04234;
#using script_4948cdf739393d2d;
#using script_6b8ada8db8d28c77;
#using script_d09ad38bcf5794b;
#using scripts\mp\utility\debug.gsc;

#namespace captivity_respawn;

// Namespace captivity_respawn/namespace_56b02f3272e8834c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x573
// Size: 0x1a8
function init() {
    level.captivity_respawn = spawnstruct();
    level.captivity_respawn.var_c3837a7e2a322b31 = getdvarfloat(@"hash_d1f05cfe6bc02cba", 3) * 60 * 1000;
    thread function_6eeab801e8f8e95c();
    level.gulag = spawnstruct();
    level.gulag.streamtimeout = getdvarint(@"hash_901c31aaa4eee907", 9);
    level.gulag.introcinematic = getdvarint(@"hash_90dc58d81378e5b0", 1);
    level.gulag.var_d373eba3425dcc77 = getdvarint(@"hash_7ea3ac91f30ce5a5", 41000);
    level.captivity_respawn.var_477bd548940c3a78 = undefined;
    if (isdefined(level.var_1a2b600a06ec21f4) && isdefined(level.var_1a2b600a06ec21f4.var_b36b2d9f357a3fd7)) {
        level.captivity_respawn.var_477bd548940c3a78 = level.var_1a2b600a06ec21f4.var_b36b2d9f357a3fd7;
    } else {
        /#
            assertmsg("Captivity Respawn requires an Intro Bink Name defined in the Game Mode Bundle");
        #/
        level.gulag.introcinematic = 0;
    }
    level thread function_22d44b07ad53078d();
    level.var_e12707853f4ca495 = &function_e12707853f4ca495;
    /#
        setdvarifuninitialized(@"hash_894ea3ecbf97fc9e", 0);
        setdvarifuninitialized(@"hash_d52d8fd13a2a61ef", 0);
        setdvarifuninitialized(@"hash_28f6df882bd50441", 0);
        setdvarifuninitialized(@"hash_17432b5f083d9cbd", 1);
        level thread function_74c192ce0ba9dbff();
    #/
}

// Namespace captivity_respawn/namespace_56b02f3272e8834c
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x722
// Size: 0x7c
function function_e12707853f4ca495(player, var_8bba771671148fba) {
    if (istrue(level.var_7620e6684733526f)) {
        if (!istrue(var_8bba771671148fba) && namespace_cd0b2d039510b38d::isteamreviveenabled() && level.teamdata[player.team]["aliveCount"] > 0) {
            return 0;
        }
        if (namespace_d576b6dc7cef9c62::gettimeremaining() < level.captivity_respawn.var_c3837a7e2a322b31) {
            return 0;
        }
        return player namespace_56b02f3272e8834c::function_76336c4da8742d6c();
    }
    return 0;
}

// Namespace captivity_respawn/namespace_56b02f3272e8834c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7a6
// Size: 0xc4
function function_6eeab801e8f8e95c() {
    level endon("game_ended");
    namespace_4b0406965e556711::gameflagwait("prematch_done");
    timetowait = (namespace_d576b6dc7cef9c62::gettimeremaining() - level.captivity_respawn.var_c3837a7e2a322b31) / 1000;
    if (timetowait <= 0) {
        return;
    }
    wait(timetowait);
    setomnvar("ui_gulag_show_closing_state", 3);
    foreach (player in level.players) {
        if (!isdefined(player) || !isalive(player)) {
            continue;
        }
        namespace_7015c4c971547a66::dangernotifyplayer(player, "respawn_disabled", 2);
    }
}

// Namespace captivity_respawn/namespace_56b02f3272e8834c
// Params 10, eflags: 0x0
// Checksum 0x0, Offset: 0x871
// Size: 0x5a
function onplayerkilled(einflictor, attacker, idamage, smeansofdeath, objweapon, vdir, shitloc, psoffsettime, deathanimduration, var_61b5d0250b328f00) {
    return function_17ae29247a2113e6();
}

// Namespace captivity_respawn/namespace_56b02f3272e8834c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8d3
// Size: 0x33
function function_b2a048361558cf43() {
    if (!istrue(level.var_7620e6684733526f)) {
        return 0;
    }
    if (namespace_d576b6dc7cef9c62::gettimeremaining() < level.captivity_respawn.var_c3837a7e2a322b31) {
        return 0;
    }
    return 1;
}

// Namespace captivity_respawn/namespace_56b02f3272e8834c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x90e
// Size: 0x8a
function function_76336c4da8742d6c() {
    if (!isplayer(self)) {
        return 0;
    }
    if (istrue(self.var_e7af56a2df18030d) || istrue(self.extracted)) {
        return 0;
    }
    level.captivity_respawn.var_77456651e4308d52 = getdvarint(@"hash_82d8c19905df603a", 1);
    var_52ea7a2215830950 = ter_op(isdefined(self.var_143fd788b0b397c4), self.var_143fd788b0b397c4, 0);
    return istrue(var_52ea7a2215830950 < level.captivity_respawn.var_77456651e4308d52);
}

// Namespace captivity_respawn/namespace_56b02f3272e8834c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9a0
// Size: 0x7c
function function_17ae29247a2113e6() {
    /#
        println("weapon_switch" + self.name + "<unknown string>" + self.class);
    #/
    if (!namespace_4b0406965e556711::gameflag("prematch_done")) {
        return 0;
    }
    if (istrue(self.gulag)) {
        return 0;
    }
    if (!istrue(function_76336c4da8742d6c())) {
        return 0;
    }
    if (istrue(getdvarint(@"hash_5713a4066ddc4739", 1))) {
        thread function_2e2d47b0c4ac6d72();
    }
    thread initplayerjail();
    return 1;
}

// Namespace captivity_respawn/namespace_56b02f3272e8834c
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xa24
// Size: 0xba
function private function_2e2d47b0c4ac6d72() {
    level endon("game_ended");
    self endon("disconnect");
    self endon("gulag_end");
    if (issharedfuncdefined("game", "getTeamData")) {
        players = [[ getsharedfunc("game", "getTeamData") ]](self.team, "players");
        foreach (var_736d8d9188ccbd45 in players) {
            if (var_736d8d9188ccbd45 == self) {
                continue;
            }
            if (istrue(function_e12707853f4ca495(var_736d8d9188ccbd45, 1))) {
                var_736d8d9188ccbd45 thread initplayerjail();
            }
        }
    }
}

// Namespace captivity_respawn/namespace_56b02f3272e8834c
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xae5
// Size: 0x3b5
function private initplayerjail() {
    level endon("game_ended");
    self endon("disconnect");
    self endon("gulag_end");
    starttime = gettime();
    self.entergulagwait = 1;
    self.var_908f8ac4bbcdb65e = 1;
    namespace_47fd1e79a44628cd::playerpreloadintrocinematic(level.captivity_respawn.var_477bd548940c3a78);
    namespace_6499f2212dc52bbd::function_8b39e363ca709341();
    self.var_57c207fde9b78089 = 1;
    if (!isdefined(self.gulaguses)) {
        self.gulaguses = 0;
    }
    self.gulaguses++;
    self.gulagloading = 1;
    namespace_d9c77dc2a6fe29c6::enableoobimmunity(self);
    if (isdefined(self.arena) && !istrue(self.arena.var_96242f4753c86dbf)) {
        /#
            assertmsg("Player attempting captivity respawn while arena is already assigned ");
        #/
    }
    childthread function_ef1139e7c3fcdab1();
    childthread function_e32dc34d871dad4e();
    while (istrue(self.gulagloading)) {
        waitframe();
    }
    if (!isbot(self)) {
        namespace_47fd1e79a44628cd::playershowskippromptcinematic();
    }
    namespace_47fd1e79a44628cd::playerwaittillcinematiccomplete(starttime);
    self clearsoundsubmix("solo_cin_igc_music", 2);
    self setplayermusicstate("");
    var_13e3fc231bb8d6b9 = namespace_8bfdb6eb5a3df67a::playeriscinematiclayeron();
    if (!var_13e3fc231bb8d6b9) {
        thread namespace_8bfdb6eb5a3df67a::fadeoutin();
    }
    thread namespace_8bfdb6eb5a3df67a::fadeoutinspectatorsofplayer();
    foreach (teammate in level.teamdata[self.team]["players"]) {
        if (!isdefined(teammate) || !isalive(teammate)) {
            continue;
        }
        if (teammate != self) {
            namespace_d696adde758cbe79::showDMZSplash("exgm_gulag_teammate_captured", [0:teammate], undefined, undefined, self);
        }
    }
    if (isdefined(self.arena)) {
        namespace_47fd1e79a44628cd::removeloadingplayer(self.arena, self);
    }
    if (isdefined(self.oobimmunity)) {
        namespace_d9c77dc2a6fe29c6::disableoobimmunity(self);
    }
    var_540e7bb90bf4bb3c = getdvarint(@"hash_ee3094fa416f8cb5", 2);
    if (var_540e7bb90bf4bb3c > 0) {
        scriptablename = function_106a39bf138b7ca3(var_540e7bb90bf4bb3c);
        var_bada25504e8844d7 = spawnstruct();
        var_bada25504e8844d7.scriptablename = scriptablename;
        var_bada25504e8844d7.origin = self.origin;
        var_bada25504e8844d7.count = 1;
        var_bada25504e8844d7.maxcount = level.br_pickups.maxcounts[scriptablename];
        var_bada25504e8844d7.stackable = level.br_pickups.stackable[scriptablename];
        var_57acedc40b2f974 = namespace_d696adde758cbe79::getDefaultWeaponAmmo(level.br_lootiteminfo[scriptablename].fullweaponobj);
        var_35ead47ed0d7507e = var_57acedc40b2f974[2];
        var_4f04b15053655ba = var_57acedc40b2f974[1];
        ammo = var_57acedc40b2f974[0];
        var_bada25504e8844d7.count = ammo * 3;
        var_bada25504e8844d7.countlefthand = var_4f04b15053655ba;
        var_bada25504e8844d7.var_e97d731bedd44c63 = var_35ead47ed0d7507e;
        namespace_3bcd40a3005712ec::takeweaponpickup(var_bada25504e8844d7);
    }
    if (var_13e3fc231bb8d6b9) {
        namespace_8bfdb6eb5a3df67a::function_e68e4bb4f65f5fe4();
    }
    self.ignoreme = 0;
    val::function_3633b947164be4f3("captivity_respawn", 1);
    wait(1);
    self.arena = undefined;
    childthread function_b6343d66389839ee();
    if (!isdefined(self.var_143fd788b0b397c4)) {
        self.var_143fd788b0b397c4 = 0;
    }
    self.var_143fd788b0b397c4++;
    self.var_908f8ac4bbcdb65e = 0;
    self notify("gulag_start");
}

// Namespace captivity_respawn/namespace_56b02f3272e8834c
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xea1
// Size: 0x24
function private function_106a39bf138b7ca3(value) {
    if (isdefined(value) && value == 2) {
        return "brloot_weapon_me_glassshiv";
    }
    return "brloot_weapon_me_knife_comm";
}

// Namespace captivity_respawn/namespace_56b02f3272e8834c
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xecd
// Size: 0xa3
function private function_b6343d66389839ee() {
    if (!isdefined(self.var_f9e06ac9a9bfd0b2.var_8dd731a00773de7)) {
        return;
    }
    wait(getdvarint(@"hash_9f90c3e42b3ddc08", 7));
    foreach (var_7df9d95029d3540f in self.var_f9e06ac9a9bfd0b2.var_8dd731a00773de7) {
        var_7df9d95029d3540f.dontevershoot = 0;
    }
    self.var_f9e06ac9a9bfd0b2.var_8dd731a00773de7 = undefined;
}

// Namespace captivity_respawn/namespace_56b02f3272e8834c
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xf77
// Size: 0x1f
function private function_46cca89beee3a842() {
    self endon("disconnect");
    self endon("arenaFound");
    wait(15);
    self.var_30aa967d83703fec = 1;
}

// Namespace captivity_respawn/namespace_56b02f3272e8834c
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xf9d
// Size: 0x1f2
function private function_178d579cd5f260b9() {
    level endon("game_ended");
    while (!function_45fad871d0bee0f2(level.captivity_respawn.var_8c731182d88e8118)) {
        var_db588938105dc91d = function_73d8a9394fc5eda2(level.captivity_respawn.var_8c731182d88e8118);
        if (!isdefined(var_db588938105dc91d) || istrue(var_db588938105dc91d.isdisconnecting)) {
            level.captivity_respawn.var_8c731182d88e8118 = function_93def91a50927481(level.captivity_respawn.var_8c731182d88e8118);
            continue;
        }
        arenaFound = var_db588938105dc91d function_dd26d64a365cebbd();
        if (!istrue(arenaFound) && istrue(var_db588938105dc91d.var_30aa967d83703fec)) {
            var_2d00675497c92ae7 = var_db588938105dc91d [[ level.getspawnpoint ]]();
            arena = spawnstruct();
            arena.targetname = "gulag";
            arena.origin = var_2d00675497c92ae7.origin;
            arena.angles = var_2d00675497c92ae7.angles;
            arena.var_96242f4753c86dbf = 1;
            setuparena(arena);
            var_db588938105dc91d.arena = arena;
            var_db588938105dc91d.var_30aa967d83703fec = 0;
        }
        if (isdefined(var_db588938105dc91d.arena)) {
            var_db588938105dc91d notify("arenaFound");
            var_db588938105dc91d.arena.loadingplayers[var_db588938105dc91d.arena.loadingplayers.size] = self;
            thread namespace_47fd1e79a44628cd::addloadingplayerdisconnectwatch(var_db588938105dc91d.arena, var_db588938105dc91d);
            level.captivity_respawn.var_8c731182d88e8118 = function_93def91a50927481(level.captivity_respawn.var_8c731182d88e8118);
        } else {
            wait(2);
        }
    }
    level.captivity_respawn.var_5b74d871c4ff992f = 0;
}

// Namespace captivity_respawn/namespace_56b02f3272e8834c
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1196
// Size: 0x385
function private function_e32dc34d871dad4e() {
    self endon("disconnect");
    while (!isdefined(self.arena)) {
        wait(2);
    }
    if (getdvarint(@"hash_28f6df882bd50441") > 0) {
        wait(getdvarint(@"hash_28f6df882bd50441"));
    }
    if (!isdefined(self.arena.origin) || !isdefined(self.arena.angles)) {
        /#
            assertmsg("Corrupted Arena assigned to player");
        #/
    }
    if (isdefined(level.checkforlaststandwipe)) {
        [[ level.checkforlaststandwipe ]]();
    }
    spawnorigin = getgroundposition(self.arena.origin, 12);
    var_3f39a8b789073e7b = namespace_47fd1e79a44628cd::gulagstreamlocationstart(spawnorigin);
    self.streampoint = spawnstruct();
    self.streampoint.origin = spawnorigin;
    self.streampoint.angles = self.arena.angles;
    self.forcespawnangles = self.streampoint.angles;
    self.forcespawnorigin = spawnorigin;
    var_96ce1f32e5c7addd = 0;
    if (istrue(namespace_7db13bdf599e41a6::function_7127253a02af37c6(self))) {
        function_acadbf101fdd2096();
        var_96ce1f32e5c7addd = 1;
    }
    if (var_3f39a8b789073e7b && istrue(self.entergulagwait)) {
        namespace_47fd1e79a44628cd::entergulagwait(self);
    }
    namespace_47fd1e79a44628cd::playerplayintrocinematic();
    if (istrue(var_96ce1f32e5c7addd) && getdvarint(@"hash_eecf9cd4f872dbec", 1) == 1) {
        waittill_any_2("disconnect", "brWaitAndSpawnClientComplete");
        self.revivetriggeravailable = undefined;
        self.statusicon = "";
    }
    if (var_3f39a8b789073e7b || isbot(self)) {
        namespace_5aeecefc462876::setdisabled();
        namespace_47fd1e79a44628cd::gulagstreamlocationstart(spawnorigin);
    }
    if (var_3f39a8b789073e7b) {
        namespace_47fd1e79a44628cd::gulagstreamlocationwait();
    }
    if (namespace_71073fa38f11492::isbrgametypefuncdefined("playerPreSpawnGulagJail")) {
        namespace_71073fa38f11492::runbrgametypefunc("playerPreSpawnGulagJail");
    }
    self.class = "gamemode";
    self.pers["gamemodeLoadout"] = [];
    namespace_d19129e4fa5d176::respawnitems_clear();
    namespace_aead94004cf4c147::function_5c5e6619f0b24f90();
    namespace_aead94004cf4c147::function_954372d604277278(self);
    namespace_d19129e4fa5d176::loadout_emptycacheofloadout("gamemode");
    if (!istrue(var_96ce1f32e5c7addd)) {
        if (isbot(self)) {
            function_acadbf101fdd2096();
        } else {
            namespace_99ac021a7547cae3::spawnplayer(undefined, 0);
        }
    }
    namespace_f8d3520d3483c1::initarmor();
    namespace_f8d3520d3483c1::function_be5c0cdfa0202544();
    val::function_2d6e7e0b80767910("captivity_respawn", [0:"usability", 1:"allow_movement", 2:"weapon_switch", 3:"crouch", 4:"prone", 5:"melee", 6:"ads"]);
    val::function_3633b947164be4f3("captivity_respawn", 0);
    self.ignoreme = 1;
    self.streampoint = undefined;
    self.gulagloading = 0;
    if (isdefined(self.var_f9e06ac9a9bfd0b2)) {
        function_a5daea6f3eb5d2a3(self.var_f9e06ac9a9bfd0b2);
        var_44fa68b2f93418ac = namespace_614554f86e52695c::function_1ceed24d075a0981(self.var_f9e06ac9a9bfd0b2.target);
        if (var_44fa68b2f93418ac.size > 0) {
            var_ad46aadd4e3290d7 = var_44fa68b2f93418ac[0];
            if (isdefined(var_ad46aadd4e3290d7)) {
                namespace_614554f86e52695c::function_e4a67fe4ddca7ed5(var_ad46aadd4e3290d7, &function_48e29eadb9a298b2, self.var_f9e06ac9a9bfd0b2);
                function_fc38783a3da0bc71(var_ad46aadd4e3290d7, 1);
            }
        }
    }
    namespace_47fd1e79a44628cd::gulagloadingtextclear();
    if (var_3f39a8b789073e7b || isbot(self)) {
        namespace_47fd1e79a44628cd::gulagstreamlocationend();
    }
}

// Namespace captivity_respawn/namespace_56b02f3272e8834c
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1522
// Size: 0x53
function private function_acadbf101fdd2096() {
    if (getdvarint(@"hash_eecf9cd4f872dbec", 1) == 1) {
        self.beingrevived = 0;
        self setbeingrevived(0);
        thread namespace_7db13bdf599e41a6::respawn();
    } else {
        self notify("abort_killcam");
        self.cancelkillcam = 1;
        thread namespace_99ac021a7547cae3::waittillcanspawnclient(1);
    }
}

// Namespace captivity_respawn/namespace_56b02f3272e8834c
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x157c
// Size: 0x79
function private function_a5daea6f3eb5d2a3(var_5abf856e87d27fbb) {
    if (!isdefined(var_5abf856e87d27fbb) || !isdefined(var_5abf856e87d27fbb.doors)) {
        return;
    }
    foreach (door in var_5abf856e87d27fbb.doors) {
        door scriptabledoorclose();
    }
}

// Namespace captivity_respawn/namespace_56b02f3272e8834c
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x15fc
// Size: 0x6f
function private function_a15f6fecb1e9013f(agent, fortress) {
    waitframe();
    weapon = namespace_e0ee43ef2dddadaa::buildweapon("iw9_pi_papa220_mp");
    agent.health = 150;
    agent.armorhealth = 100;
    agent.var_685390c6753c2cc7 = 1;
    namespace_14d36171baccf528::agentPers_setAgentPersData(agent, "exgmGulagAgent", 1);
    agent namespace_14d36171baccf528::function_c37c4f9d687074ff(undefined, undefined, weapon);
}

// Namespace captivity_respawn/namespace_56b02f3272e8834c
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x1672
// Size: 0x58
function private function_82ab612b76c294ed(fortress, agent) {
    if (!isdefined(fortress.var_8dd731a00773de7)) {
        fortress.var_8dd731a00773de7 = [];
    }
    agent.dontevershoot = 1;
    fortress.var_8dd731a00773de7[fortress.var_8dd731a00773de7.size] = agent;
}

// Namespace captivity_respawn/namespace_56b02f3272e8834c
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x16d1
// Size: 0x44
function function_48e29eadb9a298b2(requestid, fortress, agent, data) {
    data.script_stealthgroup = fortress.target;
    function_a15f6fecb1e9013f(agent, fortress);
}

// Namespace captivity_respawn/namespace_56b02f3272e8834c
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x171c
// Size: 0xb5
function private function_ef1139e7c3fcdab1() {
    if (!isdefined(level.captivity_respawn.var_8c731182d88e8118)) {
        var_2f2be6ac316fef36 = level.maxplayercount;
        level.captivity_respawn.var_8c731182d88e8118 = function_79c374ab1ca30cc9(var_2f2be6ac316fef36);
    }
    level.captivity_respawn.var_8c731182d88e8118 = function_6cf786a6cf335cb9(level.captivity_respawn.var_8c731182d88e8118, self);
    childthread function_46cca89beee3a842();
    if (!istrue(level.captivity_respawn.var_5b74d871c4ff992f)) {
        level.captivity_respawn.var_5b74d871c4ff992f = 1;
        level thread function_178d579cd5f260b9();
    }
}

// Namespace captivity_respawn/namespace_56b02f3272e8834c
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x17d8
// Size: 0x408
function private function_dd26d64a365cebbd() {
    if (getdvarint(@"hash_d52d8fd13a2a61ef") == 1) {
        self.var_f9e06ac9a9bfd0b2 = undefined;
        self.arena = undefined;
        return 0;
    }
    var_e099464a453b831 = undefined;
    if (isdefined(level.captivity_respawn.var_65b23a14b3ef04d8) && level.captivity_respawn.var_65b23a14b3ef04d8.size > 0) {
        var_94afb7d602135955 = getdvarint(@"hash_8bdee07fa09e810a", -1);
        if (var_94afb7d602135955 > -1 && var_94afb7d602135955 < level.captivity_respawn.var_65b23a14b3ef04d8.size) {
            self.var_f9e06ac9a9bfd0b2 = level.captivity_respawn.var_65b23a14b3ef04d8[var_94afb7d602135955];
            self.arena = self.var_f9e06ac9a9bfd0b2.var_199c03025cc58f52;
            return 1;
        }
        if (getdvarint(@"hash_17432b5f083d9cbd", 1) == 0) {
            level.captivity_respawn.var_65b23a14b3ef04d8 = array_randomize(level.captivity_respawn.var_65b23a14b3ef04d8);
        } else {
            level.captivity_respawn.var_65b23a14b3ef04d8 = sortbydistance(level.captivity_respawn.var_65b23a14b3ef04d8, self.origin);
            var_a82065476a8b46e4 = getdvarfloat(@"hash_350a7272a1c4e0", 30371121);
        }
        /#
            level.captivity_respawn.var_66a24e742af94808 = [];
            level.captivity_respawn.var_23f0f5b4d32eb45c = [];
            level.captivity_respawn.var_c925bd5d834fc707 = self.origin;
        #/
        for (i = 0; i < level.captivity_respawn.var_65b23a14b3ef04d8.size; i++) {
            var_5abf856e87d27fbb = level.captivity_respawn.var_65b23a14b3ef04d8[i];
            if (isdefined(var_5abf856e87d27fbb.var_5aa671823fa14c8)) {
                if (var_5abf856e87d27fbb.var_5aa671823fa14c8 == self) {
                    /#
                        assertmsg("captivityRespawn Player is searching for a Respawn Node but it's already assigned to one. NodePos:" + var_5abf856e87d27fbb.origin + ", Player: " + self);
                    #/
                }
                /#
                    level.captivity_respawn.var_66a24e742af94808[level.captivity_respawn.var_66a24e742af94808.size] = var_5abf856e87d27fbb.var_199c03025cc58f52.origin;
                #/
            } else {
                var_79129e9f3ac5dfe = utility::playersnear(var_5abf856e87d27fbb.var_199c03025cc58f52.origin, getdvarint(@"hash_88f71b97c86a178", 1200));
                if (var_79129e9f3ac5dfe.size == 0) {
                    if (isdefined(var_a82065476a8b46e4) && distancesquared(self.origin, var_5abf856e87d27fbb.var_199c03025cc58f52.origin) < var_a82065476a8b46e4) {
                        /#
                            level.captivity_respawn.var_66a24e742af94808[level.captivity_respawn.var_66a24e742af94808.size] = var_5abf856e87d27fbb.var_199c03025cc58f52.origin;
                        #/
                        continue;
                    }
                    /#
                        level.captivity_respawn.var_fe58d537de9fa162 = var_5abf856e87d27fbb.var_199c03025cc58f52.origin;
                    #/
                    var_e099464a453b831 = var_5abf856e87d27fbb;
                    break;
                } else {
                    /#
                        level.captivity_respawn.var_23f0f5b4d32eb45c[level.captivity_respawn.var_23f0f5b4d32eb45c.size] = var_5abf856e87d27fbb.var_199c03025cc58f52.origin;
                    #/
                }
            }
        }
    }
    self.var_f9e06ac9a9bfd0b2 = var_e099464a453b831;
    self.arena = undefined;
    if (isdefined(var_e099464a453b831)) {
        self.arena = var_e099464a453b831.var_199c03025cc58f52;
        var_e099464a453b831.var_5aa671823fa14c8 = self;
        var_e099464a453b831 thread function_77557394a5e071d6();
    }
    return isdefined(self.var_f9e06ac9a9bfd0b2);
}

// Namespace captivity_respawn/namespace_56b02f3272e8834c
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1be8
// Size: 0x2e
function private function_77557394a5e071d6() {
    level endon("game_ended");
    self.var_5aa671823fa14c8 waittill_any_2("disconnect", "spawned");
    self.var_5aa671823fa14c8 = undefined;
}

// Namespace captivity_respawn/namespace_56b02f3272e8834c
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1c1d
// Size: 0x2c6
function private function_22d44b07ad53078d() {
    level endon("game_ended");
    level.captivity_respawn.var_65b23a14b3ef04d8 = [];
    while (!isdefined(level.struct_class_names)) {
        waitframe();
    }
    while (!isdefined(level.patrolPaths) && !istrue(level.var_4fe0c43951f6ce37)) {
        waitframe();
    }
    while (!flag_exist("create_script_initialized")) {
        if (!flag_exist("poi_initialized")) {
            waitframe();
        } else {
            break;
        }
    }
    while (!flag_exist("poi_initialized")) {
        flag_wait("create_script_initialized");
    }
    waitframe();
    var_3f4bc61af824f7f0 = getstructarray("captivityRespawn", "targetname");
    foreach (var_5abf856e87d27fbb in var_3f4bc61af824f7f0) {
        var_da83589dc0b1bb68 = getclosestpointonnavmesh(var_5abf856e87d27fbb.origin);
        if (isdefined(var_da83589dc0b1bb68)) {
            if (distance2dsquared(var_da83589dc0b1bb68, var_5abf856e87d27fbb.origin) < 1048576) {
                if (!isdefined(var_5abf856e87d27fbb.target)) {
                    /#
                        assertmsg("captivityRespawn node is missing target value. Location: " + var_5abf856e87d27fbb.origin);
                    #/
                } else {
                    if (!isdefined(var_5abf856e87d27fbb.poiName)) {
                        var_5abf856e87d27fbb.poiName = namespace_37f0fb6355a4618a::function_55cf921efa4cbd09(var_5abf856e87d27fbb.origin, 1);
                    }
                    namespace_9823ee6035594d67::function_eecb9fd7f5e8181b(var_5abf856e87d27fbb);
                    setupprops(var_5abf856e87d27fbb);
                    var_55a8cd2462d707dc = array_combine(getstructarray(var_5abf856e87d27fbb.target, "targetname"), getentarray(var_5abf856e87d27fbb.target, "targetname"), function_f159c10d5cf8f0b4(var_5abf856e87d27fbb.target, "targetname"));
                    foreach (node in var_55a8cd2462d707dc) {
                        if (!isdefined(node.script_noteworthy)) {
                            continue;
                        }
                        if (node.script_noteworthy == "captivitySpawnPoint") {
                            setuparena(node);
                            var_5abf856e87d27fbb.var_199c03025cc58f52 = node;
                            break;
                        }
                    }
                    if (isdefined(var_5abf856e87d27fbb.var_199c03025cc58f52)) {
                        level.captivity_respawn.var_65b23a14b3ef04d8[level.captivity_respawn.var_65b23a14b3ef04d8.size] = var_5abf856e87d27fbb;
                    } else {
                        /#
                            assertmsg("captivityRespawn node requires at least 1 associated captivitySpawnPoint. Location: " + var_5abf856e87d27fbb.origin);
                        #/
                    }
                }
            }
        }
    }
}

// Namespace captivity_respawn/namespace_56b02f3272e8834c
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x1eea
// Size: 0x5b
function private function_38de677b691b79fb(var_5abf856e87d27fbb, door) {
    if (!isdefined(var_5abf856e87d27fbb) || !isdefined(door)) {
        return;
    }
    if (!isdefined(var_5abf856e87d27fbb.doors)) {
        var_5abf856e87d27fbb.doors = [];
    }
    var_5abf856e87d27fbb.doors = array_add(var_5abf856e87d27fbb.doors, door);
}

// Namespace captivity_respawn/namespace_56b02f3272e8834c
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x1f4c
// Size: 0xc7
function private setupprops(var_5abf856e87d27fbb) {
    if (isdefined(var_5abf856e87d27fbb) && isdefined(var_5abf856e87d27fbb.props)) {
        foreach (var_7b16a6b691fe4288 in var_5abf856e87d27fbb.props) {
            if (!isdefined(var_7b16a6b691fe4288)) {
                continue;
            }
            if (isdefined(var_7b16a6b691fe4288.script_noteworthy) && var_7b16a6b691fe4288.script_noteworthy == "captivityRespawn_door") {
                door = namespace_74c5cf8e20fcae83::function_95faa2e34b9a63a9(var_7b16a6b691fe4288, "scriptable_door_exgm_captivity_respawn");
                function_38de677b691b79fb(var_5abf856e87d27fbb, door);
            } else {
                namespace_92675a37bd817c19::function_c682e2b1b49deb8f(var_7b16a6b691fe4288);
            }
        }
    }
}

// Namespace captivity_respawn/namespace_56b02f3272e8834c
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x201a
// Size: 0xa9
function private setuparena(arena) {
    arena.jailspawns = [];
    arena.fightspawns = [];
    arena.cellspawns = [];
    arena.gates = [];
    arena.floor = [];
    arena.weapons = [];
    arena.molotovs = [];
    arena.jailedplayers = [];
    arena.arenaplayers = [];
    arena.matches = [];
    arena.loadingplayers = [];
    arena.fightover = 1;
}

// Namespace captivity_respawn/namespace_56b02f3272e8834c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x20ca
// Size: 0x277
function function_74c192ce0ba9dbff() {
    /#
        while (1) {
            if (getdvarint(@"hash_894ea3ecbf97fc9e", 0) == 1) {
                if (isdefined(level.captivity_respawn.var_65b23a14b3ef04d8) && level.captivity_respawn.var_65b23a14b3ef04d8.size > 0) {
                    foreach (var_5abf856e87d27fbb in level.captivity_respawn.var_65b23a14b3ef04d8) {
                        level thread function_49d30df50940b9d7(var_5abf856e87d27fbb.var_199c03025cc58f52.origin, 30, 10, (1, 1, 0));
                    }
                }
                if (isdefined(level.captivity_respawn.var_66a24e742af94808)) {
                    foreach (var_8c569acda8b95908 in level.captivity_respawn.var_66a24e742af94808) {
                        level thread function_49d30df50940b9d7(var_8c569acda8b95908, 31, 10, (1, 0, 1));
                    }
                }
                if (isdefined(level.captivity_respawn.var_23f0f5b4d32eb45c)) {
                    foreach (var_277f3ccb3a7cecec in level.captivity_respawn.var_23f0f5b4d32eb45c) {
                        level thread function_49d30df50940b9d7(var_277f3ccb3a7cecec, 31, 10, (0, 0, 1));
                    }
                }
                if (isdefined(level.captivity_respawn.var_c925bd5d834fc707)) {
                    level thread function_49d30df50940b9d7(level.captivity_respawn.var_c925bd5d834fc707, 35, 10, (1, 0, 0));
                }
                if (isdefined(level.captivity_respawn.var_fe58d537de9fa162)) {
                    level thread function_49d30df50940b9d7(level.captivity_respawn.var_fe58d537de9fa162, 35, 10, (0, 1, 0));
                }
            }
            wait(10);
        }
    #/
}

// Namespace captivity_respawn/namespace_56b02f3272e8834c
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x2348
// Size: 0x34
function function_49d30df50940b9d7(pos, size, var_9f92884414aa49fb, color) {
    /#
        level thread namespace_d028276791d9cff6::drawsphere(pos, size, var_9f92884414aa49fb, color);
    #/
}

