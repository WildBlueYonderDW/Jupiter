#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\values.gsc;
#using scripts\common\callbacks.gsc;
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

// Namespace juggernaut / scripts\cp_mp\killstreaks\juggernaut
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x84b
// Size: 0xf3
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

// Namespace juggernaut / scripts\cp_mp\killstreaks\juggernaut
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x946
// Size: 0x26f
function initconfig() {
    globals = level.juggksglobals;
    config = undefined;
    if (issharedfuncdefined("juggernaut", "initConfig")) {
        config = self [[ getsharedfunc("juggernaut", "initConfig") ]]();
    }
    globals.config = config;
    config.infiniteammo = 1;
    config.infiniteammoupdaterate = 4;
    config.maxhealth = 3000;
    config.startinghealth = 3000;
    config.suit = "iw9_ks_juggernaut_mp";
    config.clothtype = "vestheavy";
    config.geartype = "milhvygr";
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

// Namespace juggernaut / scripts\cp_mp\killstreaks\juggernaut
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xbbd
// Size: 0x52a
function function_23f0145756ed19cb(bundle) {
    config = undefined;
    if (issharedfuncdefined("juggernaut", "initConfig")) {
        config = self [[ getsharedfunc("juggernaut", "initConfig") ]]();
        assertex(bundle.var_f67737eeacd73393, "Called createConfigWithBundle but the bundle has juggernautUseBundleConfigTuning disabled.");
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
        if (isdefined(bundle.juggernautprimaryweapon)) {
            config.classstruct.loadoutprimary = bundle.juggernautprimaryweapon;
        } else {
            config.classstruct.loadoutprimary = "none";
        }
        if (isdefined(bundle.juggernautsecondaryweapon)) {
            config.classstruct.loadoutsecondary = bundle.juggernautsecondaryweapon;
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
        config.execution = bundle.juggernautexecution;
        config.suit = bundle.juggernautsuit;
        config.clothtype = bundle.var_40b6bbc083e50def;
        config.bodymodel = bundle.var_c0816bafc46c2bb6;
        config.headmodel = bundle.juggernautheadmodel;
        config.viewmodel = bundle.juggernautviewmodel;
        if (!bundle.var_4da8c9c4a056dc12 || !isdefined(config.perks)) {
            config.perks = [];
        }
        if (isdefined(bundle.juggernautperks) && bundle.juggernautperks.size > 0) {
            foreach (juggernautperk in bundle.juggernautperks) {
                config.perks[juggernautperk.name] = 1;
            }
        }
    }
    return config;
}

// Namespace juggernaut / scripts\cp_mp\killstreaks\juggernaut
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x10f0
// Size: 0x461
function function_d5974b5f58f14716(bundle, blueprintindex) {
    config = structcopy(level.var_e084c71df9ac20f1.config, 1);
    var_9b32d1936831f5aa = undefined;
    if (isdefined(bundle.var_d96d3e6ceed581fd.blueprints) && bundle.var_d96d3e6ceed581fd.blueprints.size > 0 && blueprintindex > 0) {
        var_9b32d1936831f5aa = bundle.var_d96d3e6ceed581fd.blueprints[blueprintindex - 1].genericblueprint;
    } else if (isdefined(bundle.var_d96d3e6ceed581fd.blueprint_default)) {
        var_9b32d1936831f5aa = bundle.var_d96d3e6ceed581fd.blueprint_default;
    }
    config.deployweapon = function_dd2a4fb3522f314(var_9b32d1936831f5aa, "deployWeapon");
    primaryweaponname = function_8df651a1b2728b15(var_9b32d1936831f5aa, "primaryWeapon");
    var_a1aa2d822e933d07 = function_b9ff4b6230995332(var_9b32d1936831f5aa, "primaryWeapon");
    secondaryweaponname = function_8df651a1b2728b15(var_9b32d1936831f5aa, "secondaryWeapon");
    var_e426ac0fd477f647 = function_b9ff4b6230995332(var_9b32d1936831f5aa, "secondaryWeapon");
    lethalequipmentname = function_29e16a88682086b2(var_9b32d1936831f5aa, "string", "lethalEquipment");
    tacticalequipmentname = function_29e16a88682086b2(var_9b32d1936831f5aa, "string", "tacticalEquipment");
    lethalEquipmentBlueprintIndex = function_29e16a88682086b2(var_9b32d1936831f5aa, "string", "lethalEquipmentBlueprintIndex");
    tacticalEquipmentBlueprintIndex = function_29e16a88682086b2(var_9b32d1936831f5aa, "string", "tacticalEquipmentBlueprintIndex");
    suitname = function_29e16a88682086b2(var_9b32d1936831f5aa, "suit", "suit");
    executionname = function_29e16a88682086b2(var_9b32d1936831f5aa, "execution", "execution");
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
    if (isdefined(lethalequipmentname)) {
        config.classstruct.loadoutequipmentprimary = lethalequipmentname;
    }
    config.classstruct.loadoutequipmentsecondary = "none";
    if (isdefined(tacticalequipmentname)) {
        config.classstruct.loadoutequipmentsecondary = tacticalequipmentname;
    }
    config.classstruct.var_b68e3a0a9c628d23 = 0;
    if (isdefined(lethalEquipmentBlueprintIndex)) {
        config.classstruct.var_b68e3a0a9c628d23 = int(lethalEquipmentBlueprintIndex);
    }
    config.classstruct.var_a1dfc5ce15795a3 = 0;
    if (isdefined(tacticalEquipmentBlueprintIndex)) {
        config.classstruct.var_a1dfc5ce15795a3 = int(tacticalEquipmentBlueprintIndex);
    }
    config.execution = executionname;
    config.suit = suitname;
    config.bodymodel = bodymodel;
    config.headmodel = headmodel;
    config.viewmodel = viewmodel;
    config.cratemodel = cratemodel;
    return config;
}

// Namespace juggernaut / scripts\cp_mp\killstreaks\juggernaut
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x155a
// Size: 0x18e
function function_51b8a3cf6102ba3(weaponname, blueprintname, config, isprimary) {
    if (!isdefined(blueprintname) || weaponname == "none") {
        return;
    }
    blueprintbundle = function_332b73d2eca8c367(weaponname, blueprintname);
    if (!isdefined(blueprintbundle)) {
        return;
    }
    var_a1cb298d90255f53 = function_64ccc54bdbae5cf6(blueprintbundle.lootid);
    var_49e6ef3edadd524e = namespace_e0ee43ef2dddadaa::getweaponrootname(weaponname);
    var_91bbf8d2294a656e = namespace_e0ee43ef2dddadaa::weaponattachcustomtoidmap(var_49e6ef3edadd524e, var_a1cb298d90255f53);
    attachments = [];
    attachmentids = [];
    foreach (id in var_91bbf8d2294a656e) {
        attachments[attachments.size] = attachment;
        attachmentids[attachmentids.size] = id;
    }
    if (isprimary) {
        config.classstruct.loadoutprimaryvariantid = var_a1cb298d90255f53;
        config.classstruct.loadoutprimaryattachments = attachments;
        config.classstruct.loadoutprimaryattachmentids = attachmentids;
        return;
    }
    config.classstruct.loadoutsecondaryvariantid = var_a1cb298d90255f53;
    config.classstruct.loadoutsecondaryattachments = attachments;
    config.classstruct.loadoutsecondaryattachmentids = attachmentids;
}

// Namespace juggernaut / scripts\cp_mp\killstreaks\juggernaut
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x16f0
// Size: 0xd7
function initmarker() {
    leveldata = undefined;
    if (issharedfuncdefined("juggernaut", "levelData")) {
        leveldata = [[ getsharedfunc("juggernaut", "levelData") ]]("juggernaut");
    }
    leveldata.capturecallback = &oncratecaptured;
    leveldata.destroycallback = &oncratedestroyed;
    leveldata.activatecallback = &oncrateactivated;
    leveldata.minimapicon = "ui_map_icon_jugg_drop";
    leveldata.headicon = "ui_map_icon_jugg_drop";
    if (scripts\cp_mp\utility\game_utility::function_ba5574c7f287c587()) {
        leveldata.capturestring = %MP/BR_CRATE_LOADOUT;
    } else {
        leveldata.capturestring = %KILLSTREAKS_HINTS/JUGG_CRATE_PICKUP;
    }
    if (!scripts\cp_mp\utility\game_utility::isbrstylegametype()) {
        leveldata.basemodel = "military_carepackage_03_jugg_mp";
    }
}

// Namespace juggernaut / scripts\cp_mp\killstreaks\juggernaut
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x17cf
// Size: 0x21
function init_jugg_vo() {
    game["dialog"]["juggernaut" + "_use"] = "killstreak_remote_operator" + "_request_response";
}

// Namespace juggernaut / scripts\cp_mp\killstreaks\juggernaut
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x17f8
// Size: 0x40
function tryusejuggernaut(activateimmediate, var_ca56839b2e00edce) {
    streakinfo = createstreakinfo("juggernaut", self);
    streakinfo.var_ca56839b2e00edce = var_ca56839b2e00edce;
    tryusejuggernautfromstruct(streakinfo, activateimmediate);
}

// Namespace juggernaut / scripts\cp_mp\killstreaks\juggernaut
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1840
// Size: 0x119
function tryusejuggernautfromstruct(streakinfo, activateimmediate) {
    if (scripts\engine\utility::issharedfuncdefined("juggernaut", "canTriggerJuggernaut")) {
        if (!self [[ scripts\engine\utility::getsharedfunc("juggernaut", "canTriggerJuggernaut") ]](streakinfo)) {
            return false;
        }
    }
    if (isdefined(level.killstreaktriggeredfunc)) {
        if (!level [[ level.killstreaktriggeredfunc ]](streakinfo)) {
            return false;
        }
    }
    instantdeploy = getdvarint(@"hash_3f1bd355bf340abb");
    if (instantdeploy || istrue(activateimmediate)) {
        thread activatejugg(streakinfo);
    } else {
        scripts\cp_mp\vehicles\vehicle_tracking::reservevehicle();
        deployweaponobj = makeweapon("deploy_juggernaut_mp");
        if (isdefined(level.var_27f78817b59dfe32)) {
            streakinfo.var_fb58a31c756db4cc = level.var_27f78817b59dfe32;
        }
        deployresult = scripts\cp_mp\killstreaks\killstreakdeploy::streakdeploy_doweaponfireddeploy(streakinfo, deployweaponobj, "grenade_fire", undefined, undefined, &markerthrown);
        if (!istrue(deployresult)) {
            scripts\cp_mp\vehicles\vehicle_tracking::clearvehiclereservation();
            return false;
        }
    }
    if (isdefined(level.killstreakbeginusefunc)) {
        if (!level [[ level.killstreakbeginusefunc ]](streakinfo)) {
            return false;
        }
    }
    return true;
}

// Namespace juggernaut / scripts\cp_mp\killstreaks\juggernaut
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1962
// Size: 0xa0
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

// Namespace juggernaut / scripts\cp_mp\killstreaks\juggernaut
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1a0b
// Size: 0x1d1
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
        scripts\cp_mp\vehicles\vehicle_tracking::clearvehiclereservation();
        return;
    }
    if (issharedfuncdefined("vehicle", "decrementFauxVehicleCount")) {
        [[ getsharedfunc("vehicle", "decrementFauxVehicleCount") ]]();
    }
    owner thread scripts\cp_mp\killstreaks\airdrop::airdrop_playdeploydialog(streakinfo);
    if (issharedfuncdefined("juggernaut", "dropCrateFromScriptedHeli") && !scripts\cp_mp\utility\game_utility::isbrstylegametype()) {
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
        return;
    }
    scripts\cp_mp\vehicles\vehicle_tracking::clearvehiclereservation();
    if (scripts\cp_mp\utility\game_utility::isbrstylegametype()) {
        var_e648e96614161011 = 1;
        owner thread scripts\cp_mp\killstreaks\airdrop::spawnjuggernautcrateatposition(position, var_e648e96614161011);
    }
}

// Namespace juggernaut / scripts\cp_mp\killstreaks\juggernaut
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1be4
// Size: 0x22
function oncrateactivated(var_510b9bde18d66cdd) {
    if (istrue(var_510b9bde18d66cdd)) {
        self setscriptablepartstate("smoke_cover", "active", 0);
    }
}

// Namespace juggernaut / scripts\cp_mp\killstreaks\juggernaut
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1c0e
// Size: 0xad
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
        return;
    }
    player activatejugg(streakinfo);
}

// Namespace juggernaut / scripts\cp_mp\killstreaks\juggernaut
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1cc3
// Size: 0x37
function oncratedestroyed(immediate) {
    streakinfo = self.data;
    level callback::callback("killstreak_finish_use", {#streakinfo:streakinfo});
}

// Namespace juggernaut / scripts\cp_mp\killstreaks\juggernaut
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1d02
// Size: 0x1a5
function activatejugg(streakinfo) {
    globals = level.juggksglobals;
    result = 0;
    if (issharedfuncdefined("juggernaut", "makeJuggernaut")) {
        result = self [[ getsharedfunc("juggernaut", "makeJuggernaut") ]](globals.config, streakinfo);
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
    if (!scripts\cp_mp\utility\game_utility::isbrstylegametype() && !iscp()) {
        thread dropminigunondeath();
    }
}

// Namespace juggernaut / scripts\cp_mp\killstreaks\juggernaut
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1eaf
// Size: 0xc0
function dropminigunondeath() {
    self endon("disconnect");
    level endon("game_ended");
    self waittill("death");
    minigunref = "iw9_lm_dblmg_mp";
    if (utility::iscp()) {
        minigunref = "iw9_lm_dblmg2_cp";
    }
    minigunweapon = scripts\cp_mp\utility\weapon_utility::function_eeaa22f0cd1ff845(minigunref);
    self giveweapon(minigunweapon);
    droppedgun = self dropitem(minigunweapon);
    if (!isdefined(droppedgun)) {
        self takeallweapons();
        return;
    }
    droppedgun.objweapon = minigunweapon;
    droppedgun.targetname = "dropped_weapon";
    if (issharedfuncdefined("juggernaut", "watchPickup")) {
        droppedgun thread [[ getsharedfunc("juggernaut", "watchPickup") ]](self);
    }
    waitframe();
    self takeallweapons();
}

// Namespace juggernaut / scripts\cp_mp\killstreaks\juggernaut
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1f77
// Size: 0x34
function watchforjuggernautgameend(streakinfo) {
    self endon("disconnect");
    self endon("juggernaut_end");
    level waittill("game_ended");
    if (isdefined(self) && isdefined(streakinfo)) {
        scripts\cp_mp\utility\killstreak_utility::recordkillstreakendstats(streakinfo);
    }
}

// Namespace juggernaut / scripts\cp_mp\killstreaks\juggernaut
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1fb3
// Size: 0x150
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

// Namespace juggernaut / scripts\cp_mp\killstreaks\juggernaut
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x210b
// Size: 0x59
function onjuggernautend(streakinfo, juggcontext) {
    if (!scripts\cp_mp\utility\game_utility::isbrstylegametype()) {
        level callback::callback("killstreak_finish_use", {#streakinfo:streakinfo});
        streakinfo.expiredbydeath = 1;
        scripts\cp_mp\utility\killstreak_utility::recordkillstreakendstats(streakinfo);
    }
    namespace_46e942396566f2da::function_cb5051bfab85d56a();
    cleanupjuggobjective(juggcontext);
}

// Namespace juggernaut / scripts\cp_mp\killstreaks\juggernaut
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x216c
// Size: 0x3d
function watchforjuggernautdisconnect(streakinfo) {
    self endon("juggernaut_end");
    level endon("game_ended");
    juggcontext = self.juggcontext;
    self waittill("disconnect");
    cleanupjuggobjective(juggcontext);
}

// Namespace juggernaut / scripts\cp_mp\killstreaks\juggernaut
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x21b1
// Size: 0x17a
function createjuggobjective(var_cbcc20cc563590c7) {
    if (scripts\cp_mp\utility\game_utility::isbrstylegametype()) {
        if (!isdefined(var_cbcc20cc563590c7)) {
            var_cbcc20cc563590c7 = "playerObjective";
        }
        if (istrue(self.gulag)) {
            thread function_608bedac972d60af(var_cbcc20cc563590c7);
        } else {
            self setscriptablepartstate(var_cbcc20cc563590c7, "juggernaut", 0);
        }
        return;
    }
    requestfunc = undefined;
    if (scripts\engine\utility::issharedfuncdefined("game", "requestObjectiveID")) {
        requestfunc = scripts\engine\utility::getsharedfunc("game", "requestObjectiveID");
    }
    if (isdefined(requestfunc)) {
        objid = [[ requestfunc ]](99);
        self.juggcontext.juggobjid = objid;
        scripts\mp\objidpoolmanager::objective_add_objective(objid, "active", self.origin, "hud_icon_minimap_killstreak_juggernaut");
        scripts\mp\objidpoolmanager::objective_set_play_intro(objid, 0);
        scripts\mp\objidpoolmanager::objective_set_play_outro(objid, 0);
        foreach (player in level.players) {
            if (!isdefined(player) || isbot(player) || player == self) {
                continue;
            }
            scripts\mp\objidpoolmanager::objective_playermask_addshowplayer(objid, player);
        }
        scripts\mp\objidpoolmanager::update_objective_onentity(objid, self);
        scripts\mp\objidpoolmanager::update_objective_setbackground(objid, 1);
        if (level.teambased) {
            scripts\mp\objidpoolmanager::update_objective_ownerteam(objid, self.team);
            return;
        }
        scripts\mp\objidpoolmanager::update_objective_ownerclient(objid, self);
    }
}

// Namespace juggernaut / scripts\cp_mp\killstreaks\juggernaut
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2333
// Size: 0x4b
function function_608bedac972d60af(var_cbcc20cc563590c7) {
    level endon("game_ended");
    self endon("juggernaut_end");
    self endon("death_or_disconnect");
    self endon("jugg_icon_cleanup");
    self setscriptablepartstate(var_cbcc20cc563590c7, "off", 0);
    self waittill("respawn_fade_from_black");
    self setscriptablepartstate(var_cbcc20cc563590c7, "juggernaut", 0);
}

// Namespace juggernaut / scripts\cp_mp\killstreaks\juggernaut
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2386
// Size: 0x78
function cleanupjuggobjective(juggcontext, var_cbcc20cc563590c7) {
    self notify("jugg_icon_cleanup");
    if (isdefined(self) && scripts\cp_mp\utility\game_utility::isbrstylegametype()) {
        if (!isdefined(var_cbcc20cc563590c7)) {
            var_cbcc20cc563590c7 = "playerObjective";
        }
        self setscriptablepartstate(var_cbcc20cc563590c7, "off", 0);
        return;
    }
    if (scripts\engine\utility::issharedfuncdefined("game", "returnObjectiveID")) {
        [[ scripts\engine\utility::getsharedfunc("game", "returnObjectiveID") ]](juggcontext.juggobjid);
    }
}

// Namespace juggernaut / scripts\cp_mp\killstreaks\juggernaut
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2406
// Size: 0x64
function watchjuggernautweaponenduse(juggernautweaponobject, prevweaponobject) {
    thread removejuggernautweapononaction("switched_from_minigun", prevweaponobject);
    thread removejuggernautweapononaction("minigun_ammo_depleted", prevweaponobject);
    thread removejuggernautweapononaction("death");
    thread removejuggernautweapononaction("scr_change_swim_state");
    thread watchjuggernautweaponswitch(juggernautweaponobject);
    thread function_de04c507f957b420(juggernautweaponobject);
    thread watchjuggernautweaponammo(juggernautweaponobject);
}

// Namespace juggernaut / scripts\cp_mp\killstreaks\juggernaut
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2472
// Size: 0xa1
function watchjuggernautweaponswitch(juggernautweaponobject) {
    self endon("death");
    self endon("disconnect");
    self endon("juggernaut_start");
    self endon("dropped_minigun");
    level endon("game_ended");
    self notifyonplayercommand("manual_switch_from_minigun", "+weapnext");
    self notifyonplayercommand("manual_switch_from_minigun", "+weapprev");
    while (true) {
        self waittill("manual_switch_from_minigun");
        if (self getcurrentweapon() != juggernautweaponobject) {
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

// Namespace juggernaut / scripts\cp_mp\killstreaks\juggernaut
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x251b
// Size: 0x75
function function_de04c507f957b420(juggernautweaponobject) {
    self endon("death");
    self endon("disconnect");
    self endon("juggernaut_start");
    self endon("dropped_minigun");
    level endon("game_ended");
    while (true) {
        newweaponobj, droppedweaponobj = self waittill("weapon_pickup");
        if (self getcurrentweapon() != juggernautweaponobject) {
            continue;
        }
        if (!isdefined(droppedweaponobj)) {
            continue;
        }
        self notify("switched_from_minigun");
        break;
    }
}

// Namespace juggernaut / scripts\cp_mp\killstreaks\juggernaut
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2598
// Size: 0x5a
function watchjuggernautweaponammo(juggernautweaponobject) {
    self endon("death");
    self endon("disconnect");
    self endon("juggernaut_start");
    self endon("dropped_minigun");
    level endon("game_ended");
    while (true) {
        currentweaponclipammo = self getweaponammoclip(juggernautweaponobject);
        if (currentweaponclipammo <= 0) {
            self notify("minigun_ammo_depleted");
            break;
        }
        waitframe();
    }
}

// Namespace juggernaut / scripts\cp_mp\killstreaks\juggernaut
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x25fa
// Size: 0x3c
function removejuggernautweapononaction(action, prevweaponobject) {
    self endon("disconnect");
    self endon("juggernaut_start");
    self endon("dropped_minigun");
    level endon("game_ended");
    self waittill(action);
    dropjuggernautweapon(action, prevweaponobject);
}

// Namespace juggernaut / scripts\cp_mp\killstreaks\juggernaut
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x263e
// Size: 0x1ee
function dropjuggernautweapon(action, prevweaponobject) {
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
    minigunref = "iw9_lm_dblmg_mp";
    if (utility::iscp()) {
        minigunref = "iw9_lm_dblmg2_cp";
    }
    minigunweapon = scripts\cp_mp\utility\weapon_utility::function_eeaa22f0cd1ff845(minigunref);
    if (action == "switched_from_minigun" || action == "used_ammo_box" || action == "death") {
        if (self hasweapon(minigunweapon)) {
            droppedgun = self dropitem(minigunweapon);
            droppedgun.objweapon = minigunweapon;
            droppedgun.targetname = "dropped_weapon";
            if (issharedfuncdefined("juggernaut", "watchPickup")) {
                droppedgun thread [[ getsharedfunc("juggernaut", "watchPickup") ]](self);
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
    if (isdefined(prevweaponobject)) {
        self.lastdroppableweaponobj = prevweaponobject;
        self switchtoweapon(prevweaponobject);
    }
    self notify("dropped_minigun");
}

// Namespace juggernaut / scripts\cp_mp\killstreaks\juggernaut
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2834
// Size: 0x31
function delaytakeminigun(delaytime, minigunweapon) {
    self endon("death_or_disconnect");
    level endon("game_ended");
    scripts\cp_mp\hostmigration::hostmigration_waitlongdurationwithpause(delaytime);
    self takeweapon(minigunweapon);
}

// Namespace juggernaut / scripts\cp_mp\killstreaks\juggernaut
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x286d
// Size: 0x101
function function_b63097fd668a69e1(action, minigunweapon, oldammo) {
    self endon("death_or_disconnect");
    self waittill(action);
    while (true) {
        var_545cf9fdbae045a5 = namespace_e0ee43ef2dddadaa::getgrenadeinpullback();
        if (!self isswimming() && !(isdefined(self.carryobject) && isdefined(self.carryobject.carryobjectasset) && self.carryobject.carryobjectasset == "hostage_rescue")) {
            self giveweapon(minigunweapon);
            self switchtoweaponimmediate(minigunweapon);
            self setweaponammoclip(minigunweapon, oldammo);
            previousweapon = self.lastdroppableweaponobj;
            if (!isdefined(previousweapon)) {
                currentprimaries = scripts\cp_mp\utility\inventory_utility::getcurrentprimaryweaponsminusalt();
                previousweapon = currentprimaries[0];
            }
            if (issharedfuncdefined("juggernaut", "juggernautWeaponPickedUp")) {
                self [[ getsharedfunc("juggernaut", "juggernautWeaponPickedUp") ]](minigunweapon, previousweapon);
            }
            break;
        }
        waitframe();
    }
}

