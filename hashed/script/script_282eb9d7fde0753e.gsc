// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_4c770a9a4ad7659c;
#using scripts\cp_mp\utility\killstreak_utility.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using script_3db04fd1b466bdba;
#using scripts\cp_mp\killstreaks\juggernaut.gsc;
#using script_13865ca76df87ea;
#using scripts\cp_mp\vehicles\vehicle_tracking.gsc;
#using scripts\cp_mp\killstreaks\killstreakdeploy.gsc;
#using scripts\cp_mp\killstreaks\airdrop.gsc;
#using scripts\cp_mp\emp_debuff.gsc;
#using scripts\mp\objidpoolmanager.gsc;

#namespace juggernaut_recon;

// Namespace juggernaut_recon/namespace_f65b8b60ef677e44
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0x4f6
// Size: 0x19
function autoexec main() {
    function_df7ab5b0f898e8bc(function_1823ff50bb28148d("juggernaut_recon"), &init);
}

// Namespace juggernaut_recon/namespace_f65b8b60ef677e44
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x516
// Size: 0x95
function init() {
    if (issharedfuncdefined("killstreak", "registerKillstreak")) {
        [[ getsharedfunc("killstreak", "registerKillstreak") ]]("juggernaut_recon", &function_2e34ff8caa82d72d);
    }
    if (issharedfuncdefined("juggernaut_recon", "init")) {
        [[ getsharedfunc("juggernaut_recon", "init") ]]();
    }
    if (issharedfuncdefined("juggernaut_recon", "registerActionSet")) {
        [[ getsharedfunc("juggernaut_recon", "registerActionSet") ]]();
    }
    level.var_e084c71df9ac20f1 = spawnstruct();
    thread function_f49ef51573779a58();
}

// Namespace juggernaut_recon/namespace_f65b8b60ef677e44
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5b2
// Size: 0x17
function function_f49ef51573779a58() {
    wait(0.1);
    function_8b0517e29ba99749();
    function_11f8f0876fc973de();
}

// Namespace juggernaut_recon/namespace_f65b8b60ef677e44
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5d0
// Size: 0x62
function function_8b0517e29ba99749() {
    var_584994fab4a8712b = level.var_e084c71df9ac20f1;
    bundle = level.var_b23156d776b1d85.var_38f2a11237246ac["juggernaut_recon"];
    config = namespace_3fad206953a935fe::function_23f0145756ed19cb(bundle);
    /#
    #/
    if (isdefined(config)) {
        var_584994fab4a8712b.config = config;
    }
}

// Namespace juggernaut_recon/namespace_f65b8b60ef677e44
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x639
// Size: 0xbc
function function_9611765a6973a30a(dvar, config, isprimary) {
    /#
        var_71f0e4c2bd2cd3fc = getdvar(dvar, "other");
        if (var_71f0e4c2bd2cd3fc.size == 0) {
            return;
        }
        var_59b95e3a403c1d0d = strtok(var_71f0e4c2bd2cd3fc, "active");
        weaponname = var_59b95e3a403c1d0d[0];
        if (isprimary) {
            config.classstruct.loadoutprimary = weaponname;
        } else {
            config.classstruct.loadoutsecondary = weaponname;
        }
        weaponblueprint = undefined;
        if (var_59b95e3a403c1d0d.size > 1) {
            weaponblueprint = var_59b95e3a403c1d0d[1];
        }
        function_51b8a3cf6102ba3(weaponname, weaponblueprint, config, isprimary);
    #/
}

// Namespace juggernaut_recon/namespace_f65b8b60ef677e44
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6fc
// Size: 0xeb
function function_138468dd32aae3fe() {
    levelData = undefined;
    if (issharedfuncdefined("juggernaut_recon", "levelData")) {
        levelData = [[ getsharedfunc("juggernaut_recon", "levelData") ]]("juggernaut_recon");
    }
    if (isdefined(levelData)) {
        levelData.capturecallback = &function_c13dca1515447b28;
        levelData.destroycallback = &function_bbd5edacfcb74661;
        levelData.activatecallback = &function_546bfb8d4d00c31;
        levelData.minimapicon = "jup_ui_map_icon_jugg_recon_drop";
        levelData.headicon = "jup_ui_map_icon_jugg_recon_drop";
        if (namespace_36f464722d326bbe::function_2d79a7a3b91c4c3e()) {
            levelData.capturestring = "MP/BR_CRATE_LOADOUT";
        } else {
            levelData.capturestring = "KILLSTREAKS_HINTS/JUGG_RECON_CRATE_PICKUP";
        }
        if (!namespace_36f464722d326bbe::isBRStyleGameType()) {
            levelData.basemodel = self.var_3c9615208f1c09b8.cratemodel;
        }
    }
}

// Namespace juggernaut_recon/namespace_f65b8b60ef677e44
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7ee
// Size: 0x22
function function_11f8f0876fc973de() {
    game["dialog"]["juggernaut_recon" + "_use"] = "killstreak_remote_operator" + "_request_response";
}

// Namespace juggernaut_recon/namespace_f65b8b60ef677e44
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x817
// Size: 0x41
function function_b960491329678b4(var_76553dc7aaad2909, var_ca56839b2e00edce) {
    streakinfo = createstreakinfo("juggernaut_recon", self);
    streakinfo.var_ca56839b2e00edce = var_ca56839b2e00edce;
    function_2e34ff8caa82d72d(streakinfo, var_76553dc7aaad2909);
}

// Namespace juggernaut_recon/namespace_f65b8b60ef677e44
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x85f
// Size: 0x18d
function function_2e34ff8caa82d72d(streakinfo, var_76553dc7aaad2909) {
    if (namespace_3c37cb17ade254d::issharedfuncdefined("juggernaut_recon", "canTriggerJuggernaut")) {
        if (!self [[ namespace_3c37cb17ade254d::getsharedfunc("juggernaut_recon", "canTriggerJuggernaut") ]](streakinfo)) {
            return 0;
        }
    }
    if (isdefined(level.killstreaktriggeredfunc)) {
        if (!level [[ level.killstreaktriggeredfunc ]](streakinfo)) {
            return 0;
        }
    }
    bundle = level.var_b23156d776b1d85.var_38f2a11237246ac["juggernaut_recon"];
    self.var_3c9615208f1c09b8 = function_d5974b5f58f14716(bundle, level.var_e084c71df9ac20f1.config, streakinfo.mpstreaksysteminfo.var_12c0f53a71c9bcc8);
    function_138468dd32aae3fe();
    var_97e8248da4371635 = 0;
    /#
        var_97e8248da4371635 = getdvarint(@"hash_8324943f346018cf", 0);
    #/
    if (var_97e8248da4371635 || istrue(var_76553dc7aaad2909)) {
        thread function_8bac95417054dcbf(streakinfo);
    } else {
        namespace_f64231d5b7a2c3c4::reservevehicle();
        deployweaponobj = self.var_3c9615208f1c09b8.var_8881166e57766e3a;
        if (isdefined(level.var_27f78817b59dfe32)) {
            streakinfo.var_fb58a31c756db4cc = level.var_27f78817b59dfe32;
        }
        var_9b1deb5e9d32bbe3 = namespace_b3d24e921998a8b::streakdeploy_doweaponfireddeploy(streakinfo, deployweaponobj, "grenade_fire", undefined, undefined, &markerthrown);
        if (!istrue(var_9b1deb5e9d32bbe3)) {
            namespace_f64231d5b7a2c3c4::clearvehiclereservation();
            return 0;
        }
    }
    if (isdefined(level.killstreakbeginusefunc)) {
        if (!level [[ level.killstreakbeginusefunc ]](streakinfo)) {
            return 0;
        }
    }
    return 1;
}

// Namespace juggernaut_recon/namespace_f65b8b60ef677e44
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9f4
// Size: 0xa1
function markerthrown(streakinfo, weaponobj, projectile) {
    if (issharedfuncdefined("vehicle", "incrementFauxVehicleCount")) {
        [[ getsharedfunc("vehicle", "incrementFauxVehicleCount") ]]();
    }
    projectile.owner = self;
    if (issharedfuncdefined("killstreak", "logKillstreakEvent")) {
        self [[ getsharedfunc("killstreak", "logKillstreakEvent") ]](streakinfo.streakname, self.origin);
    }
    projectile thread function_20037b6d61f6913a(streakinfo);
    streakinfo notify("killstreak_finished_with_deploy_weapon");
    return "success";
}

// Namespace juggernaut_recon/namespace_f65b8b60ef677e44
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa9d
// Size: 0x1d2
function function_20037b6d61f6913a(streakinfo) {
    level endon("game_ended");
    var_811f337efd111e98 = self.owner.angles;
    owner = self.owner;
    streakinfo.airdroptype = streakinfo.streakname;
    position = self waittill("explode");
    if (!isdefined(owner)) {
        if (issharedfuncdefined("vehicle", "decrementFauxVehicleCount")) {
            [[ getsharedfunc("vehicle", "decrementFauxVehicleCount") ]]();
        }
        namespace_f64231d5b7a2c3c4::clearvehiclereservation();
        return;
    }
    if (issharedfuncdefined("vehicle", "decrementFauxVehicleCount")) {
        [[ getsharedfunc("vehicle", "decrementFauxVehicleCount") ]]();
    }
    if (issharedfuncdefined("juggernaut_recon", "dropCrateFromScriptedHeli") && !namespace_36f464722d326bbe::isBRStyleGameType()) {
        streakinfo.vehicleisreserved = 1;
        data = streakinfo;
        scenenode = [[ getsharedfunc("juggernaut_recon", "dropCrateFromScriptedHeli") ]](owner, owner.team, "juggernaut_recon", position, var_811f337efd111e98, position, data, streakinfo);
        owner thread namespace_6c578d6ef48f10ef::airdrop_playdeploydialog(streakinfo);
        if (!isdefined(scenenode)) {
            if (issharedfuncdefined("hud", "showErrorMessage")) {
                owner [[ getsharedfunc("hud", "showErrorMessage") ]]("KILLSTREAKS/VEHICLE_REFUND_KILLSTREAK");
            }
            if (issharedfuncdefined("killstreak", "awardKillstreakFromStruct")) {
                owner [[ getsharedfunc("killstreak", "awardKillstreakFromStruct") ]](streakinfo.mpstreaksysteminfo, "other");
            }
        }
    } else {
        namespace_f64231d5b7a2c3c4::clearvehiclereservation();
        if (namespace_36f464722d326bbe::isBRStyleGameType()) {
            var_e648e96614161011 = 1;
            owner thread namespace_6c578d6ef48f10ef::spawnjuggernautcrateatposition(position, var_e648e96614161011);
        }
    }
}

// Namespace juggernaut_recon/namespace_f65b8b60ef677e44
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc76
// Size: 0x23
function function_546bfb8d4d00c31(var_510b9bde18d66cdd) {
    if (istrue(var_510b9bde18d66cdd)) {
        self setscriptablepartstate("smoke_cover", "active", 0);
    }
}

// Namespace juggernaut_recon/namespace_f65b8b60ef677e44
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xca0
// Size: 0xae
function function_c13dca1515447b28(player) {
    streakinfo = self.data;
    if (istrue(player.isjuggernaut)) {
        if (issharedfuncdefined("airdrop", "awardKillstreak")) {
            self.streakinfo = streakinfo;
            player [[ getsharedfunc("airdrop", "awardKillstreak") ]](streakinfo.streakname, player, self);
        }
        if (issharedfuncdefined("airdrop", "showKillstreakSplash")) {
            player [[ getsharedfunc("airdrop", "showKillstreakSplash") ]](streakinfo.streakname, undefined, 1);
        }
    } else {
        player function_8bac95417054dcbf(streakinfo);
    }
}

// Namespace juggernaut_recon/namespace_f65b8b60ef677e44
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd55
// Size: 0x38
function function_bbd5edacfcb74661(immediate) {
    streakinfo = self.data;
    level callback::callback("killstreak_finish_use", {streakinfo:streakinfo});
}

// Namespace juggernaut_recon/namespace_f65b8b60ef677e44
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd94
// Size: 0x233
function function_8bac95417054dcbf(streakinfo) {
    result = 0;
    if (issharedfuncdefined("juggernaut_recon", "makeJuggernaut")) {
        var_fc8f7897b5023b48 = !isdefined(level.var_e084c71df9ac20f1.config);
        /#
            var_fc8f7897b5023b48 = var_fc8f7897b5023b48 || getdvarint(@"hash_e84595a290967e65", 0) == 1;
        #/
        if (var_fc8f7897b5023b48) {
            function_8b0517e29ba99749();
        }
        var_6d42c4418479180d = var_fc8f7897b5023b48 || !isdefined(self.var_3c9615208f1c09b8);
        if (var_6d42c4418479180d) {
            bundle = level.var_b23156d776b1d85.var_38f2a11237246ac["juggernaut_recon"];
            self.var_3c9615208f1c09b8 = function_d5974b5f58f14716(bundle, level.var_e084c71df9ac20f1.config, streakinfo.mpstreaksysteminfo.var_12c0f53a71c9bcc8);
        }
        if (isdefined(self.var_3c9615208f1c09b8)) {
            result = self [[ getsharedfunc("juggernaut_recon", "makeJuggernaut") ]](self.var_3c9615208f1c09b8, streakinfo);
        }
    }
    if (!result) {
        return 0;
    }
    self.isjuggernautrecon = 1;
    if (self isnightvisionon()) {
        self nightvisionviewoff(1);
        self notify("night_vision_off");
    }
    if (issharedfuncdefined("juggernaut_recon", "playOperatorUseLine")) {
        level thread [[ getsharedfunc("juggernaut_recon", "playOperatorUseLine") ]](self);
    }
    if (issharedfuncdefined("hud", "teamPlayerCardSplash")) {
        level thread [[ getsharedfunc("hud", "teamPlayerCardSplash") ]]("used_juggernaut_recon", self);
    }
    function_68e45178659d4dfd();
    if (isdefined(self.operatorcustomization.gender) && self.operatorcustomization.gender == "female") {
        self function_555e2d32e2756625("gasmask_female");
    } else {
        self function_555e2d32e2756625("gasmask_male");
    }
    if (!istrue(streakinfo.var_ca56839b2e00edce)) {
        self setsoundsubmix("mp_juggernaut", 0.5);
    }
    thread function_e3caef85dfedc944();
    thread function_ad3e24a2d0896537(streakinfo);
    thread function_a8ed613077c9e07(streakinfo);
    thread function_ca2a1fd81a921292(streakinfo);
}

// Namespace juggernaut_recon/namespace_f65b8b60ef677e44
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfce
// Size: 0x12e
function function_e3caef85dfedc944() {
    self endon("death");
    self endon("destroyed");
    self endon("juggernaut_end");
    level endon("game_ended");
    wait(0.5);
    bundle = level.var_b23156d776b1d85.var_38f2a11237246ac["juggernaut_recon"];
    var_2ff0b7294cde30f8 = int(bundle.var_5ac52738ec92f8e * 1000);
    var_489bfe1c59fe7d65 = int(bundle.var_e57c83329f2687af);
    if (islargemap()) {
        var_489bfe1c59fe7d65 = int(bundle.var_93d485915fce13b4);
    }
    if (issharedfuncdefined("player", "doScoreEvent")) {
        childthread function_44d4db462cec2873(bundle, var_489bfe1c59fe7d65, bundle.var_5ac52738ec92f8e);
    }
    while (1) {
        if (function_7d7531f974260d91()) {
            self notify("juggernaut_recon_ping_start");
            if (level.teambased) {
                triggerportableradarpingteam(self.origin, self.team, var_489bfe1c59fe7d65, var_2ff0b7294cde30f8);
            } else {
                triggerportableradarping(self.origin, self, var_489bfe1c59fe7d65, var_2ff0b7294cde30f8);
            }
        }
        wait(bundle.var_8d17f7f2d3c1ebb7);
        self notify("juggernaut_recon_ping_end");
    }
}

// Namespace juggernaut_recon/namespace_f65b8b60ef677e44
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1103
// Size: 0x1f
function function_7d7531f974260d91() {
    if (istrue(self.var_85dc59c6a906819f)) {
        return 0;
    }
    if (namespace_5a51aa78ea0b1b9f::is_empd()) {
        return 0;
    }
    return 1;
}

// Namespace juggernaut_recon/namespace_f65b8b60ef677e44
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x112a
// Size: 0x17d
function function_44d4db462cec2873(bundle, var_489bfe1c59fe7d65, var_2ff0b7294cde30f8) {
    while (1) {
        self waittill("juggernaut_recon_ping_start");
        var_6c8d4501eb5d1f84 = self.origin;
        var_9beeddc065450e3a = var_2ff0b7294cde30f8 / bundle.var_9bf9f003feb68ed8;
        var_2c7a818dd28a336 = [];
        for (i = 1; i <= bundle.var_9bf9f003feb68ed8; i++) {
            wait(var_9beeddc065450e3a);
            var_ad00034aa6fc55c9 = i / bundle.var_9bf9f003feb68ed8 * var_489bfe1c59fe7d65;
            if (issharedfuncdefined("game", "getEnemyTeams")) {
                var_b0c33d224b825287 = [[ getsharedfunc("game", "getEnemyTeams") ]](self.team);
                var_782a999b1a24e0d8 = function_143526130b12b2b6(var_6c8d4501eb5d1f84, var_ad00034aa6fc55c9, var_b0c33d224b825287);
            } else {
                var_782a999b1a24e0d8 = function_143526130b12b2b6(var_6c8d4501eb5d1f84, var_ad00034aa6fc55c9);
            }
            foreach (newcharacter in var_782a999b1a24e0d8) {
                if (!array_contains(var_2c7a818dd28a336, newcharacter)) {
                    var_2c7a818dd28a336 = array_add(var_2c7a818dd28a336, newcharacter);
                    if (newcharacter function_7e3a77b73394cde7()) {
                        continue;
                    }
                    newcharacter childthread function_b3ac6739913f71ab(self);
                }
            }
        }
        self waittill("juggernaut_recon_ping_end");
    }
}

// Namespace juggernaut_recon/namespace_f65b8b60ef677e44
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12ae
// Size: 0x54
function function_7e3a77b73394cde7() {
    if (namespace_3c37cb17ade254d::issharedfuncdefined("perk", "hasPerk") && self [[ getsharedfunc("perk", "hasPerk") ]]("specialty_ghost") && istrue(self.var_3b1bdaaf4482717c)) {
        return 1;
    }
    if (istrue(self.var_8d9c40fe23269431)) {
        return 1;
    }
    return 0;
}

// Namespace juggernaut_recon/namespace_f65b8b60ef677e44
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x130a
// Size: 0x9d
function function_b3ac6739913f71ab(var_75385f5360dd8ddc) {
    var_75385f5360dd8ddc endon("juggernaut_recon_ping_end");
    attacker = self waittill("death");
    if (isdefined(attacker) && isplayer(attacker) && attacker != var_75385f5360dd8ddc) {
        isfriendly = 0;
        if (issharedfuncdefined("player", "isFriendly")) {
            isfriendly = [[ getsharedfunc("player", "isFriendly") ]](var_75385f5360dd8ddc.team, attacker);
        }
        if (isfriendly) {
            var_75385f5360dd8ddc thread [[ getsharedfunc("player", "doScoreEvent") ]](#"hash_70ccc75b709ede6f");
        }
    }
}

// Namespace juggernaut_recon/namespace_f65b8b60ef677e44
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13ae
// Size: 0x35
function function_ad3e24a2d0896537(streakinfo) {
    self endon("disconnect");
    self endon("juggernaut_end");
    level waittill("game_ended");
    if (isdefined(self) && isdefined(streakinfo)) {
        namespace_9abe40d2af041eb2::recordkillstreakendstats(streakinfo);
    }
}

// Namespace juggernaut_recon/namespace_f65b8b60ef677e44
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13ea
// Size: 0xac
function function_a8ed613077c9e07(streakinfo) {
    level endon("game_ended");
    self endon("disconnect");
    juggcontext = self.juggcontext;
    self waittill("juggernaut_end");
    if (isdefined(self.operatorcustomization)) {
        if (isdefined(self.operatorcustomization.gender) && self.operatorcustomization.gender == "female") {
            self function_555e2d32e2756625("female");
        } else {
            self function_555e2d32e2756625("");
        }
    }
    self clearsoundsubmix("mp_juggernaut", 0.5);
    function_d6e3424025c35356(streakinfo, juggcontext);
}

// Namespace juggernaut_recon/namespace_f65b8b60ef677e44
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x149d
// Size: 0x53
function function_d6e3424025c35356(streakinfo, juggcontext) {
    if (!namespace_36f464722d326bbe::isBRStyleGameType()) {
        level callback::callback("killstreak_finish_use", {streakinfo:streakinfo});
        streakinfo.expiredbydeath = 1;
        namespace_9abe40d2af041eb2::recordkillstreakendstats(streakinfo);
    }
    function_2bb8ec2d315b7cb1(juggcontext);
}

// Namespace juggernaut_recon/namespace_f65b8b60ef677e44
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14f7
// Size: 0x3e
function function_ca2a1fd81a921292(streakinfo) {
    self endon("juggernaut_end");
    level endon("game_ended");
    juggcontext = self.juggcontext;
    self waittill("disconnect");
    function_2bb8ec2d315b7cb1(juggcontext);
}

// Namespace juggernaut_recon/namespace_f65b8b60ef677e44
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x153c
// Size: 0x16b
function function_68e45178659d4dfd(var_cbcc20cc563590c7) {
    if (namespace_36f464722d326bbe::isBRStyleGameType()) {
        if (!isdefined(var_cbcc20cc563590c7)) {
            var_cbcc20cc563590c7 = "playerObjective";
        }
        self setscriptablepartstate(var_cbcc20cc563590c7, "juggernaut", 0);
    } else {
        var_477f81d188723410 = undefined;
        if (namespace_3c37cb17ade254d::issharedfuncdefined("game", "requestObjectiveID")) {
            var_477f81d188723410 = namespace_3c37cb17ade254d::getsharedfunc("game", "requestObjectiveID");
        }
        if (isdefined(var_477f81d188723410)) {
            objid = [[ var_477f81d188723410 ]](99);
            self.juggcontext.juggobjid = objid;
            namespace_5a22b6f3a56f7e9b::objective_add_objective(objid, "active", self.origin, "jup_hud_icon_minimap_killstreak_juggernaut_recon", "icon_medium");
            namespace_5a22b6f3a56f7e9b::objective_set_play_intro(objid, 0);
            namespace_5a22b6f3a56f7e9b::objective_set_play_outro(objid, 0);
            foreach (player in level.players) {
                if (!isdefined(player) || isbot(player) || player == self) {
                    continue;
                }
                namespace_5a22b6f3a56f7e9b::objective_playermask_addshowplayer(objid, player);
            }
            namespace_5a22b6f3a56f7e9b::update_objective_onentity(objid, self);
            namespace_5a22b6f3a56f7e9b::update_objective_setbackground(objid, 1);
            if (level.teambased) {
                namespace_5a22b6f3a56f7e9b::update_objective_ownerteam(objid, self.team);
            } else {
                namespace_5a22b6f3a56f7e9b::update_objective_ownerclient(objid, self);
            }
        }
    }
}

// Namespace juggernaut_recon/namespace_f65b8b60ef677e44
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16ae
// Size: 0x71
function function_2bb8ec2d315b7cb1(juggcontext, var_cbcc20cc563590c7) {
    if (isdefined(self) && namespace_36f464722d326bbe::isBRStyleGameType()) {
        if (!isdefined(var_cbcc20cc563590c7)) {
            var_cbcc20cc563590c7 = "playerObjective";
        }
        self setscriptablepartstate(var_cbcc20cc563590c7, "off", 0);
    } else if (namespace_3c37cb17ade254d::issharedfuncdefined("game", "returnObjectiveID")) {
        [[ namespace_3c37cb17ade254d::getsharedfunc("game", "returnObjectiveID") ]](juggcontext.juggobjid);
    }
}

