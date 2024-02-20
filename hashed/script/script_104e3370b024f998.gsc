// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_7ab5b649fa408138;
#using script_268c558ddb2267aa;
#using scripts\mp\hud_message.gsc;
#using script_189b67b2735b981d;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\supers.gsc;
#using scripts\mp\gametypes\br_pickups.gsc;
#using scripts\mp\perks\perkpackage.gsc;
#using script_26660ae1076e2d99;
#using scripts\mp\gametypes\br_public.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;

#namespace namespace_acaaa9efe860953e;

// Namespace namespace_acaaa9efe860953e/namespace_416e533f6ed17708
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x479
// Size: 0xc6
function init() {
    level.var_b35fc6d4a1b9424f = spawnstruct();
    level.var_b35fc6d4a1b9424f.powers = [];
    level.var_b35fc6d4a1b9424f.perks = [0:"specialty_super_strength", 1:"specialty_durability", 2:"specialty_super_speed"];
    level.var_2ddd5fa2cfa55afe = 0;
    namespace_314b181252bf1520::function_41c4a42ae28c7e16();
    level._effect["superPower_teleportOut"] = loadfx("vfx/iw9/gameplay/theboys/vfx_gameplay_theboys_teleport_out.vfx");
    game["dialog"]["supe_spotted"] = "game_ovld_spes";
    game["dialog"]["supe_lost"] = "game_ovld_spec";
    game["dialog"]["supe_killed"] = "game_ovld_sprk";
    function_f1aed36ab4598ea("mp_gamemode_temp_v");
}

// Namespace namespace_acaaa9efe860953e/namespace_416e533f6ed17708
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x546
// Size: 0x1d
function function_d3f8e1c800b2e8c0() {
    thread namespace_44abc05161e2e2cb::showsplash("super_temp_v" + "_pickup", undefined, self, undefined, undefined, undefined, 1);
}

// Namespace namespace_acaaa9efe860953e/namespace_416e533f6ed17708
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x56a
// Size: 0x1a
function function_4364c764fcf6194d() {
    thread function_a44c81f35835ab6f();
    namespace_27c74152ccb91331::function_55b08d6d71b41402(self, "self_apply");
    return 1;
}

// Namespace namespace_acaaa9efe860953e/namespace_416e533f6ed17708
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x58c
// Size: 0xd0
function function_a44c81f35835ab6f() {
    while (isdefined(self getheldoffhand()) && self getheldoffhand().basename == "tempv_mp") {
        waitframe();
    }
    if (namespace_36f464722d326bbe::function_beff479639e6508()) {
        self setclientomnvar("ui_super_warning", 1);
    }
    if (isdefined(level.var_2ddd5fa2cfa55afe)) {
        level.var_2ddd5fa2cfa55afe--;
        if (level.var_2ddd5fa2cfa55afe < 0) {
            level.var_2ddd5fa2cfa55afe = 0;
        }
    }
    self setscriptablepartstate("superpowers_aura", "on", 0);
    self setscriptablepartstate("superpowers_veins", "on", 0);
    self.var_b9976aacfe15a7ba = 1;
    thread function_acf86641a7105328();
    thread function_f2c35147cd83e1c7();
    function_79cd1b77a631e77c(self);
    thread function_a823070a9e81d9d8();
    thread function_4c30d408ae45aa33();
    thread function_cef1c8463d56bb49();
}

// Namespace namespace_acaaa9efe860953e/namespace_416e533f6ed17708
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x663
// Size: 0x5
function function_636d60aa04f7e10d() {
    return 1;
}

// Namespace namespace_acaaa9efe860953e/namespace_416e533f6ed17708
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x670
// Size: 0x77
function function_c0b7105aae16a9b3(mapname) {
    var_2123d54c68c8ee8e = [0:"super_teleport_deploy", 1:"super_electric_discharge", 2:"super_high_jump", 3:"super_laser_charge"];
    if (level.mapname == "mp_bio_lab" || level.mapname == "mp_biobunker") {
        var_2123d54c68c8ee8e = [0:"super_electric_discharge", 1:"super_laser_charge"];
    }
    return var_2123d54c68c8ee8e;
}

// Namespace namespace_acaaa9efe860953e/namespace_416e533f6ed17708
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6ef
// Size: 0x14f
function function_a823070a9e81d9d8() {
    var_2123d54c68c8ee8e = function_c0b7105aae16a9b3(level.mapname);
    randint = randomint(var_2123d54c68c8ee8e.size);
    var_ef7579be51267bdb = var_2123d54c68c8ee8e[randint];
    var_85071c984eecd1a9 = getdvar(@"hash_18cc28f3820edbd6", "");
    if (var_85071c984eecd1a9 != "") {
        if (var_85071c984eecd1a9 == "teleport") {
            var_ef7579be51267bdb = "super_teleport_deploy";
        } else if (var_85071c984eecd1a9 == "electric") {
            var_ef7579be51267bdb = "super_electric_discharge";
        } else if (var_85071c984eecd1a9 == "jump") {
            var_ef7579be51267bdb = "super_high_jump";
        } else if (var_85071c984eecd1a9 == "laser") {
            var_ef7579be51267bdb = "super_laser_charge";
        }
    }
    equipname = "equip_";
    postfix = getsubstr(var_ef7579be51267bdb, 6);
    if (namespace_36f464722d326bbe::function_beff479639e6508()) {
        namespace_85d036cb78063c4a::function_8c7b1312cf5986b(0);
        equipname = equipname + postfix;
        namespace_cb965d2f71fefddc::_givebrsuper(equipname, var_ef7579be51267bdb, 1);
    } else {
        namespace_727d2aa1d6c72038::perkpackage_giveoverridefieldupgrades(var_ef7579be51267bdb);
        namespace_85d036cb78063c4a::givesuperpoints(namespace_85d036cb78063c4a::getsuperpointsneeded(), undefined, 0);
    }
    superid = level.superglobals.staticsuperdata[var_ef7579be51267bdb].id;
    self setclientomnvar("ui_field_upgrade_use", superid);
    namespace_85d036cb78063c4a::showsuperremindersplash();
}

// Namespace namespace_acaaa9efe860953e/namespace_416e533f6ed17708
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x845
// Size: 0x12
function function_95b57b12158252c3() {
    namespace_85d036cb78063c4a::givesuper("super_melee_jugg", 0, 1);
}

// Namespace namespace_acaaa9efe860953e/namespace_416e533f6ed17708
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x85e
// Size: 0xf
function function_7bddc961a86c19b2() {
    namespace_727d2aa1d6c72038::perkpackage_giveoverridefieldupgrades("super_teleport_deploy");
}

// Namespace namespace_acaaa9efe860953e/namespace_416e533f6ed17708
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x874
// Size: 0xf
function function_6460412bc7e7df87() {
    namespace_727d2aa1d6c72038::perkpackage_giveoverridefieldupgrades("super_electric_discharge");
}

// Namespace namespace_acaaa9efe860953e/namespace_416e533f6ed17708
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x88a
// Size: 0xf
function function_7705327af583d75c() {
    namespace_727d2aa1d6c72038::perkpackage_giveoverridefieldupgrades("super_high_jump");
}

// Namespace namespace_acaaa9efe860953e/namespace_416e533f6ed17708
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8a0
// Size: 0xf
function function_11e36f0effe3e0a7() {
    namespace_727d2aa1d6c72038::perkpackage_giveoverridefieldupgrades("super_laser_charge");
}

// Namespace namespace_acaaa9efe860953e/namespace_416e533f6ed17708
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8b6
// Size: 0x15b
function function_269b97f3d86eb172(var_eb3aa4092c07d861, var_dc9cdb0dde14c2e3, var_4a82c38656bef462, iskillstreak) {
    if (isdefined(var_4a82c38656bef462)) {
        if (isarray(var_4a82c38656bef462)) {
            function_5adca43f839a3cce(var_4a82c38656bef462);
        } else {
            self waittill(var_4a82c38656bef462);
        }
    }
    if (!istrue(iskillstreak)) {
        if (istrue(var_eb3aa4092c07d861)) {
            namespace_85d036cb78063c4a::superusefinished();
        }
        var_102baa631c8e7151 = 0;
        var_19163e14365d9264 = self.super;
        if (!isdefined(var_19163e14365d9264) || !namespace_85d036cb78063c4a::function_907944a173ed27e1(var_19163e14365d9264.staticdata.ref)) {
            var_102baa631c8e7151 = 1;
        }
        if (!istrue(var_dc9cdb0dde14c2e3) && !var_102baa631c8e7151) {
            namespace_85d036cb78063c4a::clearsuper();
            if (namespace_3c37cb17ade254d::issharedfuncdefined("br", "superSlotCleanUp")) {
                [[ namespace_3c37cb17ade254d::getsharedfunc("br", "superSlotCleanUp") ]](self);
            }
        }
        if (namespace_36f464722d326bbe::function_beff479639e6508()) {
            self setclientomnvar("ui_super_warning", 0);
        }
    }
    self setscriptablepartstate("superpowers", "off", 0);
    self setscriptablepartstate("superpowers_aura", "off", 0);
    self setscriptablepartstate("heroDiveVfx", "off", 0);
    self.var_b9976aacfe15a7ba = 0;
    if (getdvarint(@"hash_93804fe50a4ddeab", 0) && !istrue(iskillstreak)) {
        delaythread(0.25, &function_8f385d41d37c6572);
    }
    self notify("temp_v_finished");
}

// Namespace namespace_acaaa9efe860953e/namespace_416e533f6ed17708
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa18
// Size: 0x2e
function function_8f385d41d37c6572() {
    if (namespace_36f464722d326bbe::function_beff479639e6508()) {
        namespace_cb965d2f71fefddc::_givebrsuper("equip_temp_v", "super_temp_v", 1);
    } else {
        namespace_727d2aa1d6c72038::perkpackage_giveimmediate("super_temp_v");
    }
}

// Namespace namespace_acaaa9efe860953e/namespace_416e533f6ed17708
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa4d
// Size: 0x5d
function function_333146dd4b1c3317(equipmentref) {
    if (!isdefined(equipmentref)) {
        return 0;
    }
    switch (equipmentref) {
    case #"hash_5b20a7c66514f7c":
    case #"hash_20be479cff1234e3":
    case #"hash_6cb9c4c2ee706f5d":
    case #"hash_fc0d3d954c29e3ec":
        return 1;
    default:
        return 0;
        break;
    }
}

// Namespace namespace_acaaa9efe860953e/namespace_416e533f6ed17708
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xab1
// Size: 0x143
function function_988143193cd6a03a(instance) {
    if (!istrue(level.var_7ebad80a50484a39)) {
        return;
    }
    var_3f2d768db35932e1 = undefined;
    dropchance = getdvarint(@"hash_f15bc465eb216c3e", 5);
    switch (instance.type) {
    case #"hash_19ba8d41970911ad":
        dropchance = getdvarint(@"hash_202437d366ab08bf", 50);
        break;
    default:
        if (issubstr(instance.type, "br_loot_cache")) {
            dropchance = getdvarint(@"hash_2f77de10bafc6229", 25);
        }
        if (istrue(getdvarint(@"hash_1c4ecb2e31a1b8e8", 0))) {
            dropchance = 0;
        }
        break;
    }
    var_9768b22610b34d9d = getdvarint(@"hash_69e3493c0e7dc860", 0);
    var_3f2d768db35932e1 = undefined;
    var_65b1523ca1aa20d2 = getdvarint(@"hash_a0594edd74c2cd34", 100);
    if (level.var_2ddd5fa2cfa55afe < var_65b1523ca1aa20d2) {
        var_ab6ac2a474126ea3 = randomintrange(1, 100);
        if (istrue(var_9768b22610b34d9d) || dropchance > 0 && var_ab6ac2a474126ea3 <= dropchance) {
            level.var_2ddd5fa2cfa55afe++;
            var_3f2d768db35932e1 = "brloot_super_temp_v";
        }
    }
    return var_3f2d768db35932e1;
}

// Namespace namespace_acaaa9efe860953e/namespace_416e533f6ed17708
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xbfc
// Size: 0x3d
function private function_acf86641a7105328() {
    self endon("disconnect");
    self visionsetnakedforplayer("battlerage-low-health", 0.5);
    waittill_any_timeout_1(0.2, "death");
    self visionsetnakedforplayer("", 0.5);
}

// Namespace namespace_acaaa9efe860953e/namespace_416e533f6ed17708
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xc40
// Size: 0x2d
function private function_f2c35147cd83e1c7() {
    self endon("disconnect");
    waittill_any_timeout_1(1, "death");
    self setscriptablepartstate("superpowers_veins", "off", 0);
}

// Namespace namespace_acaaa9efe860953e/namespace_416e533f6ed17708
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xc74
// Size: 0x114
function private function_79cd1b77a631e77c(player) {
    if (!namespace_36f464722d326bbe::function_beff479639e6508()) {
        return;
    }
    if (!getdvarint(@"hash_ab08e8567915abb8", 1)) {
        return;
    }
    var_cc75e0b74ee84d57 = spawnstruct();
    var_cc75e0b74ee84d57.var_d66266e27481ace9 = 0;
    var_cc75e0b74ee84d57.var_40ca706da5962314 = 1;
    var_cc75e0b74ee84d57.var_cfcffc70799935ee = 0;
    var_cc75e0b74ee84d57.var_e6f187bcb4b1648e = "TempV_Br";
    var_cc75e0b74ee84d57.var_d77771d6bfb89518 = "hud_icon_power_temp_v";
    var_cc75e0b74ee84d57.circleradius = getdvarint(@"hash_e232615a13615b53", 1000);
    var_cc75e0b74ee84d57.var_212406c9408b2d05 = getdvarint(@"hash_c3c506f46b023d34", 5);
    var_cc75e0b74ee84d57.var_9fccd0c71039eff7 = &function_dd9f4b8ceed5962e;
    var_cc75e0b74ee84d57.var_981fda4f385c05d5 = &function_df6ba84c45ef214e;
    var_cc75e0b74ee84d57.var_7073a47db2f80848 = &function_6f1e076a4ba6dbce;
    var_cc75e0b74ee84d57.var_1e7fe7292618d1c5 = 0;
    var_cc75e0b74ee84d57.priority = 1;
    namespace_8042e17e26cb2c7f::function_4647cbf23f54d6f6(player, var_cc75e0b74ee84d57);
}

// Namespace namespace_acaaa9efe860953e/namespace_416e533f6ed17708
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd8f
// Size: 0x70
function function_dd9f4b8ceed5962e(var_cc75e0b74ee84d57, var_c17caed8c315b4a6) {
    if (!isdefined(var_c17caed8c315b4a6.var_20c4102e2ddc6fc2)) {
        var_c17caed8c315b4a6.var_20c4102e2ddc6fc2 = 0;
    }
    var_c17caed8c315b4a6.var_20c4102e2ddc6fc2++;
    if (!function_60461f95db3442b4(var_c17caed8c315b4a6, var_cc75e0b74ee84d57)) {
        return;
    }
    var_c17caed8c315b4a6.var_1d7ce7f4baf78710 = gettime();
    namespace_d3d40f75bb4e4c32::brleaderdialogplayer("supe_spotted", var_c17caed8c315b4a6, 1, 0, undefined, undefined, "dx_br_bds4_");
}

// Namespace namespace_acaaa9efe860953e/namespace_416e533f6ed17708
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe06
// Size: 0xb1
function function_df6ba84c45ef214e(var_cc75e0b74ee84d57, var_81c4e06c9530f1cc) {
    var_81c4e06c9530f1cc.var_20c4102e2ddc6fc2--;
    if (var_81c4e06c9530f1cc.var_20c4102e2ddc6fc2 <= 0) {
        var_81c4e06c9530f1cc.var_20c4102e2ddc6fc2 = 0;
    }
    if (!function_60461f95db3442b4(var_81c4e06c9530f1cc, var_cc75e0b74ee84d57, 1)) {
        return;
    }
    var_81c4e06c9530f1cc.var_1d7ce7f4baf78710 = gettime();
    if (isdefined(var_cc75e0b74ee84d57.player) && !var_cc75e0b74ee84d57.player namespace_f8065cafc523dba5::_isalive()) {
        namespace_d3d40f75bb4e4c32::brleaderdialogplayer("supe_killed", var_81c4e06c9530f1cc, 1, 0, undefined, undefined, "dx_br_bds4_");
    } else {
        namespace_d3d40f75bb4e4c32::brleaderdialogplayer("supe_lost", var_81c4e06c9530f1cc, 1, 0, undefined, undefined, "dx_br_bds4_");
    }
}

// Namespace namespace_acaaa9efe860953e/namespace_416e533f6ed17708
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xebe
// Size: 0xf9
function function_60461f95db3442b4(var_1f6573e24689cf5f, var_cc75e0b74ee84d57, var_506b84b2eafa32c5) {
    if (!getdvarint(@"hash_3f710c257c1c6fb2", 1)) {
        return 0;
    }
    if (!isdefined(var_1f6573e24689cf5f)) {
        return 0;
    }
    if (isdefined(var_1f6573e24689cf5f) && var_1f6573e24689cf5f.team == var_cc75e0b74ee84d57.player.team) {
        return 0;
    }
    if (isdefined(var_1f6573e24689cf5f.var_1d7ce7f4baf78710)) {
        timediff = (gettime() - var_1f6573e24689cf5f.var_1d7ce7f4baf78710) / 1000;
        if (timediff <= getdvarint(@"hash_1b11c351d93c1126", 5)) {
            return 0;
        }
    }
    if (istrue(var_506b84b2eafa32c5)) {
        if (isdefined(var_1f6573e24689cf5f.var_20c4102e2ddc6fc2) && var_1f6573e24689cf5f.var_20c4102e2ddc6fc2 > 0) {
            return 0;
        }
    } else if (isdefined(var_1f6573e24689cf5f.var_20c4102e2ddc6fc2) && var_1f6573e24689cf5f.var_20c4102e2ddc6fc2 > 1) {
        return 0;
    }
    return 1;
}

// Namespace namespace_acaaa9efe860953e/namespace_416e533f6ed17708
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfbf
// Size: 0x51
function function_6f1e076a4ba6dbce(var_cc75e0b74ee84d57) {
    level endon("game_ended");
    var_cc75e0b74ee84d57 endon("bounty_end");
    var_cc75e0b74ee84d57.player waittill_any_5("death_or_disconnect", "enter_live_ragdoll", "successful_exfil", "map_to_map_warp", "temp_v_finished");
    namespace_8042e17e26cb2c7f::function_a10c4276271c4ad7(var_cc75e0b74ee84d57, 1, 2);
}

// Namespace namespace_acaaa9efe860953e/namespace_416e533f6ed17708
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1017
// Size: 0x34
function function_4c30d408ae45aa33() {
    self endon("temp_v_finished");
    self endon("disconnect");
    level endon("game_ended");
    waittill_any_2("death", "unset_super");
    thread function_269b97f3d86eb172(0, 1);
}

// Namespace namespace_acaaa9efe860953e/namespace_416e533f6ed17708
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1052
// Size: 0x24
function function_cef1c8463d56bb49() {
    self endon("temp_v_finished");
    self endon("disconnect");
    level waittill("game_ended");
    thread function_269b97f3d86eb172(0, 1);
}

