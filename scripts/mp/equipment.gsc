// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_3b64eb40368c1450;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using script_7ef95bba57dc4b82;
#using script_2669878cf5a1b6bc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\perk.gsc;
#using scripts\mp\class.gsc;
#using scripts\mp\battlechatter_mp.gsc;
#using scripts\mp\utility\spawn_event_aggregator.gsc;
#using scripts\mp\equipment_interact.gsc;
#using scripts\mp\perks\headgear.gsc;
#using scripts\mp\equipment\tactical_cover.gsc;
#using scripts\mp\equipment\trophy_system.gsc;
#using scripts\mp\equipment\decoy_grenade.gsc;
#using scripts\mp\equipment\at_mine.gsc;
#using scripts\mp\equipment\tac_insert.gsc;
#using script_479e458f6f530f0d;
#using scripts\mp\equipment\claymore.gsc;
#using scripts\mp\equipment\molotov.gsc;
#using scripts\mp\equipment\weapon_drop.gsc;
#using scripts\cp_mp\equipment\throwing_knife.gsc;
#using script_52d91cb28006a5bd;
#using script_1cf2ed809496bf4e;
#using script_156835ef9924856a;
#using script_13f9dde7eecfbc71;
#using script_2bada07de712df57;
#using scripts\mp\equipment\adrenaline.gsc;
#using scripts\mp\equipment\c4.gsc;
#using scripts\mp\equipment\binoculars.gsc;
#using script_ec0f9ad939b29e0;
#using script_19fd5b5d73d44c18;
#using script_7c40fa80892a721;
#using scripts\mp\equipment\flash_grenade.gsc;
#using scripts\mp\equipment\concussion_grenade.gsc;
#using scripts\mp\equipment\gas_grenade.gsc;
#using scripts\mp\equipment\thermite.gsc;
#using script_a35012b9b75a996;
#using script_6e2bb9330396afcb;
#using script_1a70dab983449bb8;
#using script_3ef6c4fbba18bfa4;
#using scripts\mp\equipment\snapshot_grenade.gsc;
#using script_10ad6174c8938599;
#using scripts\mp\utility\disconnect_event_aggregator.gsc;
#using scripts\cp_mp\utility\weapon_utility.gsc;
#using scripts\mp\flags.gsc;
#using scripts\mp\weapons.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\gametypes\br_public.gsc;
#using scripts\mp\gametypes\br_analytics.gsc;
#using scripts\mp\equipment.gsc;
#using scripts\mp\damage.gsc;
#using script_2d9d24f7c63ac143;
#using scripts\mp\utility\stats.gsc;
#using scripts\mp\hud_message.gsc;
#using scripts\mp\gamelogic.gsc;
#using scripts\cp_mp\challenges.gsc;
#using scripts\mp\killstreaks\killstreaks.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\cp_mp\utility\killstreak_utility.gsc;
#using scripts\cp_mp\killstreaks\emp_drone_targeted.gsc;
#using scripts\cp_mp\killstreaks\emp_drone.gsc;

#namespace equipment;

// Namespace equipment/namespace_1a507865f681850e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd11
// Size: 0x141
function init() {
    if (isdefined(level.var_1a2b600a06ec21f4) && isdefined(level.var_1a2b600a06ec21f4.var_bd5d1f5a11586ed4)) {
        level.var_e5255d7c501309dd = "equipmentlist:" + level.var_1a2b600a06ec21f4.var_bd5d1f5a11586ed4;
    } else if (getdvarint(@"hash_a464cb031c16ee87", 0) > 0) {
        level.var_e5255d7c501309dd = "equipmentlist:equipment_list_t10_mp";
        /#
            utility::function_631451c08249b9d2("equip_battlerage", level.var_e5255d7c501309dd);
        #/
    } else if (getdvarint(@"hash_39c3947a2e4f5f9e", 0) > 0) {
        level.var_e5255d7c501309dd = "equipmentlist:equipment_list_mgl_mp";
        /#
            utility::function_631451c08249b9d2("equip_battlerage", level.var_e5255d7c501309dd);
        #/
    } else {
        level.var_e5255d7c501309dd = "equipmentlist:equipment_list_iw9_mp";
        /#
            utility::function_631451c08249b9d2("equip_battlerage", level.var_e5255d7c501309dd);
        #/
    }
    level.equipment = spawnstruct();
    level.equipment.table = [];
    inititems();
    function_29d51c2a86346a9c(level.var_e5255d7c501309dd);
    initlethalmaxoffsetmap();
    function_f8d145900d997580();
    namespace_71eef510d7f364cf::registeronplayerspawncallback(&equiponplayerspawned);
}

// Namespace equipment/namespace_1a507865f681850e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe59
// Size: 0x841
function inititems() {
    level.equipment.callbacks = [];
    if (getdvarint(@"hash_742caa13b3c2e685")) {
        return;
    }
    var_584994fab4a8712b = level.equipment;
    namespace_43a68cf8c122ab9::equipmentinteract_init();
    if (!istrue(game["isLaunchChunk"])) {
        namespace_d69d8725e28e1ca9::init();
        namespace_e76aa51cbf8812ee::tac_cover_init();
        namespace_832187ad8517bd27::trophy_init();
        namespace_85b18538a4f2be70::decoy_init();
        namespace_3953fa5589223b8::at_mine_init();
        namespace_add8ab90fc53d7f7::tacinsert_init();
    }
    namespace_96abc792b7f61807::function_58bf160252f94e21();
    namespace_8c5b266f689b1e0b::claymore_init();
    namespace_df478cc572a311d3::molotov_init();
    namespace_7f468c66c778cc41::weapondrop_init();
    namespace_eb0feb5c721a9f11::throwing_knife_init();
    namespace_9cff5695f11e1c45::function_12d7ca3ff609caba();
    namespace_861236fa8235a2ba::function_35f02578b0c90838();
    namespace_4033b03dc100de62::function_80b2d6867c192094();
    namespace_c0468fb70a78d525::function_7c59b9d44aff939b();
    namespace_d8f7634b48937d6d::function_d80165ad0154bb7e();
    if (issharedfuncdefined("equip_butterfly_mine", "init")) {
        function_f3bb4f4911a1beb2("equip_butterfly_mine", "init");
    }
    var_584994fab4a8712b.callbacks["equip_helmet"]["onGive"] = &namespace_d69d8725e28e1ca9::runheadgear;
    var_584994fab4a8712b.callbacks["equip_helmet"]["onTake"] = &namespace_d69d8725e28e1ca9::removeheadgear;
    var_584994fab4a8712b.callbacks["equip_adrenaline"]["onFired"] = &namespace_82a12c9c6cef3538::onequipmentfired;
    var_584994fab4a8712b.callbacks["equip_adrenaline"]["onTake"] = &namespace_82a12c9c6cef3538::onequipmenttaken;
    var_584994fab4a8712b.callbacks["equip_c4"]["onGive"] = &namespace_7381a1f17171d16c::c4_set;
    var_584994fab4a8712b.callbacks["equip_trophy"]["onGive"] = &namespace_832187ad8517bd27::trophy_set;
    var_584994fab4a8712b.callbacks["equip_trophy"]["onTake"] = &namespace_832187ad8517bd27::trophy_unset;
    var_584994fab4a8712b.callbacks["equip_throwing_knife"]["onGive"] = &namespace_eb0feb5c721a9f11::throwing_knife_ongive;
    var_584994fab4a8712b.callbacks["equip_throwing_knife"]["onTake"] = &namespace_eb0feb5c721a9f11::throwing_knife_ontake;
    var_584994fab4a8712b.callbacks["equip_throwing_knife"]["onIncrement"] = &namespace_eb0feb5c721a9f11::function_d763df6d36a1e34a;
    var_584994fab4a8712b.callbacks["equip_throwing_knife_fire"]["onGive"] = &namespace_eb0feb5c721a9f11::throwing_knife_ongive;
    var_584994fab4a8712b.callbacks["equip_throwing_knife_fire"]["onTake"] = &namespace_eb0feb5c721a9f11::throwing_knife_ontake;
    var_584994fab4a8712b.callbacks["equip_throwing_knife_electric"]["onGive"] = &namespace_eb0feb5c721a9f11::throwing_knife_ongive;
    var_584994fab4a8712b.callbacks["equip_throwing_knife_electric"]["onTake"] = &namespace_eb0feb5c721a9f11::throwing_knife_ontake;
    var_584994fab4a8712b.callbacks["equip_throwstar"]["onGive"] = &namespace_9cff5695f11e1c45::function_e7715ffb329c1b40;
    var_584994fab4a8712b.callbacks["equip_throwstar"]["onTake"] = &namespace_9cff5695f11e1c45::function_92e126d1a5d3fb2;
    var_584994fab4a8712b.callbacks["equip_molotov"]["onGive"] = &namespace_df478cc572a311d3::molotov_on_give;
    var_584994fab4a8712b.callbacks["equip_molotov"]["onTake"] = &namespace_df478cc572a311d3::molotov_on_take;
    var_584994fab4a8712b.callbacks["equip_tac_cover"]["onGive"] = &namespace_e76aa51cbf8812ee::tac_cover_on_give;
    var_584994fab4a8712b.callbacks["equip_tac_cover"]["onTake"] = &namespace_e76aa51cbf8812ee::tac_cover_on_take;
    var_584994fab4a8712b.callbacks["equip_tac_cover"]["onFired"] = &namespace_e76aa51cbf8812ee::tac_cover_on_fired;
    var_584994fab4a8712b.callbacks["equip_tac_insert"]["onGive"] = &namespace_add8ab90fc53d7f7::tacinsert_set;
    var_584994fab4a8712b.callbacks["equip_tac_insert"]["onTake"] = &namespace_add8ab90fc53d7f7::tacinsert_unset;
    var_584994fab4a8712b.callbacks["equip_binoculars"]["onGive"] = &namespace_7111b1420b25d0ad::binoculars_ongive;
    var_584994fab4a8712b.callbacks["equip_binoculars"]["onTake"] = &namespace_7111b1420b25d0ad::binoculars_ontake;
    var_584994fab4a8712b.callbacks["equip_iodine_pills"]["onGive"] = &namespace_4033b03dc100de62::function_43fe8ccc8b4e6146;
    var_584994fab4a8712b.callbacks["equip_iodine_pills"]["onTake"] = &namespace_4033b03dc100de62::function_d41fe283435e26c4;
    var_584994fab4a8712b.callbacks["equip_geigercounter"]["onGive"] = &namespace_96abc792b7f61807::function_60cba38635fd35cb;
    var_584994fab4a8712b.callbacks["equip_geigercounter"]["onTake"] = &namespace_96abc792b7f61807::function_bdd02627bcafe359;
    if (issharedfuncdefined("equip_aethercounter", "onGive") && issharedfuncdefined("equip_aethercounter", "onTake")) {
        var_584994fab4a8712b.callbacks["equip_aethercounter"]["onGive"] = getsharedfunc("equip_aethercounter", "onGive");
        var_584994fab4a8712b.callbacks["equip_aethercounter"]["onTake"] = getsharedfunc("equip_aethercounter", "onTake");
    }
    var_584994fab4a8712b.callbacks["equip_hb_sensor"]["onIncrement"] = &namespace_8a392daf295e43f8::function_3efd622905908041;
    var_584994fab4a8712b.callbacks["equip_thermal_phone"]["onGive"] = &namespace_c0468fb70a78d525::function_d7b50d4592cd5421;
    var_584994fab4a8712b.callbacks["equip_thermal_phone"]["onTake"] = &namespace_c0468fb70a78d525::function_e49fa2736f79e04b;
    var_584994fab4a8712b.callbacks["equip_battlerage"]["onFired"] = &namespace_e6ac9d98b8876b98::function_d04e75b8e793111f;
    var_584994fab4a8712b.callbacks["equip_battlerage"]["onTake"] = &namespace_e6ac9d98b8876b98::function_bd68ba32d66dde65;
    var_584994fab4a8712b.callbacks["equip_armor_onehanded"]["onFired"] = &namespace_f8d3520d3483c1::function_df0c4be0709e8116;
    var_584994fab4a8712b.callbacks["equip_armor_onehanded"]["onTake"] = &namespace_f8d3520d3483c1::function_dd4193b50e36fb2c;
    var_584994fab4a8712b.callbacks["equip_flash"]["onFired"] = &namespace_5e840d01a2244aea::onfired;
    var_584994fab4a8712b.callbacks["equip_concussion"]["onFired"] = &namespace_bcc915524a9a5eba::onfired;
    var_584994fab4a8712b.callbacks["equip_gas_grenade"]["onPlayerDamaged"] = &namespace_d39a86483d995ed1::gas_onplayerdamaged;
    var_584994fab4a8712b.callbacks["equip_flash"]["onPlayerDamaged"] = &namespace_5e840d01a2244aea::onplayerdamaged;
    var_584994fab4a8712b.callbacks["equip_concussion"]["onPlayerDamaged"] = &namespace_bcc915524a9a5eba::onplayerdamaged;
    var_584994fab4a8712b.callbacks["equip_thermite"]["onPlayerDamaged"] = &namespace_8a5c6d833b2eeab1::thermite_onplayerdamaged;
    var_584994fab4a8712b.callbacks["equip_molotov"]["onPlayerDamaged"] = &namespace_df478cc572a311d3::molotov_on_player_damaged;
    var_584994fab4a8712b.callbacks["equip_shockstick"]["onPlayerDamaged"] = &namespace_742e7eca5294ecdc::function_ca6c37e5d8f35c8b;
    var_584994fab4a8712b.callbacks["equip_bunkerbuster"]["onPlayerDamaged"] = &namespace_14ec1bc880a07c3b::function_66629d921c921905;
    var_584994fab4a8712b.callbacks["equip_thermobaric_grenade"]["onPlayerDamaged"] = &namespace_d61c6e0163d61af4::onplayerdamaged;
    var_584994fab4a8712b.callbacks["equip_at_mine"]["onOwnerChanged"] = &namespace_3953fa5589223b8::at_mine_onownerchanged;
    var_584994fab4a8712b.callbacks["equip_claymore"]["onOwnerChanged"] = &namespace_8c5b266f689b1e0b::claymore_onownerchanged;
    var_584994fab4a8712b.callbacks["equip_c4"]["onOwnerChanged"] = &namespace_7381a1f17171d16c::c4_onownerchanged;
    var_584994fab4a8712b.callbacks["equip_butterfly_mine"]["onOwnerChanged"] = &namespace_b96a346cb4f3959c::function_e1d976fb5e329d97;
    var_584994fab4a8712b.callbacks["equip_trophy"]["onOwnerChanged"] = &namespace_832187ad8517bd27::function_d70f6fa2c37c1230;
    var_584994fab4a8712b.callbacks["equip_at_mine"]["onDestroyedByTrophy"] = &namespace_3953fa5589223b8::at_mine_delete;
    var_584994fab4a8712b.callbacks["equip_claymore"]["onDestroyedByTrophy"] = &namespace_8c5b266f689b1e0b::claymore_delete;
    var_584994fab4a8712b.callbacks["equip_trophy"]["onDestroyedByTrophy"] = &namespace_832187ad8517bd27::trophy_delete;
    var_584994fab4a8712b.callbacks["equip_c4"]["onDestroyedByTrophy"] = &namespace_7381a1f17171d16c::c4_delete;
    var_584994fab4a8712b.callbacks["equip_snapshot_grenade"]["onDestroyedByTrophy"] = &namespace_ce72036f17f28af2::snapshot_grenade_delete;
    var_584994fab4a8712b.callbacks["equip_deployed_decoy"]["onDestroyedByTrophy"] = &namespace_861236fa8235a2ba::function_ec4ed8b35f49093;
    var_584994fab4a8712b.callbacks["cluster_spike"]["onDestroyedByTrophy"] = &namespace_39febbb7a6990e45::function_b89726dbbc1c74f6;
    var_584994fab4a8712b.callbacks["cluster_spike_proj"]["onDestroyedByTrophy"] = &namespace_39febbb7a6990e45::function_b89726dbbc1c74f6;
    thread watchlethaldelay();
    namespace_f1d40c362677777e::registerondisconnecteventcallback(&onownerdisconnect);
    /#
        thread debughackequipment();
        thread debugemp();
        thread debugempdrone();
        thread debugdestroyempdrones();
    #/
}

// Namespace equipment/namespace_1a507865f681850e
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x16a1
// Size: 0x30
function private function_f8d145900d997580() {
    namespace_82a12c9c6cef3538::function_22fd49689920fdb1();
    if (issharedfuncdefined("thermobaric_grenade", "thermobaric_grenade_init")) {
        [[ getsharedfunc("thermobaric_grenade", "thermobaric_grenade_init") ]]();
    }
}

// Namespace equipment/namespace_1a507865f681850e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16d8
// Size: 0x46
function getcallback(ref, callback) {
    if (!isdefined(level.equipment.callbacks[ref])) {
        return undefined;
    }
    return level.equipment.callbacks[ref][callback];
}

// Namespace equipment/namespace_1a507865f681850e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1726
// Size: 0x3be
function function_29d51c2a86346a9c(var_e5255d7c501309dd) {
    level.var_a1e3b0d7b2a7836f = [];
    level.var_415476758ec47760 = [];
    var_9df9fe298aef6003 = getscriptbundle(var_e5255d7c501309dd);
    for (i = 0; i < var_9df9fe298aef6003.var_bd5d1f5a11586ed4.size; i++) {
        equipmentref = var_9df9fe298aef6003.var_bd5d1f5a11586ed4[i].ref;
        var_68cd8193f877cf60 = var_9df9fe298aef6003.var_bd5d1f5a11586ed4[i].bundle;
        if (isdefined(var_68cd8193f877cf60)) {
            var_85a1e8b6a105e2bb = getscriptbundle("equipment:" + var_68cd8193f877cf60);
            if (isdefined(var_85a1e8b6a105e2bb)) {
                struct = spawnstruct();
                struct.ref = equipmentref;
                weaponname = var_85a1e8b6a105e2bb.useweapon;
                /#
                    assertex(isdefined(weaponname), var_e5255d7c501309dd + " error -  "" + equipmentref + "" has no weapon");
                #/
                if (weaponname != "none") {
                    struct.objweapon = namespace_d325722f2754c2c4::function_eeaa22f0cd1ff845(weaponname);
                    blueprints = function_bb92a5000082832a(weaponname);
                    foreach (blueprint, id in blueprints) {
                        var_1092bc40c58c1c9a = weaponname + "|" + string(id);
                        level.var_a1e3b0d7b2a7836f[var_1092bc40c58c1c9a] = function_3211981142ec5aee(weaponname, blueprint);
                    }
                    if (!isdefined(level.var_415476758ec47760[weaponname])) {
                        level.var_415476758ec47760[weaponname] = equipmentref;
                    }
                }
                struct.id = i;
                struct.image = var_85a1e8b6a105e2bb.image;
                struct.defaultslot = ter_op(isdefined(var_85a1e8b6a105e2bb.var_5472b77a1e1124b3) && var_85a1e8b6a105e2bb.var_5472b77a1e1124b3 == 2, "secondary", "primary");
                struct.scavengerammo = ter_op(isdefined(var_85a1e8b6a105e2bb.scavengerammo), var_85a1e8b6a105e2bb.scavengerammo, 0);
                struct.ispassive = isdefined(var_85a1e8b6a105e2bb.ispassive) && var_85a1e8b6a105e2bb.ispassive;
                struct.isselectable = !isdefined(var_85a1e8b6a105e2bb.var_f9c517fd9d746051) || var_85a1e8b6a105e2bb.var_f9c517fd9d746051 != -1;
                struct.weaponname = weaponname;
                struct.bundle = var_85a1e8b6a105e2bb;
                var_da24fa61707aa57f = var_85a1e8b6a105e2bb.var_e2a7d54c199db889;
                if (!isdefined(var_da24fa61707aa57f)) {
                    if (weaponname != "none") {
                        struct.damageweaponnames = [0:weaponname];
                    }
                } else {
                    if (var_da24fa61707aa57f == "none") {
                        goto LOC_0000039d;
                    }
                    damageweaponnames = [];
                    if (weaponname != "none") {
                        damageweaponnames[damageweaponnames.size] = weaponname;
                    }
                    var_a2643f257ee064a3 = strtok(var_da24fa61707aa57f, " ");
                    foreach (var_f9ec6c92c0ff1f63 in var_a2643f257ee064a3) {
                        damageweaponnames[damageweaponnames.size] = var_f9ec6c92c0ff1f63;
                    }
                    struct.damageweaponnames = damageweaponnames;
                LOC_0000039d:
                }
            LOC_0000039d:
                level.equipment.table[equipmentref] = struct;
            }
        }
    }
}

// Namespace equipment/namespace_1a507865f681850e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1aeb
// Size: 0x28
function getequipmenttableinfo(ref) {
    if (!isdefined(ref)) {
        return undefined;
    }
    return level.equipment.table[ref];
}

// Namespace equipment/namespace_1a507865f681850e
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b1b
// Size: 0x272
function giveequipment(ref, slot, class, variantid) {
    /#
        assert(isdefined(ref));
    #/
    /#
        assert(isdefined(slot));
    #/
    if (!isdefined(self.equipment)) {
        self.equipment = [];
    }
    if (ref == "none") {
        return;
    }
    var_8bf83d28be4c2d4f = getequipmenttableinfo(ref);
    /#
        assertex(isdefined(var_8bf83d28be4c2d4f), "Attempting to give unknown equipment - "" + ref + """);
    #/
    if (!isdefined(var_8bf83d28be4c2d4f)) {
        return;
    }
    takeequipment(slot);
    weapon = undefined;
    if (!isdefined(variantid) && isdefined(self.var_a6dd5c7e74106ce3) && isdefined(self.var_a6dd5c7e74106ce3[ref])) {
        variantid = self.var_a6dd5c7e74106ce3[ref];
    }
    if (isdefined(variantid) && variantid > 0) {
        weapon = namespace_4fb9dddfb8c1a67a::function_9e77a3e4bb6c6e31(var_8bf83d28be4c2d4f.weaponname, variantid);
    } else {
        weapon = var_8bf83d28be4c2d4f.objweapon;
    }
    if (isdefined(weapon)) {
        self giveweapon(weapon);
        var_afdcb24f5375ac21 = is_equipment_slot_allowed(slot) || istrue(level.var_aefa27a676322b3f) && !namespace_4b0406965e556711::gameflag("prematch_done");
        if (var_afdcb24f5375ac21 && !var_8bf83d28be4c2d4f.ispassive) {
            if (slot == "primary") {
                self assignweaponoffhandprimary(weapon);
            } else if (slot == "secondary") {
                self assignweaponoffhandsecondary(weapon);
            } else if (slot == "super") {
                self assignweaponoffhandspecial(weapon);
            }
        }
    }
    sethudslot(slot, var_8bf83d28be4c2d4f.id);
    self.equipment[slot] = ref;
    var_645972186625daee = getcallback(ref, "onGive");
    if (isdefined(var_645972186625daee)) {
        self thread [[ var_645972186625daee ]](ref, slot, variantid);
    }
    function_22bf78eca6578d7d(slot, class);
    var_4e8271cf261e45dd = ref == "equip_throwing_knife" || ref == "equip_throwing_knife_fire" || ref == "equip_throwing_knife_electric" || ref == "equip_shuriken";
    if (namespace_3c37cb17ade254d::issharedfuncdefined("game", "getGameType") && [[ namespace_3c37cb17ade254d::getsharedfunc("game", "getGameType") ]]() == "arena" && var_4e8271cf261e45dd) {
        goto LOC_00000266;
    }
    thread watchlethaldelayplayer(ref, slot);
LOC_00000266:
    self notify("equipment_given", ref);
}

// Namespace equipment/namespace_1a507865f681850e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d94
// Size: 0xeb
function takeequipment(slot) {
    /#
        assert(isdefined(slot));
    #/
    ref = getcurrentequipment(slot);
    if (!isdefined(ref)) {
        return;
    }
    var_8bf83d28be4c2d4f = getequipmenttableinfo(ref);
    if (isdefined(var_8bf83d28be4c2d4f) && isdefined(var_8bf83d28be4c2d4f.objweapon)) {
        if (self hasweapon(var_8bf83d28be4c2d4f.objweapon)) {
            _takeweapon(var_8bf83d28be4c2d4f.objweapon);
            if (slot == "primary") {
                self clearoffhandprimary();
            } else if (slot == "secondary") {
                self clearoffhandsecondary();
            }
        }
    }
    sethudslot(slot, 0);
    self.equipment[slot] = undefined;
    var_c96c25b8a1f6fe18 = getcallback(ref, "onTake");
    if (isdefined(var_c96c25b8a1f6fe18)) {
        self thread [[ var_c96c25b8a1f6fe18 ]](ref, slot);
    }
    function_22bf78eca6578d7d(slot);
    self notify("equipment_taken_" + ref);
}

// Namespace equipment/namespace_1a507865f681850e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e86
// Size: 0x146
function equiponplayerdamaged(data) {
    weaponname = data.objweapon.basename;
    foreach (ref, var_8bf83d28be4c2d4f in level.equipment.table) {
        var_148e2d88d1deffd3 = getcallback(ref, "onPlayerDamaged");
        if (isdefined(var_148e2d88d1deffd3) && isdefined(var_8bf83d28be4c2d4f.damageweaponnames)) {
            foreach (var_f9ec6c92c0ff1f63 in var_8bf83d28be4c2d4f.damageweaponnames) {
                if (var_f9ec6c92c0ff1f63 == weaponname) {
                    var_b4998cf105f4856b = gettime();
                    result = [[ var_148e2d88d1deffd3 ]](data);
                    /#
                        assertex(gettime() == var_b4998cf105f4856b, "onPlayerDamagedCallback for " + ref + " cannot have waits.");
                    #/
                    return result;
                }
            }
        }
    }
}

// Namespace equipment/namespace_1a507865f681850e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1fd3
// Size: 0x56
function ondestroyedbytrophy() {
    if (isdefined(self.equipmentref)) {
        var_99115207769478ff = getcallback(self.equipmentref, "onDestroyedByTrophy");
        if (isdefined(var_99115207769478ff)) {
            self thread [[ var_99115207769478ff ]]();
            return 1;
        } else if (namespace_3bbb5a98b932c46f::isplantedequipment(self)) {
            thread namespace_3bbb5a98b932c46f::deleteexplosive();
            return 1;
        }
    }
    return 0;
}

// Namespace equipment/namespace_1a507865f681850e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2031
// Size: 0x68
function function_4967838290cb31b9(index) {
    switch (index) {
    case 0:
        return "primary";
    case 1:
        return "secondary";
    case 2:
        return "health";
    default:
        /#
            assert(0, "Attempt to get slot for invalid equipment index " + index);
        #/
        break;
    }
}

// Namespace equipment/namespace_1a507865f681850e
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x20a0
// Size: 0x45
function disableslotinternal(slot) {
    if (slot == "primary") {
        self clearoffhandprimary();
    } else if (slot == "secondary") {
        self clearoffhandsecondary();
    } else if (slot == "super") {
        self clearoffhandspecial();
    }
}

// Namespace equipment/namespace_1a507865f681850e
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x20ec
// Size: 0xb4
function enableslotinternal(slot) {
    ref = getcurrentequipment(slot);
    if (!isdefined(ref)) {
        return;
    }
    var_8bf83d28be4c2d4f = getequipmenttableinfo(ref);
    if (isdefined(var_8bf83d28be4c2d4f) && isdefined(var_8bf83d28be4c2d4f.objweapon) && !var_8bf83d28be4c2d4f.ispassive) {
        if (slot == "primary") {
            self assignweaponoffhandprimary(var_8bf83d28be4c2d4f.objweapon);
        } else if (slot == "secondary") {
            self assignweaponoffhandsecondary(var_8bf83d28be4c2d4f.objweapon);
        } else if (slot == "super") {
            self assignweaponoffhandspecial(var_8bf83d28be4c2d4f.objweapon);
        }
    }
}

// Namespace equipment/namespace_1a507865f681850e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x21a7
// Size: 0x6c
function is_equipment_slot_allowed(slot) {
    switch (slot) {
    case #"hash_325cb2e66f67d5b9":
        return val::get("equipment_primary");
    case #"hash_511d3c24fcedcdb1":
        return val::get("equipment_secondary");
    default:
        return (val::get("equipment_primary") && val::get("equipment_secondary"));
        break;
    }
}

// Namespace equipment/namespace_1a507865f681850e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x221a
// Size: 0x2d
function sethudslot(slot, id) {
    if (slot != "super") {
        self setclientomnvar("ui_equipment_id_" + slot, id);
    }
}

// Namespace equipment/namespace_1a507865f681850e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x224e
// Size: 0x2b
function getcurrentequipment(slot) {
    if (!(isdefined(self.equipment) && isdefined(slot))) {
        return undefined;
    }
    return self.equipment[slot];
}

// Namespace equipment/namespace_1a507865f681850e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2281
// Size: 0x66
function clearallequipment() {
    if (!isdefined(self.equipment)) {
        return;
    }
    foreach (slot, ref in self.equipment) {
        takeequipment(slot);
    }
}

// Namespace equipment/namespace_1a507865f681850e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x22ee
// Size: 0x388
function getequipmentmaxammo(ref, class) {
    var_8bf83d28be4c2d4f = getequipmenttableinfo(ref);
    if (!isdefined(var_8bf83d28be4c2d4f)) {
        return undefined;
    }
    if (!isdefined(var_8bf83d28be4c2d4f.objweapon)) {
        return 0;
    }
    if (isdefined(level.var_986acb83cc29ed77)) {
        if (ref == "equip_armorplate") {
            return namespace_f8d3520d3483c1::function_47320a25b8ee003();
        }
        maxammo = weaponmaxammo(var_8bf83d28be4c2d4f.objweapon);
    } else if (!namespace_36f464722d326bbe::isbrstylegametype()) {
        if (ref == "equip_armorplate") {
            return namespace_f8d3520d3483c1::function_47320a25b8ee003();
        }
        var_3002827bca3dc613 = namespace_82dcd1d5ae30ff7::_hasperk("specialty_extraoffhandammo");
        maxammo = weaponmaxammo(var_8bf83d28be4c2d4f.objweapon, var_3002827bca3dc613);
        switch (ref) {
        case #"hash_6d194c409057b2":
        case #"hash_4b4a6458f00d9319":
        case #"hash_8770d1da0d7395b9":
        case #"hash_aa60ec2aec479ec8":
        case #"hash_cbcb2b145327e750":
            break;
        default:
            maxammo--;
            break;
        }
        slot = findequipmentslot(ref);
        if (!isdefined(slot)) {
            return maxammo;
        }
        if (_hasperk("specialty_extra_deadly") && slot == "primary") {
            if (_hasperk("specialty_ninja_vest")) {
                if (issubstr(ref, "throwing_knife") || issubstr(ref, "throwstar") || issubstr(ref, "shuriken")) {
                    maxammo++;
                }
            } else {
                maxammo++;
            }
        }
        if (_hasperk("specialty_extra_tactical") && slot == "secondary") {
            maxammo++;
        }
        if (isdefined(class)) {
            var_fd84df04adead383 = namespace_d19129e4fa5d176::loadout_getclasstype(class);
            var_1bc3bf54ae8e6ed7 = function_11a4d197e8db4f(var_fd84df04adead383);
            var_20327dd6b8d19acf = function_58ea099b568dbfaf(var_fd84df04adead383);
            if ((var_1bc3bf54ae8e6ed7 || _hasperk("specialty_grenadier_vest")) && slot == "primary") {
                maxammo++;
            }
            if ((var_20327dd6b8d19acf || _hasperk("specialty_tac_vest")) && slot == "secondary") {
                maxammo++;
            }
        } else if (_hasperk("specialty_grenadier_vest") && slot == "primary") {
            maxammo++;
        } else if (_hasperk("specialty_tac_vest") && slot == "secondary") {
            maxammo++;
        }
    } else {
        if (!isdefined(var_8bf83d28be4c2d4f.ref)) {
            return 0;
        }
        if (isdefined(level.br_pickups.br_equipnametoscriptable[var_8bf83d28be4c2d4f.ref])) {
            equipmentname = level.br_pickups.br_equipnametoscriptable[var_8bf83d28be4c2d4f.ref];
        } else {
            equipmentname = level.br_pickups.br_equipnametoscriptable[function_1823ff50bb28148d(var_8bf83d28be4c2d4f.ref)];
        }
        /#
            assertex(isdefined(level.br_pickups.maxcounts[equipmentname]), "Equipment " + equipmentname + " not found in level.br_pickups.maxCounts. Please add a stack size in the appropriate loot_item_defs table.");
        #/
        maxammo = level.br_pickups.maxcounts[equipmentname];
        if (!isdefined(maxammo)) {
            maxammo = 0;
        }
        if (ref == "equip_armorplate") {
            if (namespace_d3d40f75bb4e4c32::hasplatepouch()) {
                maxammo = maxammo + getdvarint(@"hash_a5ab8ed6cc1b486a", 5);
            }
            if (istrue(level.var_6d1d9e1b59c6f37)) {
                maxammo = level.var_6d1d9e1b59c6f37;
            }
        }
    }
    return maxammo;
}

// Namespace equipment/namespace_1a507865f681850e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x267e
// Size: 0x5d
function getequipmentstartammo(ref) {
    var_8bf83d28be4c2d4f = getequipmenttableinfo(ref);
    if (!isdefined(var_8bf83d28be4c2d4f)) {
        return undefined;
    }
    if (!isdefined(var_8bf83d28be4c2d4f.objweapon)) {
        return 0;
    }
    var_3002827bca3dc613 = namespace_82dcd1d5ae30ff7::_hasperk("specialty_extraoffhandammo");
    return weaponstartammo(var_8bf83d28be4c2d4f.objweapon, var_3002827bca3dc613);
}

// Namespace equipment/namespace_1a507865f681850e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x26e3
// Size: 0xe0
function getequipmentammo(ref) {
    var_8bf83d28be4c2d4f = getequipmenttableinfo(ref);
    if (!isdefined(var_8bf83d28be4c2d4f)) {
        return undefined;
    }
    if (!isdefined(var_8bf83d28be4c2d4f.objweapon)) {
        return 0;
    }
    ammocount = self getammocount(var_8bf83d28be4c2d4f.objweapon);
    if (ammocount == 0) {
        var_45ac76d4327fa160 = var_8bf83d28be4c2d4f.objweapon.basename;
        foreach (weaponobj in self.offhandinventory) {
            if (weaponobj.basename == var_45ac76d4327fa160) {
                ammocount = self getammocount(weaponobj);
            }
        }
    }
    return ammocount;
}

// Namespace equipment/namespace_1a507865f681850e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x27cb
// Size: 0x171
function setequipmentammo(ref, amount) {
    var_8bf83d28be4c2d4f = getequipmenttableinfo(ref);
    if (!isdefined(var_8bf83d28be4c2d4f) || !isdefined(var_8bf83d28be4c2d4f.objweapon)) {
        return;
    }
    var_a1a3722fb9707783 = self getweaponslistoffhands();
    found = 0;
    foreach (equip in var_a1a3722fb9707783) {
        var_1189bd7fbe2861f8 = function_7f245729fcb6414d(equip.basename);
        if (isdefined(var_1189bd7fbe2861f8) && var_1189bd7fbe2861f8 == ref) {
            variantid = undefined;
            weapon = undefined;
            found = 1;
            if (isdefined(equip.variantid) && equip.variantid > 0) {
                variantid = equip.variantid;
                weapon = namespace_4fb9dddfb8c1a67a::function_9e77a3e4bb6c6e31(equip.basename, variantid);
            } else {
                weapon = var_8bf83d28be4c2d4f.objweapon;
            }
            self setweaponammoclip(weapon, amount);
            break;
        }
    }
    if (!istrue(found)) {
        weapon = var_8bf83d28be4c2d4f.objweapon;
        self setweaponammoclip(weapon, amount);
    }
    function_22bf78eca6578d7d(findequipmentslot(ref));
}

// Namespace equipment/namespace_1a507865f681850e
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2943
// Size: 0x96
function incrementequipmentammo(ref, var_930290d7f474a0ae, class, var_7af3206c6ef0c3f0) {
    if (!isdefined(var_930290d7f474a0ae)) {
        var_930290d7f474a0ae = 1;
    }
    var_3dbc3b058135cbfb = getequipmentammo(ref);
    newammo = int(min(var_3dbc3b058135cbfb + var_930290d7f474a0ae, getequipmentmaxammo(ref, class)));
    if (!istrue(var_7af3206c6ef0c3f0)) {
        var_cd1c409bf48e2722 = getcallback(ref, "onIncrement");
        if (isdefined(var_cd1c409bf48e2722)) {
            self thread [[ var_cd1c409bf48e2722 ]](ref, var_3dbc3b058135cbfb);
        }
    }
    setequipmentammo(ref, newammo);
}

// Namespace equipment/namespace_1a507865f681850e
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x29e0
// Size: 0x74
function decrementequipmentammo(ref, var_7d2e0ea9107a4c02, class) {
    if (!isdefined(var_7d2e0ea9107a4c02)) {
        var_7d2e0ea9107a4c02 = 1;
    }
    var_3dbc3b058135cbfb = getequipmentammo(ref);
    var_7d2e0ea9107a4c02 = int(min(var_7d2e0ea9107a4c02, var_3dbc3b058135cbfb));
    if (var_7d2e0ea9107a4c02 > 0) {
        newammo = int(min(var_3dbc3b058135cbfb - var_7d2e0ea9107a4c02, getequipmentmaxammo(ref, class)));
        setequipmentammo(ref, newammo);
    }
}

// Namespace equipment/namespace_1a507865f681850e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a5b
// Size: 0x70
function incrementequipmentslotammo(slot, var_930290d7f474a0ae) {
    ref = getcurrentequipment(slot);
    if (!isdefined(ref)) {
        return undefined;
    }
    if (!isdefined(var_930290d7f474a0ae)) {
        var_930290d7f474a0ae = 1;
    }
    var_3dbc3b058135cbfb = getequipmentammo(ref);
    newammo = int(min(var_3dbc3b058135cbfb + var_930290d7f474a0ae, getequipmentmaxammo(ref)));
    setequipmentammo(ref, newammo);
}

// Namespace equipment/namespace_1a507865f681850e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ad2
// Size: 0x70
function decrementequipmentslotammo(slot, var_7d2e0ea9107a4c02) {
    ref = getcurrentequipment(slot);
    if (!isdefined(ref)) {
        return undefined;
    }
    if (!isdefined(var_7d2e0ea9107a4c02)) {
        var_7d2e0ea9107a4c02 = 1;
    }
    var_3dbc3b058135cbfb = getequipmentammo(ref);
    newammo = int(min(var_3dbc3b058135cbfb - var_7d2e0ea9107a4c02, getequipmentmaxammo(ref)));
    setequipmentammo(ref, newammo);
}

// Namespace equipment/namespace_1a507865f681850e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b49
// Size: 0x2c
function getequipmentslotammo(slot) {
    ref = getcurrentequipment(slot);
    if (!isdefined(ref)) {
        return undefined;
    }
    return getequipmentammo(ref);
}

// Namespace equipment/namespace_1a507865f681850e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b7d
// Size: 0x35
function setequipmentslotammo(slot, count) {
    ref = getcurrentequipment(slot);
    if (!isdefined(ref)) {
        return undefined;
    }
    return setequipmentammo(ref, count);
}

// Namespace equipment/namespace_1a507865f681850e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2bba
// Size: 0x17
function function_7f245729fcb6414d(weaponname) {
    return level.var_415476758ec47760[weaponname];
}

// Namespace equipment/namespace_1a507865f681850e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2bd9
// Size: 0x1ca
function mapequipmentweaponforref(objweapon) {
    weaponname = undefined;
    switch (objweapon.basename) {
    case #"hash_34f28162f0f54c6e":
    case #"hash_53d34fb712dd4235":
        weaponname = "throwingknife_mp";
        break;
    case #"hash_209a406e8931b2bd":
        weaponname = "throwstar_mp_jup";
        break;
    case #"hash_5701898d598fdb27":
        weaponname = "claymore_mp";
        break;
    case #"hash_1608b7d163aaf95f":
        weaponname = "jup_claymore_ob";
        break;
    case #"hash_cce14c95e4764532":
        weaponname = "at_mine_mp";
        break;
    case #"hash_6547ec525f1340da":
    case #"hash_a009d256608f52ce":
    case #"hash_c4b9b21ecac2ced4":
        weaponname = "bunkerbuster_mp";
        break;
    case #"hash_9276d33dcce198b0":
    case #"hash_a51366582cde195e":
    case #"hash_adeee012d2581c12":
        weaponname = "jup_bunkerbuster_ob";
        break;
    case #"hash_379caca7e143e75e":
    case #"hash_4a359b7b4364d9ac":
    case #"hash_66c5fe0e48af6b38":
        weaponname = "t10_bunkerbuster_mp";
        break;
    case #"hash_8fd6158eb96a1f15":
    case #"hash_b2a8e1829f433bd7":
        weaponname = "thermite_mp";
        break;
    case #"hash_82c54c49e3242f5b":
        weaponname = "trophy_mp";
        break;
    case #"hash_fd386aff9acf671":
        weaponname = "butterfly_mine_mp";
        break;
    case #"hash_fd964aff9b13e19":
        weaponname = "jup_butterfly_mine_ob";
        break;
    case #"hash_e36b3928a0e518fa":
        weaponname = "breacher_drone_mp";
        break;
    case #"hash_aee3b09360147621":
        weaponname = "tracker_grenade_mp";
        break;
    }
    if (isdefined(weaponname)) {
        return namespace_d325722f2754c2c4::function_eeaa22f0cd1ff845(weaponname);
    }
    return objweapon;
}

// Namespace equipment/namespace_1a507865f681850e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2dab
// Size: 0x40
function getequipmentreffromweapon(objweapon) {
    if (!isdefined(objweapon) || !isweapon(objweapon)) {
        return "";
    }
    objweapon = mapequipmentweaponforref(objweapon);
    return level.var_415476758ec47760[objweapon.basename];
}

// Namespace equipment/namespace_1a507865f681850e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2df3
// Size: 0x97
function function_2113b6f7cb462692(weaponname) {
    if (!isdefined(weaponname)) {
        return undefined;
    }
    foreach (var_8bf83d28be4c2d4f in level.equipment.table) {
        if (isdefined(var_8bf83d28be4c2d4f.weaponname) && weaponname == var_8bf83d28be4c2d4f.weaponname) {
            return var_8bf83d28be4c2d4f.bundle;
        }
    }
    return undefined;
}

// Namespace equipment/namespace_1a507865f681850e
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2e92
// Size: 0x3e
function getweaponfromequipmentref(var_1189bd7fbe2861f8) {
    equip = level.equipment.table[var_1189bd7fbe2861f8];
    if (isdefined(equip)) {
        return equip.objweapon;
    }
    return undefined;
}

// Namespace equipment/namespace_1a507865f681850e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ed8
// Size: 0x72
function hasequipment(ref) {
    if (!isdefined(self.equipment)) {
        return 0;
    }
    foreach (var_f03830bd1cd0cf91 in self.equipment) {
        if (var_f03830bd1cd0cf91 == ref) {
            return 1;
        }
    }
    return 0;
}

// Namespace equipment/namespace_1a507865f681850e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f52
// Size: 0x70
function findequipmentslot(ref) {
    if (!isdefined(self.equipment)) {
        return undefined;
    }
    foreach (slot, var_f03830bd1cd0cf91 in self.equipment) {
        if (var_f03830bd1cd0cf91 == ref) {
            return slot;
        }
    }
}

// Namespace equipment/namespace_1a507865f681850e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2fc9
// Size: 0x13
function isequipmentlethal(ref) {
    return isequipmentprimary(ref);
}

// Namespace equipment/namespace_1a507865f681850e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2fe4
// Size: 0x50
function isequipmentprimary(ref) {
    if (isdefined(level.equipment.table[ref])) {
        return (level.equipment.table[ref].defaultslot == "primary");
    } else {
        return 0;
    }
}

// Namespace equipment/namespace_1a507865f681850e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x303b
// Size: 0x13
function isequipmenttactical(ref) {
    return isequipmentsecondary(ref);
}

// Namespace equipment/namespace_1a507865f681850e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3056
// Size: 0x50
function isequipmentsecondary(ref) {
    if (isdefined(level.equipment.table[ref])) {
        return (level.equipment.table[ref].defaultslot == "secondary");
    } else {
        return 0;
    }
}

// Namespace equipment/namespace_1a507865f681850e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x30ad
// Size: 0x4b
function isequipmentselectable(ref) {
    if (isdefined(level.equipment.table[ref])) {
        return istrue(level.equipment.table[ref].isselectable);
    } else {
        return 0;
    }
}

// Namespace equipment/namespace_1a507865f681850e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x30ff
// Size: 0x107
function function_22bf78eca6578d7d(slot, class) {
    if (!(isdefined(self.equipment) && isdefined(slot))) {
        return;
    }
    ammo = 0;
    maxammo = 0;
    ref = getcurrentequipment(slot);
    if (isdefined(ref)) {
        ammo = getequipmentslotammo(slot);
        maxammo = getequipmentmaxammo(ref, class);
    }
    if (slot == "primary") {
        self setclientomnvar("ui_power_num_charges", ammo);
        self setpowerammo("primary", ammo, maxammo);
    } else if (slot == "secondary") {
        self setclientomnvar("ui_power_secondary_num_charges", ammo);
        self setpowerammo("secondary", ammo, maxammo);
    } else if (slot == "health") {
        if (isdefined(self.pers["telemetry"].armor_collected)) {
            self.pers["telemetry"].armor_collected++;
        }
        self setclientomnvar("ui_equipment_id_health_numCharges", ammo);
    }
}

// Namespace equipment/namespace_1a507865f681850e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x320d
// Size: 0xb
function equiponplayerspawned() {
    thread watchoffhandfired();
}

// Namespace equipment/namespace_1a507865f681850e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x321f
// Size: 0xd
function resetequipment() {
    self.equipment = [];
}

// Namespace equipment/namespace_1a507865f681850e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3233
// Size: 0x2f0
function executeoffhandfired(objweapon) {
    foreach (slot, ref in self.equipment) {
        var_8bf83d28be4c2d4f = getequipmenttableinfo(ref);
        if (isdefined(var_8bf83d28be4c2d4f) && isdefined(var_8bf83d28be4c2d4f.objweapon) && objweapon == var_8bf83d28be4c2d4f.objweapon) {
            if (namespace_36f464722d326bbe::isbrstylegametype()) {
                item_type = "";
                if (isdefined(var_8bf83d28be4c2d4f.bundle) && isdefined(var_8bf83d28be4c2d4f.bundle.var_11d2f075e9a0e643)) {
                    item_type = var_8bf83d28be4c2d4f.bundle.var_11d2f075e9a0e643;
                }
                namespace_a011fbf6d93f25e5::branalytics_equipmentuse(self, objweapon, item_type);
            }
            weaponref = namespace_1a507865f681850e::getequipmentreffromweapon(objweapon);
            /#
                assertex(isdefined(weaponref), "weaponRef was undefined for: " + ter_op(isdefined(objweapon) && isdefined(objweapon.basename), objweapon.basename), "undefined");
            #/
            namespace_3e725f3cc58bddd3::combatrecordequipmentused(weaponref);
            var_98806ef14e691ff7 = getcallback(ref, "onFired");
            if (isdefined(var_98806ef14e691ff7)) {
                self thread [[ var_98806ef14e691ff7 ]](ref, slot, objweapon);
            }
            if (isdefined(self.team)) {
                level notify("equipment_used_" + self.team, weaponref);
            }
            ammo = 0;
            ref = getcurrentequipment(slot);
            if (isdefined(ref)) {
                ammo = getequipmentslotammo(slot);
            }
            if (ammo == 0 && isdefined(level.var_87a4731d4dce4c3f)) {
                success = self [[ level.var_87a4731d4dce4c3f ]](self, slot, ref);
                if (istrue(success)) {
                    break;
                }
            }
            function_22bf78eca6578d7d(slot);
            if (namespace_36f464722d326bbe::isbrstylegametype() && namespace_aead94004cf4c147::isbackpackinventoryenabled() && !getdvarint(@"hash_ced962345ff6ecd0", 0) && !namespace_aead94004cf4c147::function_5bf048439a846222(ref)) {
                scriptablename = level.br_pickups.br_equipnametoscriptable[ref];
                if (namespace_d3d40f75bb4e4c32::function_6b531c76815d77f3(scriptablename) && !namespace_d3d40f75bb4e4c32::function_ac3376fecc550ef0(scriptablename)) {
                    namespace_aead94004cf4c147::removesmallestitemstackbackpack(scriptablename, 1);
                    namespace_1a507865f681850e::incrementequipmentammo(ref, 1);
                }
            }
            var_3f61508d8a5c4764 = "tacticalsUsed";
            if (isequipmentlethal(weaponref)) {
                var_3f61508d8a5c4764 = "lethalsUsed";
            }
            if (isdefined(self.pers[var_3f61508d8a5c4764])) {
                namespace_3c5a4254f2b957ea::incpersstat(var_3f61508d8a5c4764, 1);
            }
            if (isdefined(var_8bf83d28be4c2d4f.bundle.var_a2d48adbe4702769)) {
                level thread namespace_20260f65229aa888::trysaylocalsound(self, var_8bf83d28be4c2d4f.bundle.var_a2d48adbe4702769);
            }
            break;
        }
    }
}

// Namespace equipment/namespace_1a507865f681850e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x352a
// Size: 0x34
function watchoffhandfired() {
    level endon("game_ended");
    self endon("death_or_disconnect");
    while (1) {
        objweapon = self waittill("offhand_fired");
        executeoffhandfired(objweapon);
    }
}

// Namespace equipment/namespace_1a507865f681850e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3565
// Size: 0x9c
function function_312cbcf07904565d() {
    foreach (ref in self.equipment) {
        if (!issubstr(ref, "throwing_knife")) {
            continue;
        }
        var_8bf83d28be4c2d4f = getequipmenttableinfo(ref);
        if (isdefined(var_8bf83d28be4c2d4f) && var_8bf83d28be4c2d4f.scavengerammo > 0) {
            incrementequipmentammo(ref, var_8bf83d28be4c2d4f.scavengerammo);
        }
    }
}

// Namespace equipment/namespace_1a507865f681850e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3608
// Size: 0x8b
function givescavengerammo() {
    foreach (ref in self.equipment) {
        var_8bf83d28be4c2d4f = getequipmenttableinfo(ref);
        if (isdefined(var_8bf83d28be4c2d4f) && var_8bf83d28be4c2d4f.scavengerammo > 0) {
            incrementequipmentammo(ref, var_8bf83d28be4c2d4f.scavengerammo);
        }
    }
}

// Namespace equipment/namespace_1a507865f681850e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x369a
// Size: 0x30
function getdefaultslot(ref) {
    var_8bf83d28be4c2d4f = getequipmenttableinfo(ref);
    if (!isdefined(var_8bf83d28be4c2d4f)) {
        return undefined;
    }
    return var_8bf83d28be4c2d4f.defaultslot;
}

// Namespace equipment/namespace_1a507865f681850e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x36d2
// Size: 0xed
function watchlethaldelay() {
    level endon("lethal_delay_end");
    level endon("round_end");
    level endon("game_ended");
    namespace_4b0406965e556711::gameflagwait("prematch_done");
    currentgametypestopsclock = currentgametypestopsclock();
    if (currentgametypestopsclock) {
        level.lethaldelaystarttime = gettime();
    } else {
        level.lethaldelaystarttime = gettimepassed();
    }
    if (level.lethaldelay == 0) {
        level.lethaldelayendtime = level.lethaldelaystarttime;
        level notify("lethal_delay_end");
    }
    level.lethaldelayendtime = level.lethaldelaystarttime + level.lethaldelay * 1000;
    level notify("lethal_delay_start");
    while (1) {
        currenttime = undefined;
        if (currentgametypestopsclock) {
            currenttime = gettime();
        } else {
            currenttime = gettimepassed();
        }
        if (currenttime >= level.lethaldelayendtime) {
            break;
        }
        waitframe();
    }
    level notify("lethal_delay_end");
}

// Namespace equipment/namespace_1a507865f681850e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x37c6
// Size: 0x119
function watchlethaldelayplayer(equipmentref, slot) {
    self endon("death_or_disconnect");
    level endon("round_end");
    level endon("game_ended");
    if (lethaldelaypassed()) {
        return;
    }
    self notify("watchLethalDelayPlayer_" + slot);
    self endon("watchLethalDelayPlayer_" + slot);
    self endon("equipment_taken_" + equipmentref);
    if (!isdefined(self.lethaldelayallows) || !istrue(self.lethaldelayallows[slot])) {
        if (!isdefined(self.lethaldelayallows)) {
            self.lethaldelayallows = [];
        }
        self.lethaldelayallows[slot] = 1;
        if (slot == "primary") {
            val::set("watchLethalDelayPlayer", "equipment_primary", 0);
        } else {
            val::set("watchLethalDelayPlayer", "equipment_secondary", 0);
        }
    }
    watchlethaldelayfeedbackplayer(self, slot);
    if (isdefined(self.lethaldelayallows) && istrue(self.lethaldelayallows[slot])) {
        self.lethaldelayallows[slot] = undefined;
        if (self.lethaldelayallows.size == 0) {
            self.lethaldelayallows = undefined;
        }
        val::function_c9d0b43701bdba00("watchLethalDelayPlayer");
    }
}

// Namespace equipment/namespace_1a507865f681850e
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x38e6
// Size: 0xeb
function watchlethaldelayfeedbackplayer(player, slot) {
    level endon("lethal_delay_end");
    if (!istrue(namespace_4b0406965e556711::gameflag("prematch_done"))) {
        level waittill("lethal_delay_start");
    }
    command = "+frag";
    if (slot != "primary") {
        command = "+smoke";
    }
    if (!isai(player)) {
        player notifyonplayercommand("lethal_attempt_" + slot, command);
    }
    currentgametypestopsclock = currentgametypestopsclock();
    while (1) {
        self waittill("lethal_attempt_" + slot);
        currenttime = undefined;
        if (currentgametypestopsclock) {
            currenttime = gettime();
        } else {
            currenttime = gettimepassed();
        }
        n = (level.lethaldelayendtime - currenttime) / 1000;
        n = int(max(0, ceil(n)));
        player namespace_44abc05161e2e2cb::showerrormessage("MP/LETHALS_UNAVAILABLE_FOR_N", n);
    }
}

// Namespace equipment/namespace_1a507865f681850e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x39d8
// Size: 0x50
function cancellethaldelay() {
    level.lethaldelay = 0;
    if (currentgametypestopsclock()) {
        level.lethaldelaystarttime = gettime();
    } else {
        level.lethaldelaystarttime = gettimepassed();
    }
    level.lethaldelayendtime = level.lethaldelaystarttime;
    level notify("lethal_delay_end");
}

// Namespace equipment/namespace_1a507865f681850e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a2f
// Size: 0x63
function lethaldelaypassed() {
    if (isdefined(level.lethaldelay) && level.lethaldelay == 0) {
        return 1;
    }
    if (isdefined(level.lethaldelayendtime)) {
        currenttime = undefined;
        if (currentgametypestopsclock()) {
            currenttime = gettime();
        } else {
            currenttime = gettimepassed();
        }
        return (currenttime > level.lethaldelayendtime);
    }
    return 0;
}

// Namespace equipment/namespace_1a507865f681850e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a9a
// Size: 0x38
function currentgametypestopsclock() {
    gametype = getgametype();
    if (gametype == "hq" || gametype == "grnd" || gametype == "koth") {
        return 1;
    }
    return 0;
}

// Namespace equipment/namespace_1a507865f681850e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3ada
// Size: 0x6b
function onownerdisconnect(player) {
    var_7c3ce7ff13fbd7fc = player namespace_3bbb5a98b932c46f::getallequip();
    foreach (equip in var_7c3ce7ff13fbd7fc) {
        equip notify("owner_disconnect");
    }
}

// Namespace equipment/namespace_1a507865f681850e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3b4c
// Size: 0xa9
function hackequipment(hacker) {
    self.ishacked = 1;
    newowner = hacker;
    if (isdefined(hacker.owner) && hacker.equipmentref == "equip_capture_bot") {
        newowner = hacker.owner;
    }
    newowner namespace_d576b6dc7cef9c62::sethasdonecombat(newowner, 1);
    hacker namespace_aad14af462a74d08::onhack(self.equipmentref);
    changeowner(newowner);
    if (level.teambased) {
        self filteroutplayermarks(newowner.team);
    } else {
        self filteroutplayermarks(newowner);
    }
    newowner namespace_58a74e7d54b56e8d::givescoreforhack();
}

// Namespace equipment/namespace_1a507865f681850e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3bfc
// Size: 0x9a
function changeowner(newowner) {
    var_c0f9139ffd72e62d = self.owner;
    self setentityowner(newowner);
    self.owner = newowner;
    self.team = newowner.team;
    self setotherent(newowner);
    var_c0f9139ffd72e62d namespace_3bbb5a98b932c46f::removeequip(self);
    self.owner namespace_3bbb5a98b932c46f::updateplantedarray(self);
    onownerchanged = getcallback(self.equipmentref, "onOwnerChanged");
    self notify("ownerChanged");
    if (isdefined(onownerchanged)) {
        self [[ onownerchanged ]](var_c0f9139ffd72e62d);
    }
}

// Namespace equipment/namespace_1a507865f681850e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3c9d
// Size: 0x3c
function function_f69ed22535d90b78() {
    self endon("death");
    level endon("game_ended");
    var_a681b7890cd017c7 = spawnstruct();
    childthread function_bdde0931accf955b(var_a681b7890cd017c7);
    childthread function_449e67a68fa04968(var_a681b7890cd017c7);
    self waittill("missile_impact");
    return var_a681b7890cd017c7;
}

// Namespace equipment/namespace_1a507865f681850e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3ce1
// Size: 0x40
function function_bdde0931accf955b(var_a681b7890cd017c7) {
    self endon("missile_impact");
    stuckto = self waittill("missile_stuck");
    if (isdefined(stuckto)) {
        var_a681b7890cd017c7.stuckto = stuckto;
    }
    self notify("missile_impact");
}

// Namespace equipment/namespace_1a507865f681850e
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3d28
// Size: 0x31
function function_449e67a68fa04968(var_a681b7890cd017c7) {
    self endon("missile_impact");
    self waittill("missile_water_impact");
    var_a681b7890cd017c7.isunderwater = 1;
    self notify("missile_impact");
}

// Namespace equipment/namespace_1a507865f681850e
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3d60
// Size: 0x69
function function_4af015619e2534ba(stuckto, destroyfunc, var_6a94cf09aa6e486e) {
    level endon("game_ended");
    self endon("death");
    if (isdefined(self.owner)) {
        self.owner endon("disconnect");
    }
    if (isagent(stuckto)) {
        return;
    }
    stuckto waittill_any_2("death", "destroy");
    self thread [[ destroyfunc ]](var_6a94cf09aa6e486e);
}

// Namespace equipment/namespace_1a507865f681850e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3dd0
// Size: 0x104
function debughackequipment() {
    /#
        setdevdvar(@"hash_aa4a28e418803dd5", 0);
        while (1) {
            if (getdvarint(@"hash_aa4a28e418803dd5") != 0) {
                setdevdvar(@"hash_aa4a28e418803dd5", 0);
                var_dad9c3e8b724d629 = level.players[0];
                enemyplayer = undefined;
                for (i = 1; i < level.players.size; i++) {
                    if (var_dad9c3e8b724d629 namespace_f8065cafc523dba5::isenemy(level.players[i])) {
                        enemyplayer = level.players[i];
                        break;
                    }
                }
                if (!isdefined(enemyplayer)) {
                    iprintlnbold("equipment_given");
                    continue;
                }
                var_7c3ce7ff13fbd7fc = var_dad9c3e8b724d629 namespace_3bbb5a98b932c46f::getallequip();
                equipment = undefined;
                if (var_7c3ce7ff13fbd7fc.size > 0) {
                    equipment = var_7c3ce7ff13fbd7fc[0];
                }
                if (!isdefined(equipment)) {
                    iprintlnbold("grnd");
                    continue;
                }
                equipment hackequipment(enemyplayer);
            }
            waitframe();
        }
    #/
}

// Namespace equipment/namespace_1a507865f681850e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3edb
// Size: 0xa4
function debugemp() {
    /#
        setdevdvar(@"hash_d39ba2fefaffd043", 0);
        while (1) {
            if (getdvarint(@"hash_d39ba2fefaffd043") != 0) {
                setdevdvar(@"hash_d39ba2fefaffd043", 0);
                if (level.players.size < 2) {
                    iprintlnbold("<unknown string>");
                    continue;
                }
                var_204da528aa0a3464 = level.players[1];
                var_204da528aa0a3464 namespace_68e641469fde3fa7::_launchgrenade("<unknown string>", (0, 0, 0), (0, 0, 0), 0.05, 0);
            }
            waitframe();
        }
    #/
}

// Namespace equipment/namespace_1a507865f681850e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3f86
// Size: 0x105
function debugempdrone() {
    /#
        setdevdvar(@"hash_a6ef3bcfa25b1aef", 0);
        while (1) {
            if (getdvarint(@"hash_a6ef3bcfa25b1aef") != 0) {
                setdevdvar(@"hash_a6ef3bcfa25b1aef", 0);
                if (level.players.size < 2) {
                    iprintlnbold("<unknown string>");
                    continue;
                }
                firstplayer = level.players[0];
                var_204da528aa0a3464 = level.players[1];
                streakinfo = spawnstruct();
                streakinfo.streakname = "<unknown string>";
                streakinfo.owner = var_204da528aa0a3464;
                streakinfo.id = namespace_9abe40d2af041eb2::getuniquekillstreakid(var_204da528aa0a3464);
                streakinfo.lifeid = 0;
                targetpos = firstplayer.origin;
                drone = var_204da528aa0a3464 namespace_3ebc55488bf8fe66::empdrone_createdrone(streakinfo, targetpos);
            }
            waitframe();
        }
    #/
}

// Namespace equipment/namespace_1a507865f681850e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4092
// Size: 0xc5
function debugdestroyempdrones() {
    /#
        setdevdvar(@"hash_196b4febb9f4dd1f", 0);
        while (1) {
            if (getdvarint(@"hash_196b4febb9f4dd1f") != 0) {
                setdevdvar(@"hash_196b4febb9f4dd1f", 0);
                foreach (killstreak in level.activekillstreaks) {
                    if (isdefined(killstreak.streakinfo) && killstreak.streakinfo.streakname == "<unknown string>") {
                        killstreak namespace_5b16930b9511d4ed::empdrone_destroy();
                    }
                }
            }
            waitframe();
        }
    #/
}

// Namespace equipment/namespace_1a507865f681850e
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x415e
// Size: 0xc8
function initlethalmaxoffsetmap() {
    level.lethal_equipmentmaskoffsets = [];
    bitindex = 0;
    foreach (equipment in level.equipment.table) {
        if (!equipment.isselectable) {
            continue;
        }
        if (equipment.id <= 0) {
            continue;
        }
        if (equipment.defaultslot == "secondary") {
            continue;
        }
        level.lethal_equipmentmaskoffsets[equipment.ref] = 1 << bitindex;
        bitindex++;
    }
}

