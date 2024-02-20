// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_3b64eb40368c1450;
#using script_4c770a9a4ad7659c;
#using scripts\cp_mp\utility\killstreak_utility.gsc;
#using script_13865ca76df87ea;
#using script_2669878cf5a1b6bc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\cp_mp\vehicles\vehicle_tracking.gsc;
#using scripts\cp_mp\killstreaks\killstreakdeploy.gsc;
#using scripts\cp_mp\killstreaks\airdrop.gsc;
#using script_189b67b2735b981d;
#using script_cbb0697de4c5728;
#using scripts\cp_mp\utility\weapon_utility.gsc;
#using scripts\mp\objidpoolmanager.gsc;
#using scripts\cp_mp\hostmigration.gsc;
#using scripts\cp_mp\utility\inventory_utility.gsc;

#namespace juggernaut;

// Namespace juggernaut/namespace_3fad206953a935fe
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x84b
// Size: 0xf4
function init() {
    if (issharedfuncdefined("juggernaut", "init")) {
        [[ getsharedfunc("juggernaut", "init") ]]();
    }
    if (issharedfuncdefined("juggernaut", "registerActionSet")) {
        [[ getsharedfunc("juggernaut", "registerActionSet") ]]();
    }
    level.juggksglobals = spawnstruct();
    initconfig();
    initmarker();
    init_jugg_vo();
    /#
        setdevdvarifuninitialized(@"hash_3f1bd355bf340abb", 0);
        setdevdvarifuninitialized(@"hash_841d9a60f75a35c8", 0);
    #/
    registervisibilityomnvarforkillstreak("juggernaut", "mask_on", 1);
    registervisibilityomnvarforkillstreak("juggernaut", "mask_damage_low", 2);
    registervisibilityomnvarforkillstreak("juggernaut", "mask_damage_med", 3);
    registervisibilityomnvarforkillstreak("juggernaut", "mask_damage_high", 4);
    registervisibilityomnvarforkillstreak("juggernaut", "mask_damage_critical", 5);
}

// Namespace juggernaut/namespace_3fad206953a935fe
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x946
// Size: 0x270
function initconfig() {
    var_584994fab4a8712b = level.juggksglobals;
    config = undefined;
    if (issharedfuncdefined("juggernaut", "initConfig")) {
        config = self [[ getsharedfunc("juggernaut", "initConfig") ]]();
    }
    var_584994fab4a8712b.config = config;
    config.infiniteammo = 1;
    config.infiniteammoupdaterate = 4;
    config.maxhealth = 3000;
    config.startinghealth = 3000;
    config.suit = "iw9_ks_juggernaut_mp";
    config.clothtype = "vestheavy";
    config.var_400ef51562606e7a = "milhvygr";
    config.execution = "execution_mp_juggernaut_01";
    config.head_health = config.maxhealth * 0.9;
    config.torso_upper_health = config.maxhealth * 0.5;
    config.torso_lower_health = config.maxhealth * 0.5;
    config.right_upper_arm_health = config.maxhealth * 0.1;
    config.right_lower_arm_health = config.maxhealth * 0.1;
    config.left_upper_arm_health = config.maxhealth * 0.1;
    config.left_lower_arm_health = config.maxhealth * 0.1;
    config.right_leg_health = config.maxhealth * 0.1;
    config.left_leg_health = config.maxhealth * 0.1;
    if (utility::iscp()) {
        config.classstruct.loadoutprimary = "iw9_lm_dblmg2_cp";
        config.classstruct.loadoutsecondary = "none";
    } else {
        config.classstruct.loadoutprimary = "iw9_minigunksjugg_mp";
        config.classstruct.loadoutsecondary = "iw9_pi_golf18_mp";
    }
    if (isdefined(level.addjuggsettings)) {
        config [[ level.addjuggsettings ]]();
    }
}

// Namespace juggernaut/namespace_3fad206953a935fe
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbbd
// Size: 0x52f
function function_23f0145756ed19cb(bundle) {
    config = undefined;
    if (issharedfuncdefined("juggernaut", "initConfig")) {
        config = self [[ getsharedfunc("juggernaut", "initConfig") ]]();
        /#
            assertex(bundle.var_f67737eeacd73393, "Called createConfigWithBundle but the bundle has juggernautUseBundleConfigTuning disabled.");
        #/
        config.maxhealth = bundle.maxhealth;
        config.startinghealth = config.maxhealth;
        config.head_health = config.maxhealth * bundle.var_416dce8611ee4b79;
        config.torso_upper_health = config.maxhealth * bundle.var_c64960c912865e66;
        config.torso_lower_health = config.maxhealth * bundle.var_c64960c912865e66;
        config.right_upper_arm_health = config.maxhealth * bundle.var_beab43fbce66e637;
        config.right_lower_arm_health = config.maxhealth * bundle.var_beab43fbce66e637;
        config.left_upper_arm_health = config.maxhealth * bundle.var_beab43fbce66e637;
        config.left_lower_arm_health = config.maxhealth * bundle.var_beab43fbce66e637;
        config.right_leg_health = config.maxhealth * bundle.var_beab43fbce66e637;
        config.left_leg_health = config.maxhealth * bundle.var_beab43fbce66e637;
        config.movespeedscalar = bundle.var_2c9122780ca2e437;
        if (isdefined(bundle.var_4067184a66c1feb1)) {
            config.classstruct.loadoutprimary = bundle.var_4067184a66c1feb1;
        } else {
            config.classstruct.loadoutprimary = "none";
        }
        if (isdefined(bundle.var_c48baae66fc5f9f1)) {
            config.classstruct.loadoutsecondary = bundle.var_c48baae66fc5f9f1;
        } else {
            config.classstruct.loadoutsecondary = "none";
        }
        function_51b8a3cf6102ba3(config.classstruct.loadoutprimary, bundle.var_7b10b84380a70ac, config, 1);
        function_51b8a3cf6102ba3(config.classstruct.loadoutsecondary, bundle.var_9ebf392a818347ec, config, 0);
        if (isdefined(bundle.var_ae012311bc24c63b)) {
            config.classstruct.loadoutequipmentprimary = bundle.var_ae012311bc24c63b;
            config.allows["equipment_primary"] = 0;
            config.var_238382d33b25a18a = ter_op(isdefined(bundle.var_ff660dd9c36f1a2a), bundle.var_ff660dd9c36f1a2a, 1);
        }
        if (isdefined(bundle.var_ba0c8abba9612e50)) {
            config.classstruct.loadoutequipmentsecondary = bundle.var_ba0c8abba9612e50;
            config.allows["equipment_secondary"] = 0;
            config.var_2c455d4333df379f = ter_op(isdefined(bundle.var_a68a7839358c93f), bundle.var_a68a7839358c93f, 1);
        }
        config.infiniteammo = bundle.var_1c2f47f106ec92e3;
        if (config.infiniteammo) {
            config.infiniteammoupdaterate = bundle.var_41a772126a8873b0;
        } else {
            config.infiniteammoupdaterate = undefined;
        }
        config.execution = bundle.var_eae856be7fea7239;
        config.suit = bundle.var_fc1320a71853eb7c;
        config.clothtype = bundle.var_40b6bbc083e50def;
        config.bodymodel = bundle.var_c0816bafc46c2bb6;
        config.headmodel = bundle.var_81a8ebd7b6bc0c7c;
        config.viewmodel = bundle.var_a92eea6b6557a819;
        if (!bundle.var_4da8c9c4a056dc12 || !isdefined(config.perks)) {
            config.perks = [];
        }
        if (isdefined(bundle.var_ee3e7dd486179916) && bundle.var_ee3e7dd486179916.size > 0) {
            foreach (var_21c5c7949ca848e1 in bundle.var_ee3e7dd486179916) {
                config.perks[var_21c5c7949ca848e1.name] = 1;
            }
        }
    }
    return config;
}

// Namespace juggernaut/namespace_3fad206953a935fe
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10f4
// Size: 0x459
function function_d5974b5f58f14716(bundle, var_89c3fff29839bf2a, blueprintIndex) {
    config = function_7e7b315fcb2b9159(var_89c3fff29839bf2a, 1);
    var_9b32d1936831f5aa = undefined;
    if (isdefined(bundle.var_d96d3e6ceed581fd.blueprints) && bundle.var_d96d3e6ceed581fd.blueprints.size > 0 && blueprintIndex > 0) {
        var_9b32d1936831f5aa = bundle.var_d96d3e6ceed581fd.blueprints[blueprintIndex - 1].genericblueprint;
    } else if (isdefined(bundle.var_d96d3e6ceed581fd.var_85ec36a3c387a93a)) {
        var_9b32d1936831f5aa = bundle.var_d96d3e6ceed581fd.var_85ec36a3c387a93a;
    }
    config.deployWeapon = function_dd2a4fb3522f314(var_9b32d1936831f5aa, "deployWeapon");
    primaryweaponname = function_8df651a1b2728b15(var_9b32d1936831f5aa, "primaryWeapon");
    var_a1aa2d822e933d07 = function_b9ff4b6230995332(var_9b32d1936831f5aa, "primaryWeapon");
    secondaryweaponname = function_8df651a1b2728b15(var_9b32d1936831f5aa, "secondaryWeapon");
    var_e426ac0fd477f647 = function_b9ff4b6230995332(var_9b32d1936831f5aa, "secondaryWeapon");
    var_145192ceef62d852 = function_29e16a88682086b2(var_9b32d1936831f5aa, "string", "lethalEquipment");
    var_97fbcdea08315d73 = function_29e16a88682086b2(var_9b32d1936831f5aa, "string", "tacticalEquipment");
    lethalEquipmentBlueprintIndex = function_29e16a88682086b2(var_9b32d1936831f5aa, "string", "lethalEquipmentBlueprintIndex");
    tacticalEquipmentBlueprintIndex = function_29e16a88682086b2(var_9b32d1936831f5aa, "string", "tacticalEquipmentBlueprintIndex");
    var_6b3c36cc33280e97 = function_29e16a88682086b2(var_9b32d1936831f5aa, "suit", "suit");
    var_8b10c9ea167f0ff2 = function_29e16a88682086b2(var_9b32d1936831f5aa, "execution", "execution");
    bodymodel = function_29e16a88682086b2(var_9b32d1936831f5aa, "xmodel", "bodyModel");
    headmodel = function_29e16a88682086b2(var_9b32d1936831f5aa, "xmodel", "headModel");
    viewmodel = function_29e16a88682086b2(var_9b32d1936831f5aa, "xmodel", "viewModel");
    cratemodel = function_29e16a88682086b2(var_9b32d1936831f5aa, "xmodel", "crateModel");
    config.classstruct.loadoutprimary = "none";
    if (isdefined(primaryweaponname)) {
        config.classstruct.loadoutprimary = primaryweaponname;
    }
    config.classstruct.loadoutsecondary = "none";
    if (isdefined(secondaryweaponname)) {
        config.classstruct.loadoutsecondary = secondaryweaponname;
    }
    function_51b8a3cf6102ba3(config.classstruct.loadoutprimary, var_a1aa2d822e933d07, config, 1);
    function_51b8a3cf6102ba3(config.classstruct.loadoutsecondary, var_e426ac0fd477f647, config, 0);
    config.classstruct.loadoutequipmentprimary = "none";
    if (isdefined(var_145192ceef62d852)) {
        config.classstruct.loadoutequipmentprimary = var_145192ceef62d852;
    }
    config.classstruct.loadoutequipmentsecondary = "none";
    if (isdefined(var_97fbcdea08315d73)) {
        config.classstruct.loadoutequipmentsecondary = var_97fbcdea08315d73;
    }
    config.classstruct.var_b68e3a0a9c628d23 = 0;
    if (isdefined(lethalEquipmentBlueprintIndex)) {
        config.classstruct.var_b68e3a0a9c628d23 = int(lethalEquipmentBlueprintIndex);
    }
    config.classstruct.var_a1dfc5ce15795a3 = 0;
    if (isdefined(tacticalEquipmentBlueprintIndex)) {
        config.classstruct.var_a1dfc5ce15795a3 = int(tacticalEquipmentBlueprintIndex);
    }
    config.execution = var_8b10c9ea167f0ff2;
    config.suit = var_6b3c36cc33280e97;
    config.bodymodel = bodymodel;
    config.headmodel = headmodel;
    config.viewmodel = viewmodel;
    config.cratemodel = cratemodel;
    return config;
}

// Namespace juggernaut/namespace_3fad206953a935fe
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1555
// Size: 0x193
function function_51b8a3cf6102ba3(weaponname, blueprintName, config, isprimary) {
    if (!isdefined(blueprintName) || weaponname == "none") {
        return;
    }
    var_b59c0baba823053c = function_332b73d2eca8c367(weaponname, blueprintName);
    if (!isdefined(var_b59c0baba823053c)) {
        return;
    }
    var_a1cb298d90255f53 = function_64ccc54bdbae5cf6(var_b59c0baba823053c.lootid);
    var_49e6ef3edadd524e = namespace_e0ee43ef2dddadaa::getweaponrootname(weaponname);
    var_91bbf8d2294a656e = namespace_e0ee43ef2dddadaa::weaponattachcustomtoidmap(var_49e6ef3edadd524e, var_a1cb298d90255f53);
    attachments = [];
    var_f3464d71f01f614e = [];
    foreach (attachment, id in var_91bbf8d2294a656e) {
        attachments[attachments.size] = attachment;
        var_f3464d71f01f614e[var_f3464d71f01f614e.size] = id;
    }
    if (isprimary) {
        config.classstruct.loadoutprimaryvariantid = var_a1cb298d90255f53;
        config.classstruct.loadoutprimaryattachments = attachments;
        config.classstruct.loadoutprimaryattachmentids = var_f3464d71f01f614e;
    } else {
        config.classstruct.loadoutsecondaryvariantid = var_a1cb298d90255f53;
        config.classstruct.loadoutsecondaryattachments = attachments;
        config.classstruct.loadoutsecondaryattachmentids = var_f3464d71f01f614e;
    }
}

// Namespace juggernaut/namespace_3fad206953a935fe
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16ef
// Size: 0xd8
function initmarker() {
    levelData = undefined;
    if (issharedfuncdefined("juggernaut", "levelData")) {
        levelData = [[ getsharedfunc("juggernaut", "levelData") ]]("juggernaut");
    }
    levelData.capturecallback = &oncratecaptured;
    levelData.destroycallback = &oncratedestroyed;
    levelData.activatecallback = &oncrateactivated;
    levelData.minimapicon = "ui_map_icon_jugg_drop";
    levelData.headicon = "ui_map_icon_jugg_drop";
    if (namespace_36f464722d326bbe::function_ba5574c7f287c587()) {
        levelData.capturestring = "MP/BR_CRATE_LOADOUT";
    } else {
        levelData.capturestring = "KILLSTREAKS_HINTS/JUGG_CRATE_PICKUP";
    }
    if (!namespace_36f464722d326bbe::isBRStyleGameType()) {
        levelData.basemodel = "military_carepackage_03_jugg_mp";
    }
}

// Namespace juggernaut/namespace_3fad206953a935fe
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17ce
// Size: 0x22
function init_jugg_vo() {
    game["dialog"]["juggernaut" + "_use"] = "killstreak_remote_operator" + "_request_response";
}

// Namespace juggernaut/namespace_3fad206953a935fe
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17f7
// Size: 0x41
function tryusejuggernaut(var_76553dc7aaad2909, var_ca56839b2e00edce) {
    streakinfo = createstreakinfo("juggernaut", self);
    streakinfo.var_ca56839b2e00edce = var_ca56839b2e00edce;
    tryusejuggernautfromstruct(streakinfo, var_76553dc7aaad2909);
}

// Namespace juggernaut/namespace_3fad206953a935fe
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x183f
// Size: 0x11a
function tryusejuggernautfromstruct(streakinfo, var_76553dc7aaad2909) {
    if (namespace_3c37cb17ade254d::issharedfuncdefined("juggernaut", "canTriggerJuggernaut")) {
        if (!self [[ namespace_3c37cb17ade254d::getsharedfunc("juggernaut", "canTriggerJuggernaut") ]](streakinfo)) {
            return 0;
        }
    }
    if (isdefined(level.killstreaktriggeredfunc)) {
        if (!level [[ level.killstreaktriggeredfunc ]](streakinfo)) {
            return 0;
        }
    }
    var_97e8248da4371635 = getdvarint(@"hash_3f1bd355bf340abb");
    if (var_97e8248da4371635 || istrue(var_76553dc7aaad2909)) {
        thread activatejugg(streakinfo);
    } else {
        namespace_f64231d5b7a2c3c4::reservevehicle();
        deployweaponobj = makeweapon("deploy_juggernaut_mp");
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

// Namespace juggernaut/namespace_3fad206953a935fe
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1961
// Size: 0xa1
function markerthrown(streakinfo, weaponobj, projectile) {
    if (issharedfuncdefined("vehicle", "incrementFauxVehicleCount")) {
        [[ getsharedfunc("vehicle", "incrementFauxVehicleCount") ]]();
    }
    projectile.owner = self;
    if (issharedfuncdefined("killstreak", "logKillstreakEvent")) {
        self [[ getsharedfunc("killstreak", "logKillstreakEvent") ]](streakinfo.streakname, self.origin);
    }
    projectile thread watchmarkeractivate(streakinfo);
    streakinfo notify("killstreak_finished_with_deploy_weapon");
    return "success";
}

// Namespace juggernaut/namespace_3fad206953a935fe
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a0a
// Size: 0x1d2
function watchmarkeractivate(streakinfo) {
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
    owner thread namespace_6c578d6ef48f10ef::airdrop_playdeploydialog(streakinfo);
    if (issharedfuncdefined("juggernaut", "dropCrateFromScriptedHeli") && !namespace_36f464722d326bbe::isBRStyleGameType()) {
        streakinfo.vehicleisreserved = 1;
        data = streakinfo;
        scenenode = [[ getsharedfunc("juggernaut", "dropCrateFromScriptedHeli") ]](owner, owner.team, "juggernaut", position, var_811f337efd111e98, position, data, streakinfo);
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

// Namespace juggernaut/namespace_3fad206953a935fe
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1be3
// Size: 0x23
function oncrateactivated(var_510b9bde18d66cdd) {
    if (istrue(var_510b9bde18d66cdd)) {
        self setscriptablepartstate("smoke_cover", "active", 0);
    }
}

// Namespace juggernaut/namespace_3fad206953a935fe
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c0d
// Size: 0xae
function oncratecaptured(player) {
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
        player activatejugg(streakinfo);
    }
}

// Namespace juggernaut/namespace_3fad206953a935fe
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1cc2
// Size: 0x38
function oncratedestroyed(immediate) {
    streakinfo = self.data;
    level callback::callback("killstreak_finish_use", {streakinfo:streakinfo});
}

// Namespace juggernaut/namespace_3fad206953a935fe
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d01
// Size: 0x1b9
function activatejugg(streakinfo) {
    var_584994fab4a8712b = level.juggksglobals;
    result = 0;
    if (issharedfuncdefined("juggernaut", "makeJuggernaut")) {
        result = self [[ getsharedfunc("juggernaut", "makeJuggernaut") ]](var_584994fab4a8712b.config, streakinfo);
    }
    if (!result) {
        return 0;
    }
    namespace_27c74152ccb91331::function_55b08d6d71b41402(self, "become_juggernaut");
    namespace_46e942396566f2da::function_606fa08e3aac10d9();
    if (self isnightvisionon() && !istrue(self.gulag)) {
        self nightvisionviewoff(1);
        self notify("night_vision_off");
    }
    if (issharedfuncdefined("juggernaut", "playOperatorUseLine")) {
        level thread [[ getsharedfunc("juggernaut", "playOperatorUseLine") ]](self);
    }
    if (issharedfuncdefined("hud", "teamPlayerCardSplash")) {
        level thread [[ getsharedfunc("hud", "teamPlayerCardSplash") ]]("used_juggernaut", self);
    }
    createjuggobjective();
    if (isdefined(self.operatorcustomization.gender) && self.operatorcustomization.gender == "female") {
        self function_555e2d32e2756625("gasmask_female");
    } else {
        self function_555e2d32e2756625("gasmask_male");
    }
    if (!istrue(streakinfo.var_ca56839b2e00edce)) {
        self setsoundsubmix("mp_juggernaut", 0.5);
    }
    thread watchforjuggernautgameend(streakinfo);
    thread watchforjuggernautend(streakinfo);
    thread watchforjuggernautdisconnect(streakinfo);
    if (getdvarint(@"hash_452a3eb9af12510c", 1) && !namespace_36f464722d326bbe::isBRStyleGameType() && !iscp()) {
        thread dropminigunondeath();
    }
}

// Namespace juggernaut/namespace_3fad206953a935fe
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ec1
// Size: 0xc1
function dropminigunondeath() {
    self endon("disconnect");
    level endon("game_ended");
    self waittill("death");
    var_1ef2006e3f6f0f89 = "iw9_lm_dblmg_mp";
    if (utility::iscp()) {
        var_1ef2006e3f6f0f89 = "iw9_lm_dblmg2_cp";
    }
    minigunweapon = namespace_d325722f2754c2c4::function_eeaa22f0cd1ff845(var_1ef2006e3f6f0f89);
    self giveweapon(minigunweapon);
    var_65b055c9a44990a9 = self dropitem(minigunweapon);
    if (!isdefined(var_65b055c9a44990a9)) {
        self takeallweapons();
        return;
    }
    var_65b055c9a44990a9.objweapon = minigunweapon;
    var_65b055c9a44990a9.targetname = "dropped_weapon";
    if (issharedfuncdefined("juggernaut", "watchPickup")) {
        var_65b055c9a44990a9 thread [[ getsharedfunc("juggernaut", "watchPickup") ]](self);
    }
    waitframe();
    self takeallweapons();
}

// Namespace juggernaut/namespace_3fad206953a935fe
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f89
// Size: 0x35
function watchforjuggernautgameend(streakinfo) {
    self endon("disconnect");
    self endon("juggernaut_end");
    level waittill("game_ended");
    if (isdefined(self) && isdefined(streakinfo)) {
        namespace_9abe40d2af041eb2::recordkillstreakendstats(streakinfo);
    }
}

// Namespace juggernaut/namespace_3fad206953a935fe
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1fc5
// Size: 0x151
function watchforjuggernautend(streakinfo) {
    level endon("game_ended");
    self endon("disconnect");
    juggcontext = self.juggcontext;
    self waittill("juggernaut_end");
    if (isdefined(self.operatorcustomization)) {
        if (isdefined(self.operatorcustomization.skinref) && self.operatorcustomization.skinref + "" == "355") {
            self function_555e2d32e2756625("gasmask_female");
        } else if (isdefined(self.operatorcustomization.gender) && self.operatorcustomization.gender == "female") {
            self function_555e2d32e2756625("female");
        } else if (isdefined(self.operatorcustomization) && isdefined(self.operatorcustomization.skinref) && self.operatorcustomization.skinref + "" == "319") {
            self setentitysoundcontext("gender", "bongmask_male");
        } else {
            self function_555e2d32e2756625("");
        }
    }
    self clearsoundsubmix("mp_juggernaut", 0.5);
    onjuggernautend(streakinfo, juggcontext);
}

// Namespace juggernaut/namespace_3fad206953a935fe
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x211d
// Size: 0x5a
function onjuggernautend(streakinfo, juggcontext) {
    if (!namespace_36f464722d326bbe::isBRStyleGameType()) {
        level callback::callback("killstreak_finish_use", {streakinfo:streakinfo});
        streakinfo.expiredbydeath = 1;
        namespace_9abe40d2af041eb2::recordkillstreakendstats(streakinfo);
    }
    namespace_46e942396566f2da::function_cb5051bfab85d56a();
    cleanupjuggobjective(juggcontext);
}

// Namespace juggernaut/namespace_3fad206953a935fe
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x217e
// Size: 0x3e
function watchforjuggernautdisconnect(streakinfo) {
    self endon("juggernaut_end");
    level endon("game_ended");
    juggcontext = self.juggcontext;
    self waittill("disconnect");
    cleanupjuggobjective(juggcontext);
}

// Namespace juggernaut/namespace_3fad206953a935fe
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x21c3
// Size: 0x17f
function createjuggobjective(var_cbcc20cc563590c7) {
    if (namespace_36f464722d326bbe::isBRStyleGameType()) {
        if (!isdefined(var_cbcc20cc563590c7)) {
            var_cbcc20cc563590c7 = "playerObjective";
        }
        if (istrue(self.gulag)) {
            thread function_608bedac972d60af(var_cbcc20cc563590c7);
        } else {
            self setscriptablepartstate(var_cbcc20cc563590c7, "juggernaut", 0);
        }
    } else {
        var_477f81d188723410 = undefined;
        if (namespace_3c37cb17ade254d::issharedfuncdefined("game", "requestObjectiveID")) {
            var_477f81d188723410 = namespace_3c37cb17ade254d::getsharedfunc("game", "requestObjectiveID");
        }
        if (isdefined(var_477f81d188723410)) {
            objid = [[ var_477f81d188723410 ]](99);
            self.juggcontext.juggobjid = objid;
            namespace_5a22b6f3a56f7e9b::objective_add_objective(objid, "active", self.origin, "hud_icon_minimap_killstreak_juggernaut");
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

// Namespace juggernaut/namespace_3fad206953a935fe
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2349
// Size: 0x4c
function function_608bedac972d60af(var_cbcc20cc563590c7) {
    level endon("game_ended");
    self endon("juggernaut_end");
    self endon("death_or_disconnect");
    self endon("jugg_icon_cleanup");
    self setscriptablepartstate(var_cbcc20cc563590c7, "off", 0);
    self waittill("respawn_fade_from_black");
    self setscriptablepartstate(var_cbcc20cc563590c7, "juggernaut", 0);
}

// Namespace juggernaut/namespace_3fad206953a935fe
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x239c
// Size: 0x79
function cleanupjuggobjective(juggcontext, var_cbcc20cc563590c7) {
    self notify("jugg_icon_cleanup");
    if (isdefined(self) && namespace_36f464722d326bbe::isBRStyleGameType()) {
        if (!isdefined(var_cbcc20cc563590c7)) {
            var_cbcc20cc563590c7 = "playerObjective";
        }
        self setscriptablepartstate(var_cbcc20cc563590c7, "off", 0);
    } else if (namespace_3c37cb17ade254d::issharedfuncdefined("game", "returnObjectiveID")) {
        [[ namespace_3c37cb17ade254d::getsharedfunc("game", "returnObjectiveID") ]](juggcontext.juggobjid);
    }
}

// Namespace juggernaut/namespace_3fad206953a935fe
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x241c
// Size: 0x65
function watchjuggernautweaponenduse(var_a2d4837d22e88282, var_6e8abb5cb9bfd417) {
    thread removejuggernautweapononaction("switched_from_minigun", var_6e8abb5cb9bfd417);
    thread removejuggernautweapononaction("minigun_ammo_depleted", var_6e8abb5cb9bfd417);
    thread removejuggernautweapononaction("death");
    thread removejuggernautweapononaction("scr_change_swim_state");
    thread watchjuggernautweaponswitch(var_a2d4837d22e88282);
    thread function_de04c507f957b420(var_a2d4837d22e88282);
    thread watchjuggernautweaponammo(var_a2d4837d22e88282);
}

// Namespace juggernaut/namespace_3fad206953a935fe
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2488
// Size: 0xa2
function watchjuggernautweaponswitch(var_a2d4837d22e88282) {
    self endon("death");
    self endon("disconnect");
    self endon("juggernaut_start");
    self endon("dropped_minigun");
    level endon("game_ended");
    self notifyonplayercommand("manual_switch_from_minigun", "+weapnext");
    self notifyonplayercommand("manual_switch_from_minigun", "+weapprev");
    while (1) {
        self waittill("manual_switch_from_minigun");
        if (self getcurrentweapon() != var_a2d4837d22e88282) {
            continue;
        }
        var_545cf9fdbae045a5 = namespace_e0ee43ef2dddadaa::getgrenadeinpullback();
        if (var_545cf9fdbae045a5.basename != "none") {
            continue;
        }
        self notify("switched_from_minigun");
        break;
    }
}

// Namespace juggernaut/namespace_3fad206953a935fe
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2531
// Size: 0x76
function function_de04c507f957b420(var_a2d4837d22e88282) {
    self endon("death");
    self endon("disconnect");
    self endon("juggernaut_start");
    self endon("dropped_minigun");
    level endon("game_ended");
    while (1) {
        var_88b2f9e2206ae20a = var_66b3db972ac1531e = self waittill("weapon_pickup");
        if (self getcurrentweapon() != var_a2d4837d22e88282) {
            continue;
        }
        if (!isdefined(var_88b2f9e2206ae20a)) {
            continue;
        }
        self notify("switched_from_minigun");
        break;
    }
}

// Namespace juggernaut/namespace_3fad206953a935fe
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x25ae
// Size: 0x5b
function watchjuggernautweaponammo(var_a2d4837d22e88282) {
    self endon("death");
    self endon("disconnect");
    self endon("juggernaut_start");
    self endon("dropped_minigun");
    level endon("game_ended");
    while (1) {
        var_7e7c62618a84b0c6 = self getweaponammoclip(var_a2d4837d22e88282);
        if (var_7e7c62618a84b0c6 <= 0) {
            self notify("minigun_ammo_depleted");
            break;
        }
        waitframe();
    }
}

// Namespace juggernaut/namespace_3fad206953a935fe
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2610
// Size: 0x3d
function removejuggernautweapononaction(action, var_6e8abb5cb9bfd417) {
    self endon("disconnect");
    self endon("juggernaut_start");
    self endon("dropped_minigun");
    level endon("game_ended");
    self waittill(action);
    dropjuggernautweapon(action, var_6e8abb5cb9bfd417);
}

// Namespace juggernaut/namespace_3fad206953a935fe
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2654
// Size: 0x203
function dropjuggernautweapon(action, var_6e8abb5cb9bfd417) {
    self.pickedupcoreminigun = undefined;
    self.minigunprevweaponobject = undefined;
    self.playerstreakspeedscale = undefined;
    if (issharedfuncdefined("juggernaut", "updateMoveSpeedScale")) {
        self [[ getsharedfunc("juggernaut", "updateMoveSpeedScale") ]]();
    }
    if (issharedfuncdefined("juggernaut", "allowActionSet")) {
        self [[ getsharedfunc("juggernaut", "allowActionSet") ]]("fakeJugg", 1);
    }
    if (!istrue(level.disablemount)) {
        val::set("fakeJugg", "mount_top", 1);
        val::set("fakeJugg", "mount_side", 1);
    }
    var_1ef2006e3f6f0f89 = "iw9_lm_dblmg_mp";
    if (utility::iscp()) {
        var_1ef2006e3f6f0f89 = "iw9_lm_dblmg2_cp";
    }
    minigunweapon = namespace_d325722f2754c2c4::function_eeaa22f0cd1ff845(var_1ef2006e3f6f0f89);
    if (action == "switched_from_minigun" || action == "used_ammo_box" || action == "death") {
        if (self hasweapon(minigunweapon) && getdvarint(@"hash_452a3eb9af12510c", 1)) {
            var_65b055c9a44990a9 = self dropitem(minigunweapon);
            var_65b055c9a44990a9.objweapon = minigunweapon;
            var_65b055c9a44990a9.targetname = "dropped_weapon";
            if (issharedfuncdefined("juggernaut", "watchPickup")) {
                var_65b055c9a44990a9 thread [[ getsharedfunc("juggernaut", "watchPickup") ]](self);
            }
        }
    } else if (action == "minigun_ammo_depleted") {
        if (self hasweapon(minigunweapon)) {
            thread delaytakeminigun(0.5, minigunweapon);
        }
    } else if (action == "scr_change_swim_state") {
        if (self hasweapon(minigunweapon)) {
            oldammo = self getweaponammoclip(minigunweapon);
            self takeweapon(minigunweapon);
            thread function_b63097fd668a69e1(action, minigunweapon, oldammo);
        }
    }
    if (isdefined(var_6e8abb5cb9bfd417)) {
        self.lastdroppableweaponobj = var_6e8abb5cb9bfd417;
        self switchtoweapon(var_6e8abb5cb9bfd417);
    }
    self notify("dropped_minigun");
}

// Namespace juggernaut/namespace_3fad206953a935fe
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x285e
// Size: 0x32
function delaytakeminigun(delaytime, minigunweapon) {
    self endon("death_or_disconnect");
    level endon("game_ended");
    namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(delaytime);
    self takeweapon(minigunweapon);
}

// Namespace juggernaut/namespace_3fad206953a935fe
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2897
// Size: 0x102
function function_b63097fd668a69e1(action, minigunweapon, oldammo) {
    self endon("death_or_disconnect");
    self waittill(action);
    while (1) {
        var_545cf9fdbae045a5 = namespace_e0ee43ef2dddadaa::getgrenadeinpullback();
        if (!self isswimming() && !(isdefined(self.carryobject) && isdefined(self.carryobject.carryobjectasset) && self.carryobject.carryobjectasset == "hostage_rescue")) {
            self giveweapon(minigunweapon);
            self switchtoweaponimmediate(minigunweapon);
            self setweaponammoclip(minigunweapon, oldammo);
            previousweapon = self.lastdroppableweaponobj;
            if (!isdefined(previousweapon)) {
                var_9111b9a018285894 = namespace_df5cfdbe6e2d3812::getcurrentprimaryweaponsminusalt();
                previousweapon = var_9111b9a018285894[0];
            }
            if (issharedfuncdefined("juggernaut", "juggernautWeaponPickedUp")) {
                self [[ getsharedfunc("juggernaut", "juggernautWeaponPickedUp") ]](minigunweapon, previousweapon);
            }
            break;
        }
        waitframe();
    }
}

