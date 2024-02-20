// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_3b64eb40368c1450;
#using script_247745a526421ba7;
#using scripts\cp_mp\utility\callback_group.gsc;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using scripts\cp_mp\utility\weapon_utility.gsc;
#using script_2669878cf5a1b6bc;
#using scripts\mp\equipment\bandage.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\mp\utility\outline.gsc;
#using scripts\mp\hud_message.gsc;
#using scripts\mp\utility\equipment.gsc;
#using scripts\mp\gametypes\br_weapons.gsc;
#using scripts\mp\gametypes\br_analytics.gsc;
#using scripts\mp\utility\perk.gsc;
#using scripts\mp\perks\perkpackage.gsc;
#using script_5762ac2f22202ba2;
#using scripts\cp_mp\utility\player_utility.gsc;
#using script_728ffcee8cbf30ee;
#using script_396a814d39e7044f;
#using scripts\mp\calloutmarkerping_mp.gsc;
#using script_600b944a95c3a7bf;
#using scripts\mp\gametypes\br_circle.gsc;
#using scripts\engine\scriptable.gsc;
#using scripts\engine\trace.gsc;
#using scripts\mp\gametypes\br_armory_kiosk.gsc;
#using scripts\mp\gametypes\br_gametypes.gsc;
#using scripts\mp\gametypes\br_public.gsc;
#using script_3583ff375ab3a91e;
#using script_55e418c5cc946593;
#using script_2d9d24f7c63ac143;
#using scripts\cp_mp\challenges.gsc;
#using script_6fc415ff6a905dc1;
#using script_b7a9ce0a2282b79;
#using script_1f97a44d1761c919;
#using script_67cc94c07ab18d3a;
#using script_b0385bb45379222;
#using scripts\mp\loot.gsc;
#using scripts\mp\flags.gsc;
#using scripts\mp\gametypes\br_quest_util.gsc;
#using script_64acb6ce534155b7;
#using scripts\mp\equipment.gsc;
#using script_7c40fa80892a721;
#using scripts\mp\killstreaks\killstreaks.gsc;
#using scripts\mp\weapons.gsc;
#using scripts\mp\supers.gsc;
#using script_3aacf02225ca0da5;
#using script_ec0f9ad939b29e0;
#using scripts\mp\equipment\throwing_knife_mp.gsc;
#using scripts\mp\perks\perkfunctions.gsc;
#using scripts\mp\utility\script.gsc;
#using scripts\mp\gametypes\br_plunder.gsc;
#using scripts\mp\utility\points.gsc;
#using scripts\mp\perks\perks.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\cp_mp\gasmask.gsc;
#using scripts\cp_mp\killstreaks\white_phosphorus.gsc;
#using script_2391409ef7b431e1;
#using scripts\mp\juggernaut.gsc;
#using scripts\mp\gametypes\br_gulag.gsc;
#using scripts\mp\gametypes\br_gametype_dmz.gsc;
#using scripts\mp\gametypes\br_dev.gsc;
#using script_21c19cfc7139d773;
#using script_5bc60484d17fa95c;
#using script_1193c0b83fce13b;
#using script_3314add7998ab13;
#using script_2880c23deadcdd8f;
#using script_156835ef9924856a;
#using scripts\cp_mp\vehicles\vehicle_interact.gsc;
#using script_439d01e25d19543b;
#using script_744cad313ed0a87e;
#using scripts\mp\utility\killstreak.gsc;
#using scripts\mp\gametypes\br_jugg_common.gsc;
#using scripts\mp\gametypes\br_extract_quest.gsc;
#using scripts\mp\class.gsc;
#using scripts\mp\gametypes\br.gsc;
#using scripts\mp\gametypes\br_blueprint_extract_spawn.gsc;
#using scripts\common\interactive.gsc;
#using scripts\cp_mp\calloutmarkerping.gsc;
#using script_7c03ab87c5f9f420;
#using script_6a8ec730b2bfa844;
#using script_58f20490049af6ac;
#using script_498b5814b18986c9;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using scripts\mp\gametypes\br_pickups.gsc;
#using script_3ff2458477d23489;
#using scripts\mp\gametypes\br_gametype_truckwar.gsc;
#using scripts\cp_mp\vehicles\vehicle_occupancy.gsc;
#using script_676f8221e501bed1;
#using script_189b67b2735b981d;
#using scripts\mp\equipment\nvg.gsc;

#namespace br_pickups;

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e9b
// Size: 0x50e
function br_pickups_init() {
    level.br_pickups = spawnstruct();
    level.forcegivesuper = &forcegivesuper;
    level.showuseresultsfeedback = &showuseresultsfeedback;
    level.removeselfrevivetoken = &removeselfrevivetoken;
    level.var_f26b4e7eb9af8155 = &function_cdf7f2f6bd3207;
    level.var_c57ee1e174e42601 = &function_8206bc54a1ed73cb;
    level.var_86b2cfc21b9abcf8 = getdvarint(@"hash_9aad06ff702ecdb7", 1);
    level.var_509664f56a31278f = getdvarint(@"hash_55db2e273692b804", 1);
    level.var_cf32b38db66d1f3b = getdvarint(@"hash_e9f0565782117772", 1);
    level.var_34906263684780b7 = getdvarint(@"hash_3cbf2f4d297a0afb", 0);
    level.var_3ea6ceb7358d49df = getdvarint(@"hash_260b2bc23af3a102", 1);
    level.var_41ed77c6e0438829 = getdvarint(@"hash_81d6ab9018e6a6fe", 0);
    level.var_3d804d3022029476 = getdvarint(@"hash_581d0f4c51272920", 1);
    level.br_pickups.var_5bbd561a9aa69746 = getdvarint(@"hash_ec4c4df4cf064acf", 1) == 1;
    level.var_a9350d89a2e4d752 = getdvarint(@"hash_6d4a21dadd19744d", 0);
    if (getdvar(@"hash_e38e16d9fbf3fc43", "mp/loot/br/default/loot_item_defs.csv") != "mp/loot/br/default/loot_item_defs.csv") {
        level.var_a9350d89a2e4d752 = 0;
    }
    initarrays();
    if (istrue(level.var_a9350d89a2e4d752)) {
        function_d910e9a16fea4235();
        function_68c4db74396e7683();
    } else {
        function_e5528af9b712723f();
    }
    if (getdvar(@"hash_7feb156ccfaf8ddf", "") != "") {
        function_32a0394cf13c8b29();
    }
    initscriptablemanagement();
    level.var_aba762658155f642 = getdvarint(@"hash_b455ab2ec51aa034", 0);
    level.var_e5bb4d290468dd8 = getdvarint(@"hash_5a47269347ae6efd", 4);
    level.var_17d5cea099c1ef53 = getdvarint(@"hash_36a8422f72c9b425", 1);
    level.var_9fa4c8afefdc8734 = getdvarint(@"hash_aaf53a2c0b576822", 0);
    level.var_7b6723a60d7478a0 = getdvarint(@"hash_2f04a41993e8009a", 0);
    level.var_d3ef9649a38ffbe5 = getdvarint(@"hash_3d4dc4c0031757df", 0);
    level.var_6fb51ff010511210 = getdvarint(@"hash_a4f090b2c5573e4a", 0);
    level.var_152735d16e609bec = getdvarint(@"hash_7cd2980eb93cd682", 0);
    level.var_f5a1dc77e6a05354 = getdvarint(@"hash_bad88dadea6f5eaa", 0);
    level.var_a7c2a61a231cda3e = getdvarint(@"hash_6ed187ba3b2a67d4", 0);
    level.var_108efba0ee1450a8 = getdvarint(@"hash_53147c89008f8596", 0);
    level notify("br_pickups_init");
    level.var_1515562147f27975 = function_be35d1aef76188cb("brloot_equip_gasmask");
    level.var_479d8ef7f76a4df6 = function_be35d1aef76188cb("brloot_equip_gasmask_durable");
    level.var_cb1a359321609c75 = function_be35d1aef76188cb("brloot_equip_gasmask_scuba");
    level.var_1170cfb92432a61d = getdvarfloat(@"hash_27f5f1d2bc0ef94c", 0.75);
    level.var_152d5a9c5ac5cdad = getdvarfloat(@"hash_ba9e8fbf0254be1e", 1);
    level.var_aa1aaed4a9b80d4b = getdvarint(@"hash_3196e3743c6871b2", 3);
    level.var_7420ddc23aa7b431 = getdvarint(@"hash_552a3359b82d470f", 1);
    level.var_a3443d8ebdaf7c00 = getdvarint(@"hash_3481b39eb4c2f17a", 0);
    level.var_7582dc4260722bf1 = getdvarint(@"hash_53d1e9738538bb23", 0);
    level.var_bc1086a365d70b30 = getdvarint(@"hash_957bf05692b129ca", 0);
    level.var_e8fc7c00fd85a565 = getdvarint(@"hash_dbb95d9fb9db4e73", 1);
    level.var_9dd3ce936c1dec1d = getdvarint(@"hash_c108cc4c4e3a3653", 1);
    utility::registersharedfunc("pickups", "isDogTag", &isDogTag);
    utility::registersharedfunc("pickups", "isGasMask", &isgasmask);
    level.var_66a7a8b388d5de9e = getdvarint(@"hash_a55c2df135b06dc0", 2);
    level.var_66a7a8b388d5de9e = getdvarint(@"hash_a55c2df135b06dc0", 2);
    namespace_7c996eebd51b5b1f::init();
    br_circle::function_eca79fa0f341ee08(2, &dangercircletick, &function_1a1709943670772a);
    level.var_5312bc14bd5db377 = getdvarfloat(@"hash_58805f0cb8978a2a", 0.65);
    level.var_7f82d2e3f2ef4402 = getdvarint(@"hash_ff8abba18e62faa0", 8);
    level.var_43c2a465029a4684 = getdvarint(@"hash_27fc198432e29f5a", 30);
    level.var_42eb4fb7558dc1ec = getdvarint(@"hash_a75f4828b96da3ab", 40);
    level.var_40111092ff73b724 = getdvarint(@"hash_4b287dc805e35339", 5);
    level.var_7452545fbedecdba = getdvarint(@"hash_c5bb640990a524c2", 1);
    /#
        level thread function_d53595847895c537();
    #/
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x33b0
// Size: 0x18d
function function_d910e9a16fea4235() {
    level.var_970f64593dc93ff8 = [];
    level.var_ca63cdc28149e3b5 = [];
    var_a98d7d5830f7ebe6 = getscriptbundle(%"hash_19ee3c96a018bf35");
    if (isdefined(var_a98d7d5830f7ebe6) && isdefined(var_a98d7d5830f7ebe6.var_ce541b20ce9ca2a5)) {
        foreach (data in var_a98d7d5830f7ebe6.var_ce541b20ce9ca2a5) {
            var_890049f984dd3e53 = data.var_890049f984dd3e53;
            if (isdefined(var_890049f984dd3e53)) {
                var_97f1b48fd49a7224 = getscriptbundle(function_2ef675c13ca1c4af(%"hash_36fa976a8ae12763", var_890049f984dd3e53));
                if (isdefined(var_97f1b48fd49a7224) && isdefined(var_97f1b48fd49a7224.var_890049f984dd3e53)) {
                    foreach (data in var_97f1b48fd49a7224.var_890049f984dd3e53) {
                        var_a6961e95809442eb = data.var_fc4d515870dd3af3;
                        if (isdefined(var_a6961e95809442eb)) {
                            var_4913ec7fd6df45ec = getscriptbundle(function_2ef675c13ca1c4af(%"loot_item_def:", var_a6961e95809442eb));
                            if (isdefined(var_4913ec7fd6df45ec)) {
                                level.var_970f64593dc93ff8[var_a6961e95809442eb] = var_4913ec7fd6df45ec;
                                level.var_ca63cdc28149e3b5[var_4913ec7fd6df45ec.name] = var_a6961e95809442eb;
                            }
                        }
                    }
                }
            }
        }
    }
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3544
// Size: 0xa46
function initarrays() {
    if (!isdefined(level.br_pickups)) {
        level.br_pickups = spawnstruct();
    }
    level.br_pickups.createcallbacks = [];
    level.br_pickups.var_7c25f4fb48db3dd4 = [];
    level.br_pickups.droppedgasmasks = [];
    registerpickupcreatedcallback("brloot_equip_gasmask", &gasmask_onpickupcreated, 1);
    registerpickupcreatedcallback("brloot_equip_gasmask_durable", &gasmask_onpickupcreated, 1);
    registerpickupcreatedcallback("brloot_equip_gasmask_scuba", &gasmask_onpickupcreated, 1);
    level.br_pickups.br_equipname = [];
    level.br_pickups.stackable = [];
    level.br_pickups.maxcounts = [];
    level.br_pickups.counts = [];
    level.br_pickups.br_itemtype = [];
    level.br_pickups.var_db931093a6a130a5 = [];
    level.br_pickups.br_itemrow = [];
    level.br_pickups.br_itemrarity = [];
    level.br_pickups.var_d93566a78e29d583 = [];
    level.br_pickups.br_equipnametoscriptable = [];
    level.br_pickups.br_weapontoscriptable = [];
    level.br_pickups.var_7b2bff2d04ee1017 = [];
    level.br_pickups.var_b13dc7e63676bbe7 = [];
    level.br_pickups.br_pickupsfx = [];
    level.br_pickups.br_killstreakreference = [];
    level.br_pickups.br_killstreaktoscriptable = [];
    level.br_pickups.br_superreference = [];
    level.br_pickups.var_14bd11727c4b6629 = [];
    level.br_pickups.var_838863c4848d4c26 = [];
    level.br_pickups.br_hasautopickup = [];
    level.br_pickups.uniquelootcallbacks = [];
    level.br_pickups.var_c4b4b56c76765330 = [];
    level.br_pickups.var_4138f9ddc1cd22d = [];
    level.br_pickups.var_52aac7e6e7072413 = [];
    level.br_pickups.rotationoffset = [];
    level.br_pickups.var_688c9b0a44e4a8ca = [];
    level.br_pickups.var_b8fad1cfd41d21da = [];
    level.br_pickups.var_a5e4b146866d7fd = [];
    level.br_pickups.var_4183295edcc21db0 = [];
    level.br_pickups.var_832ad168567520f7 = [];
    level.br_pickups.var_59e01317f76cf924 = [];
    level.br_pickups.var_caf82339100de589 = [];
    level.br_pickups.br_allguns = [];
    level.br_pickups.br_lootguns = [];
    level.br_pickups.var_9e78b5ee377070a9 = [];
    level.br_pickups.var_692e058f97bcc055 = [];
    level.br_pickups.br_crateguns = [];
    level.br_pickups.br_crateitems = [];
    level.br_pickups.br_gulagpickups = [];
    level.br_pickups.var_1e6c5e03170cf425 = [];
    level.br_pickups.var_eb7725a8a6f2c64c = [];
    level.br_pickups.br_perks = [];
    level.br_lootiteminfo = [];
    level.br_weaponsprimary = [];
    level.br_weaponssecondary = [];
    level.br_throwables = [];
    level.br_usables = [];
    level.var_f2b443c644970bd7 = [];
    level.var_fb8e78837bc5ee6c = [];
    level.var_d8db1602c8bf473e = [];
    level.var_5635125e56693c8 = [];
    function_75633a54ad10a451("brloot_equip_gasmask_durable", getdvarint(@"hash_20633082981b3a9c", 220));
    setdvarifuninitialized(@"hash_61e10de0f675e9ad", 0);
    setdvarifuninitialized(@"hash_ff7a56b91e81bd5d", 1);
    level.br_pickups.br_pickupdenyammonoroom = "MP/BR_AMMO_DENY_NO_ROOM";
    level.br_pickups.br_pickupdenyequipnoroom = "MP/BR_EQUIP_DENY_NO_ROOM";
    level.br_pickups.br_pickupdenyalreadyhaveweapon = "MP/BR_WEAPON_DENY_ALREADY_HAVE";
    level.br_pickups.br_pickupdenyarmornotbetter = "MP/BR_ARMOR_DENY_NOT_BETTER";
    level.br_pickups.br_pickupdenyalreadyhaveks = "MP/BR_KILLSTREAK_DENY_ALREADY_HAVE";
    level.br_pickups.var_17109b21f99ad76d = "MP_BR_INGAME/ALREADY_HAVE_RESPAWN_TOKEN";
    level.br_pickups.var_540408f173ba9a3f = "MP_BR_INGAME/ALREADY_HAVE_GULAG_TOKEN";
    level.br_pickups.br_pickupdenyalreadyhaverevive = "MP_BR_INGAME/ALREADY_HAVE_SELF_REVIVE_ITEM";
    level.br_pickups.br_pickupdenyarmorfull = "MP/BR_ARMOR_DENY_ARMOR_FULL";
    level.br_pickups.br_pickupdenyalreadyhaveplatepouch = "MP_BR_INGAME/ALREADY_HAVE_PLATE_POUCH_ITEM";
    level.br_pickups.br_pickupdenyparachuting = "MP/BR_PICKUP_DENY_PARACHUTING";
    level.br_pickups.br_pickupdenyalreadyhavequest = "MP_BR_INGAME/TABLET_PICKUP_FAILURE";
    level.br_pickups.br_pickupdenyplunderpickup = "MP_BR_INGAME/PLUNDER_HELD_LIMIT_REACHED";
    level.br_pickups.br_pickupdenyjuggernaut = "KILLSTREAKS/JUGG_CANNOT_BE_USED";
    level.br_pickups.br_pickupalreadyhavespecialistbonus = "MP_BR_INGAME/ALREADY_HAVE_SPECIALIST_BONUS_ITEM";
    level.br_pickups.var_b4a939303c824805 = "MP_BR_INGAME/CIRCLE_PEEK_LIMIT";
    level.br_pickups.var_5fdcd05c466e7520 = "MP/BR_PICKUP_ITEM_MAX_LIMIT";
    level.br_pickups.var_a1a6a7680c4ff1eb = "MP/BR_ALREADY_EQUIPPED_ITEM";
    level.br_pickups.var_fde0e27b3a09bf3 = "MP/CANNOT_EQUIP_NOW";
    level.br_pickups.var_8840f100125d76c1 = "MP/CANNOT_USE_GAS_CAN";
    level.br_pickups.var_11ce58bf7ab6580b = "MP/CANNOT_USE_GAS_CAN_PALFA";
    level.br_pickups.var_4119211a43b2e452 = "MP/CANNOT_USE_GAS_CAN_IN_PALFA";
    level.br_pickups.var_fcdefa93bb57394a = "MP/CANNOT_USE_GAS_CAN_ELECTRIC";
    level.br_pickups.var_58fe23c2a80f28ed = "MP_BR_INGAME/MISSION_WHITELISTED";
    level.br_pickups.var_d8a2816e3697c70c = "MP_DMZ_MISSIONS/GEIGER_SEARCH_CONTRACT_CANCELLED_ERR";
    level.br_pickups.var_6944f496399a2a4 = "MP_BR_INGAME/TOO_MANY_TEAMMATES";
    level.br_pickups.br_pickupdenyplunderpickup = "MP_BR_INGAME/PLUNDER_HELD_LIMIT_REACHED";
    level.br_pickups.var_58d0559b458fd450 = "MP/CANNOT_EQUIP_NOW";
    level.br_pickups.var_355cddb773cb000d = "MP/DENY_USE_CARRY";
    level.br_pickups.br_pickupdenyweaponpickupap = "MP_BR_INGAME/ARMOR_INSERT_IN_PROGRESS";
    level.br_pickups.var_7141c6c2372c0a82 = "MP/BR_EQUIP_DENY_PLATE_CARRIER_SAME";
    level.br_pickups.var_8bffca3828fd297e = "MP/BR_EQUIP_DENY_PLATE_CARRIER_LESS";
    level.br_pickups.var_ec7422f11a61c100 = "MP/BR_EQUIP_DENY_BACKPACK_LESS";
    level.br_pickups.var_7bd397b2e9d8a434 = "MP/BR_EQUIP_DENY_PLATE_CARRIER_SAME";
    level.br_pickups.br_dropoffsets = [0:(24, 24, 6), 1:(-24, -24, 6), 2:(24, -24, 6), 3:(-24, 24, 6), 4:(48, 0, 6), 5:(-48, 0, 6), 6:(0, -48, 6), 7:(0, 48, 6), 8:(72, 0, 6), 9:(-72, 0, 6), 10:(0, -72, 6), 11:(0, 72, 6), 12:(72, -72, 6), 13:(-72, 72, 6), 14:(-72, -72, 6), 15:(72, 72, 6)];
    level.br_pickups.respawntokenenabled = getdvarint(@"hash_c9d9bc1bae348282", 1);
    level.br_pickups.respawntokenclosewithgulag = getdvarint(@"hash_8603626dc2ec647d", 1);
    level.br_pickups.var_a181de0ed6a505d5 = getdvarint(@"hash_fbd4a4c8aa273539", 1);
    level.br_pickups.var_174664c71517f679 = getdvarint(@"hash_410f6b398c585156", 1);
    level.br_pickups.var_5609de5240e42e84 = getdvarint(@"hash_2df02ec7e7efe5c9", 1);
    level.br_pickups.var_ad49a38dd7c4c10f = undefined;
    level.br_pickups.var_3b53bc0eee6ae84e = undefined;
    if (getdvarint(@"hash_249a73868c9cd7d8", 0)) {
        function_f8b204e807cc62ed();
        function_e6cabc9f20dcbc23();
    }
    if (br_weapons::function_b1dd9dcae2f63965()) {
        br_weapons::function_b9da718e50063452();
    }
    scriptable::scriptable_addusedcallback(&function_e40eec61ee9d0889);
    scriptable::scriptable_addautousecallback(&function_e40eec61ee9d0889);
    level.var_b8e67f48a1d47883 = &function_23d6a60ccfa90b00;
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3f91
// Size: 0x1128
function function_68c4db74396e7683() {
    index = 0;
    foreach (itemdef in level.var_970f64593dc93ff8) {
        itemtype = itemdef.type;
        if (!isdefined(itemtype)) {
            continue;
        }
        var_14004b68ddacb781 = itemdef.name;
        if (!isdefined(var_14004b68ddacb781)) {
            continue;
        }
        var_77432be198da78c6 = itemdef.var_77432be198da78c6;
        if (!isdefined(var_77432be198da78c6)) {
            var_77432be198da78c6 = 0;
        }
        level.br_pickups.var_d93566a78e29d583[var_14004b68ddacb781] = itemdef.value;
        level.br_pickups.maxcounts[var_14004b68ddacb781] = var_77432be198da78c6;
        level.br_pickups.br_hasautopickup[var_14004b68ddacb781] = itemdef.var_bb9e46e1d8130f2;
        level.br_pickups.br_itemrow[var_14004b68ddacb781] = index;
        index++;
        if (isdefined(itemdef.var_a38e261031751c09) && itemdef.var_a38e261031751c09 == 1) {
            level.br_pickups.var_b8fad1cfd41d21da[var_14004b68ddacb781] = itemdef.var_a38e261031751c09;
        } else {
            level.br_pickups.var_b8fad1cfd41d21da[var_14004b68ddacb781] = 0;
        }
        var_52e1d38987af61c3 = itemdef.var_52e1d38987af61c3;
        level.br_pickups.var_a5e4b146866d7fd[var_14004b68ddacb781] = isdefined(var_52e1d38987af61c3) && var_52e1d38987af61c3 != %"";
        if (itemtype != #"tablet") {
            var_d530bdb3d172e1cb = 0;
            var_d530bcb3d172df98 = 0;
            var_d530bfb3d172e631 = 0;
            if (isdefined(itemdef.originx)) {
                var_d530bdb3d172e1cb = itemdef.originx;
            }
            if (isdefined(itemdef.originy)) {
                var_d530bcb3d172df98 = itemdef.originy;
            }
            if (isdefined(itemdef.originz)) {
                var_d530bfb3d172e631 = itemdef.originz;
            }
            var_54eeaa80ba02a904 = 0;
            var_54eeab80ba02ab37 = 0;
            var_54eeac80ba02ad6a = 0;
            if (isdefined(itemdef.var_f768c961e563812a)) {
                var_54eeaa80ba02a904 = itemdef.var_f768c961e563812a;
            }
            if (isdefined(itemdef.var_f768ca61e563835d)) {
                var_54eeab80ba02ab37 = itemdef.var_f768ca61e563835d;
            }
            if (isdefined(itemdef.var_f768c761e5637cc4)) {
                var_54eeac80ba02ad6a = itemdef.var_f768c761e5637cc4;
            }
            level.br_pickups.var_52aac7e6e7072413[var_14004b68ddacb781] = (var_d530bdb3d172e1cb, var_d530bcb3d172df98, var_d530bfb3d172e631);
            level.br_pickups.rotationoffset[var_14004b68ddacb781] = (var_54eeaa80ba02a904, var_54eeab80ba02ab37, var_54eeac80ba02ad6a);
        }
        level.br_pickups.var_688c9b0a44e4a8ca[var_14004b68ddacb781] = isdefined(itemdef.var_128743b61c17f6b5) && itemdef.var_128743b61c17f6b5 == #"brightGold";
        lootid = itemdef.lootid;
        if (itemtype == #"weapon") {
            var_ae10c1b57593e13f = itemdef.rarity;
            pickupsound = itemdef.var_7c42466bc0339b10;
            if (isdefined(itemdef.baseweapon)) {
                level.var_fb8e78837bc5ee6c[var_14004b68ddacb781] = itemdef.baseweapon;
            }
            var_2b69ea4799c0a698 = itemdef.var_c893dd7dea73050b;
            if (isdefined(var_2b69ea4799c0a698) && var_2b69ea4799c0a698 != #"") {
                level.br_pickups.var_14bd11727c4b6629[var_14004b68ddacb781] = var_2b69ea4799c0a698;
                level.br_pickups.var_838863c4848d4c26[var_2b69ea4799c0a698] = var_14004b68ddacb781;
            }
            attachmentcount = undefined;
            if (isdefined(lootid) && lootid > 0) {
                var_4bb9768282d4260d = function_1cc3fd00b6ccc3ba(lootid);
                var_25152a36c536d7f = loot::function_793e8a72cedb8ef3(lootid);
                var_655be453564ea032 = weapon::getweaponvarianttablename(var_4bb9768282d4260d);
                if (getdvar(@"hash_9cc91f7c70752fa7", "1") == "1") {
                    variantid = 0;
                } else {
                    variantid = int(tablelookup(var_655be453564ea032, 1, var_25152a36c536d7f, 0));
                }
                var_e31692dcf0614ebc = itemdef.attachmentlist;
                attachmentlist = getscriptbundle(function_2ef675c13ca1c4af(%"hash_6ab26ee9c0dc2c2f", var_e31692dcf0614ebc));
                var_91bbf8d2294a656e = [];
                if (isdefined(attachmentlist)) {
                    foreach (data in attachmentlist.var_4f1703e5bf8c7fed) {
                        if (isdefined(data.attachmentid)) {
                            var_91bbf8d2294a656e[data.attachment] = data.attachmentid;
                        } else {
                            var_91bbf8d2294a656e[data.attachment] = 0;
                        }
                    }
                    attachmentcount = attachmentlist.var_4f1703e5bf8c7fed.size;
                }
                var_92fce7b1696254e3 = var_4bb9768282d4260d;
                camo = undefined;
                if (isdefined(itemdef.camo)) {
                    camo = itemdef.camo;
                }
                if (getdvarint(@"hash_ad67cf67992fe5f2", 0)) {
                    camo = "camo_11a";
                }
                fullweaponobj = undefined;
                if (!isdefined(var_91bbf8d2294a656e)) {
                    fullweaponobj = weapon::buildweapon_blueprint(var_4bb9768282d4260d, camo, undefined, variantid);
                } else {
                    fullweaponobj = weapon::buildweapon_attachmentidmap(var_4bb9768282d4260d, var_91bbf8d2294a656e, camo, undefined, variantid);
                }
                fullweaponname = getcompleteweaponname(fullweaponobj);
            } else {
                var_92fce7b1696254e3 = itemdef.baseweapon;
                var_e31692dcf0614ebc = itemdef.attachmentlist;
                attachmentlist = getscriptbundle(function_2ef675c13ca1c4af(%"hash_6ab26ee9c0dc2c2f", var_e31692dcf0614ebc));
                var_7ce98c8199be3d76 = [];
                if (isdefined(attachmentlist)) {
                    i = 0;
                    foreach (data in attachmentlist.var_4f1703e5bf8c7fed) {
                        if (isdefined(data.attachmentid)) {
                            var_7ce98c8199be3d76[i] = data.attachment + "|" + utility::string(data.attachmentid);
                        } else {
                            var_7ce98c8199be3d76[i] = data.attachment;
                        }
                        i++;
                    }
                }
                if (getdvarint(@"hash_ad67cf67992fe5f2", 0)) {
                    fullweaponobj = weapon::buildweapon(var_92fce7b1696254e3, var_7ce98c8199be3d76, "camo_11a", "none", -1);
                } else {
                    fullweaponobj = weapon::buildweapon(var_92fce7b1696254e3, var_7ce98c8199be3d76, "none", "none", -1);
                }
                fullweaponname = getcompleteweaponname(fullweaponobj);
                var_d7305e20a538a9a1 = loot::getLootIDFromRef(var_92fce7b1696254e3);
                if (isdefined(var_d7305e20a538a9a1)) {
                    var_bb255cc38c4aa89d = "" + var_d7305e20a538a9a1;
                }
            }
            rarity = itemdef.rarity;
            var_d0923526de8a11f = function_ec07a134a6ed91fd(rarity, var_14004b68ddacb781);
            if (var_d0923526de8a11f != -1) {
                level.br_pickups.br_itemrarity[var_14004b68ddacb781] = var_d0923526de8a11f;
                if (!isdefined(level.br_pickups.var_692e058f97bcc055[var_d0923526de8a11f])) {
                    level.br_pickups.var_692e058f97bcc055[var_d0923526de8a11f] = [];
                }
                level.br_pickups.var_692e058f97bcc055[var_d0923526de8a11f][level.br_pickups.var_692e058f97bcc055[var_d0923526de8a11f].size] = var_14004b68ddacb781;
            }
            level.br_pickups.br_itemtype[var_14004b68ddacb781] = itemtype;
            level.br_pickups.br_pickupsfx[var_14004b68ddacb781] = pickupsound;
            level.br_pickups.br_lootguns[level.br_pickups.br_lootguns.size] = var_14004b68ddacb781;
            level.br_lootiteminfo[var_14004b68ddacb781] = spawnstruct();
            level.br_lootiteminfo[var_14004b68ddacb781].baseweapon = var_92fce7b1696254e3;
            level.br_lootiteminfo[var_14004b68ddacb781].fullweaponname = fullweaponname;
            level.br_lootiteminfo[var_14004b68ddacb781].fullweaponobj = fullweaponobj;
            if (isdefined(attachmentcount)) {
                level.br_lootiteminfo[var_14004b68ddacb781].attachmentcount = attachmentcount;
            }
            if (isdefined(var_d0923526de8a11f)) {
                if (var_d0923526de8a11f != 10) {
                    level.br_pickups.br_weapontoscriptable[fullweaponname] = var_14004b68ddacb781;
                    level.br_pickups.var_7b2bff2d04ee1017[var_14004b68ddacb781] = lootid;
                    level.br_pickups.var_b13dc7e63676bbe7[lootid] = var_14004b68ddacb781;
                }
            }
            gametype = game_utility::getsubgametype();
            var_dbd4af6757751f2c = function_2ef675c13ca1c4af(#"no", gametype);
            var_b2bff4a8914c83ba = level.var_ca63cdc28149e3b5[itemdef.name];
            if (isdefined(var_b2bff4a8914c83ba) && isdefined(var_dbd4af6757751f2c)) {
                var_c73607c288ad6f7c = function_6a36b14e6b79459(function_2ef675c13ca1c4af(%"loot_item_def:", var_b2bff4a8914c83ba), var_dbd4af6757751f2c);
                if (isdefined(var_c73607c288ad6f7c) && var_c73607c288ad6f7c == 0 || !isdefined(var_c73607c288ad6f7c)) {
                    if (isdefined(itemdef.var_3acc975374e0a045) && itemdef.var_3acc975374e0a045 != "") {
                        level.br_pickups.var_9e78b5ee377070a9[fullweaponname] = var_14004b68ddacb781;
                    }
                }
            }
        } else {
            equipname = itemdef.baseweapon;
            if (isdefined(equipname) && equipname != "") {
                level.br_pickups.br_equipname[var_14004b68ddacb781] = equipname;
                level.br_pickups.br_equipnametoscriptable[equipname] = var_14004b68ddacb781;
                if (itemtype == #"lethal" || itemtype == #"tactical") {
                    level.var_fb8e78837bc5ee6c[var_14004b68ddacb781] = equipname;
                }
            }
            var_54e2cc4157b862bd = itemdef.var_500dce1375d7c40d;
            if (isdefined(var_54e2cc4157b862bd) && var_54e2cc4157b862bd != #"none") {
                if (var_54e2cc4157b862bd == #"lethal") {
                    if (isdefined(equipname) && equipname != "" && isdefined(level.equipment.table[equipname])) {
                        level.equipment.table[equipname].defaultslot = "primary";
                    }
                    level.br_throwables[level.br_throwables.size] = var_14004b68ddacb781;
                } else if (var_54e2cc4157b862bd == #"tactical") {
                    if (isdefined(equipname) && equipname != "" && isdefined(level.equipment.table[equipname])) {
                        level.equipment.table[equipname].defaultslot = "secondary";
                    }
                    level.br_usables[level.br_usables.size] = var_14004b68ddacb781;
                } else if (var_54e2cc4157b862bd == #"heal") {
                    if (isdefined(equipname) && equipname != "" && isdefined(level.equipment.table[equipname])) {
                        level.equipment.table[equipname].defaultslot = "health";
                    }
                } else if (var_54e2cc4157b862bd == #"super") {
                    if (isdefined(equipname) && equipname != "" && isdefined(level.equipment.table[equipname])) {
                        level.equipment.table[equipname].defaultslot = "super";
                    }
                } else {
                    /#
                        assertmsg("Unhandled brSlotOverride type for " + function_3c8848a3a11b2553(var_14004b68ddacb781) + "
");
                    #/
                }
            }
            var_2b69ea4799c0a698 = itemdef.var_c893dd7dea73050b;
            if (isdefined(var_2b69ea4799c0a698) && var_2b69ea4799c0a698 != "") {
                level.br_pickups.var_14bd11727c4b6629[var_14004b68ddacb781] = var_2b69ea4799c0a698;
                level.br_pickups.var_838863c4848d4c26[var_2b69ea4799c0a698] = var_14004b68ddacb781;
            }
            if (itemtype == #"killstreak" || itemtype == #"killstreak_nodrop") {
                level.br_pickups.br_killstreakreference[var_14004b68ddacb781] = var_2b69ea4799c0a698;
                level.br_pickups.br_killstreaktoscriptable[var_2b69ea4799c0a698] = var_14004b68ddacb781;
            } else if (itemtype == #"super" || itemtype == #"super_nodrop") {
                level.br_pickups.br_superreference[var_14004b68ddacb781] = var_2b69ea4799c0a698;
            } else if (itemtype == #"lethal" || itemtype == #"lethal_nodrop") {
                level.br_pickups.var_1e6c5e03170cf425[level.br_pickups.var_1e6c5e03170cf425.size] = var_14004b68ddacb781;
            } else if (itemtype == #"tactical" || itemtype == #"tactical_nodrop") {
                level.br_pickups.var_eb7725a8a6f2c64c[level.br_pickups.var_eb7725a8a6f2c64c.size] = var_14004b68ddacb781;
            } else if (itemtype == #"perk" || itemtype == #"perk_nodrop") {
                level.br_pickups.br_perks[level.br_pickups.br_perks.size] = var_14004b68ddacb781;
            }
            var_51426ae160732e49 = 0;
            if (isdefined(itemdef.var_bc409982f535cde2)) {
                var_51426ae160732e49 = itemdef.var_bc409982f535cde2;
            }
            var_77432be198da78c6 = 0;
            if (isdefined(itemdef.var_77432be198da78c6)) {
                var_77432be198da78c6 = itemdef.var_77432be198da78c6;
            }
            var_10a92702735eff08 = 0;
            if (isdefined(itemdef.var_4138f9ddc1cd22d)) {
                var_10a92702735eff08 = itemdef.var_4138f9ddc1cd22d;
            }
            if (itemtype == #"ammo") {
                if (!isdefined(level.br_ammo_max)) {
                    br_weapons::br_ammo_init();
                }
                level.br_ammo_max[var_14004b68ddacb781] = var_77432be198da78c6;
            }
            level.br_pickups.stackable[var_14004b68ddacb781] = var_77432be198da78c6 > 1;
            level.br_pickups.counts[var_14004b68ddacb781] = var_51426ae160732e49;
            level.br_pickups.var_4138f9ddc1cd22d[var_14004b68ddacb781] = var_10a92702735eff08;
            level.br_pickups.br_itemtype[var_14004b68ddacb781] = itemtype;
            level.br_pickups.br_pickupsfx[var_14004b68ddacb781] = itemdef.var_7c42466bc0339b10;
            var_d0923526de8a11f = function_ec07a134a6ed91fd(itemdef.rarity, var_14004b68ddacb781);
            if (var_d0923526de8a11f != -1) {
                level.br_pickups.br_itemrarity[var_14004b68ddacb781] = var_d0923526de8a11f;
            }
            if (isdefined(lootid) && lootid > 0) {
                level.br_pickups.var_7b2bff2d04ee1017[var_14004b68ddacb781] = lootid;
                level.br_pickups.var_b13dc7e63676bbe7[lootid] = var_14004b68ddacb781;
            }
            if (itemtype == #"breakable_tool") {
                var_c44b0165a7b9c8b4 = 1;
                level.var_f2b443c644970bd7[var_14004b68ddacb781] = var_c44b0165a7b9c8b4;
            }
        }
        level.br_pickups.var_c4b4b56c76765330[var_14004b68ddacb781] = itemdef.nospawn;
        if (isdefined(lootid) && lootid > 0 && isdefined(itemdef.var_832ad168567520f7)) {
            level.br_pickups.var_832ad168567520f7[lootid] = itemdef.var_832ad168567520f7;
        }
        if (isdefined(itemdef.var_832ad168567520f7)) {
            level.br_pickups.var_59e01317f76cf924[var_14004b68ddacb781] = itemdef.var_832ad168567520f7;
        }
        if (isdefined(itemdef.var_caf82339100de589)) {
            level.br_pickups.var_caf82339100de589[var_14004b68ddacb781] = itemdef.var_caf82339100de589;
        }
    }
    function_2d397216d0fc2167();
    level.var_970f64593dc93ff8 = undefined;
    level.var_ca63cdc28149e3b5 = undefined;
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x50c0
// Size: 0x7fc
function function_2d397216d0fc2167() {
    foreach (scriptablename, itemtype in level.br_pickups.br_itemtype) {
        switch (itemtype) {
        case #"trader":
            level.br_pickups.var_2d9176b507230cab[scriptablename] = "trader";
            break;
        case #"cache":
            level.br_pickups.var_2d9176b507230cab[scriptablename] = "cache";
            break;
        case #"plea":
            level.br_pickups.var_2d9176b507230cab[scriptablename] = "plea";
            break;
        case #"kiosk":
            level.br_pickups.var_2d9176b507230cab[scriptablename] = "kiosk";
            break;
        case #"questsafe":
            level.br_pickups.var_2d9176b507230cab[scriptablename] = "questsafe";
            break;
        case #"keycard":
            level.br_pickups.var_2d9176b507230cab[scriptablename] = "keycard";
            break;
        case #"activitystarter":
            level.br_pickups.var_2d9176b507230cab[scriptablename] = "activitystarter";
            break;
        case #"ammo":
            level.br_pickups.var_2d9176b507230cab[scriptablename] = "ammo";
            break;
        case #"health":
            level.br_pickups.var_2d9176b507230cab[scriptablename] = "health";
            break;
        case #"tablet":
            level.br_pickups.var_2d9176b507230cab[scriptablename] = "tablet";
            break;
        case #"attachment":
            level.br_pickups.var_2d9176b507230cab[scriptablename] = "attachment";
            break;
        case #"container":
            level.br_pickups.var_2d9176b507230cab[scriptablename] = "container";
            break;
        case #"gear":
            level.br_pickups.var_2d9176b507230cab[scriptablename] = "gear";
            break;
        case #"super":
            level.br_pickups.var_2d9176b507230cab[scriptablename] = "super";
            break;
        case #"valuable":
            level.br_pickups.var_8bc2150d96509171[scriptablename] = "valuable";
            break;
        case #"radio":
            level.br_pickups.var_2d9176b507230cab[scriptablename] = "radio";
            break;
        case #"disguise":
            level.br_pickups.var_2d9176b507230cab[scriptablename] = "disguise";
            break;
        case #"dogtag":
            level.br_pickups.var_2d9176b507230cab[scriptablename] = "dogtag";
            break;
        case #"note":
            level.br_pickups.var_2d9176b507230cab[scriptablename] = "note";
            break;
        case #"mission":
            level.br_pickups.var_2d9176b507230cab[scriptablename] = "mission";
            break;
        case #"extractable":
            level.br_pickups.var_2d9176b507230cab[scriptablename] = "extractable";
            break;
        case #"elite_arrow":
            level.br_pickups.var_2d9176b507230cab[scriptablename] = "elite_arrow";
            break;
        case #"exfil":
            level.br_pickups.var_2d9176b507230cab[scriptablename] = "exfil";
            break;
        case #"gascan":
            level.br_pickups.var_2d9176b507230cab[scriptablename] = "gascan";
            break;
        case #"token":
            level.br_pickups.var_2d9176b507230cab[scriptablename] = "token";
            break;
        case #"tactical":
            level.br_pickups.var_2d9176b507230cab[scriptablename] = "tactical";
            break;
        case #"key":
            level.br_pickups.var_2d9176b507230cab[scriptablename] = "key";
            break;
        case #"killstreak":
            level.br_pickups.var_2d9176b507230cab[scriptablename] = "killstreak";
            break;
        case #"nvg":
            level.br_pickups.var_2d9176b507230cab[scriptablename] = "nvg";
            break;
        case #"lethal":
            level.br_pickups.var_2d9176b507230cab[scriptablename] = "lethal";
            break;
        case #"perk":
            level.br_pickups.var_2d9176b507230cab[scriptablename] = "perk";
            break;
        case #"helmet":
            level.br_pickups.var_2d9176b507230cab[scriptablename] = "helmet";
            break;
        case #"PerkPack":
            level.br_pickups.var_2d9176b507230cab[scriptablename] = "perkpack";
            break;
        case #"personal":
            level.br_pickups.var_2d9176b507230cab[scriptablename] = "personal";
            break;
        case #"plate_carrier":
            level.br_pickups.var_2d9176b507230cab[scriptablename] = "plate_carrier";
            break;
        case #"nodrop":
            level.br_pickups.var_2d9176b507230cab[scriptablename] = "nodrop";
            break;
        case #"plunder":
            level.br_pickups.var_2d9176b507230cab[scriptablename] = "plunder";
            break;
        case #"trophy":
            level.br_pickups.var_2d9176b507230cab[scriptablename] = "trophy";
            break;
        case #"revive":
            level.br_pickups.var_2d9176b507230cab[scriptablename] = "revive";
            break;
        case #"voucher":
            level.br_pickups.var_2d9176b507230cab[scriptablename] = "voucher";
            break;
        case #"weapon":
            level.br_pickups.var_2d9176b507230cab[scriptablename] = "weapon";
            break;
        case #"weaponCase":
            level.br_pickups.var_2d9176b507230cab[scriptablename] = "weaponCase";
            break;
        case #"xp":
            level.br_pickups.var_2d9176b507230cab[scriptablename] = "xp";
            break;
        case #"restock":
            level.br_pickups.var_2d9176b507230cab[scriptablename] = "restock";
            break;
        case #"gametype_item":
            level.br_pickups.var_2d9176b507230cab[scriptablename] = "gametype_item";
            break;
        default:
            /#
                println("MP/CANNOT_USE_GAS_CAN" + function_3c8848a3a11b2553(scriptablename) + "super" + function_3c8848a3a11b2553(itemtype) + "gascan");
            #/
            break;
        }
    }
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x58c3
// Size: 0x128
function function_ec07a134a6ed91fd(rarity, var_14004b68ddacb781) {
    var_d0923526de8a11f = -1;
    if (isdefined(rarity)) {
        if (rarity == #"common") {
            var_d0923526de8a11f = 0;
        } else if (rarity == #"uncommon") {
            var_d0923526de8a11f = 1;
        } else if (rarity == #"rare") {
            var_d0923526de8a11f = 2;
        } else if (rarity == #"epic") {
            var_d0923526de8a11f = 3;
        } else if (rarity == #"legendary") {
            var_d0923526de8a11f = 4;
        } else if (rarity == #"ultra") {
            var_d0923526de8a11f = 5;
        } else if (rarity == #"hash_6883e8a817e0fafb") {
            var_d0923526de8a11f = 10;
        } else if (rarity == #"hash_5e6d080aa056ca7e") {
            var_d0923526de8a11f = 11;
        } else if (rarity == #"hash_c5d97e08120826fe") {
            var_d0923526de8a11f = 12;
        } else if (rarity == #"hash_431ea4149a88aa2f") {
            var_d0923526de8a11f = 13;
        } else if (rarity == #"hash_46b771597c49ebd4") {
            var_d0923526de8a11f = 14;
        } else {
            /#
                println("tactical" + function_3c8848a3a11b2553(var_14004b68ddacb781) + "gascan");
            #/
        }
    }
    return var_d0923526de8a11f;
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x59f3
// Size: 0x1553
function function_e5528af9b712723f() {
    level.brloottablename = getdvar(@"hash_e38e16d9fbf3fc43", "mp/loot/br/default/loot_item_defs.csv");
    if (level.brloottablename == "") {
        level.brloottablename = "mp/loot/br/default/loot_item_defs.csv";
    }
    level.var_6178ce645aeeb787 = getdvar(@"hash_496705f4c6403e66", "mp/loot/br/default/loot_table_zones.csv");
    if (level.var_6178ce645aeeb787 == "") {
        level.var_6178ce645aeeb787 = "mp/loot/br/default/loot_table_zones.csv";
        setdvar(@"hash_add02e4fff48882f", level.var_6178ce645aeeb787);
    }
    var_6a537ee3949585f4 = [];
    var_5c845b7a0ef0780f = 0;
    var_55dff3c24d1396c9 = "+";
    var_4236bee99ba1d49b = tablelookupgetnumrows(level.brloottablename);
    for (row = 0; row < var_4236bee99ba1d49b; row++) {
        key = tablelookupbyrow(level.brloottablename, row, 0);
        if (!isdefined(key)) {
            continue;
        }
        if (key == "item") {
            itemtype = tablelookupbyrow(level.brloottablename, row, 2);
            if (!isdefined(itemtype)) {
                continue;
            }
            var_14004b68ddacb781 = tablelookupbyrow(level.brloottablename, row, 1);
            itemvalue = tablelookupbyrow(level.brloottablename, row, 7);
            level.br_pickups.var_d93566a78e29d583[var_14004b68ddacb781] = int(itemvalue);
            var_bb255cc38c4aa89d = tablelookupbyrow(level.brloottablename, row, 5);
            var_2ad07b9c3adc39e3 = int(tablelookupbyrow(level.brloottablename, row, 17));
            level.br_pickups.maxcounts[var_14004b68ddacb781] = var_2ad07b9c3adc39e3;
            level.br_pickups.br_hasautopickup[var_14004b68ddacb781] = int(tablelookupbyrow(level.brloottablename, row, 20));
            level.br_pickups.br_itemrow[var_14004b68ddacb781] = int(row);
            var_a38e261031751c09 = tablelookupbyrow(level.brloottablename, row, 33);
            if (var_a38e261031751c09 != "") {
                level.br_pickups.var_b8fad1cfd41d21da[var_14004b68ddacb781] = int(var_a38e261031751c09);
            }
            var_52e1d38987af61c3 = tablelookupbyrow(level.brloottablename, row, 34);
            level.br_pickups.var_a5e4b146866d7fd[var_14004b68ddacb781] = isdefined(var_52e1d38987af61c3) && var_52e1d38987af61c3 != "";
            var_5a56fe331235854a = tablelookupbyrow(level.brloottablename, row, 32);
            level.br_pickups.var_4183295edcc21db0[var_14004b68ddacb781] = isdefined(var_5a56fe331235854a) && var_5a56fe331235854a != "";
            if (itemtype != "tablet") {
                var_d530bdb3d172e1cb = float(tablelookupbyrow(level.brloottablename, row, 21));
                var_d530bcb3d172df98 = float(tablelookupbyrow(level.brloottablename, row, 22));
                var_d530bfb3d172e631 = float(tablelookupbyrow(level.brloottablename, row, 23));
                var_54eeaa80ba02a904 = float(tablelookupbyrow(level.brloottablename, row, 24));
                var_54eeab80ba02ab37 = float(tablelookupbyrow(level.brloottablename, row, 25));
                var_54eeac80ba02ad6a = float(tablelookupbyrow(level.brloottablename, row, 26));
                level.br_pickups.var_52aac7e6e7072413[var_14004b68ddacb781] = (var_d530bdb3d172e1cb, var_d530bcb3d172df98, var_d530bfb3d172e631);
                level.br_pickups.rotationoffset[var_14004b68ddacb781] = (var_54eeaa80ba02a904, var_54eeab80ba02ab37, var_54eeac80ba02ad6a);
            }
            level.br_pickups.var_688c9b0a44e4a8ca[var_14004b68ddacb781] = tablelookupbyrow(level.brloottablename, row, 28) == "brightGold";
            if (itemtype == "weapon") {
                var_ae10c1b57593e13f = tablelookupbyrow(level.brloottablename, row, 3);
                pickupsound = tablelookupbyrow(level.brloottablename, row, 14);
                var_2b69ea4799c0a698 = tablelookupbyrow(level.brloottablename, row, 18);
                if (isdefined(var_2b69ea4799c0a698) && var_2b69ea4799c0a698 != "") {
                    level.br_pickups.var_14bd11727c4b6629[var_14004b68ddacb781] = var_2b69ea4799c0a698;
                    level.br_pickups.var_838863c4848d4c26[var_2b69ea4799c0a698] = var_14004b68ddacb781;
                }
                if (isdefined(var_bb255cc38c4aa89d) && var_bb255cc38c4aa89d.size > 0) {
                    lootid = int(var_bb255cc38c4aa89d);
                    var_4bb9768282d4260d = function_1cc3fd00b6ccc3ba(lootid);
                    var_25152a36c536d7f = loot::function_793e8a72cedb8ef3(lootid);
                    var_655be453564ea032 = weapon::getweaponvarianttablename(var_4bb9768282d4260d);
                    if (getdvar(@"hash_9cc91f7c70752fa7", "1") == "1") {
                        var_4bb9768282d4260d = tablelookupbyrow(level.brloottablename, row, 8);
                        variantid = 0;
                    } else {
                        variantid = int(tablelookup(var_655be453564ea032, 1, var_25152a36c536d7f, 0));
                    }
                    var_fc5b5cabb888a488 = tablelookupbyrow(level.brloottablename, row, 9);
                    var_7ce98c8199be3d76 = [];
                    var_91bbf8d2294a656e = [];
                    if (isdefined(var_fc5b5cabb888a488) && var_fc5b5cabb888a488.size) {
                        var_7ce98c8199be3d76 = strtok(var_fc5b5cabb888a488, var_55dff3c24d1396c9);
                    }
                    if (isdefined(var_7ce98c8199be3d76)) {
                        foreach (attach in var_7ce98c8199be3d76) {
                            array = strtok(attach, "|");
                            if (array.size > 1) {
                                var_91bbf8d2294a656e[array[0]] = int(array[1]);
                            } else {
                                var_91bbf8d2294a656e[array[0]] = 0;
                            }
                        }
                    }
                    var_92fce7b1696254e3 = var_4bb9768282d4260d;
                    camo = undefined;
                    fullweaponname = tablelookupbyrow(level.brloottablename, row, 10);
                    parts = strtok(fullweaponname, "+");
                    foreach (part in parts) {
                        if (getsubstr(part, 0, 4) == "camo") {
                            camo = strtok(part, "|")[1];
                        }
                    }
                    if (getdvarint(@"hash_ad67cf67992fe5f2", 0)) {
                        camo = "camo_11a";
                    }
                    fullweaponobj = undefined;
                    if (!isdefined(var_91bbf8d2294a656e)) {
                        fullweaponobj = weapon::buildweapon_blueprint(var_4bb9768282d4260d, camo, undefined, variantid);
                    } else {
                        fullweaponobj = weapon::buildweapon_attachmentidmap(var_4bb9768282d4260d, var_91bbf8d2294a656e, camo, undefined, variantid);
                    }
                    fullweaponname = getcompleteweaponname(fullweaponobj);
                    if (getdvar(@"hash_9cc91f7c70752fa7", "1") != "1") {
                        /#
                            var_1306ad638cedc772 = "gulag";
                            titlestring = tablelookupbyrow(level.brloottablename, row, 11);
                            var_4c270e785098f51d = tablelookup(var_655be453564ea032, 1, var_25152a36c536d7f, 17);
                            icon = weapon::function_b8811a0fc04e4b9d(var_4bb9768282d4260d, #"image", "inheritDepends");
                            var_c452677d1f8f2714 = weapon::weaponattachcustomtoidmap(var_4bb9768282d4260d, variantid);
                            var_2e0d182449ebc56e = weapon::weaponattachdefaulttoidmap(var_4bb9768282d4260d, variantid);
                            var_fc5b5cabb888a488 = "inheritDepends";
                            if (isdefined(var_c452677d1f8f2714)) {
                                foreach (key, aid in var_c452677d1f8f2714) {
                                    if (isdefined(var_2e0d182449ebc56e) && isdefined(var_2e0d182449ebc56e[key])) {
                                        continue;
                                    }
                                    if (var_fc5b5cabb888a488 != "inheritDepends") {
                                        var_fc5b5cabb888a488 = var_fc5b5cabb888a488 + var_55dff3c24d1396c9;
                                    }
                                    var_fc5b5cabb888a488 = var_fc5b5cabb888a488 + key;
                                }
                            }
                            var_6a537ee3949585f4[var_6a537ee3949585f4.size] = weapon::function_13aeabbe4210eadc(var_14004b68ddacb781, var_1306ad638cedc772, lootid, var_92fce7b1696254e3, var_fc5b5cabb888a488, fullweaponname, titlestring, var_4c270e785098f51d, icon, pickupsound);
                            var_287363cd98ae15a8 = tablelookupbyrow(level.brloottablename, row, 8);
                            var_361a437d788f1ff4 = tablelookupbyrow(level.brloottablename, row, 11);
                            var_2278b4e29d8c7ddd = tablelookupbyrow(level.brloottablename, row, 13);
                            if (var_ae10c1b57593e13f != var_1306ad638cedc772) {
                                var_5c845b7a0ef0780f = 1;
                            }
                            if (var_287363cd98ae15a8 != var_92fce7b1696254e3) {
                                println("mp/automatism/weapon_class_groups_for_auto_grab.csv" + var_14004b68ddacb781 + "disconnect" + var_287363cd98ae15a8 + "ui_perk_package_state" + var_92fce7b1696254e3 + "br_loot");
                                var_5c845b7a0ef0780f = 1;
                            }
                            if (var_361a437d788f1ff4 != fullweaponname) {
                                println("closed_usable" + var_14004b68ddacb781 + "disconnect" + var_361a437d788f1ff4 + "ui_perk_package_state" + fullweaponname + "br_loot");
                                var_5c845b7a0ef0780f = 1;
                            }
                            if (var_2278b4e29d8c7ddd != icon) {
                                println("iw8_ges_plyr_gasmask_on" + var_14004b68ddacb781 + "disconnect" + var_2278b4e29d8c7ddd + "ui_perk_package_state" + icon + "br_loot");
                                var_5c845b7a0ef0780f = 1;
                            }
                        #/
                    }
                } else {
                    var_92fce7b1696254e3 = tablelookupbyrow(level.brloottablename, row, 8);
                    var_fc5b5cabb888a488 = tablelookupbyrow(level.brloottablename, row, 9);
                    var_7ce98c8199be3d76 = [];
                    if (isdefined(var_fc5b5cabb888a488) && var_fc5b5cabb888a488.size) {
                        var_7ce98c8199be3d76 = strtok(var_fc5b5cabb888a488, var_55dff3c24d1396c9);
                    }
                    if (getdvarint(@"hash_ad67cf67992fe5f2", 0)) {
                        fullweaponobj = weapon::buildweapon(var_92fce7b1696254e3, var_7ce98c8199be3d76, "camo_11a", "none", -1);
                    } else {
                        fullweaponobj = weapon::buildweapon(var_92fce7b1696254e3, var_7ce98c8199be3d76, "none", "none", -1);
                    }
                    fullweaponname = getcompleteweaponname(fullweaponobj);
                    var_d7305e20a538a9a1 = loot::getLootIDFromRef(var_92fce7b1696254e3);
                    if (isdefined(var_d7305e20a538a9a1)) {
                        var_bb255cc38c4aa89d = "" + var_d7305e20a538a9a1;
                    }
                    /#
                        if (int(var_ae10c1b57593e13f) != 10) {
                            titlestring = tablelookupbyrow(level.brloottablename, row, 11);
                            icon = tablelookupbyrow(level.brloottablename, row, 13);
                            var_6a537ee3949585f4[var_6a537ee3949585f4.size] = weapon::function_13aeabbe4210eadc(var_14004b68ddacb781, var_ae10c1b57593e13f, "inheritDepends", var_92fce7b1696254e3, var_fc5b5cabb888a488, fullweaponname, titlestring, "inheritDepends", icon, pickupsound);
                            var_361a437d788f1ff4 = tablelookupbyrow(level.brloottablename, row, 10);
                            if (var_361a437d788f1ff4 != fullweaponname) {
                                println("closed_usable" + var_14004b68ddacb781 + "disconnect" + var_361a437d788f1ff4 + "ui_perk_package_state" + fullweaponname + "br_loot");
                            }
                        }
                    #/
                }
                var_d0923526de8a11f = int(var_ae10c1b57593e13f);
                level.br_pickups.br_itemtype[var_14004b68ddacb781] = function_1823ff50bb28148d(itemtype);
                level.br_pickups.br_pickupsfx[var_14004b68ddacb781] = function_1823ff50bb28148d(pickupsound);
                level.br_pickups.br_itemrarity[var_14004b68ddacb781] = var_d0923526de8a11f;
                level.br_pickups.br_lootguns[level.br_pickups.br_lootguns.size] = var_14004b68ddacb781;
                if (!isdefined(level.br_pickups.var_692e058f97bcc055[var_d0923526de8a11f])) {
                    level.br_pickups.var_692e058f97bcc055[var_d0923526de8a11f] = [];
                }
                level.br_pickups.var_692e058f97bcc055[var_d0923526de8a11f][level.br_pickups.var_692e058f97bcc055[var_d0923526de8a11f].size] = var_14004b68ddacb781;
                level.br_lootiteminfo[var_14004b68ddacb781] = spawnstruct();
                level.br_lootiteminfo[var_14004b68ddacb781].baseweapon = var_92fce7b1696254e3;
                level.br_lootiteminfo[var_14004b68ddacb781].fullweaponname = fullweaponname;
                level.br_lootiteminfo[var_14004b68ddacb781].fullweaponobj = fullweaponobj;
                if (var_d0923526de8a11f != 10) {
                    level.br_pickups.br_weapontoscriptable[fullweaponname] = var_14004b68ddacb781;
                    level.br_pickups.var_7b2bff2d04ee1017[var_14004b68ddacb781] = int(var_bb255cc38c4aa89d);
                    level.br_pickups.var_b13dc7e63676bbe7[int(var_bb255cc38c4aa89d)] = var_14004b68ddacb781;
                }
                if (function_d9da779938ebcd86(row)) {
                    level.br_pickups.var_9e78b5ee377070a9[fullweaponname] = var_14004b68ddacb781;
                }
            } else {
                equipname = tablelookupbyrow(level.brloottablename, row, 8);
                if (isdefined(equipname) && equipname.size > 0) {
                    equipname = tolower(equipname);
                    level.br_pickups.br_equipname[var_14004b68ddacb781] = equipname;
                    level.br_pickups.br_equipnametoscriptable[equipname] = var_14004b68ddacb781;
                }
                var_54e2cc4157b862bd = tablelookupbyrow(level.brloottablename, row, 15);
                if (var_54e2cc4157b862bd != "") {
                    switch (var_54e2cc4157b862bd) {
                    case #"hash_31100fbc01bd387c":
                        if (isdefined(equipname) && equipname.size > 0 && isdefined(level.equipment.table[equipname])) {
                            level.equipment.table[equipname].defaultslot = "primary";
                        }
                        level.br_throwables[level.br_throwables.size] = var_14004b68ddacb781;
                        break;
                    case #"hash_311012bc01bd3d35":
                        if (isdefined(equipname) && equipname.size > 0 && isdefined(level.equipment.table[equipname])) {
                            level.equipment.table[equipname].defaultslot = "secondary";
                        }
                        level.br_usables[level.br_usables.size] = var_14004b68ddacb781;
                        break;
                    case #"hash_311011bc01bd3ba2":
                        if (isdefined(equipname) && equipname.size > 0 && isdefined(level.equipment.table[equipname])) {
                            level.equipment.table[equipname].defaultslot = "health";
                        }
                        break;
                    case #"hash_31100cbc01bd33c3":
                        if (isdefined(equipname) && equipname.size > 0 && isdefined(level.equipment.table[equipname])) {
                            level.equipment.table[equipname].defaultslot = "super";
                        }
                        break;
                    default:
                        /#
                            assertmsg("Unhandled brSlotOverride type in loot table for " + var_14004b68ddacb781 + "
");
                        #/
                        break;
                    }
                }
                var_2b69ea4799c0a698 = tablelookupbyrow(level.brloottablename, row, 18);
                if (isdefined(var_2b69ea4799c0a698) && var_2b69ea4799c0a698 != "") {
                    level.br_pickups.var_14bd11727c4b6629[var_14004b68ddacb781] = var_2b69ea4799c0a698;
                    level.br_pickups.var_838863c4848d4c26[var_2b69ea4799c0a698] = var_14004b68ddacb781;
                }
                if (itemtype == "killstreak" || itemtype == "killstreak_nodrop") {
                    var_44861522c9f83848 = tablelookupbyrow(level.brloottablename, row, 18);
                    level.br_pickups.br_killstreakreference[var_14004b68ddacb781] = var_44861522c9f83848;
                    level.br_pickups.br_killstreaktoscriptable[var_44861522c9f83848] = var_14004b68ddacb781;
                } else if (itemtype == "super" || itemtype == "super_nodrop") {
                    var_9766fdfdc41069a5 = tablelookupbyrow(level.brloottablename, row, 18);
                    level.br_pickups.br_superreference[var_14004b68ddacb781] = var_9766fdfdc41069a5;
                } else if (itemtype == "lethal" || itemtype == "lethal_nodrop") {
                    level.br_pickups.var_1e6c5e03170cf425[level.br_pickups.var_1e6c5e03170cf425.size] = var_14004b68ddacb781;
                } else if (itemtype == "tactical" || itemtype == "tactical_nodrop") {
                    level.br_pickups.var_eb7725a8a6f2c64c[level.br_pickups.var_eb7725a8a6f2c64c.size] = var_14004b68ddacb781;
                } else if (itemtype == "perk" || itemtype == "perk_nodrop") {
                    level.br_pickups.br_perks[level.br_pickups.br_perks.size] = var_14004b68ddacb781;
                }
                var_51426ae160732e49 = int(tablelookupbyrow(level.brloottablename, row, 4));
                var_10a92702735eff08 = int(tablelookupbyrow(level.brloottablename, row, 27));
                if (itemtype == "ammo") {
                    if (!isdefined(level.br_ammo_max)) {
                        br_weapons::br_ammo_init();
                    }
                    level.br_ammo_max[var_14004b68ddacb781] = var_2ad07b9c3adc39e3;
                }
                level.br_pickups.stackable[var_14004b68ddacb781] = var_2ad07b9c3adc39e3 > 1;
                level.br_pickups.counts[var_14004b68ddacb781] = var_51426ae160732e49;
                level.br_pickups.var_4138f9ddc1cd22d[var_14004b68ddacb781] = var_10a92702735eff08;
                itemtype = tolower(itemtype);
                level.br_pickups.br_itemtype[var_14004b68ddacb781] = function_1823ff50bb28148d(itemtype);
                level.br_pickups.br_pickupsfx[var_14004b68ddacb781] = function_1823ff50bb28148d(tablelookupbyrow(level.brloottablename, row, 14));
                var_a69fff5222862f26 = tablelookupbyrow(level.brloottablename, row, 3);
                level.br_pickups.br_itemrarity[var_14004b68ddacb781] = int(var_a69fff5222862f26);
                if (isdefined(var_bb255cc38c4aa89d) && var_bb255cc38c4aa89d != "") {
                    level.br_pickups.var_7b2bff2d04ee1017[var_14004b68ddacb781] = int(var_bb255cc38c4aa89d);
                    level.br_pickups.var_b13dc7e63676bbe7[int(var_bb255cc38c4aa89d)] = var_14004b68ddacb781;
                }
                if (itemtype == "breakable_tool") {
                    var_c44b0165a7b9c8b4 = 1;
                    level.var_f2b443c644970bd7[var_14004b68ddacb781] = var_c44b0165a7b9c8b4;
                }
            }
            tags = tablelookupbyrow(level.brloottablename, row, 6);
            tags = strtok(tags, "&");
            level.br_pickups.var_c4b4b56c76765330[var_14004b68ddacb781] = utility::array_contains(tags, "noSpawn");
        } else if (key == "crate") {
            var_14004b68ddacb781 = tablelookupbyrow(level.brloottablename, row, 1);
            var_6d4e1b034a6b8370 = int(tablelookupbyrow(level.brloottablename, row, 2));
            if (var_6d4e1b034a6b8370 > 0) {
                if (isdefined(level.br_lootiteminfo[var_14004b68ddacb781]) && isdefined(level.br_lootiteminfo[var_14004b68ddacb781].baseweapon)) {
                    for (i = 0; i < var_6d4e1b034a6b8370; i++) {
                        level.br_pickups.br_crateguns[level.br_pickups.br_crateguns.size] = var_14004b68ddacb781;
                        level.br_pickups.br_allguns[level.br_pickups.br_allguns.size] = var_14004b68ddacb781;
                    }
                } else {
                    for (i = 0; i < var_6d4e1b034a6b8370; i++) {
                        level.br_pickups.br_crateitems[level.br_pickups.br_crateitems.size] = var_14004b68ddacb781;
                    }
                }
            }
        } else if (key == "gulag") {
            var_14004b68ddacb781 = tablelookupbyrow(level.brloottablename, row, 1);
            var_7d9a5d01ce25e7a3 = tablelookupbyrow(level.brloottablename, row, 2);
            if (!isdefined(level.br_pickups.br_gulagpickups[var_7d9a5d01ce25e7a3])) {
                level.br_pickups.br_gulagpickups[var_7d9a5d01ce25e7a3] = [];
            }
            count = level.br_pickups.br_gulagpickups[var_7d9a5d01ce25e7a3].size;
            level.br_pickups.br_gulagpickups[var_7d9a5d01ce25e7a3][count] = var_14004b68ddacb781;
        } else if (!isdefined(level.br_pickups.var_11feb85e78e7cee8) && (key == "depends" || key == "inheritDepends")) {
            level.br_pickups.var_11feb85e78e7cee8 = row;
        }
    }
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6f4d
// Size: 0x8d
function function_f8b204e807cc62ed() {
    level.var_81369e82645391f0 = [];
    var_3c7f6558e5171cfc = getdvar(@"hash_dd0e2df8833b28d8", "mp/automatism/weapon_class_groups_for_auto_grab.csv");
    var_3cfaae92e4bb0d04 = tablelookupgetnumrows(var_3c7f6558e5171cfc);
    for (row = 0; row < var_3cfaae92e4bb0d04; row++) {
        weaponclass = tablelookupbyrow(var_3c7f6558e5171cfc, row, 0);
        groupindex = int(tablelookupbyrow(var_3c7f6558e5171cfc, row, 1));
        level.var_81369e82645391f0[weaponclass] = groupindex;
    }
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6fe1
// Size: 0x58
function function_e6cabc9f20dcbc23() {
    if (isdefined(level.br_standard_loadout)) {
        level.var_ea84a0518343879c["primary"] = function_78ad8eb4cc92f407(level.br_standard_loadout, "Primary");
        level.var_ea84a0518343879c["secondary"] = function_78ad8eb4cc92f407(level.br_standard_loadout, "Secondary");
    }
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7040
// Size: 0x128
function function_23a8498a6613de14() {
    level.var_f67907afe56c4f82 = [];
    if (istrue(level.usegulag)) {
        /#
            assert(isdefined(level.gulagloadouts));
        #/
        var_f070698d508b0818 = [];
        var_23182e0fd5672080 = getdvar(@"hash_d07965da1789dea1", "mp/automatism/initial_slot_after_gulag_base_weapons_table.csv");
        if (tableexists(var_23182e0fd5672080)) {
            var_9c304086ca408d8b = tablelookupgetnumrows(var_23182e0fd5672080);
            for (row = 0; row < var_9c304086ca408d8b; row++) {
                var_92fce7b1696254e3 = tablelookupbyrow(var_23182e0fd5672080, row, 0);
                var_f070698d508b0818[row] = var_92fce7b1696254e3;
            }
            count = level.gulagloadouts.size;
            for (index = 0; index < count; index++) {
                var_bc095883aece1a82 = function_78ad8eb4cc92f407(level.gulagloadouts[index], "Primary");
                var_cc63cd9ec88314c2 = function_78ad8eb4cc92f407(level.gulagloadouts[index], "Secondary");
                function_5d9ef63de8747c32(var_bc095883aece1a82, var_f070698d508b0818);
                function_5d9ef63de8747c32(var_cc63cd9ec88314c2, var_f070698d508b0818);
            }
        }
    }
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x716f
// Size: 0x84
function function_d9da779938ebcd86(row) {
    var_8677e2501bd28313 = tablelookupbyrow(level.brloottablename, row, 10);
    if (!isdefined(var_8677e2501bd28313) || var_8677e2501bd28313 == "") {
        return 0;
    }
    tags = tablelookupbyrow(level.brloottablename, row, 6);
    tags = strtok(tags, "&");
    gametype = getsubgametype();
    return !array_contains(tags, "no" + gametype);
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x71fb
// Size: 0xe7
function function_32a0394cf13c8b29() {
    var_bb4c023dc74082df = "lootvalueoverride:" + getdvar(@"hash_7feb156ccfaf8ddf", "");
    bundle = getscriptbundle(function_40fd49171fad19d3(var_bb4c023dc74082df));
    if (!isdefined(bundle)) {
        return;
    }
    foreach (var_345386aa7c1afe54 in bundle.var_2eaf4feeef5cefc5) {
        ref = var_345386aa7c1afe54.var_cb325ddb4a764623;
        if (isdefined(level.br_pickups.var_d93566a78e29d583[ref])) {
            level.br_pickups.var_d93566a78e29d583[ref] = int(var_345386aa7c1afe54.var_17b73aa1820974ee);
        }
    }
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x72e9
// Size: 0x77
function function_5d9ef63de8747c32(weaponobj, var_f070698d508b0818) {
    var_92fce7b1696254e3 = weapon::getweaponrootname(weaponobj);
    count = var_f070698d508b0818.size;
    for (index = 0; index < count; index++) {
        if (var_f070698d508b0818[index] == var_92fce7b1696254e3 && !function_2166628459c78e7a(weaponobj)) {
            level.var_f67907afe56c4f82[level.var_f67907afe56c4f82.size] = weaponobj;
            break;
        }
    }
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7367
// Size: 0x5f
function function_2166628459c78e7a(weaponobj) {
    hasweapon = 0;
    count = level.var_f67907afe56c4f82.size;
    for (index = 0; !hasweapon && index < count; index++) {
        hasweapon = issameweapon(level.var_f67907afe56c4f82[index], weaponobj);
    }
    return hasweapon;
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x73ce
// Size: 0x10e
function function_78ad8eb4cc92f407(loadout, var_e38b4e99059a1f48) {
    maxattachments = 0;
    if (var_e38b4e99059a1f48 == "Primary") {
        maxattachments = 7;
    } else if (var_e38b4e99059a1f48 == "Secondary") {
        maxattachments = 7;
    } else {
        /#
            assertmsg("Invalid slot " + var_e38b4e99059a1f48 + " in buildWeaponStandardLoadoutBySlot
");
        #/
    }
    var_48743aab19552fd = "loadout" + var_e38b4e99059a1f48;
    weaponattachments = [];
    var_e7cc1946fb89afaa = [];
    var_6c2bfd3d88f9e18c = var_48743aab19552fd + "Attachment";
    var_6d728bae3e54774a = "";
    for (attachmentindex = 0; attachmentindex < maxattachments; attachmentindex++) {
        if (attachmentindex != 0) {
            var_6d728bae3e54774a = var_6c2bfd3d88f9e18c + attachmentindex + 1;
        } else {
            var_6d728bae3e54774a = var_6c2bfd3d88f9e18c;
        }
        if (isdefined(loadout[var_6d728bae3e54774a])) {
            weaponattachments[attachmentindex] = loadout[var_6d728bae3e54774a];
            var_e7cc1946fb89afaa[attachmentindex] = 0;
        }
    }
    return weapon::buildweapon(loadout[var_48743aab19552fd], weaponattachments, loadout[var_48743aab19552fd + "Camo"], loadout[var_48743aab19552fd + "Reticle"], loadout[var_48743aab19552fd + "VariantID"], var_e7cc1946fb89afaa);
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x74e4
// Size: 0x4a
function function_75633a54ad10a451(scriptablename, itemcount) {
    if (isdefined(level.br_pickups.counts[scriptablename]) && isdefined(itemcount)) {
        level.br_pickups.counts[scriptablename] = itemcount;
    }
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x7535
// Size: 0x14b
function function_d2d7b153b9d3889e(index, name, start, end, traceresults) {
    /#
        var_a16891a5162df351 = 2000;
        if (traceresults["brloot_plate_carrier_high_capacity"] < 1) {
            line(start, traceresults["brloot_rock"], (1, 0, 0), 1, 0, var_a16891a5162df351);
            if (isdefined(traceresults["Quest Tablet does not have a defined task struct. Scriptable: "])) {
                var_8b6b95e859550ffb = traceresults["Quest Tablet does not have a defined task struct. Scriptable: "];
                println("specialty_pc_high_capacity" + index + "brloot_weapon_generic_" + name + "brloot_weapon_generic_me" + traceresults["brloot_plate_carrier_high_capacity"] + "reset_cash_wait" + traceresults["brloot_rock"] + "br_pickup_cash_04" + utility::function_53c4c53197386572(var_8b6b95e859550ffb.name, "br_pickup_cash_med_05"));
            } else {
                println("specialty_pc_high_capacity" + index + "brloot_weapon_generic_" + name + "brloot_weapon_generic_me" + traceresults["brloot_plate_carrier_high_capacity"] + "reset_cash_wait" + traceresults["brloot_rock"]);
            }
        } else {
            println("specialty_pc_high_capacity" + index + "brloot_weapon_generic_" + name + "br_pickup_cash_vlrg_05");
            line(start, end, (1, 1, 1), 1, 0, var_a16891a5162df351);
        }
    #/
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7687
// Size: 0xaa
function getitemdropinfo(origin, angles, payload, groundentity) {
    /#
        assert(isdefined(origin));
    #/
    var_cb4fad49263e20c4 = spawnstruct();
    var_cb4fad49263e20c4.origin = origin;
    if (isdefined(angles)) {
        var_cb4fad49263e20c4.angles = angles;
    } else {
        var_cb4fad49263e20c4.angles = (0, 0, 0);
    }
    if (isdefined(payload)) {
        var_cb4fad49263e20c4.payload = payload;
    } else {
        var_cb4fad49263e20c4.payload = 0;
    }
    var_cb4fad49263e20c4.groundentity = groundentity;
    return var_cb4fad49263e20c4;
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7739
// Size: 0xd1
function function_78ca4cfbcb159de2(baseorigin, var_adf4a147715daba0, traceresults) {
    var_fafd64b272244139 = getlootscriptablearrayinradius(undefined, undefined, baseorigin, var_adf4a147715daba0.dist + level.var_43c2a465029a4684);
    if (isdefined(var_fafd64b272244139) && var_fafd64b272244139.size > 0) {
        foreach (scriptable in var_fafd64b272244139) {
            if (!isdefined(scriptable.origin)) {
                continue;
            }
            if (distance2d(traceresults["position"], scriptable.origin) < level.var_43c2a465029a4684) {
                return 1;
            }
        }
    }
    return 0;
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7812
// Size: 0x19c
function function_7bf5ea7dd272db77(dropstruct, var_adf4a147715daba0, baseorigin, ignoreent, var_fbcabd62b8f66eb8, var_551904951118b7b9) {
    tracestart = baseorigin + (0, 0, 21);
    var_ffbb92bfd2dc8fe7 = var_adf4a147715daba0.dir * 18;
    traceend = var_adf4a147715daba0.var_2be6462ff6be9915 + var_ffbb92bfd2dc8fe7 + (0, 0, 21 + level.var_42eb4fb7558dc1ec);
    traceresults = trace::ray_trace(tracestart, traceend, ignoreent, var_fbcabd62b8f66eb8);
    /#
        if (var_551904951118b7b9) {
            function_d2d7b153b9d3889e(dropstruct.var_dfba5a2c3c6f0a07, "gulag_token", tracestart, traceend, traceresults);
        }
    #/
    if (traceresults["fraction"] < 1) {
        var_adf4a147715daba0.var_2be6462ff6be9915 = traceresults["position"];
    } else {
        var_adf4a147715daba0.var_2be6462ff6be9915 = traceend;
    }
    var_adf4a147715daba0.var_2be6462ff6be9915 = var_adf4a147715daba0.var_2be6462ff6be9915 - var_ffbb92bfd2dc8fe7;
    var_69750fb1d5f5525f = getdvarint(@"hash_3ca29b429f678228", 1);
    for (check = 0; check < var_69750fb1d5f5525f; check++) {
        tracestart = tracestart + (0, 0, 10 * check);
        var_435e68a101be2358 = trace::ray_trace(tracestart, traceend, ignoreent, var_fbcabd62b8f66eb8);
        if (var_435e68a101be2358["fraction"] < traceresults["fraction"]) {
            traceresults["fraction"] = -1;
        }
    }
    return traceresults;
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 11, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x79b6
// Size: 0x327
function function_3f0ce5cf3481f56c(dropstruct, var_adf4a147715daba0, baseorigin, baseangles, ignoreent, var_fbcabd62b8f66eb8, retries, var_daa047868cf7a01b, var_551904951118b7b9, var_43ee1b505fc4c4ed, var_93a7b81154b71c0e) {
    var_a9d5ad9414f5ecb7 = 9;
    var_3385f93167b49aa1 = 360 / var_a9d5ad9414f5ecb7;
    if (!istrue(var_43ee1b505fc4c4ed) && istrue(var_93a7b81154b71c0e)) {
        var_3385f93167b49aa1 = level.var_7f82d2e3f2ef4402;
    }
    var_69ba8b68ba5e82e1 = var_adf4a147715daba0.ring;
    var_52f7d953deddb1d3 = var_adf4a147715daba0.slot;
    var_d1f8e4e25a5b0afa = var_adf4a147715daba0.yaw;
    var_b1645fb2e124b7bf = var_adf4a147715daba0.dist;
    var_943ce3376b5dfe = var_adf4a147715daba0.dir;
    var_f4a31528787ae6bd = var_adf4a147715daba0.var_37fba60b9cb411eb;
    var_9bd3420d924c5c43 = var_adf4a147715daba0.var_2be6462ff6be9915;
    for (attempts = 0; attempts < retries; attempts++) {
        dropstruct.var_dfba5a2c3c6f0a07++;
        var_adf4a147715daba0.ring = int(dropstruct.var_dfba5a2c3c6f0a07 / var_a9d5ad9414f5ecb7);
        var_adf4a147715daba0.slot = dropstruct.var_dfba5a2c3c6f0a07 - var_adf4a147715daba0.ring * var_a9d5ad9414f5ecb7;
        var_adf4a147715daba0.yaw = baseangles[1] + var_adf4a147715daba0.slot * var_3385f93167b49aa1 + var_adf4a147715daba0.ring * 10 + randomfloatrange(-5, 5);
        var_adf4a147715daba0.dist = 60 + var_adf4a147715daba0.ring * 35 + randomfloatrange(-5, 5);
        var_adf4a147715daba0.var_37fba60b9cb411eb = (0, var_adf4a147715daba0.yaw, 0);
        var_adf4a147715daba0.dir = anglestoforward(var_adf4a147715daba0.var_37fba60b9cb411eb);
        var_adf4a147715daba0.var_2be6462ff6be9915 = baseorigin + var_adf4a147715daba0.dir * var_adf4a147715daba0.dist;
        traceresults = function_7bf5ea7dd272db77(dropstruct, var_adf4a147715daba0, baseorigin, ignoreent, var_fbcabd62b8f66eb8, var_551904951118b7b9);
        var_93a7b81154b71c0e = function_78ca4cfbcb159de2(baseorigin, var_adf4a147715daba0, traceresults);
        if (traceresults["fraction"] >= var_daa047868cf7a01b && !var_93a7b81154b71c0e) {
            return;
        }
    }
    var_adf4a147715daba0.ring = var_69ba8b68ba5e82e1;
    var_adf4a147715daba0.slot = var_52f7d953deddb1d3;
    var_adf4a147715daba0.yaw = var_d1f8e4e25a5b0afa;
    var_1558da3ce03f6856 = var_93a7b81154b71c0e ? 3 : 1;
    var_adf4a147715daba0.dist = var_b1645fb2e124b7bf / var_1558da3ce03f6856;
    var_adf4a147715daba0.dir = var_943ce3376b5dfe;
    var_adf4a147715daba0.var_37fba60b9cb411eb = var_f4a31528787ae6bd;
    var_adf4a147715daba0.var_2be6462ff6be9915 = var_9bd3420d924c5c43;
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7ce4
// Size: 0xfd
function function_28cd87cdbae45940(dropstruct, var_adf4a147715daba0, ignoreent, var_fbcabd62b8f66eb8, var_551904951118b7b9) {
    tracestart = var_adf4a147715daba0.var_2be6462ff6be9915;
    traceend = var_adf4a147715daba0.var_2be6462ff6be9915 + (0, 0, 60);
    traceresults = trace::ray_trace(tracestart, traceend, ignoreent, var_fbcabd62b8f66eb8);
    /#
        if (var_551904951118b7b9) {
            function_d2d7b153b9d3889e(dropstruct.var_dfba5a2c3c6f0a07, "MP/MRAP_ALREADY_UNLOCKED", tracestart + (0, 1, 0), traceend + (0, 1, 0), traceresults);
        }
    #/
    if (traceresults["fraction"] < 1) {
        var_adf4a147715daba0.var_2be6462ff6be9915 = traceresults["position"] + (0, 0, -6);
    } else {
        var_adf4a147715daba0.var_2be6462ff6be9915 = traceend;
    }
    return traceresults;
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7de9
// Size: 0x2cd
function function_bd56d40fa4e7a1e3(dropstruct, var_adf4a147715daba0, ignoreent, var_fbcabd62b8f66eb8, var_c79bb482424eb3a0, var_29a915f667b07b0f, var_551904951118b7b9) {
    tracestart = var_adf4a147715daba0.var_2be6462ff6be9915;
    traceheight = function_53c4c53197386572(var_29a915f667b07b0f, getdvarfloat(@"hash_b91d6bc7e0694ac", 2000));
    var_3a7f0173b03f5767 = -1 * traceheight;
    traceend = var_adf4a147715daba0.var_2be6462ff6be9915 + (0, 0, var_3a7f0173b03f5767);
    traceresults = namespace_2a184fc4902783dc::ray_trace(tracestart, traceend, ignoreent, var_fbcabd62b8f66eb8);
    /#
        if (var_551904951118b7b9) {
            function_d2d7b153b9d3889e(dropstruct.var_dfba5a2c3c6f0a07, "brloot_gascan_palfa", tracestart, traceend, traceresults);
        }
    #/
    if (traceresults["fraction"] < 1) {
        var_adf4a147715daba0.var_2be6462ff6be9915 = traceresults["position"] + (0, 0, var_c79bb482424eb3a0);
        var_adf4a147715daba0.groundentity = traceresults["entity"];
        if (isdefined(var_adf4a147715daba0.groundentity) && (istrue(var_adf4a147715daba0.groundentity.isdestroyed) || istrue(var_adf4a147715daba0.groundentity.burningdown) || var_adf4a147715daba0.groundentity namespace_1f188a13f7e79610::function_794b5f886cced2d0())) {
            ignorelist = [0:var_adf4a147715daba0.groundentity];
            if (isdefined(ignoreent)) {
                ignorelist[ignorelist.size] = ignoreent;
            }
            traceresults = namespace_2a184fc4902783dc::ray_trace(var_adf4a147715daba0.var_2be6462ff6be9915, traceend, ignorelist, var_fbcabd62b8f66eb8);
            /#
                if (var_551904951118b7b9) {
                    function_d2d7b153b9d3889e(dropstruct.var_dfba5a2c3c6f0a07, "reveal_intel", var_adf4a147715daba0.var_2be6462ff6be9915, traceend, traceresults);
                }
            #/
            if (traceresults["fraction"] < 1) {
                var_adf4a147715daba0.var_2be6462ff6be9915 = traceresults["position"] + (0, 0, var_c79bb482424eb3a0);
                var_adf4a147715daba0.groundentity = traceresults["entity"];
            } else {
                /#
                    if (var_551904951118b7b9) {
                        println("specialty_pc_high_capacity" + dropstruct.var_dfba5a2c3c6f0a07 + "setDronePartFound");
                    }
                #/
                var_adf4a147715daba0.var_2be6462ff6be9915 = (0, 0, 0);
                var_adf4a147715daba0.var_c551ab221bac9779 = 1;
            }
        }
    } else {
        /#
            if (var_551904951118b7b9) {
                println("specialty_pc_high_capacity" + dropstruct.var_dfba5a2c3c6f0a07 + "setDronePartFound");
            }
        #/
        var_adf4a147715daba0.var_2be6462ff6be9915 = (0, 0, 0);
        var_adf4a147715daba0.var_c551ab221bac9779 = 1;
    }
    return traceresults;
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 11, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x80be
// Size: 0x5b6
function getitemdroporiginandangles(dropstruct, baseorigin, baseangles, ignoreent, var_8a600b6102da9f9b, var_f71d4f78d508da69, var_6fe2ff802d5192d4, var_3ace5ac9c7d6fa44, var_7591ed99e87a77d3, var_29a915f667b07b0f, var_688e4da4cb16116d) {
    /#
        assert(!isdefined(ignoreent) || isent(ignoreent));
    #/
    var_a9d5ad9414f5ecb7 = 9;
    if (isdefined(dropstruct.var_fb6b5e268e9a52de) && dropstruct.var_fb6b5e268e9a52de > 0) {
        var_a9d5ad9414f5ecb7 = dropstruct.var_fb6b5e268e9a52de;
    }
    var_3385f93167b49aa1 = 360 / var_a9d5ad9414f5ecb7;
    var_551904951118b7b9 = getdvarint(@"hash_d7613094ea4ba91f", 0);
    var_ab9f50e5b2c2e07e = ter_op(isdefined(dropstruct.var_d1e7ececee01c6d5), dropstruct.var_d1e7ececee01c6d5, -5);
    var_ab7c62e5b29cc05c = ter_op(isdefined(dropstruct.var_d20ad6ecee27de2b), dropstruct.var_d20ad6ecee27de2b, 5);
    var_b57e08395cbe94d2 = 40;
    if (isdefined(ignoreent) && isent(ignoreent) && isplayer(ignoreent) && player::isreallyalive(ignoreent)) {
        currentstance = ignoreent getstance();
        if (currentstance == "crouch") {
            var_b57e08395cbe94d2 = 20;
        } else if (currentstance == "prone") {
            var_b57e08395cbe94d2 = 10;
        }
    }
    var_adf4a147715daba0 = spawnstruct();
    var_adf4a147715daba0.var_c551ab221bac9779 = 0;
    var_adf4a147715daba0.payload = 0;
    var_adf4a147715daba0.groundentity = undefined;
    if (!isdefined(baseangles)) {
        baseangles = (0, 0, 0);
    }
    var_c79bb482424eb3a0 = 0;
    if (isdefined(var_6fe2ff802d5192d4)) {
        var_c79bb482424eb3a0 = var_6fe2ff802d5192d4;
    }
    var_adf4a147715daba0.ring = int(dropstruct.var_dfba5a2c3c6f0a07 / var_a9d5ad9414f5ecb7);
    var_adf4a147715daba0.slot = dropstruct.var_dfba5a2c3c6f0a07 - var_adf4a147715daba0.ring * var_a9d5ad9414f5ecb7;
    var_adf4a147715daba0.yaw = baseangles[1] + var_adf4a147715daba0.slot * var_3385f93167b49aa1 + var_adf4a147715daba0.ring * 10 + randomfloatrange(var_ab9f50e5b2c2e07e, var_ab7c62e5b29cc05c);
    var_adf4a147715daba0.dist = 60 + var_adf4a147715daba0.ring * 35 + randomfloatrange(-5, 5);
    if (isdefined(var_8a600b6102da9f9b)) {
        var_adf4a147715daba0.yaw = baseangles[1] + var_8a600b6102da9f9b;
    }
    if (isdefined(var_f71d4f78d508da69)) {
        var_adf4a147715daba0.dist = var_f71d4f78d508da69;
    }
    var_adf4a147715daba0.var_37fba60b9cb411eb = (0, var_adf4a147715daba0.yaw, 0);
    var_adf4a147715daba0.dir = anglestoforward(var_adf4a147715daba0.var_37fba60b9cb411eb);
    var_adf4a147715daba0.var_2be6462ff6be9915 = baseorigin + var_adf4a147715daba0.dir * var_adf4a147715daba0.dist;
    if (isdefined(var_7591ed99e87a77d3)) {
        var_adf4a147715daba0.var_2be6462ff6be9915 = var_7591ed99e87a77d3;
    }
    if (1) {
        /#
            if (var_551904951118b7b9) {
                println("specialty_pc_high_capacity" + dropstruct.var_dfba5a2c3c6f0a07 + "playPickupFeedback unexpected pickupEnt" + baseorigin + "brloot_plate_carrier_" + var_adf4a147715daba0.var_2be6462ff6be9915 + "br_twotwo_gulag_key_dropped" + var_adf4a147715daba0.dist);
            }
        #/
        var_fbcabd62b8f66eb8 = trace::create_contents(0, 1, 1, 1, 1, 1, level.var_41ed77c6e0438829, 0, 1, 0, 1);
        traceresults = function_7bf5ea7dd272db77(dropstruct, var_adf4a147715daba0, baseorigin, ignoreent, var_fbcabd62b8f66eb8, var_551904951118b7b9);
        var_43ee1b505fc4c4ed = traceresults["fraction"] < level.var_7452545fbedecdba;
        if (isdefined(traceresults) && level.var_40111092ff73b724 > 0 && !isdefined(var_8a600b6102da9f9b) && !isdefined(var_f71d4f78d508da69) && !isdefined(var_7591ed99e87a77d3)) {
            var_93a7b81154b71c0e = 0;
            if (!isdefined(var_f71d4f78d508da69) && !isdefined(var_7591ed99e87a77d3) && !istrue(var_688e4da4cb16116d)) {
                var_93a7b81154b71c0e = function_78ca4cfbcb159de2(baseorigin, var_adf4a147715daba0, traceresults);
            }
            if (var_93a7b81154b71c0e || var_43ee1b505fc4c4ed) {
                function_3f0ce5cf3481f56c(dropstruct, var_adf4a147715daba0, baseorigin, baseangles, ignoreent, var_fbcabd62b8f66eb8, level.var_40111092ff73b724, level.var_7452545fbedecdba, var_551904951118b7b9, var_43ee1b505fc4c4ed, var_93a7b81154b71c0e);
            }
        }
        function_28cd87cdbae45940(dropstruct, var_adf4a147715daba0, ignoreent, var_fbcabd62b8f66eb8, var_551904951118b7b9);
        function_bd56d40fa4e7a1e3(dropstruct, var_adf4a147715daba0, ignoreent, var_fbcabd62b8f66eb8, var_c79bb482424eb3a0, var_29a915f667b07b0f, var_551904951118b7b9);
    } else {
        var_adf4a147715daba0.var_2be6462ff6be9915 = var_adf4a147715daba0.var_2be6462ff6be9915 + (0, 0, var_c79bb482424eb3a0);
    }
    if (1 && !var_adf4a147715daba0.var_c551ab221bac9779) {
        startorigin = baseorigin;
        if (!istrue(var_3ace5ac9c7d6fa44)) {
            startorigin = startorigin + (0, 0, var_b57e08395cbe94d2);
        }
        var_adf4a147715daba0.payload = calcscriptablepayloadgravityarc(startorigin, var_adf4a147715daba0.var_2be6462ff6be9915);
    }
    /#
        if (var_551904951118b7b9) {
            println("specialty_pc_high_capacity" + dropstruct.var_dfba5a2c3c6f0a07 + "ks_use_crate_mp" + var_adf4a147715daba0.var_2be6462ff6be9915 + "try_armor_cancel" + var_adf4a147715daba0.var_37fba60b9cb411eb);
        }
    #/
    dropstruct.dropcount++;
    dropstruct.var_dfba5a2c3c6f0a07++;
    return getitemdropinfo(var_adf4a147715daba0.var_2be6462ff6be9915, var_adf4a147715daba0.var_37fba60b9cb411eb, var_adf4a147715daba0.payload, var_adf4a147715daba0.groundentity);
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x867c
// Size: 0x6e
function function_73ffc9bcd6d1e62d(var_7f437a5779c8787c) {
    if (istrue(var_7f437a5779c8787c)) {
        level.br_pickups.var_ad49a38dd7c4c10f = br_armory_kiosk::getkioskyawoffsetoverride();
        level.br_pickups.var_3b53bc0eee6ae84e = br_armory_kiosk::function_1a8066ccdb91c1d1();
    } else {
        level.br_pickups.var_ad49a38dd7c4c10f = undefined;
        level.br_pickups.var_3b53bc0eee6ae84e = undefined;
    }
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x86f1
// Size: 0x52
function getfullweaponobjforscriptablepartname(scriptablename) {
    if (isdefined(scriptablename) && isdefined(level.br_lootiteminfo[scriptablename]) && isdefined(level.br_lootiteminfo[scriptablename].fullweaponobj)) {
        return level.br_lootiteminfo[scriptablename].fullweaponobj;
    }
    return undefined;
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x874b
// Size: 0x7e
function getfullweaponobjforpickup(pickupent) {
    if (isdefined(pickupent) && isdefined(pickupent.scriptablename)) {
        return getfullweaponobjforscriptablepartname(pickupent.scriptablename);
    } else if (pickupent function_73cc0f04c4c5001d()) {
        scriptablename = namespace_cb965d2f71fefddc::lootGetScriptableName(pickupent);
        return getfullweaponobjforscriptablepartname(scriptablename);
    } else if (isdefined(pickupent.type)) {
        return getfullweaponobjforscriptablepartname(pickupent.type);
    }
    return undefined;
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x87d1
// Size: 0x58
function getgulagpickupsforclass(var_7d9a5d01ce25e7a3) {
    var_14004b68ddacb781 = [0:"none"];
    if (isdefined(var_7d9a5d01ce25e7a3) && isdefined(level.br_pickups.br_gulagpickups[var_7d9a5d01ce25e7a3])) {
        var_14004b68ddacb781 = level.br_pickups.br_gulagpickups[var_7d9a5d01ce25e7a3];
    }
    return var_14004b68ddacb781;
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8831
// Size: 0x2b
function loot_getitemcount(instance) {
    /#
        assert(isdefined(instance));
    #/
    return instance.count >> 0 & 2048 - 1;
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8864
// Size: 0x2c
function loot_getitemcountlefthand(instance) {
    /#
        assert(isdefined(instance));
    #/
    return instance.count >> 11 & 2048 - 1;
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8898
// Size: 0x2f
function function_3a5f7703319142dd(instance) {
    /#
        assert(isdefined(instance));
    #/
    return instance.count >> 11 + 11 & 512 - 1;
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x88cf
// Size: 0xab
function loot_setitemcount(instance, itemcount, var_59bd51afc73df2cd, var_dab81ead77442a10) {
    count = 0;
    /#
        assert(isdefined(instance));
    #/
    /#
        assert(itemcount < 2048);
    #/
    count = count + ((itemcount & 2048 - 1) << 0);
    if (isdefined(var_59bd51afc73df2cd)) {
        /#
            assert(var_59bd51afc73df2cd < 2048);
        #/
        count = count + ((var_59bd51afc73df2cd & 2048 - 1) << 11);
    }
    if (isdefined(var_dab81ead77442a10)) {
        /#
            assert(var_dab81ead77442a10 < 512);
        #/
        count = count + ((var_dab81ead77442a10 & 512 - 1) << 11 + 11);
    }
    instance.count = count;
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8981
// Size: 0x53
function lootUsedIgnore(instance) {
    scriptablename = lootGetScriptableName(instance);
    if (!isdefined(scriptablename)) {
        return 0;
    }
    if (scriptablename == "dmz_uav_tower") {
        return 1;
    }
    if (scriptablename == "brloot_scorpion_trophy") {
        return 1;
    }
    if (istrue(namespace_b8ca654fc4c2dd79::runbrgametypefunc("lootUsedIgnore", instance))) {
        return 1;
    }
    return 0;
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x89dc
// Size: 0x4b
function lootGetScriptableName(instance) {
    if (!isdefined(instance)) {
        return undefined;
    }
    if (!instance function_73cc0f04c4c5001d()) {
        return instance.type;
    }
    var_a1093166de09e6b8 = instance function_15c8c4841bfc1fd5();
    if (isdefined(var_a1093166de09e6b8)) {
        return var_a1093166de09e6b8;
    }
    return instance.type;
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8a2f
// Size: 0x201
function function_23d6a60ccfa90b00(instance, player) {
    if (!isdefined(instance)) {
        return 0;
    }
    pickup = spawnstruct();
    pickup.scriptablename = lootGetScriptableName(instance);
    pickup.origin = instance.origin;
    pickup.count = loot_getitemcount(instance);
    pickup.countlefthand = loot_getitemcountlefthand(instance);
    pickup.instance = instance;
    pickup.customweaponname = instance.customweaponname;
    pickup.maxcount = level.br_pickups.maxcounts[pickup.scriptablename];
    pickup.stackable = level.br_pickups.stackable[pickup.scriptablename];
    /#
        assert(isdefined(pickup.count));
    #/
    if (!pickup.count && isdefined(level.br_pickups.counts[pickup.scriptablename])) {
        pickup.count = level.br_pickups.counts[pickup.scriptablename];
    }
    pickup.isweaponfromcrate = instance.isweaponfromcrate;
    pickup.isautouse = 1;
    if (!function_bbc64f5bf69b1680(player, pickup, instance)) {
        return 0;
    }
    var_3fcf64bb4bafc05b = 0;
    var_12e7d95b6cc9cc78 = player cantakepickup(pickup);
    if (var_12e7d95b6cc9cc78 == 1) {
        var_3fcf64bb4bafc05b = var_3fcf64bb4bafc05b | 1;
        if (isweaponpickup(pickup.scriptablename)) {
            var_a700f4673c85c915 = br_weapons::function_55c5d35c8c76a95b(pickup)[0];
            if (player br_weapons::function_744e28ebe63c0358(var_a700f4673c85c915)) {
                var_3fcf64bb4bafc05b = var_3fcf64bb4bafc05b | 2;
            }
        }
    }
    return var_3fcf64bb4bafc05b;
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8c38
// Size: 0x78
function function_e40eec61ee9d0889(instance, part, state, player, var_a5b2c541413aa895, var_cc38472e36be1b61) {
    result = lootused(instance, part, state, player, var_a5b2c541413aa895, var_cc38472e36be1b61, 1);
    if (getdvarint(@"hash_efe884b265ffb84f", 1) && isdefined(instance) && istrue(var_a5b2c541413aa895)) {
        player function_95f0eda7e462e30f(instance, result);
    }
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 8, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8cb7
// Size: 0x23c
function lootused(instance, part, state, player, var_a5b2c541413aa895, var_cc38472e36be1b61, var_2861e2eeeb7af5da, var_1a33360665b6bb36) {
    if (!isdefined(instance)) {
        return;
    }
    pickup = spawnstruct();
    pickup.scriptablename = lootGetScriptableName(instance);
    pickup.origin = instance.origin;
    pickup.count = loot_getitemcount(instance);
    pickup.countlefthand = loot_getitemcountlefthand(instance);
    pickup.var_e97d731bedd44c63 = function_3a5f7703319142dd(instance);
    pickup.instance = instance;
    pickup.customweaponname = instance.customweaponname;
    pickup.maxcount = level.br_pickups.maxcounts[pickup.scriptablename];
    pickup.stackable = level.br_pickups.stackable[pickup.scriptablename];
    /#
        assert(isdefined(pickup.count));
    #/
    if (!pickup.count && !function_5449da9d3d0358a4(pickup.scriptablename) && !isgasmask(pickup.scriptablename) && isdefined(level.br_pickups.counts[pickup.scriptablename])) {
        pickup.count = level.br_pickups.counts[pickup.scriptablename];
    }
    pickup.isweaponfromcrate = instance.isweaponfromcrate;
    pickup.isautouse = var_a5b2c541413aa895;
    pickup.var_e1147886ccf51970 = instance.var_e1147886ccf51970;
    pickup.metadata = instance.metadata;
    return function_b5f5576a0017c089(pickup, state, player, var_a5b2c541413aa895, instance, var_2861e2eeeb7af5da, var_1a33360665b6bb36);
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8efb
// Size: 0x2b2
function function_60234aa487445085(pickup, player, var_a5b2c541413aa895, instance) {
    var_483ad0cab6e25673 = isdefined(pickup.scriptablename) && function_f262c137ed78e6eb(pickup.scriptablename);
    var_becfb5931b2c6bd7 = isdefined(pickup.scriptablename) && pickup namespace_2d7f47b19ccdb41d::function_5facfbee97e1a98e();
    var_f0abce18fe9c334e = var_483ad0cab6e25673 || var_becfb5931b2c6bd7;
    var_10bbeacb1429824e = player onusecompleted(pickup, var_f0abce18fe9c334e, var_a5b2c541413aa895, undefined, undefined, instance);
    if (isdefined(instance) && var_10bbeacb1429824e) {
        loot_setitemcount(instance, pickup.count, pickup.countlefthand, pickup.var_e97d731bedd44c63);
    }
    if (player namespace_a548bd428a566cf3::isplayerinorgoingtogulag()) {
        if (isdefined(player.var_d919d1c70719e664)) {
            player.var_d919d1c70719e664 = player.var_d919d1c70719e664 + 1;
        }
        if (isdefined(pickup.scriptablename) && pickup.scriptablename == "loot_key_gulag") {
            player.var_936612c9eeedd33b = 1;
            player.var_c51be970ba557af5 = 1;
        }
        arena = namespace_de6eb888abbe38e1::function_2f4344abdc200e43(player);
        if (isdefined(pickup.scriptablename) && pickup.scriptablename != "loot_key_gulag") {
            if (isdefined(arena) && isdefined(arena.var_62d1855d36cff5d2) && isdefined(instance)) {
                arena.var_62d1855d36cff5d2[arena.var_62d1855d36cff5d2.size] = instance;
            }
        }
    }
    var_ed6d9e78de701fba = getdvarint(@"hash_920a281ef3740251", 1);
    if (!isdefined(instance) || var_10bbeacb1429824e && !var_ed6d9e78de701fba) {
        return 1;
    }
    if (!var_483ad0cab6e25673 && !function_4ebfdbfa1b8e0339(pickup.scriptablename) && !istrue(instance.var_c001ccfc802f487)) {
        if (var_10bbeacb1429824e && var_ed6d9e78de701fba) {
            dropstruct = function_7b9f3966a7a42003();
            var_cb4fad49263e20c4 = getitemdroporiginandangles(dropstruct, player.origin, player.angles, player, undefined, pickup.var_96c7526f4ab04875, undefined, undefined, pickup.origin);
            spawnpickup(pickup.scriptablename, var_cb4fad49263e20c4, var_10bbeacb1429824e, 1);
        }
        loothide(instance);
    }
    function_56dd1faa25a3414f(player, pickup, var_a5b2c541413aa895, 1);
    player setclientomnvar("ui_notify_show_minimal_hud", gettime());
    return 1;
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x91b5
// Size: 0x4e
function function_dc5a935ab4958490(pickup) {
    if (isdefined(pickup.customweaponname)) {
        lootid = namespace_e0ee43ef2dddadaa::function_b0d37b9be0027733(pickup.customweaponname);
    } else {
        lootid = loot::function_fae5e1d3de32d3f7(pickup.scriptablename);
    }
    return lootid;
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x920b
// Size: 0x51
function function_be35d1aef76188cb(var_bb057f32440ac1b5) {
    if (!isdefined(level.var_534e97d34ef9fa29)) {
        level.var_534e97d34ef9fa29 = [];
    }
    var_1515562147f27975 = loot::function_fae5e1d3de32d3f7(var_bb057f32440ac1b5);
    if (isdefined(var_1515562147f27975)) {
        level.var_534e97d34ef9fa29[level.var_534e97d34ef9fa29.size] = var_1515562147f27975;
    }
    return var_1515562147f27975;
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9264
// Size: 0x12a
function function_b29b252cdfa9a7d6(perks) {
    var_3552db979c982413 = 8;
    quantity = 0;
    var_99d72c999b9a85fa = 0;
    mask = int(pow(2, var_3552db979c982413)) - 1;
    for (i = 0; i < 4 && i < perks.size; i++) {
        if (isdefined(perks[i])) {
            perk = perks[i];
        } else {
            key = "perk" + i + 1;
            perk = perks[key];
        }
        var_1855223a9b8caacb = i >= 2;
        id = namespace_b6a8027f477010e1::getperkid(perk);
        /#
            assertex(id <= mask, "Perk Indicies for Custom Perk Packs are limited to " + mask);
        #/
        var_7a4d1246a164bd91 = ter_op(var_1855223a9b8caacb, i - 2, i);
        var_81dc643838b63c97 = (id & mask) << var_7a4d1246a164bd91 * var_3552db979c982413;
        if (var_1855223a9b8caacb) {
            var_99d72c999b9a85fa = var_99d72c999b9a85fa + var_81dc643838b63c97;
        } else {
            quantity = quantity + var_81dc643838b63c97;
        }
    }
    return [0:quantity, 1:var_99d72c999b9a85fa];
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9396
// Size: 0x196
function function_8f0bd51f5c6108b(pickup, player, var_a5b2c541413aa895, instance) {
    lootid = function_dc5a935ab4958490(pickup);
    player onPickupTakenIntoBackpack(pickup);
    player playPickupFeedback(pickup, var_a5b2c541413aa895);
    function_56dd1faa25a3414f(player, pickup, var_a5b2c541413aa895, 20);
    var_10bbeacb1429824e = 0;
    if (isdefined(lootid)) {
        if (isweaponpickupitem(pickup)) {
            pickup.count = 1;
        }
        if (namespace_126f4192a2d090c4::function_43044da0ed44d79f(pickup.scriptablename)) {
            if (namespace_126f4192a2d090c4::function_bdd930eee0042052()) {
                var_65b695f0c0d909ed = player namespace_e50e624d9af51c8c::getAvailableDMZBackpackIndex();
                quantity = 1;
                var_99d72c999b9a85fa = 0;
                if (isdefined(pickup.instance.perks)) {
                    var_c00a336249963ce8 = function_b29b252cdfa9a7d6(pickup.instance.perks);
                    var_99d72c999b9a85fa = var_c00a336249963ce8[1];
                    quantity = var_c00a336249963ce8[0];
                }
                namespace_e50e624d9af51c8c::function_11f48ae5b87b4525(player, var_65b695f0c0d909ed, lootid, quantity, var_99d72c999b9a85fa);
                if (isdefined(pickup.instance.perks)) {
                    var_cca9dde643cb4a63 = arraycopy(pickup.instance.perks);
                    player namespace_126f4192a2d090c4::function_222999aad19f5b52(var_65b695f0c0d909ed, var_cca9dde643cb4a63);
                }
            }
        } else {
            player namespace_e50e624d9af51c8c::addItemToBackpack(lootid, pickup);
        }
        if (isdefined(instance)) {
            loothide(instance);
        }
        return 1;
    }
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9533
// Size: 0x114
function function_56dd1faa25a3414f(player, pickup, var_a5b2c541413aa895, results) {
    var_c17ac30865717c64 = results == 1 || results == 20 || results == 5 || results == 27;
    if (var_c17ac30865717c64) {
        method = challenges::function_6d40f12a09494350(0, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_2af1f13aa6ae3b5f", #"loot"));
        method = challenges::function_6d40f12a09494350(method, namespace_ec6836c9475c9d18::function_e2ff8f4b4e94f723(#"hash_2af1f13aa6ae3b5f", #"ground"));
        lootid = function_dc5a935ab4958490(pickup);
        quantity = pickup.count;
        var_2cf425f220b95fbb = challenges::function_d24138b32084fc3e(player, lootid, undefined, method, quantity);
        if (!istrue(var_2cf425f220b95fbb)) {
            function_2237800b816490b8(player, pickup);
        }
        if (!game_utility::isBRStyleGameType()) {
            function_acddab6fa6e914a(player, pickup.origin);
        }
        player notify("looted_item", lootid);
    }
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x964e
// Size: 0xd8
function function_2237800b816490b8(player, pickup) {
    if (!isdefined(player) || !isdefined(pickup) || !isdefined(pickup.scriptablename)) {
        return;
    }
    scriptablename = pickup.scriptablename;
    if (isplunder(scriptablename) || isvaluable(scriptablename)) {
        var_b87f7fae01ce754f = 0;
        if (isdefined(player.plundercount)) {
            var_b87f7fae01ce754f = player.plundercount;
        }
        var_846972f0cb7c37fa = player namespace_771165fe61010ab2::function_e2f4f470c55123b8(undefined, 1);
        if (isdefined(var_846972f0cb7c37fa)) {
            var_b87f7fae01ce754f = var_b87f7fae01ce754f + var_846972f0cb7c37fa;
        }
        if (var_b87f7fae01ce754f > 1000) {
            if (istrue(namespace_b16531563568eaba::function_80478f2ef8c8882f(player)) && !overlord::function_50ebf0029301be3f(player, "dead_drop_nag")) {
                overlord::function_d87d5deb069bf8e5("dead_drop_nag", [0:player]);
            }
        }
    }
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x972d
// Size: 0x21
function function_acddab6fa6e914a(player, origin) {
    function_afe5cda1a4ed9d11("looted_item", player, origin);
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9755
// Size: 0x7f
function function_2e6de0100e414a86(pickup) {
    if (namespace_a548bd428a566cf3::isammo(pickup.scriptablename) && !getdvarint(@"hash_9d140d98331435ed", 0)) {
        return 0;
    }
    if (isGametypeItem(pickup.scriptablename) && namespace_71073fa38f11492::isbrgametypefuncdefined("shouldAutoPickupEquippedGametypeItemOnly")) {
        return namespace_71073fa38f11492::runbrgametypefunc("shouldAutoPickupEquippedGametypeItemOnly", pickup.scriptablename);
    }
    return getdvarint(@"hash_15055cb805b43a20", 1);
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x97dc
// Size: 0xc8
function function_bbc64f5bf69b1680(player, pickup, instance) {
    if (istrue(level.var_aba762658155f642)) {
        return 0;
    }
    if (function_2e6de0100e414a86(pickup) && !player function_e44c2d69db881894(pickup.scriptablename)) {
        return 0;
    }
    if (getdvarint(@"hash_752eeed3ddcbd04b", 0) && !player function_7b738b973a0b7f94() && player function_e44c2d69db881894(pickup.scriptablename)) {
        return 0;
    }
    if (br_weapons::function_b1dd9dcae2f63965() && player br_weapons::function_ac3ec31be7aad7a7(instance)) {
        return 0;
    }
    if (namespace_a548bd428a566cf3::isammo(pickup.scriptablename) && player namespace_e50e624d9af51c8c::function_9e76c59021bbf021(pickup.scriptablename) == 0) {
        return 0;
    }
    return 1;
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 8, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x98ac
// Size: 0x676
function function_b5f5576a0017c089(pickup, state, player, var_a5b2c541413aa895, instance, var_2861e2eeeb7af5da, var_1a33360665b6bb36, var_1e2e085b484205c3) {
    if (!isdefined(pickup)) {
        return 0;
    }
    if (istrue(player namespace_b8ca654fc4c2dd79::runbrgametypefunc("playerSkipLootPickup", instance, var_a5b2c541413aa895)) || istrue(level.infilcinematicactive)) {
        return 0;
    }
    if (istrue(var_a5b2c541413aa895) && !function_bbc64f5bf69b1680(player, pickup, instance)) {
        return 0;
    }
    if (namespace_24e240b9cee9d3b9::function_9005af34e01bf8fe() && player namespace_a548bd428a566cf3::isplayerinorgoingtogulag()) {
        if (isdefined(pickup.instance) && isdefined(pickup.instance.classname) && pickup.instance.classname == "scriptable_br_plunder_box") {
            if (!isdefined(player.var_44172449614f0738)) {
                player.var_44172449614f0738 = 0;
            }
            player.var_44172449614f0738 = player.var_44172449614f0738 + 1;
        }
    }
    if (!isdefined(instance) || instance getscriptableisloot() && !lootUsedIgnore(instance)) {
        results = undefined;
        if (istrue(var_1a33360665b6bb36)) {
            results = 20;
        } else {
            results = player cantakepickup(pickup, getdvarint(@"hash_8225b8d33c1565c6", 1) && !istrue(var_a5b2c541413aa895) && !istrue(var_1e2e085b484205c3));
        }
        if ((results == 1 || results == 20) && utility::issharedfuncdefined("pmc_missions", "onPickupWeapon") && isweaponpickupitem(pickup)) {
            weapon = br_weapons::function_55c5d35c8c76a95b(pickup)[0];
            [[ utility::getsharedfunc("pmc_missions", "onPickupWeapon") ]](player, weapon, pickup.metadata);
        }
        if (namespace_ca28d060b3b6ab8e::function_7ba31cb6b21c346f()) {
            if (results == 1 || results == 20 || results == 5 || results == 27) {
                if (player namespace_3f742ff4cbe345af::function_c28d94289c4a6ecd(instance)) {
                    player thread namespace_ca28d060b3b6ab8e::function_36edf91561322753(3);
                } else if (player namespace_3f742ff4cbe345af::function_4864c58ab9b1f07e(instance, 1)) {
                    player thread namespace_ca28d060b3b6ab8e::function_36edf91561322753(3);
                }
            }
        }
        if (isGametypeItem(pickup.scriptablename) && var_a5b2c541413aa895 == 0 && namespace_71073fa38f11492::isbrgametypefuncdefined("canLootNotAutoUseGametypeItem")) {
            if (istrue(namespace_71073fa38f11492::runbrgametypefunc("canLootNotAutoUseGametypeItem", pickup.scriptablename))) {
                results = 1;
            }
        }
        if (results == 1) {
            return function_60234aa487445085(pickup, player, var_a5b2c541413aa895, instance);
        } else if (results == 20) {
            return function_8f0bd51f5c6108b(pickup, player, var_a5b2c541413aa895, instance);
        } else if (results == 5 || results == 27) {
            newweapon = br_weapons::function_55c5d35c8c76a95b(pickup)[0];
            var_60227bff1e9478cc = spawnstruct();
            var_60227bff1e9478cc.scriptablename = br_weapons::br_ammo_type_for_weapon(newweapon);
            var_60227bff1e9478cc.origin = pickup.origin;
            var_60227bff1e9478cc.count = weaponclipsize(newweapon);
            var_f26ab8d7933ae75a = 0;
            if (results == 5) {
                var_f26ab8d7933ae75a = function_60234aa487445085(var_60227bff1e9478cc, player);
            } else {
                var_f26ab8d7933ae75a = function_8f0bd51f5c6108b(var_60227bff1e9478cc, player);
            }
            if (isdefined(instance)) {
                loothide(instance);
            }
            return var_f26ab8d7933ae75a;
        } else {
            if (getdvarint(@"hash_c031ba1736951fae", 1) && results != 28 && results != 2 && results != 10 && results != 9 && results != 13 && results != 33 && results != 35 && results != 11 && results != 16 && results != 8 && results != 36 && results != 7 && results != 37 && results != 39 && player namespace_de6eb888abbe38e1::function_c84e254980c7c8ed() && namespace_e50e624d9af51c8c::function_7e103028c464ab9a(pickup.scriptablename) && isdefined(instance) && !istrue(var_a5b2c541413aa895)) {
                var_491c9b4e02748831 = instance;
                var_491c9b4e02748831.contents = [];
                var_491c9b4e02748831.var_46a3a8565ac0c17c = 14;
                var_491c9b4e02748831.contents[0] = [];
                var_491c9b4e02748831.contents[0]["quantity"] = pickup.count;
                var_491c9b4e02748831.contents[0]["lootID"] = loot::function_fae5e1d3de32d3f7(pickup.scriptablename);
                if (function_2d86ba79a58bb62(pickup.scriptablename)) {
                    var_491c9b4e02748831.contents[0]["extraInfoEnt"] = undefined;
                    var_491c9b4e02748831.contents[0]["extraInfoTeam"] = undefined;
                    if (isdefined(pickup.instance.blacksite)) {
                        var_491c9b4e02748831.contents[0]["extraInfoEnt"] = pickup.instance.blacksite;
                    }
                    if (isdefined(pickup.instance.originalteam)) {
                        var_491c9b4e02748831.contents[0]["extraInfoTeam"] = pickup.instance.originalteam;
                    }
                }
                loot::function_68ca06034b8aaccd(player, var_491c9b4e02748831);
                return 0;
            }
            var_8dde4ac0085463fc = 1;
            var_bb9e46e1d8130f2 = level.br_pickups.br_hasautopickup[pickup.scriptablename];
            if (isdefined(var_a5b2c541413aa895) && isdefined(var_bb9e46e1d8130f2)) {
                if (var_a5b2c541413aa895 && istrue(var_bb9e46e1d8130f2) && state == "visible") {
                    var_8dde4ac0085463fc = 0;
                }
            }
            if (results == 17) {
                var_8dde4ac0085463fc = 0;
            }
            if (function_a45ee992e46a29f1(pickup.scriptablename)) {
                var_8dde4ac0085463fc = 0;
            }
            if (function_945d5bc4b5cb8c78(pickup.scriptablename)) {
                var_8dde4ac0085463fc = 0;
            }
            if (isGametypeItem(pickup.scriptablename)) {
                var_8dde4ac0085463fc = 0;
            }
            if (results == 41) {
                thread namespace_735f8af4d2aa34fb::function_5d0b1fa9645f3c89(pickup, player);
                var_8dde4ac0085463fc = 0;
            }
            if (var_8dde4ac0085463fc) {
                if (results == 3) {
                    player playlocalsound("weap_ammo_full");
                } else {
                    player playlocalsound("br_pickup_deny");
                }
                player showuseresultsfeedback(results);
            }
        }
    }
    return 0;
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9f2a
// Size: 0x56
function function_2ae5e94bd6518ab5(loot, var_ecce4aadde6676e5) {
    scriptablename = lootGetScriptableName(loot);
    if (function_a45ee992e46a29f1(scriptablename)) {
        return var_ecce4aadde6676e5;
    }
    if (function_32125eba262380c7(scriptablename) || function_f48bd2f51721f2fd(scriptablename) || function_7a345d3f5a65278c(scriptablename)) {
        return 0;
    }
    return 1;
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9f88
// Size: 0xed
function loothide(instance, part) {
    scriptablename = lootGetScriptableName(instance);
    if (!isdefined(part)) {
        part = instance.type;
    }
    if (isdefined(scriptablename) && isquesttablet(scriptablename)) {
        if (flags::gameflag("prematch_done")) {
            level notify("tablethide_kill_callout_" + instance.origin);
        }
        if (getdvarint(@"hash_82bde055b11e6698", 0)) {
            namespace_bd5b51637804dbad::onquesttablethide(instance);
        } else {
            namespace_c133516bfc1d803c::function_4d5dd20e109455f2(instance);
        }
    }
    instance namespace_ede58c1e66c2c280::function_6bc4f6b579285f79();
    if (instance getscriptableisreserved() && !istrue(instance.keepinmap)) {
        if (isdefined(instance.brpickupscriptableid)) {
            deregisterscriptableinstance(instance);
        }
        instance freescriptable();
    } else if (!istrue(instance.var_7b4388c3a450812a)) {
        instance setscriptablepartstate(part, "hidden");
    }
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa07c
// Size: 0x3a1
function br_forcegivecustompickupitem(player, scriptablename, var_43fb3d97abb79854, var_8e4538d786fb9418, var_7f437a5779c8787c, var_1e736a37c3737585) {
    if (istrue(var_1e736a37c3737585)) {
        player dropbrcustompickupitem(scriptablename, var_8e4538d786fb9418, var_7f437a5779c8787c, var_1e736a37c3737585);
        return 1;
    }
    var_60227bff1e9478cc = spawnstruct();
    var_60227bff1e9478cc.scriptablename = scriptablename;
    var_60227bff1e9478cc.origin = player.origin;
    var_60227bff1e9478cc.count = 0;
    var_60227bff1e9478cc.maxcount = level.br_pickups.maxcounts[var_60227bff1e9478cc.scriptablename];
    var_60227bff1e9478cc.stackable = level.br_pickups.stackable[var_60227bff1e9478cc.scriptablename];
    if (istrue(var_7f437a5779c8787c) && isdefined(player.br_kiosk)) {
        var_60227bff1e9478cc.var_96c7526f4ab04875 = distance2d(player.origin, player.br_kiosk.origin) / 2;
    }
    if (isdefined(var_8e4538d786fb9418)) {
        var_60227bff1e9478cc.count = var_8e4538d786fb9418;
    }
    if (!var_60227bff1e9478cc.count && isdefined(level.br_pickups.counts[var_60227bff1e9478cc.scriptablename])) {
        var_60227bff1e9478cc.count = level.br_pickups.counts[var_60227bff1e9478cc.scriptablename];
    }
    results = player cantakepickup(var_60227bff1e9478cc, 1);
    if (results == 1) {
        lootid = loot::function_fae5e1d3de32d3f7(var_60227bff1e9478cc.scriptablename);
        if (namespace_a548bd428a566cf3::isarmorplate(var_60227bff1e9478cc.scriptablename) && namespace_e50e624d9af51c8c::function_7e103028c464ab9a(var_60227bff1e9478cc.scriptablename)) {
            equipname = level.br_pickups.br_equipname[var_60227bff1e9478cc.scriptablename];
            slot = level.equipment.table[equipname].defaultslot;
            var_9ffb530e039a041 = player namespace_1a507865f681850e::getequipmentslotammo(slot);
            if (!isdefined(var_9ffb530e039a041)) {
                var_9ffb530e039a041 = 0;
            }
            var_7b207409ae007577 = spawnstruct();
            var_7b207409ae007577.scriptablename = scriptablename;
            var_7b207409ae007577.count = var_60227bff1e9478cc.count - level.br_pickups.var_4138f9ddc1cd22d[scriptablename] - var_9ffb530e039a041;
            if (var_7b207409ae007577.count > 0) {
                player namespace_e50e624d9af51c8c::addItemToBackpack(lootid, var_7b207409ae007577);
                var_60227bff1e9478cc.count = var_60227bff1e9478cc.count - var_7b207409ae007577.count;
            }
        }
        player onusecompleted(var_60227bff1e9478cc, var_43fb3d97abb79854, undefined, var_7f437a5779c8787c);
        return 1;
    } else if (results == 20) {
        lootid = undefined;
        if (namespace_a548bd428a566cf3::isammo(var_60227bff1e9478cc.scriptablename)) {
            lootid = loot::getLootIDFromRef(var_60227bff1e9478cc.scriptablename);
        } else {
            lootid = loot::function_fae5e1d3de32d3f7(var_60227bff1e9478cc.scriptablename);
        }
        if (isdefined(lootid)) {
            if (isweaponpickupitem(var_60227bff1e9478cc) || function_4294e9b331377c31(var_60227bff1e9478cc.scriptablename)) {
                var_60227bff1e9478cc.count = 1;
            }
            player namespace_e50e624d9af51c8c::addItemToBackpack(lootid, var_60227bff1e9478cc);
            return 1;
        }
    }
    return 0;
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xa425
// Size: 0x33
function resetplayerinventorywithdelay(var_90d292bfa34cac7d, var_9e83064e74fa428c) {
    level endon("game_ended");
    self endon("death");
    self endon("disconnect");
    wait(var_90d292bfa34cac7d);
    resetplayerinventory(var_9e83064e74fa428c);
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa45f
// Size: 0xee
function resetplayerinventory(var_9e83064e74fa428c, var_f7e8a863407717b3, playerkilled) {
    var_7de7c04bf49817c = game_utility::getsubgametype() == "kingslayer";
    self.br_inventory_slots = [];
    if (!namespace_b8ca654fc4c2dd79::isfeaturedisabled("armor")) {
        if (!istrue(var_f7e8a863407717b3)) {
            armor::breakarmor();
        }
    }
    if (!istrue(var_9e83064e74fa428c)) {
        breakgasmaskbr();
        if (!level.allowsupers) {
            resetsuper(playerkilled);
        }
        if (isdefined(self.streakdata) && !var_7de7c04bf49817c) {
            killstreaks::removekillstreak(1);
        }
        br_weapons::stripweaponsfromplayer();
        equipment::takeequipment("primary");
        equipment::takeequipment("secondary");
        equipment::takeequipment("super");
        weapons::setlastdroppableweaponobj(makeweapon("iw9_me_fists_mp"));
        if (namespace_126f4192a2d090c4::function_c0d385a09d173a36()) {
            namespace_126f4192a2d090c4::function_19868614946c4df4();
        }
        if (namespace_a548bd428a566cf3::hasselfrevivetoken()) {
            removeselfrevivetoken();
        }
    }
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa554
// Size: 0x45
function resetsuper(playerkilled) {
    supers::clearsuper(undefined, undefined, playerkilled);
    equipment::takeequipment("super");
    self setclientomnvar("ui_perk_package_state", 0);
    thread namespace_85d036cb78063c4a::function_93b5448ea8f6277b(0);
    namespace_b16531563568eaba::function_351fe4ac57ca37e5(self, "super");
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa5a0
// Size: 0xc4
function resetdefaultweaponammo(magcount) {
    weaponslist = self getweaponslistall();
    for (idx = 0; idx < weaponslist.size; idx++) {
        weapon = weaponslist[idx];
        stockammo = 0;
        if (weapon.inventorytype == "primary") {
            if (isdefined(magcount)) {
                var_d63c71101d308076 = weapon.clipsize;
                stockammo = var_d63c71101d308076 * (magcount - 1);
            } else if (level.magcount > 0) {
                var_d63c71101d308076 = weapon.clipsize;
                stockammo = var_d63c71101d308076 * (level.magcount - 1);
            } else {
                var_d63c71101d308076 = 0;
            }
            self setweaponammoclip(weapon, var_d63c71101d308076);
        }
    }
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa66b
// Size: 0x25
function initplayer(var_756150045b2b7ad8) {
    br_weapons::br_ammo_player_clear();
    resetplayerinventory(var_756150045b2b7ad8);
    level thread function_cf83a47b811bd132(self);
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa697
// Size: 0xbb
function function_cf83a47b811bd132(player) {
    if (!namespace_e50e624d9af51c8c::isBackpackInventoryEnabled() || !getdvarint(@"hash_48d4e35a894b5aff", 1)) {
        return;
    }
    player notify("watch_backpack_size");
    level endon("game_ended");
    player endon("disconnect");
    player endon("watch_backpack_size");
    if (!flags::gameflag("prematch_done")) {
        flags::gameflagwait("prematch_done");
    }
    while (1) {
        if (isdefined(player.attached_bag)) {
            var_39d303a2954e0791 = function_877ff2bc34ed0e27(player);
            if (!isdefined(player.var_9190265f4c5ca4c0) || player.var_9190265f4c5ca4c0 != var_39d303a2954e0791) {
                function_8933b487e22ee213(player, var_39d303a2954e0791);
            }
        }
        wait(1);
    }
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa759
// Size: 0x7d
function function_877ff2bc34ed0e27(player) {
    var_4755865f44ed3d7e = namespace_e50e624d9af51c8c::function_6fe7e7891d125c48(player);
    var_4ac0d9de9d828350 = namespace_e50e624d9af51c8c::function_b13e35608b336d65(player);
    if (var_4ac0d9de9d828350 <= 0) {
        return "";
    }
    ratio = var_4755865f44ed3d7e / var_4ac0d9de9d828350;
    var_43f0ad7c4532c785 = "";
    if (ratio == 1) {
        var_43f0ad7c4532c785 = "bgfull";
    } else if (ratio >= 0.5) {
        var_43f0ad7c4532c785 = "bghalf";
    }
    return var_43f0ad7c4532c785;
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa7de
// Size: 0x2e
function function_8933b487e22ee213(player, var_43f0ad7c4532c785) {
    player function_1863f51c1339d80f(function_1823ff50bb28148d(var_43f0ad7c4532c785));
    player.var_9190265f4c5ca4c0 = var_43f0ad7c4532c785;
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xa813
// Size: 0x377
function spawndebugpickupfromdevgui(scriptablename, critical, quantity) {
    foreach (player in level.players) {
        if (!isbot(player) && isalive(player)) {
            spawnpos = player.origin + anglestoforward(player.angles) * 100 + (0, 0, 12);
            initialcount = 0;
            if (isdefined(level.br_pickups.counts[scriptablename])) {
                initialcount = level.br_pickups.counts[scriptablename];
            }
            if (isdefined(quantity)) {
                initialcount = int(quantity);
            }
            var_cb4fad49263e20c4 = getitemdropinfo(spawnpos);
            perks = [];
            if (scriptablename == "brloot_perkpack_custom") {
                var_cb4fad49263e20c4.var_a0597a25c511b0ac = [0:#"customPerkPackage"];
                for (i = 0; i < 4; i++) {
                    var_24a56bbb3eeae81e = randomint(level.var_a1ad2758fcbd2f5e.size);
                    perk = function_5162a2aaad39b2c7(level.var_a1ad2758fcbd2f5e, var_24a56bbb3eeae81e);
                    perks[perks.size] = perk;
                    var_cb4fad49263e20c4.var_a0597a25c511b0ac[var_cb4fad49263e20c4.var_a0597a25c511b0ac.size] = namespace_38b993c4618e76cd::getLootIDFromRef(perk);
                }
            }
            item = spawnpickup(scriptablename, var_cb4fad49263e20c4, initialcount);
            if (scriptablename == "brloot_perkpack_custom") {
                item.perks = perks;
            }
            if (istrue(critical)) {
                item.var_bbc200bc77c5db2b = 1;
                item.var_8c6ce30a6a5126b1 = 1;
            }
            if (function_55f0daea8408e3a9(scriptablename)) {
                namespace_f3c34c81dcc60eda::function_3e7ee85cb0d3504c(item);
            }
            if (isquesttablet(scriptablename)) {
                namespace_c133516bfc1d803c::function_8a25384bacdd7b79(item, scriptablename);
            }
            if (isdefined(item)) {
                contents = trace::create_contents(0, 1, 0, 0, 0, 1, 1, 0, 0);
                ignorelist = [];
                caststart = item.origin + (0, 0, 50);
                castend = caststart + (0, 0, -200);
                traceresult = trace::ray_trace(caststart, castend, ignorelist, contents);
                if (isdefined(traceresult["entity"]) && isdefined(traceresult["entity"].targetname) && traceresult["entity"].targetname == "train_wz") {
                    trainent = traceresult["entity"];
                    var_ea3b9640a6ad3c8e = rotatevectorinverted(item.origin - trainent.origin, trainent.angles);
                    localangles = combineangles(invertangles(trainent.angles), item.angles);
                    item utility::function_6e506f39f121ea8a(trainent, var_ea3b9640a6ad3c8e, localangles);
                }
            }
        }
    }
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xab91
// Size: 0x118
function function_c87696a022a2c6fc(var_d9407d0d9c222ce7) {
    size = level.br_pickups.var_d93566a78e29d583.size;
    rows = sqrt(size);
    var_c3eaab1a20ff3cc = level.players[0].origin;
    curIndex = 0;
    foreach (index, value in level.br_pickups.var_7b2bff2d04ee1017) {
        if (istrue(var_d9407d0d9c222ce7) && isweaponpickup(index)) {
            continue;
        }
        curIndex = curIndex + 1;
        var_cb4fad49263e20c4 = getitemdropinfo(var_c3eaab1a20ff3cc + (20 * curIndex % rows, 20 * int(curIndex / rows), 0));
        item = spawnpickup(index, var_cb4fad49263e20c4, 1);
    }
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xacb0
// Size: 0x194
function function_510f82785bd2c148() {
    var_937af88187007c23 = [];
    foreach (scriptablename, type in level.br_pickups.br_itemtype) {
        if (type == #"cache" && (scriptablename == "dmz_crate_wood" || issubstr(scriptablename, "br_loot"))) {
            var_937af88187007c23[var_937af88187007c23.size] = scriptablename;
        }
    }
    size = var_937af88187007c23.size;
    rows = sqrt(size);
    var_c3eaab1a20ff3cc = level.players[0].origin;
    curIndex = 0;
    foreach (scriptable in var_937af88187007c23) {
        curIndex = curIndex + 1;
        var_cb4fad49263e20c4 = getitemdropinfo(var_c3eaab1a20ff3cc + (60 * curIndex % rows, 60 * int(curIndex / rows), 0));
        item = spawnpickup(scriptable, var_cb4fad49263e20c4, 1);
        if (isdefined(item) && item getscriptablehaspart("body")) {
            item setscriptablepartstate("body", "closed_usable");
        }
    }
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xae4b
// Size: 0x16f
function function_b158d838449b637e(var_4fd8eb3a32c6a55e) {
    var_cb4fad49263e20c4 = getitemdropinfo(level.players[0].origin);
    cache = spawnpickup("br_loot_cache", var_cb4fad49263e20c4, 1);
    if (!isdefined(cache)) {
        return;
    }
    cache.contents = [];
    var_b6da601dccc1197 = strtok(var_4fd8eb3a32c6a55e, ",");
    foreach (id in var_b6da601dccc1197) {
        currentindex = cache.contents.size;
        cache.contents[currentindex] = [];
        cache.contents[currentindex]["lootID"] = int(id);
        cache.contents[currentindex]["quantity"] = 1;
        scriptablename = loot::getScriptableFromLootID(int(id));
        if (isdefined(scriptablename) && isweaponpickup(scriptablename)) {
            cache.contents[currentindex]["ref"] = scriptablename;
        }
    }
    if (cache getscriptablehaspart("body")) {
        cache setscriptablepartstate("body", "closed_usable");
    }
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xafc1
// Size: 0xe5
function function_e2d83df8b282b199(var_4fd8eb3a32c6a55e) {
    var_cb4fad49263e20c4 = getitemdropinfo(level.players[0].origin);
    cache = spawnpickup("br_loot_cache", var_cb4fad49263e20c4, 1);
    if (!isdefined(cache)) {
        return;
    }
    items = [];
    var_b6da601dccc1197 = strtok(var_4fd8eb3a32c6a55e, ",");
    index = items.size;
    items[index] = [];
    id = utility::function_7a2aaa4a09a4d250(var_b6da601dccc1197);
    items[index]["lootID"] = int(id);
    items[index]["quantity"] = 1;
    loot::function_40b46e7298657a93(cache, level.players, items);
    if (cache getscriptablehaspart("body")) {
        cache setscriptablepartstate("body", "closed_usable");
    }
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb0ad
// Size: 0x45
function isweaponpickup(scriptablename) {
    return isdefined(level.br_pickups.br_itemtype[scriptablename]) && level.br_pickups.br_itemtype[scriptablename] == #"weapon";
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb0fa
// Size: 0x4a
function isweaponpickupitem(item) {
    if (!isdefined(item)) {
        return 0;
    }
    if (isdefined(item.scriptablename)) {
        return isweaponpickup(item.scriptablename);
    } else if (isdefined(item.weapon)) {
        return 1;
    }
    return 0;
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb14c
// Size: 0x79
function takearmorpickup(pickupent) {
    var_873c80e924a3f087 = level.br_pickups.br_equipname[pickupent.scriptablename];
    var_e233f90aec7bf0a = armor::function_cd4a78b4a236ddc8(var_873c80e924a3f087);
    if (var_e233f90aec7bf0a) {
        tryequiparmor(pickupent);
    }
    level notify("picked_up_item_" + pickupent.scriptablename + "_" + self.team, self);
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb1cc
// Size: 0x3b7
function function_4e335a6589199847(pickupent, var_a5b2c541413aa895, var_db943473454f6ea6, var_44ee85dcf52b4001, var_7f437a5779c8787c) {
    lootid = namespace_38b993c4618e76cd::function_fae5e1d3de32d3f7(pickupent.scriptablename);
    var_43044da0ed44d79f = namespace_708f627020de59d3::function_43044da0ed44d79f(pickupent.scriptablename);
    var_10bbeacb1429824e = 0;
    var_575ab8e8d68fbb42 = isdefined(self.var_28c944f222f4814.var_183ec729c8876d57);
    var_b46ab1e2531a4e2 = istrue(var_a5b2c541413aa895) || istrue(var_44ee85dcf52b4001) || !var_575ab8e8d68fbb42 || !isdefined(var_db943473454f6ea6) && !isdefined(var_44ee85dcf52b4001) || istrue(var_7f437a5779c8787c);
    var_a0fef687a228ba07 = namespace_aead94004cf4c147::function_7e103028c464ab9a(pickupent.scriptablename) && namespace_aead94004cf4c147::canItemFitInBackpack(lootid, pickupent.count);
    var_a5ba66a3a80e70f7 = var_a0fef687a228ba07 && !var_b46ab1e2531a4e2 && namespace_aead94004cf4c147::function_7e103028c464ab9a(pickupent.scriptablename);
    var_40467635b1225b49 = istrue(var_7f437a5779c8787c) && var_a0fef687a228ba07 && var_575ab8e8d68fbb42;
    var_abeeb0d8e08896fd = var_b46ab1e2531a4e2 && var_575ab8e8d68fbb42 && !istrue(var_44ee85dcf52b4001) && !var_40467635b1225b49;
    targetent = pickupent;
    var_aee3b96540ed46e1 = ter_op(var_575ab8e8d68fbb42, namespace_708f627020de59d3::function_43044da0ed44d79f(self.var_28c944f222f4814.var_183ec729c8876d57), 0);
    perks = function_2f886a8000750771();
    if (istrue(var_44ee85dcf52b4001) && !isdefined(var_db943473454f6ea6) && isdefined(self.var_2fa5b49969def47)) {
        scriptablename = lootGetScriptableName(self.var_2fa5b49969def47);
        if (function_36de08ea672b354c(scriptablename)) {
            targetent = function_7e7b315fcb2b9159(pickupent);
            targetent.origin = self.var_2fa5b49969def47.origin;
            targetent.angles = self.var_2fa5b49969def47.angles;
            if (isdefined(self.var_2fa5b49969def47.perks)) {
                targetent.perks = self.var_2fa5b49969def47.perks;
            }
        }
    }
    if (var_b46ab1e2531a4e2 || var_a5ba66a3a80e70f7) {
        var_eeeae9defa0c1e95 = undefined;
        if (var_575ab8e8d68fbb42) {
            var_eeeae9defa0c1e95 = namespace_38b993c4618e76cd::function_fae5e1d3de32d3f7(self.var_28c944f222f4814.var_183ec729c8876d57);
        }
        if (var_40467635b1225b49) {
            index = namespace_aead94004cf4c147::getAvailableDMZBackpackIndex();
            if (isdefined(index)) {
                if (namespace_708f627020de59d3::function_43044da0ed44d79f(self.var_28c944f222f4814.var_183ec729c8876d57)) {
                    namespace_708f627020de59d3::function_222999aad19f5b52(index, self.var_28c944f222f4814.perks);
                }
                namespace_aead94004cf4c147::function_a0ccc23064473a05(self, index, var_eeeae9defa0c1e95, 1);
                namespace_708f627020de59d3::function_19868614946c4df4();
                var_575ab8e8d68fbb42 = 0;
                var_eeeae9defa0c1e95 = undefined;
            } else if (var_575ab8e8d68fbb42) {
                var_abeeb0d8e08896fd = 1;
            }
        }
        namespace_708f627020de59d3::function_c3023358dc648bf1(targetent, var_abeeb0d8e08896fd, var_a5b2c541413aa895, var_db943473454f6ea6, var_44ee85dcf52b4001);
        if (isdefined(var_eeeae9defa0c1e95) && istrue(var_44ee85dcf52b4001) && var_575ab8e8d68fbb42) {
            quantity = 1;
            var_99d72c999b9a85fa = 0;
            if (var_aee3b96540ed46e1 && isdefined(perks)) {
                var_bffcb26249870cb0 = function_b29b252cdfa9a7d6(perks);
                var_99d72c999b9a85fa = var_bffcb26249870cb0[1];
                quantity = var_bffcb26249870cb0[0];
            }
            namespace_aead94004cf4c147::function_3c3ee4c5700e0e32(self, var_db943473454f6ea6, var_eeeae9defa0c1e95, quantity, 1, 6, var_99d72c999b9a85fa);
        } else if (istrue(var_44ee85dcf52b4001) && !var_575ab8e8d68fbb42) {
            quantity = 1;
            if (var_43044da0ed44d79f) {
                quantity = namespace_e50e624d9af51c8c::function_897b29adb37f06a7(var_db943473454f6ea6);
            }
            namespace_aead94004cf4c147::function_db1dd76061352e5b(var_db943473454f6ea6, quantity);
        }
    } else {
        var_10bbeacb1429824e = 1;
    }
    return var_10bbeacb1429824e;
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xb58b
// Size: 0x3cf
function function_1df16a3922616cd8(pickupent, var_7f437a5779c8787c, var_db943473454f6ea6, var_44ee85dcf52b4001) {
    equipname = level.br_pickups.br_equipname[pickupent.scriptablename];
    slot = level.equipment.table[equipname].defaultslot;
    lootid = loot::function_fae5e1d3de32d3f7(pickupent.scriptablename);
    var_10bbeacb1429824e = 0;
    if (pickupissameasequipmentslot(equipname, slot)) {
        var_5324597edfaff57c = equipment::getequipmentslotammo(slot);
        if (var_5324597edfaff57c == 0 && pickupent.count > 0) {
            namespace_b16531563568eaba::function_f5b2810055f85ead(self, slot, lootid);
            hb_sensor::function_30cd943d877dc29f(pickupent.count);
            equipment::setequipmentammo(equipname, 1);
        }
        if (isdefined(var_db943473454f6ea6)) {
            namespace_e50e624d9af51c8c::function_84772ebf836af5db(var_db943473454f6ea6, pickupent.count * -1);
            namespace_b16531563568eaba::function_351fe4ac57ca37e5(self, slot);
        }
        if (var_5324597edfaff57c > 0) {
            if (namespace_e50e624d9af51c8c::function_7e103028c464ab9a(pickupent.scriptablename)) {
                lootid = loot::function_fae5e1d3de32d3f7(pickupent.scriptablename);
                namespace_e50e624d9af51c8c::addItemToBackpack(lootid, pickupent);
            } else {
                var_3a4d41c141d89042 = pickupent.count;
                var_57d1237e118f28d7 = hb_sensor::function_db61876aca4e4cd3();
                if (var_3a4d41c141d89042 > var_57d1237e118f28d7) {
                    var_10bbeacb1429824e = pickupent.count;
                    hb_sensor::function_30cd943d877dc29f(var_3a4d41c141d89042);
                }
            }
        }
    } else if (!isdefined(self.equipment[slot]) || equipment::getequipmentslotammo(slot) == 0) {
        equipment::giveequipment(equipname, slot);
        hb_sensor::function_30cd943d877dc29f(pickupent.count);
        equipment::setequipmentammo(equipname, 1);
        if (isdefined(var_db943473454f6ea6)) {
            var_9145f7d1b47a57d4 = namespace_b16531563568eaba::function_f1c7356a808e9bd9(slot);
            namespace_e50e624d9af51c8c::function_b4e3d555d6d737bb(self, var_db943473454f6ea6, var_9145f7d1b47a57d4);
        } else {
            namespace_b16531563568eaba::function_f5b2810055f85ead(self, slot, lootid);
        }
    } else if (namespace_e50e624d9af51c8c::function_7e103028c464ab9a(pickupent.scriptablename) && !isdefined(var_db943473454f6ea6) && function_82c2dc3d57d67f52()) {
        lootid = loot::function_fae5e1d3de32d3f7(pickupent.scriptablename);
        if (namespace_e50e624d9af51c8c::canItemFitInBackpack(lootid, pickupent.count)) {
            var_feb782334dd23a66 = utility::array_find(level.br_pickups.br_equipname, self.equipment[slot]);
            lootid = loot::function_fae5e1d3de32d3f7(var_feb782334dd23a66);
            var_60227bff1e9478cc = spawnstruct();
            var_60227bff1e9478cc.scriptablename = var_feb782334dd23a66;
            var_60227bff1e9478cc.count = pickupent.count;
            if (isdefined(pickupent.var_96c7526f4ab04875)) {
                var_60227bff1e9478cc.var_96c7526f4ab04875 = pickupent.var_96c7526f4ab04875;
            }
            namespace_e50e624d9af51c8c::addItemToBackpack(lootid, var_60227bff1e9478cc);
        } else {
            dropstruct = function_7b9f3966a7a42003();
            dropequipmentinslot(dropstruct, slot, var_7f437a5779c8787c, undefined, var_db943473454f6ea6, undefined, undefined, undefined, pickupent);
        }
        namespace_b16531563568eaba::function_f5b2810055f85ead(self, slot, lootid);
    } else {
        if (isdefined(var_db943473454f6ea6)) {
            namespace_e50e624d9af51c8c::function_84772ebf836af5db(var_db943473454f6ea6, pickupent.count * -1);
            namespace_b16531563568eaba::function_351fe4ac57ca37e5(self, slot);
        }
        if (!istrue(level.var_ad82058550e7696b)) {
            dropstruct = function_7b9f3966a7a42003();
            dropequipmentinslot(dropstruct, slot, var_7f437a5779c8787c, undefined, var_db943473454f6ea6, undefined, undefined, undefined, pickupent);
        }
        equipment::giveequipment(equipname, slot);
        equipment::setequipmentammo(equipname, 1);
        hb_sensor::function_30cd943d877dc29f(pickupent.count);
        namespace_b16531563568eaba::function_f5b2810055f85ead(self, slot, lootid);
    }
    return var_10bbeacb1429824e;
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb962
// Size: 0x5aa
function takeequipmentpickup(pickupent, var_7f437a5779c8787c, var_db943473454f6ea6, var_44ee85dcf52b4001) {
    equipname = level.br_pickups.br_equipname[pickupent.scriptablename];
    slot = level.equipment.table[equipname].defaultslot;
    lootid = loot::function_fae5e1d3de32d3f7(pickupent.scriptablename);
    var_10bbeacb1429824e = 0;
    if (pickupissameasequipmentslot(equipname, slot)) {
        if (equipmentslothasroom(pickupent.scriptablename, slot)) {
            var_5324597edfaff57c = equipment::getequipmentslotammo(slot);
            var_b5cdf4d935e6ac13 = equipment::getequipmentmaxammo(equipname);
            if (var_5324597edfaff57c == 0 && pickupent.count > 0) {
                namespace_b16531563568eaba::function_f5b2810055f85ead(self, slot, lootid);
            }
            if (var_5324597edfaff57c + pickupent.count > var_b5cdf4d935e6ac13) {
                var_97c23a1323acc7df = var_b5cdf4d935e6ac13 - var_5324597edfaff57c;
                equipment::setequipmentammo(equipname, var_b5cdf4d935e6ac13);
                pickupent.count = pickupent.count - var_97c23a1323acc7df;
                var_10bbeacb1429824e = pickupent.count;
            } else {
                equipment::incrementequipmentslotammo(slot, pickupent.count);
            }
            if (namespace_e50e624d9af51c8c::isBackpackInventoryEnabled() && equipname == "equip_throwing_knife" && !perk::_hasperk("specialty_equip_throwingKnife")) {
                namespace_70a9c767ad1878e5::throwing_knife_mp_ongive(equipname);
            }
            if (isdefined(var_db943473454f6ea6)) {
                namespace_e50e624d9af51c8c::function_84772ebf836af5db(var_db943473454f6ea6, -1 * (var_b5cdf4d935e6ac13 - var_5324597edfaff57c));
                var_10bbeacb1429824e = 0;
            }
            if (var_10bbeacb1429824e && namespace_e50e624d9af51c8c::function_7e103028c464ab9a(pickupent.scriptablename) && !isdefined(var_db943473454f6ea6) && function_82c2dc3d57d67f52()) {
                lootid = loot::function_fae5e1d3de32d3f7(pickupent.scriptablename);
                namespace_e50e624d9af51c8c::addItemToBackpack(lootid, pickupent);
                var_10bbeacb1429824e = 0;
            }
        } else if (namespace_e50e624d9af51c8c::function_7e103028c464ab9a(pickupent.scriptablename) && !istrue(var_44ee85dcf52b4001) && function_82c2dc3d57d67f52()) {
            lootid = loot::function_fae5e1d3de32d3f7(pickupent.scriptablename);
            namespace_e50e624d9af51c8c::addItemToBackpack(lootid, pickupent);
            var_10bbeacb1429824e = 0;
        }
    } else if (!isdefined(self.equipment[slot]) || equipment::getequipmentslotammo(slot) == 0) {
        var_b5cdf4d935e6ac13 = equipment::getequipmentmaxammo(equipname);
        equipment::giveequipment(equipname, slot);
        if (pickupent.count > var_b5cdf4d935e6ac13) {
            var_97c23a1323acc7df = var_b5cdf4d935e6ac13;
            equipment::setequipmentammo(equipname, var_b5cdf4d935e6ac13);
            pickupent.count = pickupent.count - var_97c23a1323acc7df;
            var_10bbeacb1429824e = pickupent.count;
        } else {
            equipment::setequipmentammo(equipname, pickupent.count);
        }
        if (var_10bbeacb1429824e && namespace_e50e624d9af51c8c::function_7e103028c464ab9a(pickupent.scriptablename) && function_82c2dc3d57d67f52()) {
            lootid = loot::function_fae5e1d3de32d3f7(pickupent.scriptablename);
            namespace_e50e624d9af51c8c::addItemToBackpack(lootid, pickupent);
            var_10bbeacb1429824e = 0;
        }
        if (isdefined(var_db943473454f6ea6)) {
            var_9145f7d1b47a57d4 = namespace_b16531563568eaba::function_f1c7356a808e9bd9(slot);
            namespace_e50e624d9af51c8c::function_b4e3d555d6d737bb(self, var_db943473454f6ea6, var_9145f7d1b47a57d4);
        } else {
            namespace_b16531563568eaba::function_f5b2810055f85ead(self, slot, lootid);
        }
    } else if (namespace_e50e624d9af51c8c::function_7e103028c464ab9a(pickupent.scriptablename) && !isdefined(var_db943473454f6ea6) && function_82c2dc3d57d67f52()) {
        lootid = loot::function_fae5e1d3de32d3f7(pickupent.scriptablename);
        if (namespace_e50e624d9af51c8c::canItemFitInBackpack(lootid, pickupent.count)) {
            var_feb782334dd23a66 = utility::array_find(level.br_pickups.br_equipname, self.equipment[slot]);
            lootid = loot::function_fae5e1d3de32d3f7(var_feb782334dd23a66);
            ammocount = equipment::getequipmentslotammo(slot);
            var_60227bff1e9478cc = spawnstruct();
            var_60227bff1e9478cc.scriptablename = var_feb782334dd23a66;
            var_60227bff1e9478cc.count = ammocount;
            if (isdefined(pickupent.var_96c7526f4ab04875)) {
                var_60227bff1e9478cc.var_96c7526f4ab04875 = pickupent.var_96c7526f4ab04875;
            }
            namespace_e50e624d9af51c8c::addItemToBackpack(lootid, var_60227bff1e9478cc);
            equipment::giveequipment(equipname, slot);
            equipment::setequipmentammo(equipname, pickupent.count);
            var_10bbeacb1429824e = 0;
        } else {
            dropstruct = function_7b9f3966a7a42003();
            dropequipmentinslot(dropstruct, slot, var_7f437a5779c8787c, undefined, var_db943473454f6ea6, undefined, undefined, undefined, pickupent);
            equipment::giveequipment(equipname, slot);
            equipment::setequipmentammo(equipname, pickupent.count);
            var_10bbeacb1429824e = 0;
        }
        namespace_b16531563568eaba::function_f5b2810055f85ead(self, slot, lootid);
    } else {
        if (isdefined(var_db943473454f6ea6)) {
            if (pickupent.maxcount == 0) {
                pickupent.maxcount = level.br_pickups.var_4138f9ddc1cd22d[pickupent.scriptablename];
            }
            var_3fa041e4f059bc71 = min(pickupent.maxcount, pickupent.count);
            namespace_e50e624d9af51c8c::function_84772ebf836af5db(var_db943473454f6ea6, -1 * var_3fa041e4f059bc71);
            namespace_b16531563568eaba::function_351fe4ac57ca37e5(self, slot);
        }
        if (!istrue(level.var_ad82058550e7696b)) {
            dropstruct = function_7b9f3966a7a42003();
            dropequipmentinslot(dropstruct, slot, var_7f437a5779c8787c, undefined, var_db943473454f6ea6, undefined, undefined, undefined, pickupent);
        }
        equipment::giveequipment(equipname, slot);
        equipment::setequipmentammo(equipname, pickupent.count);
        namespace_b16531563568eaba::function_f5b2810055f85ead(self, slot, lootid);
    }
    return var_10bbeacb1429824e;
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 9, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbf14
// Size: 0x394
function dropequipmentinslot(dropstruct, slot, var_7f437a5779c8787c, var_9bcb02c2619fe05a, var_db943473454f6ea6, var_1ad2db70c8d01f51, itemtype, var_4c6eba41707c461f, pickup) {
    ammocount = equipment::getequipmentslotammo(slot);
    if (slot == "super") {
        if (namespace_282db5a41b643e19::function_66f0cbd5ff8458fe() && namespace_85d036cb78063c4a::issuperready()) {
            ammocount = 1;
        } else if (namespace_85d036cb78063c4a::isUsingSuperWeapon()) {
            ammocount = namespace_85d036cb78063c4a::function_3889d69492a93008();
        }
    }
    if (isdefined(var_9bcb02c2619fe05a)) {
        ammocount = var_9bcb02c2619fe05a;
    }
    if (!isdefined(var_1ad2db70c8d01f51)) {
        var_1ad2db70c8d01f51 = 1;
    }
    if (ammocount <= 0) {
        return;
    }
    var_feb782334dd23a66 = utility::array_find(level.br_pickups.br_equipname, self.equipment[slot]);
    if (isdefined(var_feb782334dd23a66)) {
        function_73ffc9bcd6d1e62d(var_7f437a5779c8787c);
        if (isdefined(var_db943473454f6ea6)) {
            lootid = loot::function_fae5e1d3de32d3f7(var_feb782334dd23a66);
            var_60227bff1e9478cc = spawnstruct();
            var_60227bff1e9478cc.scriptablename = namespace_e50e624d9af51c8c::function_91c1be871300a518(lootid);
            var_60227bff1e9478cc.count = ammocount;
            namespace_e50e624d9af51c8c::addItemToBackpack(lootid, var_60227bff1e9478cc, undefined, undefined, var_7f437a5779c8787c);
        } else {
            var_285b7129b392cf3d = 0;
            lootid = loot::function_fae5e1d3de32d3f7(var_feb782334dd23a66);
            scriptablename = namespace_e50e624d9af51c8c::function_91c1be871300a518(lootid);
            if (isdefined(itemtype)) {
                var_285b7129b392cf3d = quickdropaddtoexisting(itemtype, scriptablename, ammocount);
            }
            if (var_285b7129b392cf3d) {
                return;
            }
            var_96c7526f4ab04875 = undefined;
            var_7591ed99e87a77d3 = undefined;
            if (isdefined(pickup)) {
                if (isdefined(pickup.var_3b53bc0eee6ae84e)) {
                    var_96c7526f4ab04875 = pickup.var_3b53bc0eee6ae84e;
                }
                if (isdefined(pickup.origin)) {
                    var_7591ed99e87a77d3 = pickup.origin;
                }
            }
            baseorigin = self.origin;
            baseangles = self.angles;
            var_ad49a38dd7c4c10f = level.br_pickups.var_ad49a38dd7c4c10f;
            if (istrue(var_7f437a5779c8787c) && isdefined(self.br_kiosk)) {
                baseorigin = utility::function_53c4c53197386572(self.br_kiosk.var_afc028d00356e443, self.br_kiosk.origin);
                baseangles = self.br_kiosk.angles;
                var_ad49a38dd7c4c10f = undefined;
                if (isdefined(self.br_kiosk.var_bf8e5f003146af44)) {
                    baseorigin = self.br_kiosk.var_bf8e5f003146af44.origin + rotatevector(baseorigin, self.br_kiosk.var_bf8e5f003146af44.angles);
                }
            }
            var_cb4fad49263e20c4 = getitemdroporiginandangles(dropstruct, baseorigin, baseangles, self, var_ad49a38dd7c4c10f, var_96c7526f4ab04875, undefined, undefined, var_7591ed99e87a77d3);
            if (issuperpickup(scriptablename)) {
                var_1ad2db70c8d01f51 = getdvarint(@"hash_8c7fd24cb9dc68f0", 0) || var_1ad2db70c8d01f51 && isalive(self);
            }
            item = spawnpickup(var_feb782334dd23a66, var_cb4fad49263e20c4, ammocount, 1, undefined, var_1ad2db70c8d01f51);
            quickdropaddtocache(scriptablename, slot, item, var_cb4fad49263e20c4.origin, var_cb4fad49263e20c4.angles);
            function_2f4e0022c686dbe6(item);
            if (istrue(var_4c6eba41707c461f)) {
                quickdropplaysound(itemtype, var_cb4fad49263e20c4.origin, scriptablename, item);
            }
            namespace_e50e624d9af51c8c::function_c6306ea9715dd8f1(self, slot);
        }
    }
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc2af
// Size: 0x38
function pickupissameasequipmentslot(equipname, var_cbb2b3d05e48bd27) {
    if (isdefined(self.equipment[var_cbb2b3d05e48bd27]) && self.equipment[var_cbb2b3d05e48bd27] == equipname) {
        return 1;
    }
    return 0;
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc2ef
// Size: 0x50
function equipmentslothasroom(scriptablename, var_cbb2b3d05e48bd27) {
    var_1c437e4320e43045 = level.br_pickups.br_equipname[scriptablename];
    if (isdefined(var_1c437e4320e43045) && equipment::getequipmentslotammo(var_cbb2b3d05e48bd27) < equipment::getequipmentmaxammo(var_1c437e4320e43045)) {
        return 1;
    }
    return 0;
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc347
// Size: 0xa2
function function_e52b0b5ab01dfa0c(var_a1093166de09e6b8, var_257c3db6f4bfdd81) {
    lootid = loot::function_fae5e1d3de32d3f7(var_a1093166de09e6b8);
    currentitemcount = namespace_e50e624d9af51c8c::getTotalItemCountInBag(lootid);
    var_5bc83c04fc824511 = 0;
    maxcount = level.br_pickups.var_4138f9ddc1cd22d[var_a1093166de09e6b8];
    if (!isdefined(maxcount) || maxcount == 0) {
        maxcount = level.br_pickups.maxcounts[var_a1093166de09e6b8];
    }
    if (maxcount > 0) {
        var_5bc83c04fc824511 = floor(currentitemcount / maxcount);
    }
    if (var_5bc83c04fc824511 >= var_257c3db6f4bfdd81) {
        return 0;
    }
    return 1;
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc3f1
// Size: 0x2b
function takerespawntokenpickup(pickupent) {
    if (!respawntokendisabled() && !namespace_a548bd428a566cf3::hasrespawntoken()) {
        addrespawntoken();
        return 1;
    }
    return 0;
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc424
// Size: 0x59
function addrespawntoken(skipsplash) {
    player = self;
    /#
        assert(!istrue(player.hasrespawntoken));
    #/
    player.hasrespawntoken = 1;
    player namespace_a548bd428a566cf3::sethasrespawntokenextrainfo(1);
    if (!istrue(skipsplash)) {
        player thread hud_message::showsplash("br_respawn_token_pickup");
    }
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc484
// Size: 0x3a
function removerespawntoken() {
    player = self;
    /#
        assert(istrue(player.hasrespawntoken));
    #/
    player.hasrespawntoken = 0;
    player namespace_a548bd428a566cf3::sethasrespawntokenextrainfo(0);
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc4c5
// Size: 0x74
function function_68c46fe15ed38d9b(pickupent) {
    if (!namespace_a548bd428a566cf3::function_8b2396647673be50() && istrue(level.usegulag)) {
        if (!namespace_a548bd428a566cf3::function_15da77dc195bd80a()) {
            function_127474f04c3a06b5();
            return 1;
        }
        if (namespace_e50e624d9af51c8c::function_7e103028c464ab9a(pickupent.scriptablename)) {
            lootid = loot::function_fae5e1d3de32d3f7(pickupent.scriptablename);
            namespace_e50e624d9af51c8c::addItemToBackpack(lootid, pickupent);
            return 1;
        }
    }
    return 0;
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc541
// Size: 0x59
function function_127474f04c3a06b5(skipsplash) {
    player = self;
    /#
        assert(!istrue(player.var_15da77dc195bd80a));
    #/
    player.var_15da77dc195bd80a = 1;
    player namespace_a548bd428a566cf3::function_e58801acf7adcdc8(1);
    if (!istrue(skipsplash)) {
        player thread hud_message::showsplash("br_gulag_token_pickup");
    }
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc5a1
// Size: 0x3a
function function_17e127f2e3771058() {
    player = self;
    /#
        assert(istrue(player.var_15da77dc195bd80a));
    #/
    player.var_15da77dc195bd80a = 0;
    player namespace_a548bd428a566cf3::function_e58801acf7adcdc8(0);
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc5e2
// Size: 0x71
function takerevivepickup(pickupent, itemslotindex, var_44ee85dcf52b4001) {
    if (!namespace_a548bd428a566cf3::hasselfrevivetoken() || namespace_a548bd428a566cf3::hasselfrevivetoken() && !namespace_a548bd428a566cf3::function_723bd1ab3bb16b2b(self, pickupent.scriptablename)) {
        var_e250afaeae6d7b0b = namespace_38b993c4618e76cd::getLootIDFromRef(pickupent.scriptablename);
        addselfrevivetoken(undefined, var_e250afaeae6d7b0b, itemslotindex, var_44ee85dcf52b4001);
        return 1;
    }
    return 0;
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc65b
// Size: 0x5a
function function_966d64f200872160(pickupent) {
    player = self;
    if (!isdefined(player.var_61c274a3bd736bed)) {
        player.var_61c274a3bd736bed = [];
    }
    player.var_61c274a3bd736bed[player.var_61c274a3bd736bed.size] = pickupent.scriptablename;
    return 1;
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc6bd
// Size: 0x55
function function_ebf82cde71707ec8(var_eb0a92127237346e) {
    player = self;
    itemname = function_95c6391212a25f7c(var_eb0a92127237346e, "_voucher");
    var_7a704a1d0652ab82 = namespace_38b993c4618e76cd::function_fae5e1d3de32d3f7(itemname);
    function_d8cd9c1941a88194(var_7a704a1d0652ab82, 1, undefined, 1, undefined, undefined, undefined, undefined, 0, undefined, 1);
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc719
// Size: 0x1ea
function function_aaaa1b3dfe18885c(skipsplash, var_e250afaeae6d7b0b, itemslotindex, var_44ee85dcf52b4001) {
    player = self;
    scriptablename = namespace_38b993c4618e76cd::getScriptableFromLootID(var_e250afaeae6d7b0b);
    if (player namespace_a548bd428a566cf3::hasselfrevivetoken() && !namespace_a548bd428a566cf3::function_723bd1ab3bb16b2b(player, scriptablename)) {
        if (istrue(var_44ee85dcf52b4001) && isdefined(itemslotindex)) {
            var_bf28fcd9dfeac57e = namespace_a548bd428a566cf3::function_791e72676cd7b544(player);
            lootid = namespace_38b993c4618e76cd::function_fae5e1d3de32d3f7(var_bf28fcd9dfeac57e);
            namespace_aead94004cf4c147::function_3c3ee4c5700e0e32(player, itemslotindex, lootid, 1, 65535, 3);
            player removeselfrevivetoken();
        } else {
            dropstruct = function_7b9f3966a7a42003();
            player dropbrselfrevivetoken(dropstruct);
        }
    } else if (istrue(var_44ee85dcf52b4001) && isdefined(itemslotindex)) {
        player namespace_aead94004cf4c147::function_db1dd76061352e5b(itemslotindex);
    }
    player.var_6c05b62d5521a0b2 = spawnstruct();
    player.var_6c05b62d5521a0b2.name = scriptablename;
    player.var_6c05b62d5521a0b2.type = namespace_a548bd428a566cf3::function_56733d929b67a814(scriptablename);
    player.var_6c05b62d5521a0b2.perk = namespace_a548bd428a566cf3::function_8e65095b82c19d04(scriptablename);
    player setclientomnvar("ui_br_self_revive_type", player.var_6c05b62d5521a0b2.type);
    if (isdefined(player.var_6c05b62d5521a0b2.perk)) {
        player namespace_82dcd1d5ae30ff7::giveperk(player.var_6c05b62d5521a0b2.perk);
    }
    player namespace_a548bd428a566cf3::sethasselfrevivetokenextrainfo(1);
    if (!istrue(skipsplash)) {
        player thread hud_message::showsplash("br_self_revive_token_pickup");
    }
    var_4ad7c03ec4fa687 = level.maxteamsize == 1;
    if (var_4ad7c03ec4fa687 && !player perk::_hasperk("specialty_pistoldeath")) {
        player perk::giveperk("specialty_pistoldeath");
    }
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc90a
// Size: 0x55
function addselfrevivetoken(skipsplash, var_e250afaeae6d7b0b, itemslotindex, var_44ee85dcf52b4001) {
    if (!isdefined(var_e250afaeae6d7b0b)) {
        var_e250afaeae6d7b0b = 8548;
    }
    function_aaaa1b3dfe18885c(skipsplash, var_e250afaeae6d7b0b, itemslotindex, var_44ee85dcf52b4001);
    namespace_b16531563568eaba::function_c0ae57d4dc3a8eef(self, var_e250afaeae6d7b0b);
    level notify("picked_up_item_brloot_self_revive_" + self.team, self);
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc966
// Size: 0x99
function removeselfrevivetoken() {
    player = self;
    if (player namespace_a548bd428a566cf3::hasselfrevivetoken()) {
        var_f1ced1fc8297b8d2 = namespace_a548bd428a566cf3::function_7285c46ee8b26043(player);
        if (isdefined(var_f1ced1fc8297b8d2) && player namespace_82dcd1d5ae30ff7::_hasperk(var_f1ced1fc8297b8d2)) {
            player namespace_82dcd1d5ae30ff7::removeperk(var_f1ced1fc8297b8d2);
        }
        player namespace_a548bd428a566cf3::sethasselfrevivetokenextrainfo(0);
        var_4ad7c03ec4fa687 = level.maxteamsize == 1;
        if (var_4ad7c03ec4fa687 && player perk::_hasperk("specialty_pistoldeath")) {
            player perk::removeperk("specialty_pistoldeath");
        }
        namespace_b16531563568eaba::function_a60428cda4724a7(self);
        player.var_6c05b62d5521a0b2 = undefined;
    }
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xca06
// Size: 0xd5
function respawntokendisabled() {
    var_d5edac819916cb3e = !istrue(level.br_pickups.respawntokenenabled);
    var_1f53ada6cb3669b = istrue(level.br_pickups.respawntokenclosewithgulag) && isdefined(level.gulag) && istrue(level.gulag.shutdown);
    var_bb7e9c61e84a8808 = istrue(level.br_pickups.var_a181de0ed6a505d5) && isdefined(level.brgametype.var_c42e40ec22a1f0d4) && !istrue(level.brgametype.var_c42e40ec22a1f0d4);
    return getdvarint(@"hash_4d250e4873e1753e", 0) || var_d5edac819916cb3e || var_1f53ada6cb3669b || var_bb7e9c61e84a8808;
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcae3
// Size: 0xd8
function fillmaxarmorplate() {
    player = self;
    var_60227bff1e9478cc = spawnstruct();
    var_60227bff1e9478cc.scriptablename = "brloot_armor_plate";
    var_60227bff1e9478cc.equipname = level.br_pickups.br_equipname[var_60227bff1e9478cc.scriptablename];
    var_60227bff1e9478cc.origin = self.origin;
    var_60227bff1e9478cc.maxcount = equipment::getequipmentmaxammo(var_60227bff1e9478cc.equipname);
    var_60227bff1e9478cc.count = var_60227bff1e9478cc.maxcount;
    var_60227bff1e9478cc.stackable = level.br_pickups.stackable[var_60227bff1e9478cc.scriptablename];
    player takeequipmentpickup(var_60227bff1e9478cc);
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcbc2
// Size: 0x97
function takeaccesscardpickup(pickupent) {
    if (namespace_a548bd428a566cf3::hasaccesscard()) {
        dropstruct = function_7b9f3966a7a42003();
        var_ad49a38dd7c4c10f = undefined;
        var_cb4fad49263e20c4 = getitemdroporiginandangles(dropstruct, self.origin, self.angles, self, var_ad49a38dd7c4c10f, pickupent.var_96c7526f4ab04875, undefined, undefined, pickupent.origin);
        spawnpickup(self.accesscard, var_cb4fad49263e20c4, 1, 1);
    }
    addaccesscard(pickupent.scriptablename);
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcc60
// Size: 0x51
function addaccesscard(var_a9f79680ff8b04ab) {
    player = self;
    player.accesscard = var_a9f79680ff8b04ab;
    var_4dc292c559481471 = int(tablelookup("mp/braccess_card.csv", 1, var_a9f79680ff8b04ab, 0));
    player namespace_a548bd428a566cf3::updatebrscoreboardstat("bunkerKeycardType", var_4dc292c559481471);
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xccb8
// Size: 0x49
function removeaccesscard() {
    player = self;
    if (!getdvarint(@"hash_8c6e1c43e3d41dd3", 0)) {
        /#
            assert(namespace_a548bd428a566cf3::hasaccesscard());
        #/
    }
    player.accesscard = undefined;
    player namespace_a548bd428a566cf3::updatebrscoreboardstat("bunkerKeycardType", 0);
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcd08
// Size: 0xa8
function function_7cb3c8630787467e(item) {
    player = self;
    if (!isdefined(player.var_1366e50d254f3f08)) {
        player.var_1366e50d254f3f08 = [];
    }
    if (istrue(player.var_1366e50d254f3f08[item])) {
        script::demoforcesre("Trying to give persistent item player already has. Item: "" + item + """);
        return;
    }
    player.var_1366e50d254f3f08[item] = 1;
    var_5c9ddcf56d36f133 = player getclientomnvar("ui_persistent_item_status");
    var_e0a2bfda9da11175 = player br_plunder::function_5efeff555d3c3ab4(item);
    var_5c9ddcf56d36f133 = var_5c9ddcf56d36f133 + (1 << var_e0a2bfda9da11175);
    player setclientomnvar("ui_persistent_item_status", var_5c9ddcf56d36f133);
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xcdb7
// Size: 0x9a
function function_b53322f9aca1b83b(item) {
    player = self;
    if (!isdefined(player.var_1366e50d254f3f08) || !istrue(player.var_1366e50d254f3f08[item])) {
        script::demoforcesre("Trying to take persistent item player doesn't have. Item: "" + item + """);
        return;
    }
    player.var_1366e50d254f3f08[item] = undefined;
    var_5c9ddcf56d36f133 = player getclientomnvar("ui_persistent_item_status");
    var_e0a2bfda9da11175 = player br_plunder::function_5efeff555d3c3ab4(item);
    var_5c9ddcf56d36f133 = var_5c9ddcf56d36f133 - (1 << var_e0a2bfda9da11175);
    player setclientomnvar("ui_persistent_item_status", var_5c9ddcf56d36f133);
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xce58
// Size: 0x37
function function_e351a4b1c26ec991(item) {
    player = self;
    if (!isdefined(player.var_1366e50d254f3f08)) {
        return 0;
    }
    return istrue(player.var_1366e50d254f3f08[item]);
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xce97
// Size: 0x31
function function_b379c8b0a6564107(pickupent) {
    lootid = loot::function_fae5e1d3de32d3f7(pickupent.scriptablename);
    namespace_e50e624d9af51c8c::addItemToBackpack(lootid, pickupent);
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xcecf
// Size: 0xc
function function_8a121226bd7bf630(pickupent) {
    
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcee2
// Size: 0x48
function function_afcb53228e48f6a(pickupent) {
    thread points::doScoreEvent(#"dmz_loot_xp");
    thread hud_message::showsplash("dmz_loot_xp");
    damagefeedback::hudicontype("xp_pickup");
    pickupent.instance disablescriptableplayeruse(self);
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcf31
// Size: 0xbf
function function_ed254d7be7ff977a(pickupent) {
    var_a89e936650684174 = 0;
    if (pickupent namespace_2d7f47b19ccdb41d::function_5facfbee97e1a98e()) {
        var_a89e936650684174 = pickupent namespace_2d7f47b19ccdb41d::function_699d3afb882fd365();
    }
    var_a88e9f0add4feeb3 = 0;
    if (pickupent namespace_2d7f47b19ccdb41d::function_668fa8d4516f7e15()) {
        var_a88e9f0add4feeb3 = pickupent namespace_2d7f47b19ccdb41d::function_bd7732605a7843b2(self);
    }
    shouldpickup = var_a89e936650684174 || var_a88e9f0add4feeb3;
    var_8fb765e581aaf658 = pickupent namespace_2d7f47b19ccdb41d::function_10949665efa60b20();
    if (isdefined(var_8fb765e581aaf658) && istrue(shouldpickup)) {
        if (!pickupent namespace_2d7f47b19ccdb41d::function_d0daea8e27167bf7(self)) {
            return 33;
        }
        pickupent.scriptablename = var_8fb765e581aaf658;
    }
    if (istrue(shouldpickup)) {
        return function_cbbf9bf3544dc456(pickupent);
    } else {
        pickupent.instance.count = 1;
        return 1;
    }
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcff7
// Size: 0x73
function addspecialistbonuspickup(skipsplash) {
    player = self;
    /#
        assert(!player namespace_a548bd428a566cf3::hasspecialistbonus());
    #/
    if (getdvarint(@"hash_be1b706f310c8e63", 0) == 0) {
        self playsoundtoplayer("br_legendary_loot_pickup", self);
    }
    player.hasbrspecialistbonus = 1;
    player perks::addspecialistbonus();
    if (!istrue(skipsplash)) {
        player thread hud_message::showsplash("specialist_perk_bonus");
    }
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd071
// Size: 0x34
function removespecialistbonuspickup() {
    player = self;
    /#
        assert(player namespace_a548bd428a566cf3::hasspecialistbonus());
    #/
    player.hasbrspecialistbonus = 0;
    player perks::removespecialistbonus();
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd0ac
// Size: 0x1d2
function forcegivekillstreak(killstreakref, var_a5ab866673e5e99d, var_7f437a5779c8787c, var_1e736a37c3737585, var_db943473454f6ea6, var_44ee85dcf52b4001, pickup) {
    self notify("cancel_all_killstreak_deployments");
    if (istrue(var_1e736a37c3737585)) {
        dropstruct = function_7b9f3966a7a42003();
        if (istrue(var_7f437a5779c8787c) && isdefined(self.br_kiosk) && isdefined(self.br_kiosk.dropstruct)) {
            var_e1d097c517c3af5b = self.br_kiosk function_4f4d537c794b2bf5();
            self.br_kiosk.dropstruct.var_dfba5a2c3c6f0a07 = var_e1d097c517c3af5b;
            dropstruct = self.br_kiosk.dropstruct;
        }
        function_aa702bcdeeb2b827(dropstruct, var_7f437a5779c8787c, var_1e736a37c3737585, killstreakref, pickup);
        return;
    }
    if (istrue(var_44ee85dcf52b4001) && isdefined(var_db943473454f6ea6)) {
        namespace_e50e624d9af51c8c::function_db1dd76061352e5b(var_db943473454f6ea6);
    }
    if (istrue(var_a5ab866673e5e99d)) {
        dropstruct = function_7b9f3966a7a42003();
        if (istrue(var_7f437a5779c8787c) && isdefined(self.br_kiosk) && isdefined(self.br_kiosk.dropstruct)) {
            var_e1d097c517c3af5b = self.br_kiosk function_4f4d537c794b2bf5();
            self.br_kiosk.dropstruct.var_dfba5a2c3c6f0a07 = var_e1d097c517c3af5b;
            dropstruct = self.br_kiosk.dropstruct;
        }
        dropbrkillstreak(dropstruct, var_7f437a5779c8787c, var_db943473454f6ea6, undefined, pickup);
        if (isdefined(var_db943473454f6ea6)) {
            namespace_b16531563568eaba::function_28550536ebafe216(self);
        }
    } else {
        killstreaks::removekillstreak(1);
    }
    killstreaks::awardkillstreak(killstreakref, "other", undefined, undefined, undefined, 1);
    lootid = loot::function_fae5e1d3de32d3f7(loot::function_b88cfb4893ceedac(killstreakref));
    namespace_b16531563568eaba::function_aa051314f7cdab4e(self, lootid);
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd285
// Size: 0x68
function takekillstreakpickup(pickupent, var_7f437a5779c8787c, var_db943473454f6ea6, var_44ee85dcf52b4001) {
    killstreakref = level.br_pickups.var_14bd11727c4b6629[pickupent.scriptablename];
    /#
        assert(isdefined(killstreakref));
    #/
    forcegivekillstreak(killstreakref, 1, var_7f437a5779c8787c, 0, var_db943473454f6ea6, var_44ee85dcf52b4001, pickupent);
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd2f4
// Size: 0x5b
function hasanykillstreak() {
    if (isdefined(self.streakdata) && isdefined(self.streakdata.streaks) && self.streakdata.streaks.size > 0) {
        return isdefined(self.streakdata.streaks[1]);
    }
    return 0;
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd357
// Size: 0x38
function haskillstreak(killstreakref) {
    return hasanykillstreak() && self.streakdata.streaks[1].streakname == killstreakref;
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd397
// Size: 0x47
function function_81b00a2ba10c143a(killstreakref) {
    if (haskillstreak(killstreakref)) {
        var_16efcf27e6efcbe8 = self.streakdata.streaks[1];
        return (var_16efcf27e6efcbe8.available == 1);
    }
    return 0;
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xd3e6
// Size: 0x42
function function_381d14fb6e6aca9a(killstreakref) {
    var_159ec9a052e1efda = killstreaks::getkillstreaksetupinfo(killstreakref);
    if (isdefined(var_159ec9a052e1efda) && isdefined(var_159ec9a052e1efda.var_b1469bcdaec75a9)) {
        self [[ var_159ec9a052e1efda.var_b1469bcdaec75a9 ]]();
    }
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd42f
// Size: 0x60
function forceusekillstreak(killstreakref) {
    if (hasanykillstreak()) {
        killstreaks::removekillstreak(1);
    }
    killstreaks::awardkillstreak(killstreakref, "other");
    var_16efcf27e6efcbe8 = killstreaks::getkillstreakinslot(1);
    var_e4aecb271d56914b = killstreaks::triggerkillstreak(var_16efcf27e6efcbe8, 1);
    if (!var_e4aecb271d56914b) {
        killstreaks::removekillstreak(1);
    }
    return var_e4aecb271d56914b;
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd497
// Size: 0xbb
function _givebrsuper(equipname, var_5237a188ccda4d7b, var_f29e7e3311257c37) {
    if (level.allowsupers || istrue(self.var_678855513f5076ca) && !supers::function_f95bcca44e8cba53(var_5237a188ccda4d7b)) {
        perkpackage::perkpackage_giveoverridefieldupgrades(var_5237a188ccda4d7b);
        supers::function_8c7b1312cf5986b(0);
        var_f29e7e3311257c37 = supers::getcurrentsuperpoints() >= supers::getsuperpointsneeded();
    } else {
        function_9ec0d84bc12b8d15(var_5237a188ccda4d7b);
        self setclientomnvar("ui_perk_package_state", 3);
        self setclientomnvar("ui_perk_package_super1", supers::getsuperid(var_5237a188ccda4d7b));
        thread namespace_85d036cb78063c4a::function_93b5448ea8f6277b(1);
        thread namespace_85d036cb78063c4a::function_bdcbe42d37001209(2);
    }
    if (isdefined(equipname)) {
        equipment::giveequipment(equipname, "super");
        equipment::setequipmentammo(equipname, var_f29e7e3311257c37);
    }
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd559
// Size: 0x6b
function function_9ec0d84bc12b8d15(var_5237a188ccda4d7b) {
    perkpackage_giveimmediate(var_5237a188ccda4d7b);
    self.var_1066fbd86c88a6df = 1;
    thread function_390eaf44f2e0f0cc(var_5237a188ccda4d7b);
    if (isdefined(self.super.staticdata.var_70b09ed29c10732f)) {
        self thread [[ self.super.staticdata.var_70b09ed29c10732f ]]();
    }
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd5cb
// Size: 0x4f
function function_390eaf44f2e0f0cc(var_5237a188ccda4d7b) {
    level endon("game_ended");
    self endon("disconnect");
    self setclientomnvar("ui_perk_package_state", 3);
    self setclientomnvar("ui_perk_package_super1", namespace_85d036cb78063c4a::getsuperid(var_5237a188ccda4d7b));
    thread namespace_85d036cb78063c4a::function_93b5448ea8f6277b(1);
    thread namespace_85d036cb78063c4a::function_bdcbe42d37001209(2);
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd621
// Size: 0x63
function function_1615eaec0c470f4f(equipname, var_5237a188ccda4d7b) {
    self.var_1066fbd86c88a6df = 1;
    self setclientomnvar("ui_perk_package_state", 3);
    self setclientomnvar("ui_perk_package_super1", supers::getsuperid(var_5237a188ccda4d7b));
    thread namespace_85d036cb78063c4a::function_93b5448ea8f6277b(1);
    thread namespace_85d036cb78063c4a::function_bdcbe42d37001209(2);
    if (isdefined(equipname)) {
        equipment::setequipmentammo(equipname, 1);
    }
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd68b
// Size: 0xae
function function_fcde72dcbcec206b() {
    var_19163e14365d9264 = supers::getcurrentsuper();
    if (!isdefined(var_19163e14365d9264)) {
        return undefined;
    }
    if (isdefined(var_19163e14365d9264.staticdata.useweapon)) {
        return supers::function_3889d69492a93008();
    } else if (isdefined(var_19163e14365d9264.staticdata.ref) && issharedfuncdefined(var_19163e14365d9264.staticdata.ref, "getAmmo", 0)) {
        return [[ getsharedfunc(var_19163e14365d9264.staticdata.ref, "getAmmo") ]]();
    } else {
        return equipment::getequipmentslotammo("super");
    }
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd740
// Size: 0x50
function function_add28651639056b9() {
    var_a1566100e7df492e = supers::function_45c01cf6ebb2ba62();
    var_eec1b23802e9c80b = supers::getsuperpointsneeded();
    var_1e2edcfd539b12cc = supers::function_395a9cb3ebe25d55(self.super) * var_a1566100e7df492e * var_eec1b23802e9c80b;
    supers::setsuperbasepoints(var_eec1b23802e9c80b - var_1e2edcfd539b12cc, undefined, 1);
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd797
// Size: 0x33
function function_23ac735f86c58bf4() {
    level endon("game_ended");
    self endon("disconnect");
    self endon("super_started");
    self endon("remove_super");
    wait(0.05);
    self setclientomnvar("ui_super_can_use", 1);
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd7d1
// Size: 0x1f2
function takesuperpickup(pickupent, var_7f437a5779c8787c, var_db943473454f6ea6) {
    equipname = level.br_pickups.br_equipname[pickupent.scriptablename];
    var_5237a188ccda4d7b = level.br_pickups.var_14bd11727c4b6629[pickupent.scriptablename];
    lootid = loot::function_fae5e1d3de32d3f7(pickupent.scriptablename);
    var_d539af51a08b192d = 0;
    if (isdefined(self.super) && namespace_30a6d7a07831c1e2::function_66f0cbd5ff8458fe()) {
        var_d539af51a08b192d = supers::getcurrentsuperpoints() >= supers::getsuperpointsneeded();
    }
    if (isdefined(var_db943473454f6ea6)) {
        namespace_e50e624d9af51c8c::function_84772ebf836af5db(var_db943473454f6ea6, pickupent.count * -1);
        namespace_b16531563568eaba::function_351fe4ac57ca37e5(self, "super");
    }
    if (function_df3f5431c93ed5a1(undefined, pickupent.scriptablename) && namespace_ea497db8cab34561::function_59566a4ce3c2c3e2()) {
        namespace_ea497db8cab34561::function_60d5992f51286201();
    }
    if (isdefined(self.equipment["super"])) {
        if (namespace_1a507865f681850e::getequipmentslotammo("super") > 0 || var_d539af51a08b192d || namespace_85d036cb78063c4a::isUsingSuperWeapon()) {
            dropstruct = function_7b9f3966a7a42003();
            dropequipmentinslot(dropstruct, "super", var_7f437a5779c8787c, undefined, var_db943473454f6ea6, undefined, undefined, undefined, pickupent);
        }
    }
    _givebrsuper(equipname, var_5237a188ccda4d7b, pickupent.count);
    if (function_1be34022a4acce73(pickupent.scriptablename)) {
        supers::function_60e9ab8c0ad6a01c(pickupent.count, "all");
        function_add28651639056b9();
    }
    namespace_b16531563568eaba::function_f5b2810055f85ead(self, "super", lootid);
    if ((level.allowsupers || namespace_30a6d7a07831c1e2::function_66f0cbd5ff8458fe()) && !(equipment::getequipmentslotammo("super") > 0)) {
        supers::givesuperpoints(supers::getsuperpointsneeded(), undefined, undefined, undefined, 1);
    }
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd9ca
// Size: 0x325
function forcegivesuper(var_9394537680f9c8a4, var_a5ab866673e5e99d, var_7f437a5779c8787c, var_1e736a37c3737585, var_db943473454f6ea6) {
    if (istrue(level.var_d040719163e20394) && var_9394537680f9c8a4 == "none") {
        return;
    }
    if (var_9394537680f9c8a4 == "none" && game_utility::function_fa7bfcc1d68b7b73()) {
        return;
    }
    var_733d60a5f3a8c170 = undefined;
    foreach (scriptablename, var_5237a188ccda4d7b in level.br_pickups.var_14bd11727c4b6629) {
        if (var_5237a188ccda4d7b == var_9394537680f9c8a4) {
            var_733d60a5f3a8c170 = scriptablename;
            break;
        }
    }
    /#
        if (!isdefined(var_733d60a5f3a8c170)) {
            println("dropped_minigun" + utility::function_53c4c53197386572(var_9394537680f9c8a4, "br_pickup_cash_med_05") + "br_inventory_drop_plunder_lrg");
        }
    #/
    var_878c13a767e1d193 = undefined;
    var_f29e7e3311257c37 = 1;
    if (isdefined(var_733d60a5f3a8c170) && !game_utility::function_9cdaadfddeda4d7a()) {
        var_878c13a767e1d193 = level.br_pickups.br_equipname[var_733d60a5f3a8c170];
        /#
            assertex(isdefined(var_878c13a767e1d193), "targetSuperName: " + var_733d60a5f3a8c170 + " could not be mapped to an index in level.br_pickups.br_equipName[]");
        #/
        if (istrue(var_1e736a37c3737585)) {
            dropbrequipment(var_7f437a5779c8787c, var_1e736a37c3737585, var_878c13a767e1d193);
            return;
        }
        /#
            assertex(isdefined(var_878c13a767e1d193), "targetSuperName: " + var_733d60a5f3a8c170 + " could not be mapped to an index in level.br_pickups.br_equipName[]");
        #/
        if (istrue(var_1e736a37c3737585)) {
            dropstruct = function_7b9f3966a7a42003();
            if (istrue(var_7f437a5779c8787c) && isdefined(self.br_kiosk) && isdefined(self.br_kiosk.dropstruct)) {
                var_e1d097c517c3af5b = self.br_kiosk function_4f4d537c794b2bf5();
                self.br_kiosk.dropstruct.var_dfba5a2c3c6f0a07 = var_e1d097c517c3af5b;
                dropstruct = self.br_kiosk.dropstruct;
            }
            dropbrequipment(dropstruct, var_7f437a5779c8787c, var_1e736a37c3737585, var_878c13a767e1d193);
            return;
        }
        if (istrue(var_a5ab866673e5e99d)) {
            if (isdefined(self.equipment["super"]) && equipment::getequipmentslotammo("super") > 0) {
                dropstruct = function_7b9f3966a7a42003();
                if (istrue(var_7f437a5779c8787c) && isdefined(self.br_kiosk) && isdefined(self.br_kiosk.dropstruct)) {
                    var_e1d097c517c3af5b = self.br_kiosk function_4f4d537c794b2bf5();
                    self.br_kiosk.dropstruct.var_dfba5a2c3c6f0a07 = var_e1d097c517c3af5b;
                    dropstruct = self.br_kiosk.dropstruct;
                }
                dropequipmentinslot(dropstruct, "super", var_7f437a5779c8787c, undefined, var_db943473454f6ea6, undefined, undefined, undefined);
            }
        }
    }
    if (istrue(var_7f437a5779c8787c) && issharedfuncdefined(var_9394537680f9c8a4, "getPurchasedCount")) {
        var_f29e7e3311257c37 = self [[ getsharedfunc(var_9394537680f9c8a4, "getPurchasedCount") ]]();
    }
    _givebrsuper(var_878c13a767e1d193, var_9394537680f9c8a4, var_f29e7e3311257c37);
    if (function_1be34022a4acce73(var_733d60a5f3a8c170)) {
        supers::function_60e9ab8c0ad6a01c(var_f29e7e3311257c37, "all");
        function_add28651639056b9();
    }
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdcf6
// Size: 0x5c
function function_bae867278a38b69a(scriptablename, var_7f437a5779c8787c, var_db943473454f6ea6, var_44ee85dcf52b4001) {
    perkref = level.br_pickups.var_14bd11727c4b6629[scriptablename];
    /#
        assert(isdefined(perkref));
    #/
    function_ca43755a6d8927d9(perkref, 1, var_7f437a5779c8787c, var_db943473454f6ea6, var_44ee85dcf52b4001);
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdd59
// Size: 0xd7
function function_ca43755a6d8927d9(perkref, var_a5ab866673e5e99d, var_7f437a5779c8787c, var_db943473454f6ea6, var_44ee85dcf52b4001) {
    if (istrue(var_44ee85dcf52b4001) && isdefined(var_db943473454f6ea6)) {
        namespace_e50e624d9af51c8c::function_db1dd76061352e5b(var_db943473454f6ea6);
    }
    if (istrue(var_a5ab866673e5e99d)) {
        dropstruct = function_7b9f3966a7a42003();
        if (istrue(var_7f437a5779c8787c) && isdefined(self.br_kiosk) && isdefined(self.br_kiosk.dropstruct)) {
            var_e1d097c517c3af5b = self.br_kiosk function_4f4d537c794b2bf5();
            self.br_kiosk.dropstruct.var_dfba5a2c3c6f0a07 = var_e1d097c517c3af5b;
            dropstruct = self.br_kiosk.dropstruct;
        }
    }
    perk::giveperk(perkref);
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xde37
// Size: 0x3a8
function takegasmask(pickupent, var_7f437a5779c8787c, itemslotindex, var_44ee85dcf52b4001) {
    if (istrue(var_44ee85dcf52b4001) && isdefined(itemslotindex)) {
        namespace_e50e624d9af51c8c::function_db1dd76061352e5b(itemslotindex);
    }
    if (!isdefined(pickupent.count) || pickupent.count <= 0) {
        return;
    }
    if (gasmask::hasgasmask(self)) {
        if (pickupent.scriptablename == "brloot_equip_gasmask" && self.gasmasktype == "brloot_equip_gasmask_durable" && !istrue(var_44ee85dcf52b4001)) {
            lootid = function_dc5a935ab4958490(pickupent);
            namespace_e50e624d9af51c8c::addItemToBackpack(lootid, pickupent);
            return;
        }
        function_73ffc9bcd6d1e62d(var_7f437a5779c8787c);
        var_caa51970540df10d = !istrue(namespace_e50e624d9af51c8c::function_7e103028c464ab9a(pickupent.scriptablename));
        if (!istrue(var_caa51970540df10d)) {
            if (!istrue(var_44ee85dcf52b4001)) {
                index = namespace_e50e624d9af51c8c::getAvailableDMZBackpackIndex();
                if (isdefined(index)) {
                    var_1515562147f27975 = namespace_38b993c4618e76cd::function_fae5e1d3de32d3f7(self.gasmasktype);
                    namespace_aead94004cf4c147::function_11f48ae5b87b4525(self, index, var_1515562147f27975, int(self.gasmaskhealth));
                } else {
                    var_caa51970540df10d = 1;
                }
            } else {
                var_1515562147f27975 = namespace_38b993c4618e76cd::function_fae5e1d3de32d3f7(self.gasmasktype);
                namespace_aead94004cf4c147::function_11f48ae5b87b4525(self, itemslotindex, var_1515562147f27975, int(self.gasmaskhealth));
            }
        }
        if (istrue(var_caa51970540df10d)) {
            dropstruct = function_7b9f3966a7a42003();
            var_96c7526f4ab04875 = utility::ter_op(isdefined(pickupent.var_96c7526f4ab04875), pickupent.var_96c7526f4ab04875, level.br_pickups.var_3b53bc0eee6ae84e);
            var_cb4fad49263e20c4 = getitemdroporiginandangles(dropstruct, self.origin, self.angles, self, level.br_pickups.var_ad49a38dd7c4c10f, var_96c7526f4ab04875, undefined, undefined, pickupent.origin);
            var_e5d2b8ffab2a2964 = spawnpickup(self.gasmasktype, var_cb4fad49263e20c4, int(self.gasmaskhealth), 1);
            if (namespace_a548bd428a566cf3::isplayeringulag()) {
                var_e5d2b8ffab2a2964.var_1b46a808091ea19c = 1;
            }
        }
        namespace_b16531563568eaba::function_777c89585478357b(self);
        if (pickupent.scriptablename == "brloot_equip_gasmask_durable" && self.gasmasktype == "brloot_equip_gasmask" && !istrue(var_44ee85dcf52b4001)) {
            var_9bdf1cfacd52af25 = self.gasmaskhealth;
            dropstruct = function_7b9f3966a7a42003();
            var_96c7526f4ab04875 = utility::ter_op(isdefined(pickupent.var_96c7526f4ab04875), pickupent.var_96c7526f4ab04875, level.br_pickups.var_3b53bc0eee6ae84e);
            var_cb4fad49263e20c4 = getitemdroporiginandangles(dropstruct, self.origin, self.angles, self, level.br_pickups.var_ad49a38dd7c4c10f, var_96c7526f4ab04875, undefined, undefined, pickupent.origin);
            var_e5d2b8ffab2a2964 = spawnpickup("brloot_equip_gasmask", var_cb4fad49263e20c4, int(var_9bdf1cfacd52af25), 1);
            index = namespace_aead94004cf4c147::function_106b52ed8f680043(level.var_1515562147f27975);
            namespace_aead94004cf4c147::function_db1dd76061352e5b(index, var_9bdf1cfacd52af25);
        }
    }
    lootid = namespace_38b993c4618e76cd::function_fae5e1d3de32d3f7(pickupent.scriptablename);
    namespace_b16531563568eaba::function_826c883f14e827b3(self, lootid);
    gasmask::init(pickupent.count, pickupent.scriptablename);
    if (istrue(level.var_e79884673ac9666e)) {
        function_cdf7f2f6bd3207("br_circle");
    }
    level notify("picked_up_item_" + pickupent.scriptablename + "_" + self.team, self);
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe1e6
// Size: 0x49
function function_cdf7f2f6bd3207(request) {
    if (!isdefined(self.var_fe63300b318b76b0)) {
        self.var_fe63300b318b76b0 = [];
    }
    if (isdefined(self.var_fe63300b318b76b0[request])) {
        return;
    }
    self.var_fe63300b318b76b0[request] = 1;
    thread function_2202e74632488bac();
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe236
// Size: 0x46
function function_8206bc54a1ed73cb(request) {
    if (!isdefined(self.var_fe63300b318b76b0)) {
        self.var_fe63300b318b76b0 = [];
    }
    if (!isdefined(self.var_fe63300b318b76b0[request])) {
        return;
    }
    self.var_fe63300b318b76b0[request] = undefined;
    thread function_2202e74632488bac();
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe283
// Size: 0xf6
function function_2202e74632488bac() {
    level endon("game_ended");
    self endon("death_or_disconnect");
    if (istrue(self.gasmaskswapinprogress)) {
        utility::waittill_notify_or_timeout("gas_mask_swap_complete", 2);
        waitframe();
    }
    self notify("gasMaskUpdateOnOff");
    self endon("gasMaskUpdateOnOff");
    waittillframeend();
    function_f4361ea8ce0fbca4();
    if (istrue(level.var_e79884673ac9666e)) {
        if (!istrue(self.gasmaskequipped)) {
            self setsoundsubmix("jup_wz_gasmask_nogas");
            thread equipgasmaskbr();
        } else {
            self clearsoundsubmix("jup_wz_gasmask_nogas");
            thread removegasmaskbr();
        }
    } else if (istrue(self.gasmaskequipped) && (!isdefined(self.var_fe63300b318b76b0) || !self.var_fe63300b318b76b0.size)) {
        thread removegasmaskbr();
    } else if (!istrue(self.gasmaskequipped) && isdefined(self.var_fe63300b318b76b0) && self.var_fe63300b318b76b0.size) {
        thread equipgasmaskbr();
    }
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe380
// Size: 0x4c
function function_f213f06eba604bbd(player) {
    var_6b878da7b46a930f = 0;
    var_6b878da7b46a930f = var_6b878da7b46a930f | player isreloading();
    var_6b878da7b46a930f = var_6b878da7b46a930f | player isthrowinggrenade();
    var_6b878da7b46a930f = var_6b878da7b46a930f | player function_e5bf22923d0004bc();
    var_6b878da7b46a930f = var_6b878da7b46a930f | player issprintsliding();
    var_6b878da7b46a930f = var_6b878da7b46a930f | player player::isplayerads();
    return var_6b878da7b46a930f;
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe3d4
// Size: 0x4f
function canplaygasmaskgesturebr() {
    player = self;
    var_c6c1e3e2091f7050 = 0;
    var_c6c1e3e2091f7050 = var_c6c1e3e2091f7050 | player isinfreefall();
    var_c6c1e3e2091f7050 = var_c6c1e3e2091f7050 | player isskydiving();
    var_c6c1e3e2091f7050 = var_c6c1e3e2091f7050 | player isparachuting();
    var_c6c1e3e2091f7050 = var_c6c1e3e2091f7050 | player isbasejumpavailable();
    var_c6c1e3e2091f7050 = var_c6c1e3e2091f7050 | player ismantling();
    return !var_c6c1e3e2091f7050;
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe42b
// Size: 0x1c4
function equipgasmaskbr() {
    self endon("game_ended");
    self endon("death_or_disconnect");
    if (!isdefined(self.gasmaskhealth) || self.gasmaskhealth == 0) {
        return;
    }
    self playsoundtoplayer("br_gas_mask_on_plr", self);
    self.gasmaskswapinprogress = 1;
    thread delayedattach(0.2);
    var_9f955950f47f8532 = self getgestureanimlength("iw9_vm_ges_gasmask_on");
    var_4e2ae79f26d9f720 = var_9f955950f47f8532 * 0.35;
    /#
        assert(0.2 < var_9f955950f47f8532);
    #/
    if (canplaygasmaskgesturebr()) {
        thread namespace_a548bd428a566cf3::playerplaygestureweaponanim("iw8_ges_plyr_gasmask_on", var_9f955950f47f8532);
    }
    self setclientomnvar("ui_gas_mask", 2);
    thread function_4f2124298797aded(level.var_1170cfb92432a61d, var_4e2ae79f26d9f720);
    wait(var_9f955950f47f8532);
    self.gasmaskswapinprogress = 0;
    self notify("gas_mask_swap_complete");
    self.gasmaskequipped = 1;
    white_phosphorus::enableloopingcoughaudiosupression();
    if (isdefined(self.operatorcustomization.gender) && self.operatorcustomization.gender == "female") {
        self function_555e2d32e2756625("gasmask_female");
    } else if (isdefined(self.operatorcustomization) && isdefined(self.operatorcustomization.skinref) && self.operatorcustomization.skinref + "" == "319") {
        self setentitysoundcontext("gender", "bongmask_male");
    } else {
        self function_555e2d32e2756625("gasmask_male");
    }
    if (isdefined(self.gasmaskhealth) && self.gasmaskhealth <= 0) {
        if (!istrue(level.var_e79884673ac9666e)) {
            breakgasmaskbr();
        }
    }
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe5f6
// Size: 0x230
function removegasmaskbr() {
    self endon("game_ended");
    self endon("death_or_disconnect");
    if (!istrue(self.gasmaskequipped) && !istrue(level.var_e79884673ac9666e)) {
        return;
    }
    self playsoundtoplayer("br_gas_mask_off_plr", self);
    fadeouttime = self getgestureanimlength("iw9_vm_ges_gasmask_off");
    var_4e2ae79f26d9f720 = fadeouttime * 0.35;
    thread delayeddetach(1.3);
    if (canplaygasmaskgesturebr()) {
        if (istrue(level.var_e79884673ac9666e)) {
            if (gasmask::function_27e68abe09612a13(self)) {
                thread namespace_a548bd428a566cf3::playerplaygestureweaponanim("iw8_ges_plyr_gasmask_off", fadeouttime);
            } else {
                thread namespace_a548bd428a566cf3::playerplaygestureweaponanim("iw8_ges_plyr_gasmask_break", fadeouttime);
            }
        } else {
            thread namespace_a548bd428a566cf3::playerplaygestureweaponanim("iw8_ges_plyr_gasmask_off", fadeouttime);
        }
    }
    self.gasmaskswapinprogress = 1;
    self setclientomnvar("ui_gas_mask", 1);
    thread function_4f2124298797aded(0, var_4e2ae79f26d9f720);
    wait(fadeouttime);
    self.gasmaskswapinprogress = 0;
    self notify("gas_mask_swap_complete");
    white_phosphorus::disableloopingcoughaudiosupression();
    if (isdefined(self.operatorcustomization) && isdefined(self.operatorcustomization.skinref) && self.operatorcustomization.skinref + "" == "355") {
        self function_555e2d32e2756625("gasmask_female");
    } else if (isdefined(self.operatorcustomization.gender) && self.operatorcustomization.gender == "female") {
        self function_555e2d32e2756625("female");
    } else if (isdefined(self.operatorcustomization) && isdefined(self.operatorcustomization.skinref) && self.operatorcustomization.skinref + "" == "319") {
        self setentitysoundcontext("gender", "bongmask_male");
    } else {
        self function_555e2d32e2756625("");
    }
    if (isdefined(self.gasmaskhealth) && self.gasmaskhealth <= 0) {
        if (!istrue(level.var_e79884673ac9666e)) {
            function_4d16b9c52efa3b8();
        }
    }
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe82d
// Size: 0x1bb
function breakgasmaskbr() {
    if (!isdefined(self.gasmaskhealth)) {
        return;
    }
    self playsoundtoplayer("br_gas_mask_break_plr", self);
    if (!istrue(level.var_e79884673ac9666e)) {
        thread delayeddetachbreak(0.6);
    }
    if (isdefined(self.operatorcustomization) && isdefined(self.operatorcustomization.skinref) && self.operatorcustomization.skinref + "" == "355") {
        self function_555e2d32e2756625("gasmask_female");
    } else if (isdefined(self.operatorcustomization.gender) && self.operatorcustomization.gender == "female") {
        self function_555e2d32e2756625("female");
    } else if (isdefined(self.operatorcustomization) && isdefined(self.operatorcustomization.skinref) && self.operatorcustomization.skinref + "" == "319") {
        self setentitysoundcontext("gender", "bongmask_male");
    } else {
        self function_555e2d32e2756625("");
    }
    self playsoundtoplayer("br_gas_mask_depleted_plr", self);
    if (!istrue(level.var_e79884673ac9666e)) {
        function_4d16b9c52efa3b8();
        fadeouttime = self getgestureanimlength("iw9_vm_ges_gasmask_break");
        thread namespace_a548bd428a566cf3::playerplaygestureweaponanim("iw8_ges_plyr_gasmask_break", fadeouttime);
        self.gasmaskswapinprogress = 1;
        self setclientomnvar("ui_gas_mask", 3);
        wait(fadeouttime);
        self.gasmaskswapinprogress = 0;
        self notify("gas_mask_swap_complete");
        namespace_b16531563568eaba::function_777c89585478357b(self);
        function_8e9b00a1d2b23d72();
    }
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe9ef
// Size: 0x31
function function_4f2124298797aded(amount, time) {
    level endon("game_ended");
    self endon("disconnect");
    wait(time);
    self setclientomnvar("ui_gas_mask_opacity_override", amount);
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xea27
// Size: 0x3d
function delayedattach(delaytime) {
    self endon("game_end");
    self endon("death_or_disconnect");
    if (isdefined(delaytime) && delaytime > 0) {
        wait(delaytime);
    }
    self attach("hat_child_hadir_gas_mask_wm_br", "j_head");
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xea6b
// Size: 0x53
function delayeddetach(delaytime) {
    self endon("game_end");
    self endon("death_or_disconnect");
    if (isdefined(delaytime) && delaytime > 0) {
        wait(delaytime);
    }
    if (self.gasmaskequipped) {
        self detach("hat_child_hadir_gas_mask_wm_br", "j_head");
        self.gasmaskequipped = 0;
    }
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xeac5
// Size: 0x76
function delayeddetachbreak(delaytime) {
    self endon("game_end");
    self endon("death_or_disconnect");
    if (isdefined(delaytime) && delaytime > 0.1) {
        wait(delaytime - 0.1);
    }
    playfxontag(utility::getfx("vfx_gas_mask_break"), self, "tag_weapon_left");
    wait(0.1);
    if (self.gasmaskequipped) {
        self detach("hat_child_hadir_gas_mask_wm_br", "j_head");
        self.gasmaskequipped = 0;
    }
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xeb42
// Size: 0x54
function function_a1d897962a19d27e() {
    level endon("game_ended");
    self endon("disconnect");
    while (1) {
        var_353cc7fac6358799 = waittill_any_timeout_1(level.var_5312bc14bd5db377, "gasmask_buffer_reset");
        if (!isdefined(var_353cc7fac6358799) || var_353cc7fac6358799 == "timeout") {
            self.var_a18181d8bdaa0dab = 0;
            return;
        }
    }
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xeb9d
// Size: 0x40
function function_8e9b00a1d2b23d72() {
    player = self;
    if (!player namespace_e50e624d9af51c8c::isBackpackInventoryEnabled()) {
        return;
    }
    var_d035435a9237f3d = function_b76f69ce63757cea("gas_mask_durable");
    if (!var_d035435a9237f3d) {
        function_b76f69ce63757cea("gas_mask");
    }
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xebe4
// Size: 0x27
function canholdammobox(scriptablename) {
    if (!isdefined(self.br_ammo[scriptablename])) {
        return 1;
    }
    return !br_weapons::br_ammo_type_player_full(self, scriptablename);
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xec13
// Size: 0x54
function isvest(scriptablename) {
    return isdefined(level.br_pickups.br_itemtype[scriptablename]) && level.br_pickups.br_itemtype[scriptablename] == #"armor" && issubstr(scriptablename, "vest");
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xec6f
// Size: 0x54
function isgasmask(scriptablename) {
    return isdefined(level.br_pickups.br_itemtype[scriptablename]) && level.br_pickups.br_itemtype[scriptablename] == #"gear" && issubstr(scriptablename, "gasmask");
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xeccb
// Size: 0x54
function function_9a5d18fbdad686c2(scriptablename) {
    return isdefined(level.br_pickups.br_itemtype[scriptablename]) && level.br_pickups.br_itemtype[scriptablename] == #"key" && issubstr(scriptablename, "loot_key_gulag");
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xed27
// Size: 0x45
function function_4f94796425d65f79(scriptablename) {
    return isdefined(level.br_pickups.br_itemtype[scriptablename]) && level.br_pickups.br_itemtype[scriptablename] == #"note";
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xed74
// Size: 0x54
function function_6b5f3fb6550ae6d5(scriptablename) {
    return isdefined(level.br_pickups.br_itemtype[scriptablename]) && level.br_pickups.br_itemtype[scriptablename] == #"gear" && issubstr(scriptablename, "iodine_pills");
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xedd0
// Size: 0x54
function function_4cf229c2265183a9(scriptablename) {
    return isdefined(level.br_pickups.br_itemtype[scriptablename]) && level.br_pickups.br_itemtype[scriptablename] == #"exfil" && issubstr(scriptablename, "exfil_marker");
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xee2c
// Size: 0x54
function isspecialistbonus(scriptablename) {
    return isdefined(level.br_pickups.br_itemtype[scriptablename]) && level.br_pickups.br_itemtype[scriptablename] == #"specialist" && issubstr(scriptablename, "specialist_bonus");
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xee88
// Size: 0x45
function isplunder(scriptablename) {
    return isdefined(level.br_pickups.br_itemtype[scriptablename]) && level.br_pickups.br_itemtype[scriptablename] == #"plunder";
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xeed5
// Size: 0x17
function function_34af0f77c1668dba(lootid) {
    return isdefined(lootid) && lootid == 8395;
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xeef4
// Size: 0x45
function isquesttablet(scriptablename) {
    return isdefined(level.br_pickups.br_itemtype[scriptablename]) && level.br_pickups.br_itemtype[scriptablename] == #"tablet";
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xef41
// Size: 0x23
function function_c7279e910cefd2a4(scriptablename) {
    if (isquesttablet(scriptablename)) {
        return issubstr(scriptablename, "elite_arrow");
    }
    return 0;
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xef6c
// Size: 0x45
function isDogTag(scriptablename) {
    return isdefined(level.br_pickups.br_itemtype[scriptablename]) && level.br_pickups.br_itemtype[scriptablename] == #"dogtag";
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xefb9
// Size: 0x54
function function_a5202e2fc8ecb076(scriptablename) {
    return isdefined(level.br_pickups.br_itemtype[scriptablename]) && level.br_pickups.br_itemtype[scriptablename] == #"extractable" && issubstr(scriptablename, "durable_loot");
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf015
// Size: 0x45
function function_55f0daea8408e3a9(scriptablename) {
    return isdefined(level.br_pickups.br_itemtype[scriptablename]) && level.br_pickups.br_itemtype[scriptablename] == #"weaponCase";
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf062
// Size: 0x45
function function_f92615e29aff3602(scriptablename) {
    return isdefined(level.br_pickups.br_itemtype[scriptablename]) && level.br_pickups.br_itemtype[scriptablename] == #"hash_a49b77de0306ea57";
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf0af
// Size: 0x45
function function_e4b6260dbb04b43d(scriptablename) {
    return isdefined(level.br_pickups.br_itemtype[scriptablename]) && level.br_pickups.br_itemtype[scriptablename] == #"elite_arrow";
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf0fc
// Size: 0x2c
function function_9b77601837f66e32(lootid) {
    scriptablename = namespace_38b993c4618e76cd::getScriptableFromLootID(lootid);
    if (isdefined(scriptablename)) {
        return function_e4b6260dbb04b43d(scriptablename);
    }
    return 0;
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf130
// Size: 0x2c
function function_b605a733974c2ff5(lootid) {
    scriptablename = namespace_38b993c4618e76cd::getScriptableFromLootID(lootid);
    if (isdefined(scriptablename)) {
        return function_43e6c697b2fdde6e(scriptablename);
    }
    return 0;
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf164
// Size: 0x45
function isperkpointpickup(scriptablename) {
    return isdefined(level.br_pickups.br_itemtype[scriptablename]) && level.br_pickups.br_itemtype[scriptablename] == #"hash_ca302c431e5bc4e9";
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf1b1
// Size: 0x45
function istokenpickup(scriptablename) {
    return isdefined(level.br_pickups.br_itemtype[scriptablename]) && level.br_pickups.br_itemtype[scriptablename] == #"token";
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf1fe
// Size: 0x19
function function_f8f4cf026fb2b9f8(scriptablename) {
    return isdefined(scriptablename) && scriptablename == "brloot_gulag_token";
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf21f
// Size: 0x45
function isrevivepickup(scriptablename) {
    return isdefined(level.br_pickups.br_itemtype[scriptablename]) && level.br_pickups.br_itemtype[scriptablename] == #"revive";
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf26c
// Size: 0x45
function iskillstreak(scriptablename) {
    return isdefined(level.br_pickups.br_itemtype[scriptablename]) && level.br_pickups.br_itemtype[scriptablename] == #"killstreak";
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf2b9
// Size: 0x45
function function_233d8364992b23b4(scriptablename) {
    return isdefined(level.br_pickups.br_itemtype[scriptablename]) && level.br_pickups.br_itemtype[scriptablename] == #"attachment";
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf306
// Size: 0x51
function issuperpickup(scriptablename) {
    return !isnonequippable(scriptablename) && isdefined(level.br_pickups.br_itemtype[scriptablename]) && level.br_pickups.br_itemtype[scriptablename] == #"super";
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf35f
// Size: 0x4a
function function_1be34022a4acce73(scriptablename) {
    switch (scriptablename) {
    case #"hash_dc76dae6923cd72":
    case #"hash_42f538a268e06c04":
    case #"hash_cc33d71013dc6a72":
        return 1;
    default:
        return 0;
        break;
    }
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf3b0
// Size: 0x45
function function_1950b02c25bad779(scriptablename) {
    return isdefined(level.br_pickups.br_itemtype[scriptablename]) && level.br_pickups.br_itemtype[scriptablename] == #"perk";
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xf3fd
// Size: 0x13
function isplunderextract(scriptablename) {
    return scriptablename == "brloot_plunder_extract";
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf418
// Size: 0x13
function function_4294e9b331377c31(scriptablename) {
    return scriptablename == "brloot_plate_carrier_high_capacity";
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf433
// Size: 0x17
function isaccesscard(scriptablename) {
    return issubstr(scriptablename, "access_card");
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf452
// Size: 0x17
function function_cb8c6abfd1ce083a(scriptablename) {
    return issubstr(scriptablename, "card_biometric_scan");
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf471
// Size: 0x17
function function_e066d6b70dda15f1(scriptablename) {
    return issubstr(scriptablename, "brloot_xp");
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf490
// Size: 0x17
function function_f262c137ed78e6eb(scriptablename) {
    return issubstr(scriptablename, "activity_starter");
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf4af
// Size: 0x26
function function_82d45592d750d388(scriptablename) {
    return issubstr(scriptablename, "loot_key") || issubstr(scriptablename, "loot_multi_key");
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf4dd
// Size: 0x17
function function_2d86ba79a58bb62(scriptablename) {
    return issubstr(scriptablename, "loot_multi_key");
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf4fc
// Size: 0x17
function function_68f7f39db3bc7fa4(scriptablename) {
    return issubstr(scriptablename, "brloot_drone_part");
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf51b
// Size: 0x1e
function isnonequippable(scriptablename) {
    return scriptablename == "br_loot_cache" || isquesttablet(scriptablename);
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf541
// Size: 0x45
function isvaluable(scriptablename) {
    return isdefined(level.br_pickups.br_itemtype[scriptablename]) && level.br_pickups.br_itemtype[scriptablename] == #"valuable";
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf58e
// Size: 0x45
function function_eac097ce4c683ab9(scriptablename) {
    return isdefined(level.br_pickups.br_itemtype[scriptablename]) && level.br_pickups.br_itemtype[scriptablename] == #"personal";
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf5db
// Size: 0x45
function function_f48bd2f51721f2fd(scriptablename) {
    return isdefined(level.br_pickups.br_itemtype[scriptablename]) && level.br_pickups.br_itemtype[scriptablename] == #"tablet";
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf628
// Size: 0x45
function function_32125eba262380c7(scriptablename) {
    return isdefined(level.br_pickups.br_itemtype[scriptablename]) && level.br_pickups.br_itemtype[scriptablename] == #"mission";
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf675
// Size: 0x3e
function function_a38e261031751c09(scriptablename) {
    return isdefined(level.br_pickups.var_b8fad1cfd41d21da[scriptablename]) && level.br_pickups.var_b8fad1cfd41d21da[scriptablename] == 1;
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf6bb
// Size: 0x45
function function_a45ee992e46a29f1(scriptablename) {
    return isdefined(level.br_pickups.br_itemtype[scriptablename]) && level.br_pickups.br_itemtype[scriptablename] == #"cache";
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf708
// Size: 0x45
function function_b989edd9af4f42c7(scriptablename) {
    return isdefined(level.br_pickups.br_itemtype[scriptablename]) && level.br_pickups.br_itemtype[scriptablename] == #"lethal";
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf755
// Size: 0x45
function function_d7c5786a0c42ef6c(scriptablename) {
    return isdefined(level.br_pickups.br_itemtype[scriptablename]) && level.br_pickups.br_itemtype[scriptablename] == #"tactical";
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf7a2
// Size: 0x45
function function_cb1e30930c35f2e2(scriptablename) {
    return isdefined(level.br_pickups.br_itemtype[scriptablename]) && level.br_pickups.br_itemtype[scriptablename] == #"nvg";
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf7ef
// Size: 0x45
function function_43e6c697b2fdde6e(scriptablename) {
    return isdefined(level.br_pickups.br_itemtype[scriptablename]) && level.br_pickups.br_itemtype[scriptablename] == #"disguise";
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf83c
// Size: 0x45
function function_4c2b7c5a19471dec(scriptablename) {
    return isdefined(level.br_pickups.br_itemtype[scriptablename]) && level.br_pickups.br_itemtype[scriptablename] == #"hash_6efae1130002838";
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf889
// Size: 0x45
function function_5449da9d3d0358a4(scriptablename) {
    return isdefined(level.br_pickups.br_itemtype[scriptablename]) && level.br_pickups.br_itemtype[scriptablename] == #"gascan";
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf8d6
// Size: 0x33
function function_f96674ba1a1ec2b3(lootid) {
    if (!isdefined(lootid)) {
        return 0;
    }
    scriptable = namespace_38b993c4618e76cd::getScriptableFromLootID(lootid);
    if (!isdefined(scriptable)) {
        return 0;
    }
    return function_5449da9d3d0358a4(scriptable);
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf911
// Size: 0x45
function function_7a345d3f5a65278c(scriptablename) {
    return isdefined(level.br_pickups.br_itemtype[scriptablename]) && level.br_pickups.br_itemtype[scriptablename] == #"questsafe";
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf95e
// Size: 0x4d
function function_3cad96c265936df7(scriptablename) {
    if (!isdefined(level.br_pickups.br_itemtype[scriptablename])) {
        return 0;
    }
    switch (scriptablename) {
    case #"hash_37befa6a4b547903":
        return 1;
    default:
        return 0;
        break;
    }
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf9b2
// Size: 0x28
function isGametypeItem(scriptablename) {
    if (namespace_71073fa38f11492::isbrgametypefuncdefined("isGametypeItem")) {
        return namespace_71073fa38f11492::runbrgametypefunc("isGametypeItem", scriptablename);
    }
    return 0;
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf9e2
// Size: 0x13
function function_945d5bc4b5cb8c78(scriptablename) {
    return scriptablename == "brloot_rock";
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf9fd
// Size: 0x13
function function_e68e1669597a3f4d(scriptablename) {
    return scriptablename == "brloot_payment_hacker_phone";
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfa18
// Size: 0x1c
function function_4f6e89c88bb9605(scriptablename) {
    return function_1823ff50bb28148d(scriptablename) == #"hash_19c0f9046ea4a996";
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xfa3c
// Size: 0x34
function function_b77386f2a0293169(scriptablename) {
    return isvaluable(scriptablename) || isDogTag(scriptablename) || function_eac097ce4c683ab9(scriptablename) || function_32125eba262380c7(scriptablename);
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfa78
// Size: 0x13
function function_c51fec498a6283b5(scriptablename) {
    return scriptablename == "brloot_shopkeeper_code";
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfa93
// Size: 0x30
function function_df3f5431c93ed5a1(lootid, scriptablename) {
    if (!isdefined(scriptablename)) {
        scriptablename = namespace_38b993c4618e76cd::getScriptableFromLootID(lootid);
    }
    if (!isdefined(scriptablename)) {
        return 0;
    }
    return scriptablename == "brloot_offhand_advancedvehicledrop";
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfacb
// Size: 0x80
function function_d345eec68e01361f(lootid, scriptablename) {
    if (!isdefined(lootid) && !isdefined(scriptablename)) {
        return 0;
    }
    if (!isdefined(scriptablename)) {
        scriptablename = loot::getScriptableFromLootID(lootid);
    }
    if (!isdefined(scriptablename)) {
        return 0;
    }
    return namespace_85cd45b4fe0d86fb::function_3c17a26ce6a4668(lootid) || namespace_cb965d2f71fefddc::isgasmask(scriptablename) || namespace_cb965d2f71fefddc::function_5449da9d3d0358a4(scriptablename) || namespace_cb965d2f71fefddc::function_1be34022a4acce73(scriptablename) || namespace_d3d40f75bb4e4c32::function_12d9a293931f0455(scriptablename) || function_c51fec498a6283b5(scriptablename) || namespace_cb965d2f71fefddc::function_43e6c697b2fdde6e(scriptablename);
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfb53
// Size: 0x45
function function_16a5ebe82e3f2286(scriptablename) {
    return isdefined(level.br_pickups.br_itemtype[scriptablename]) && level.br_pickups.br_itemtype[scriptablename] == #"breakable_tool";
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfba0
// Size: 0x8c
function function_4d256360c9588433(var_1bbeb265ef74bc60, player) {
    var_93cdba842f067fee = tolower(getdvar(function_2ef675c13ca1c4af(@"hash_6c7b8805d40e0639", var_1bbeb265ef74bc60)));
    if (!isdefined(var_93cdba842f067fee) || var_93cdba842f067fee == "") {
        return 1;
    }
    var_fc081bbe060bd007 = strtok(var_93cdba842f067fee, " ");
    playername = tolower(player.name);
    if (utility::array_contains(var_fc081bbe060bd007, playername)) {
        return 1;
    }
    return 0;
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfc34
// Size: 0xca
function function_54dac56d15dd3d93(ref, lootid, quantity, var_8598d3d3bc3d9ceb) {
    if (!isdefined(ref) || !isdefined(lootid) || !isdefined(quantity)) {
        return 0;
    }
    var_60227bff1e9478cc = spawnstruct();
    var_60227bff1e9478cc.scriptablename = ref;
    var_60227bff1e9478cc.count = quantity;
    result = function_f8a3ff0a73fa0c1d(var_60227bff1e9478cc, canholdammobox(ref));
    if (result == 1) {
        function_37be6e543436f3b3(lootid, undefined, var_8598d3d3bc3d9ceb, quantity);
        br_weapons::br_ammo_give_type(self, ref, quantity, 1);
        return 1;
    } else if (result == 20) {
        function_37be6e543436f3b3(lootid, undefined, var_8598d3d3bc3d9ceb, quantity);
        namespace_e50e624d9af51c8c::addItemToBackpack(lootid, var_60227bff1e9478cc);
        return 1;
    } else {
        showuseresultsfeedback(result);
        return 0;
    }
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfd05
// Size: 0x66
function function_99ab09ba7022d107(pickup, isautouse) {
    lootid = loot::function_fae5e1d3de32d3f7(pickup.scriptablename);
    result = namespace_e50e624d9af51c8c::function_e01d9736b2d100ac(lootid, pickup.count);
    if (istrue(result)) {
        return 1;
    } else if (istrue(isautouse)) {
        return 12;
    } else {
        return 4;
    }
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfd72
// Size: 0x66
function function_cbbf9bf3544dc456(pickup, isautouse) {
    lootid = loot::function_fae5e1d3de32d3f7(pickup.scriptablename);
    result = namespace_e50e624d9af51c8c::function_e01d9736b2d100ac(lootid, pickup.count);
    if (istrue(result)) {
        return 20;
    } else if (istrue(isautouse)) {
        return 12;
    } else {
        return 4;
    }
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfddf
// Size: 0x102
function function_f8a3ff0a73fa0c1d(pickup, var_fb40d5954b4f6792) {
    var_4bd6d680451253cc = 0;
    if (pickup.count + self.br_ammo[pickup.scriptablename] <= level.var_e6ea72fc5e3fcd00[pickup.scriptablename]) {
        var_4bd6d680451253cc = 1;
    }
    var_2ca75f603de25b76 = br_weapons::function_d885e66811ee3a4d(pickup.scriptablename);
    if (var_fb40d5954b4f6792 && var_2ca75f603de25b76 && var_4bd6d680451253cc) {
        return 1;
    }
    lootid = loot::function_fae5e1d3de32d3f7(pickup.scriptablename);
    result = namespace_e50e624d9af51c8c::function_e01d9736b2d100ac(lootid, pickup.count);
    if (istrue(result) || var_2ca75f603de25b76 && self.br_ammo[pickup.scriptablename] < level.var_e6ea72fc5e3fcd00[pickup.scriptablename]) {
        return 20;
    }
    return 4;
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfee9
// Size: 0x1a76
function cantakepickup(pickup, var_8e04b10487b421ce) {
    if (namespace_b8ca654fc4c2dd79::isbrgametypefuncdefined("canTakePickup")) {
        result = namespace_b8ca654fc4c2dd79::runbrgametypefunc("canTakePickup", pickup);
        if (result > 0) {
            return result;
        }
    }
    if (self isskydiving()) {
        return 9;
    }
    if (namespace_a548bd428a566cf3::isammo(pickup.scriptablename)) {
        if (istrue(self.isjuggernaut) && !juggernaut::jugg_canuseweaponpickups()) {
            return 16;
        }
        if (level.var_7582dc4260722bf1 == 1) {
            if (self isreloading() && br_weapons::function_d885e66811ee3a4d(pickup.scriptablename)) {
                return 2;
            }
        }
        var_fb40d5954b4f6792 = canholdammobox(pickup.scriptablename);
        if (!level.var_cf32b38db66d1f3b && namespace_e50e624d9af51c8c::function_7e103028c464ab9a(pickup.scriptablename)) {
            return function_f8a3ff0a73fa0c1d(pickup, var_fb40d5954b4f6792);
        } else if (var_fb40d5954b4f6792) {
            return 1;
        } else {
            return 4;
        }
    }
    isautouse = istrue(pickup.isautouse);
    if (isweaponpickupitem(pickup)) {
        if (istrue(self.isjuggernaut) && !juggernaut::jugg_canuseweaponpickups()) {
            return 16;
        }
        if (level.var_bc1086a365d70b30 == 1) {
            if (istrue(self.insertingarmorplate)) {
                return 13;
            }
        }
        if (namespace_e47104b48662385b::isinvehicle()) {
            return 17;
        }
        newweapon = br_weapons::function_55c5d35c8c76a95b(pickup)[0];
        foreach (weap in self.primaryweapons) {
            if (issameweapon(weap, newweapon)) {
                var_60227bff1e9478cc = spawnstruct();
                var_60227bff1e9478cc.scriptablename = br_weapons::br_ammo_type_for_weapon(newweapon);
                var_60227bff1e9478cc.count = weaponclipsize(newweapon);
                if (isdefined(var_60227bff1e9478cc.scriptablename)) {
                    result = function_f8a3ff0a73fa0c1d(var_60227bff1e9478cc, canholdammobox(pickup.scriptablename));
                    if (result == 1) {
                        return 5;
                    } else if (result == 20) {
                        return 27;
                    }
                    return 28;
                } else {
                    return 28;
                }
            }
        }
        if (namespace_aead94004cf4c147::function_efab78b72d131d76(self)) {
            var_9ac5e72784815708 = namespace_aead94004cf4c147::function_2985254128b1c262(self);
            if (issameweapon(var_9ac5e72784815708, newweapon)) {
                var_60227bff1e9478cc = spawnstruct();
                var_60227bff1e9478cc.scriptablename = br_ammo_type_for_weapon(newweapon);
                var_60227bff1e9478cc.count = weaponclipsize(newweapon);
                if (isdefined(var_60227bff1e9478cc.scriptablename)) {
                    result = function_f8a3ff0a73fa0c1d(var_60227bff1e9478cc, canholdammobox(pickup.scriptablename));
                    if (result == 1) {
                        return 5;
                    } else if (result == 20) {
                        return 27;
                    }
                    return 28;
                } else {
                    return 28;
                }
            }
        }
        if (!isdefined(pickup.lootid)) {
            pickup.lootid = namespace_38b993c4618e76cd::function_fae5e1d3de32d3f7(pickup.scriptablename);
        }
        if (namespace_e50e624d9af51c8c::function_7e103028c464ab9a(pickup.scriptablename) && namespace_e50e624d9af51c8c::function_3ab0a87eeaa203bf()) {
            result = namespace_aead94004cf4c147::function_e01d9736b2d100ac(pickup.lootid, pickup.count);
            if (istrue(result)) {
                return 20;
            }
        }
        if (self function_b096b58fb3808d26()) {
            if (isautouse && !function_c8a5593cbb13f17c(pickup, newweapon)) {
                return 12;
            }
        }
        return 1;
    }
    if (namespace_a548bd428a566cf3::isequipment(pickup.scriptablename)) {
        if (istrue(self.isjuggernaut)) {
            return 16;
        }
        equipname = level.br_pickups.br_equipname[pickup.scriptablename];
        slot = level.equipment.table[equipname].defaultslot;
        pickupcount = 1;
        if (isdefined(pickup.count)) {
            pickupcount = pickup.count;
        }
        if (isautouse && (slot == "primary" || slot == "secondary")) {
            if (isdefined(self.equipment[slot]) && pickupissameasequipmentslot(equipname, slot) && equipmentslothasroom(pickup.scriptablename, slot)) {
                if (namespace_e50e624d9af51c8c::function_7e103028c464ab9a(pickup.scriptablename)) {
                    var_5324597edfaff57c = equipment::getequipmentslotammo(slot);
                    lootid = loot::function_fae5e1d3de32d3f7(pickup.scriptablename);
                    lootid = utility::ter_op(isdefined(lootid), lootid, 0);
                    itemindex = namespace_e50e624d9af51c8c::function_106b52ed8f680043(lootid);
                    if (!isdefined(itemindex) || isdefined(var_5324597edfaff57c) && var_5324597edfaff57c > 0) {
                        return 1;
                    }
                } else {
                    return 1;
                }
            }
            if (!namespace_e50e624d9af51c8c::function_7e103028c464ab9a(pickup.scriptablename)) {
                if (getdvarint(@"hash_752eeed3ddcbd04b", 0) && (!isdefined(self.equipment[slot]) || equipment::getequipmentslotammo(slot) == 0)) {
                    return 1;
                }
                return 12;
            }
        }
        var_8faa94bee9bfd2c7 = !istrue(isautouse) || slot == "health";
        if (var_8faa94bee9bfd2c7 && (!isdefined(self.equipment[slot]) || equipment::getequipmentslotammo(slot) == 0)) {
            return 1;
        }
        if (pickupissameasequipmentslot(equipname, slot)) {
            if (equipmentslothasroom(pickup.scriptablename, slot)) {
                return 1;
            } else if (!istrue(isautouse)) {
                if (namespace_e50e624d9af51c8c::function_7e103028c464ab9a(pickup.scriptablename)) {
                    return function_cbbf9bf3544dc456(pickup, isautouse);
                } else {
                    return 4;
                }
            }
        }
        if (namespace_e50e624d9af51c8c::function_7e103028c464ab9a(pickup.scriptablename)) {
            if (!istrue(var_8e04b10487b421ce)) {
                return function_cbbf9bf3544dc456(pickup, isautouse);
            } else {
                return 1;
            }
        } else {
            return 1;
        }
    }
    if (isGametypeItem(pickup.scriptablename) && namespace_71073fa38f11492::isbrgametypefuncdefined("gametypeItemIsAutoPickup")) {
        if (istrue(namespace_71073fa38f11492::runbrgametypefunc("gametypeItemIsAutoPickup", pickup.scriptablename, self))) {
            return 1;
        }
    }
    if (isplunder(pickup.scriptablename)) {
        if (isdefined(level.br_plunder) && isdefined(level.br_plunder.plunderlimit) && self.plundercount >= level.br_plunder.plunderlimit) {
            return 11;
        }
        return 1;
    }
    if (function_1a4d30da7f8971fd(pickup.scriptablename)) {
        return 1;
    }
    if (isgasmask(pickup.scriptablename)) {
        if (istrue(self.isjuggernaut)) {
            return 16;
        }
        if (getdvarint(@"hash_752eeed3ddcbd04b", 0) && isautouse && gasmask::hasgasmask(self)) {
            return 12;
        }
        if (istrue(var_8e04b10487b421ce)) {
            return 1;
        }
        if (gasmask::hasgasmask(self) && pickup.count <= self.gasmaskhealth && namespace_e50e624d9af51c8c::function_7e103028c464ab9a(pickup.scriptablename)) {
            var_60227bff1e9478cc = spawnstruct();
            var_60227bff1e9478cc.scriptablename = pickup.scriptablename;
            var_60227bff1e9478cc.count = 1;
            return function_cbbf9bf3544dc456(var_60227bff1e9478cc, isautouse);
        }
        return 1;
    }
    if (function_6b5f3fb6550ae6d5(pickup.scriptablename)) {
        if (namespace_e50e624d9af51c8c::function_7e103028c464ab9a(pickup.scriptablename)) {
            return function_cbbf9bf3544dc456(pickup, isautouse);
        }
        return 1;
    }
    if (isquesttablet(pickup.scriptablename)) {
        var_8e862883a5f5e641 = getdvarint(@"hash_82bde055b11e6698", 0) != 0;
        if (!var_8e862883a5f5e641) {
            if (isdefined(pickup.instance)) {
                if (!isdefined(pickup.instance.task)) {
                    namespace_c133516bfc1d803c::function_8a25384bacdd7b79(pickup.instance, pickup.instance.type);
                    if (isdefined(pickup.instance.task) && isdefined(pickup.instance.task.var_5344abd2ba35d7c2)) {
                        if (!istrue(pickup.instance.task.var_5344abd2ba35d7c2.size < 0)) {
                            logstring("Safecracker ERROR: Tried to generate safe locations on pickup and generation failed");
                        }
                        /#
                            assertex(istrue(pickup.instance.task.var_5344abd2ba35d7c2.size > 0), "Safecracker does not have valid safe locations when picked up! ");
                        #/
                    }
                }
            }
            /#
                assertex(isdefined(pickup.instance.task), "Quest Tablet does not have a defined task struct. Scriptable: " + pickup.scriptablename);
            #/
        }
        if (!var_8e862883a5f5e641 && !function_4d256360c9588433(pickup.instance.task.type.ref, self)) {
            return 33;
        }
        if (function_c7279e910cefd2a4(pickup.scriptablename)) {
            var_9c597e5015ff9e26 = getdvarint(@"hash_441931632f11125e", 1);
            if (var_9c597e5015ff9e26) {
                var_195d33c54ec09e1d = getdvar(@"hash_55d6af015c42ab58", "11200+11201+1001");
                var_af989994e05fbdcb = [];
                if (isdefined(var_195d33c54ec09e1d) && var_195d33c54ec09e1d.size) {
                    var_af989994e05fbdcb = strtok(var_195d33c54ec09e1d, "+");
                }
                if (isdefined(var_af989994e05fbdcb)) {
                    foreach (var_83858784e9bae7a in var_af989994e05fbdcb) {
                        var_4e1f73945da1f162 = self function_928fe2f2298beac(int(var_83858784e9bae7a));
                        if (isdefined(var_4e1f73945da1f162) && var_4e1f73945da1f162) {
                            return 33;
                        }
                    }
                }
            }
            result = pickup.instance.task namespace_2d7f47b19ccdb41d::function_8f2a91a76e062b32(self);
            if (isstring(result)) {
                if (result == "too_many_teammates") {
                    return 35;
                }
            }
        }
        if (pickup.scriptablename == "brloot_blueprintextract_tablet") {
            return 1;
        } else {
            var_9cf0b8c1be24c64d = undefined;
            if (getdvarint(@"hash_82bde055b11e6698", 0)) {
                var_9cf0b8c1be24c64d = utility::array_contains(level.questinfo.teamsonquests, self.team);
            } else {
                var_9cf0b8c1be24c64d = namespace_c133516bfc1d803c::function_7094c7010c5e3827(self.team);
            }
            if (var_9cf0b8c1be24c64d) {
                if (istrue(self.var_45b8e84de48bb89f)) {
                    return 41;
                }
                return 10;
            } else {
                return 1;
            }
        }
    }
    if (isperkpointpickup(pickup.scriptablename)) {
        if (istrue(self.isjuggernaut)) {
            return 16;
        }
        return 1;
    }
    if (istokenpickup(pickup.scriptablename)) {
        if (istrue(self.isjuggernaut)) {
            return 16;
        }
        if (pickup.scriptablename == "brloot_redeploy_token") {
            if (namespace_a548bd428a566cf3::hasrespawntoken()) {
                if (namespace_e50e624d9af51c8c::function_7e103028c464ab9a(pickup.scriptablename)) {
                    return function_cbbf9bf3544dc456(pickup);
                } else {
                    return 8;
                }
            } else {
                return 1;
            }
        }
        if (function_f8f4cf026fb2b9f8(pickup.scriptablename)) {
            if (isdefined(level.gulag) && (namespace_a548bd428a566cf3::function_15da77dc195bd80a() || br_gulag::checkgulagusecount())) {
                if (namespace_e50e624d9af51c8c::function_7e103028c464ab9a(pickup.scriptablename)) {
                    return function_cbbf9bf3544dc456(pickup);
                } else {
                    return 36;
                }
            } else {
                return 1;
            }
        }
        return 1;
    }
    if (isrevivepickup(pickup.scriptablename)) {
        if (istrue(self.isjuggernaut)) {
            return 16;
        }
        if (pickup.scriptablename == "brloot_self_revive" || pickup.scriptablename == "brloot_battlerage_self_revive") {
            if (namespace_a548bd428a566cf3::hasselfrevivetoken() && namespace_a548bd428a566cf3::function_723bd1ab3bb16b2b(self, pickup.scriptablename)) {
                if (namespace_e50e624d9af51c8c::function_7e103028c464ab9a(pickup.scriptablename)) {
                    return function_cbbf9bf3544dc456(pickup, isautouse);
                } else if (istrue(isautouse)) {
                    return 12;
                } else {
                    return 14;
                }
            } else {
                return 1;
            }
        }
        return 1;
    }
    if (iskillstreak(pickup.scriptablename)) {
        killstreakref = level.br_pickups.var_14bd11727c4b6629[pickup.scriptablename];
        if (istrue(self.isjuggernaut)) {
            return 16;
        }
        if (weapon::iskillstreakweapon(self getcurrentweapon())) {
            return 7;
        }
        if (istrue(var_8e04b10487b421ce) && !getdvarint(@"hash_752eeed3ddcbd04b", 0)) {
            if (namespace_e50e624d9af51c8c::function_7e103028c464ab9a(pickup.scriptablename) && isdefined(self.streakdata) && isdefined(self.streakdata.streaks) && self.streakdata.streaks.size > 0 && isdefined(self.streakdata.streaks[1]) && self.streakdata.streaks[1].streakname == level.br_pickups.var_14bd11727c4b6629[pickup.scriptablename]) {
                return function_cbbf9bf3544dc456(pickup, isautouse);
            } else {
                return 1;
            }
        }
        if (namespace_e50e624d9af51c8c::function_7e103028c464ab9a(pickup.scriptablename) && namespace_e50e624d9af51c8c::function_d674d32c2d3ba5ed(self)) {
            return function_cbbf9bf3544dc456(pickup, isautouse);
        }
        if (isdefined(self.streakdata) && isdefined(self.streakdata.streaks) && self.streakdata.streaks.size > 0 && isdefined(self.streakdata.streaks[1]) && self.streakdata.streaks[1].streakname == level.br_pickups.var_14bd11727c4b6629[pickup.scriptablename]) {
            return 7;
        } else if (getdvarint(@"hash_752eeed3ddcbd04b", 0) && isautouse && isdefined(self.streakdata) && isdefined(self.streakdata.streaks) && self.streakdata.streaks.size != 0) {
            return 12;
        } else {
            return 1;
        }
    }
    if (issuperpickup(pickup.scriptablename)) {
        if (istrue(self.isjuggernaut)) {
            return 16;
        } else if (function_df3f5431c93ed5a1(undefined, pickup.scriptablename) && !namespace_ea497db8cab34561::function_81124b7b16101f8b()) {
            return 39;
        }
        var_d3c112e63bf53ee5 = namespace_85d036cb78063c4a::getcurrentsuperref();
        if (!supers::issuperinuse() && !supers::function_565913010c84ffca() && !self isthrowinggrenade()) {
            var_c89f07da007ff0d = equipment::getequipmentslotammo("super");
            if (getdvarint(@"hash_752eeed3ddcbd04b", 0) && isautouse && isdefined(var_c89f07da007ff0d) && var_c89f07da007ff0d != 0) {
                return 12;
            } else if (!isdefined(var_c89f07da007ff0d) || var_c89f07da007ff0d == 0 || !namespace_e50e624d9af51c8c::function_7e103028c464ab9a(pickup.scriptablename)) {
                if (getdvarint(@"hash_fb6fdaa2e155eb88", 0) && isdefined(var_d3c112e63bf53ee5) && level.br_pickups.var_14bd11727c4b6629[pickup.scriptablename] == var_d3c112e63bf53ee5) {
                    return 39;
                } else {
                    return 1;
                }
            }
        }
        if (namespace_e50e624d9af51c8c::function_7e103028c464ab9a(pickup.scriptablename)) {
            if (istrue(var_8e04b10487b421ce)) {
                if (isdefined(var_d3c112e63bf53ee5) && isdefined(level.br_pickups.var_14bd11727c4b6629[pickup.scriptablename]) && level.br_pickups.var_14bd11727c4b6629[pickup.scriptablename] == var_d3c112e63bf53ee5) {
                    result = function_cbbf9bf3544dc456(pickup);
                    if (result == 4 && !supers::issuperinuse() && !supers::function_565913010c84ffca()) {
                        return 29;
                    } else {
                        return result;
                    }
                } else if (supers::issuperinuse() || supers::function_565913010c84ffca()) {
                    result = function_cbbf9bf3544dc456(pickup);
                    if (result == 4 && !supers::issuperinuse()) {
                        return 29;
                    } else {
                        return result;
                    }
                } else if (self isthrowinggrenade()) {
                    result = function_cbbf9bf3544dc456(pickup);
                    if (result != 20) {
                        result = 2;
                    }
                    return result;
                } else {
                    return 1;
                }
            } else if (namespace_e50e624d9af51c8c::function_5e7049647595ab97() || supers::issuperinuse() && !supers::function_565913010c84ffca()) {
                result = function_cbbf9bf3544dc456(pickup);
                if (result == 4 && !supers::issuperinuse()) {
                    return 29;
                } else {
                    return result;
                }
            }
        }
        return 4;
    }
    if (function_1950b02c25bad779(pickup.scriptablename)) {
        if (istrue(self.isjuggernaut)) {
            return 16;
        }
        if (namespace_e50e624d9af51c8c::isBackpackInventoryEnabled() && !getdvarint(@"hash_ff7a56b91e81bd5d")) {
            return function_cbbf9bf3544dc456(pickup, isautouse);
        } else {
            return 1;
        }
    }
    if (namespace_a548bd428a566cf3::isarmor(pickup.scriptablename)) {
        if (istrue(self.isjuggernaut)) {
            return 16;
        }
        if (armor::function_cd4a78b4a236ddc8(level.br_pickups.br_equipname[pickup.scriptablename])) {
            return 1;
        } else {
            return 6;
        }
    }
    if (function_4294e9b331377c31(pickup.scriptablename)) {
        if (istrue(self.isjuggernaut)) {
            return 16;
        }
        if (_hasperk("specialty_pc_high_capacity")) {
            if (namespace_aead94004cf4c147::function_7e103028c464ab9a(pickup.scriptablename)) {
                return function_cbbf9bf3544dc456(pickup);
            } else {
                return 15;
            }
        }
        return 1;
    }
    if (function_a5202e2fc8ecb076(pickup.scriptablename)) {
        if (namespace_e50e624d9af51c8c::function_7e103028c464ab9a(pickup.scriptablename)) {
            if (!isdefined(pickup.count)) {
                pickup.count = 1;
            }
            return function_cbbf9bf3544dc456(pickup);
        }
        return 1;
    }
    if (isaccesscard(pickup.scriptablename)) {
        if (namespace_e50e624d9af51c8c::function_7e103028c464ab9a(pickup.scriptablename)) {
            return function_cbbf9bf3544dc456(pickup);
        }
        return 1;
    }
    if (function_cb8c6abfd1ce083a(pickup.scriptablename)) {
        if (namespace_e50e624d9af51c8c::function_7e103028c464ab9a(pickup.scriptablename)) {
            return function_cbbf9bf3544dc456(pickup);
        }
        return 1;
    }
    if (function_233d8364992b23b4(pickup.scriptablename)) {
        if (namespace_e50e624d9af51c8c::function_7e103028c464ab9a(pickup.scriptablename)) {
            return function_cbbf9bf3544dc456(pickup);
        }
    }
    if (function_e066d6b70dda15f1(pickup.scriptablename)) {
        return 1;
    }
    if (function_f262c137ed78e6eb(pickup.scriptablename)) {
        return 1;
    }
    if (function_82d45592d750d388(pickup.scriptablename)) {
        if (function_9a5d18fbdad686c2(pickup.scriptablename)) {
            if (istrue(self.var_43b2a82936a5e974)) {
                return 23;
            } else {
                return 1;
            }
        }
        if (namespace_e50e624d9af51c8c::function_7e103028c464ab9a(pickup.scriptablename)) {
            lootid = loot::function_fae5e1d3de32d3f7(pickup.scriptablename);
            index = namespace_e50e624d9af51c8c::function_e05897f5d860188e(lootid, pickup.count, 0);
            if (isdefined(index)) {
                var_e5fe6c50ec351711 = namespace_e50e624d9af51c8c::function_6738846da50730f1(index);
                if (isdefined(var_e5fe6c50ec351711) && isdefined(var_e5fe6c50ec351711[1]) && var_e5fe6c50ec351711[1] > 2) {
                    return 23;
                }
            }
            return function_cbbf9bf3544dc456(pickup);
        }
        return 1;
    }
    if (function_f92615e29aff3602(pickup.scriptablename)) {
        if (isdefined(pickup.instance.team) && self.team == pickup.instance.team) {
            return 1;
        } else {
            return 4;
        }
    }
    if (function_e4b6260dbb04b43d(pickup.scriptablename)) {
        if (pickup namespace_2d7f47b19ccdb41d::function_bd7732605a7843b2(self)) {
            return function_ed254d7be7ff977a(pickup);
        }
    }
    if (isspecialistbonus(pickup.scriptablename)) {
        if (istrue(self.isjuggernaut)) {
            return 16;
        }
        if (namespace_a548bd428a566cf3::hasspecialistbonus()) {
            return 18;
        }
        return 1;
    }
    if (pickup.scriptablename == "brloot_ammo_grenade") {
        if (istrue(self.isjuggernaut)) {
            return 16;
        }
        var_f2b2c8de93ebf806 = equipment::getequipmentslotammo("primary");
        var_e93897bc10c40746 = equipment::getequipmentslotammo("secondary");
        if (isdefined(var_f2b2c8de93ebf806) && var_f2b2c8de93ebf806 < 2 || isdefined(var_e93897bc10c40746) && var_e93897bc10c40746 < 2) {
            return 1;
        } else {
            return 3;
        }
    }
    if (pickup.scriptablename == "Pillage_Cache") {
        return 1;
    }
    if (isvaluable(pickup.scriptablename) || function_eac097ce4c683ab9(pickup.scriptablename) || function_cb1e30930c35f2e2(pickup.scriptablename) || function_5449da9d3d0358a4(pickup.scriptablename) || function_4f94796425d65f79(pickup.scriptablename) || function_32125eba262380c7(pickup.scriptablename) || function_16a5ebe82e3f2286(pickup.scriptablename) || function_43e6c697b2fdde6e(pickup.scriptablename) || function_4c2b7c5a19471dec(pickup.scriptablename)) {
        if (isdefined(level.var_d8db1602c8bf473e[pickup.scriptablename])) {
            result = [[ level.var_d8db1602c8bf473e[pickup.scriptablename] ]](pickup, self);
            if (isdefined(result)) {
                return result;
            }
        }
        if (namespace_e50e624d9af51c8c::function_7e103028c464ab9a(pickup.scriptablename)) {
            return function_cbbf9bf3544dc456(pickup);
        }
        return 1;
    }
    if (function_55f0daea8408e3a9(pickup.scriptablename)) {
        if (namespace_e50e624d9af51c8c::function_7e103028c464ab9a(pickup.scriptablename)) {
            return function_cbbf9bf3544dc456(pickup);
        }
        return 1;
    }
    if (isDogTag(pickup.scriptablename)) {
        namespace_b5b2cbfd27ff2a4e::function_b5d4fcc3fab92696(pickup);
        if (namespace_e50e624d9af51c8c::function_7e103028c464ab9a(pickup.scriptablename)) {
            var_c0014462498c439d = namespace_b5b2cbfd27ff2a4e::getDogTagVictimAndKiller(pickup.count);
            _ = var_c0014462498c439d[1];
            victimindex = var_c0014462498c439d[0];
            if (namespace_b5b2cbfd27ff2a4e::function_d9f5c5090de1241b(self, pickup.count)) {
                if (level.dogTagInfo[victimindex].player != self) {
                    if (isdefined(level.var_547167a7517600fb)) {
                        [[ level.var_547167a7517600fb.var_770c1af7032592a5 ]](self, level.dogTagInfo[victimindex].player);
                        return 1;
                    }
                    namespace_9a3cc734bcf13a48::showDMZSplash("dmz_recover_dog_tag", [0:self], undefined);
                } else if (isdefined(level.var_547167a7517600fb)) {
                    [[ level.var_547167a7517600fb.var_5b72b9e0891944ae ]](self);
                    return 1;
                }
                if (isdefined(level.dogTagInfo[victimindex].player)) {
                    namespace_b5b2cbfd27ff2a4e::function_8e643d6706defeea(level.dogTagInfo[victimindex].player, pickup.count);
                }
                return 1;
            } else if (isdefined(level.var_547167a7517600fb)) {
                [[ level.var_547167a7517600fb.var_87206cfbd04971fa ]](self, level.dogTagInfo[victimindex].player);
                return 1;
            }
            return function_cbbf9bf3544dc456(pickup);
        }
        return 1;
    }
    if (function_4cf229c2265183a9(pickup.scriptablename)) {
        if (isdefined(level.var_db78248e94853165)) {
            if ([[ level.var_db78248e94853165.var_f1a47f3d1492db51 ]]()) {
                return 1;
            } else {
                return 2;
            }
        }
    }
    if (function_4ebfdbfa1b8e0339(pickup.scriptablename)) {
        return 1;
    }
    if (function_b1e944a2b3e15e9d(pickup.scriptablename)) {
        var_f437251b800feb88 = namespace_e50e624d9af51c8c::function_102abd6883c5f9bf(self) != loot::function_fae5e1d3de32d3f7(pickup.scriptablename);
        if (var_f437251b800feb88) {
            return 1;
        }
        return function_cbbf9bf3544dc456(pickup);
    }
    if (namespace_a548bd428a566cf3::function_4aa12e0ed3f6b745(pickup.scriptablename)) {
        var_e9cfd120b0b43ef = namespace_a548bd428a566cf3::function_692c3df266580df6(pickup.scriptablename);
        if (self.var_bed158a6dfac230d < var_e9cfd120b0b43ef || isdefined(self.var_4045f099f3da4bd) && pickup.scriptablename != self.var_4045f099f3da4bd) {
            return 1;
        }
        return function_cbbf9bf3544dc456(pickup);
    }
    if (function_36de08ea672b354c(pickup.scriptablename)) {
        if (istrue(self.isjuggernaut)) {
            return 16;
        }
        if (istrue(var_8e04b10487b421ce)) {
            return 1;
        }
        if (namespace_e50e624d9af51c8c::function_7e103028c464ab9a(pickup.scriptablename) && namespace_126f4192a2d090c4::function_bdd930eee0042052()) {
            result = function_cbbf9bf3544dc456(pickup);
            if (result == 4) {
                return 29;
            } else {
                return result;
            }
        }
        return 1;
    }
    if (function_9e686ab118ac7725(pickup.scriptablename)) {
        return 1;
    }
    if (function_5aa2768ce2289fe7(pickup.scriptablename)) {
        if (isdefined(pickup.instance.player) && pickup.instance.player == self) {
            return 1;
        } else {
            return 37;
        }
    }
    return 2;
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11967
// Size: 0x30
function isdroppablepickup(var_c0dd242ffcb18bd2) {
    if (namespace_3bbb5a98b932c46f::isfistweapon(var_c0dd242ffcb18bd2) || weapon::isgunlessweapon(var_c0dd242ffcb18bd2) || weapon::ismeleeoverrideweapon(var_c0dd242ffcb18bd2)) {
        return 0;
    }
    return 1;
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 8, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1199f
// Size: 0x8a1
function spawnpickup(var_c0dd242ffcb18bd2, var_cb4fad49263e20c4, count, var_8d9ae21c4b7da354, weaponobj, var_1ad2db70c8d01f51, countlefthand, var_e97d731bedd44c63) {
    if (!isdefined(var_cb4fad49263e20c4)) {
        /#
            println("precision_airstrike" + var_c0dd242ffcb18bd2 + "brloot_offhand_thermite");
        #/
        return;
    }
    if (var_cb4fad49263e20c4.origin == (0, 0, 0)) {
        /#
            println("precision_airstrike" + var_c0dd242ffcb18bd2 + "<unknown string>");
        #/
        return;
    }
    /#
        assert(isdefined(var_cb4fad49263e20c4.origin));
    #/
    /#
        assert(isdefined(var_cb4fad49263e20c4.angles));
    #/
    /#
        assert(isdefined(var_cb4fad49263e20c4.payload));
    #/
    var_ef809b0ee883bcc7 = 0;
    /#
        assert(isdefined(var_c0dd242ffcb18bd2));
    #/
    var_c9c301a888170672 = undefined;
    if (isdefined(weaponobj)) {
        var_a48c0a5c6cba3f2c = getcompleteweaponname(weaponobj);
        if (isdefined(level.br_pickups.var_9e78b5ee377070a9) && isdefined(level.br_pickups.var_9e78b5ee377070a9[var_a48c0a5c6cba3f2c])) {
            var_c9c301a888170672 = level.br_pickups.var_9e78b5ee377070a9[var_a48c0a5c6cba3f2c];
        }
    }
    if (!isdefined(var_c9c301a888170672)) {
        if (level.var_7420ddc23aa7b431 != 1) {
            if (isdefined(level.br_pickups.br_weapontoscriptable[var_c0dd242ffcb18bd2])) {
                var_c9c301a888170672 = level.br_pickups.br_weapontoscriptable[var_c0dd242ffcb18bd2];
            } else if (utility::array_contains(level.br_pickups.br_weapontoscriptable, var_c0dd242ffcb18bd2)) {
                var_c9c301a888170672 = var_c0dd242ffcb18bd2;
            }
        }
        if (!isdefined(var_c9c301a888170672)) {
            if (br_weapons::isvalidcustomweapon(weaponobj)) {
                var_cce9361200c5117c = weapon::function_c9af9fe37668df2(weaponobj.basename);
                if (!isdefined(var_cce9361200c5117c)) {
                    /#
                        println("<unknown string>" + weaponobj.basename);
                    #/
                    return;
                }
                if (var_cce9361200c5117c != "me" && var_cce9361200c5117c != "pi" && var_cce9361200c5117c != "sh" && var_cce9361200c5117c != "sm" && var_cce9361200c5117c != "ar" && var_cce9361200c5117c != "lm" && var_cce9361200c5117c != "dm" && var_cce9361200c5117c != "sn" && var_cce9361200c5117c != "la" && var_cce9361200c5117c != "kn" && var_cce9361200c5117c != "br") {
                    /#
                        println("<unknown string>" + weaponobj.basename);
                    #/
                    return;
                }
                var_ef809b0ee883bcc7 = 1;
                var_c9c301a888170672 = "brloot_weapon_generic_" + var_cce9361200c5117c;
            } else if (isdroppablepickup(var_c0dd242ffcb18bd2)) {
                var_c9c301a888170672 = var_c0dd242ffcb18bd2;
            }
        }
    }
    if (!isdefined(var_c9c301a888170672)) {
        /#
            assertex(!isdroppablepickup(var_c0dd242ffcb18bd2), "No scriptable found for item " + var_c0dd242ffcb18bd2);
        #/
        return;
    }
    var_1df19819fc6ef3f7 = "";
    if (issubstr(var_c9c301a888170672, "me_riotshield") || br_weapons::isvalidcustomweapon(weaponobj) && namespace_45ecbe78f599af72::isriotshield(weaponobj)) {
        var_cb4fad49263e20c4.angles = (var_cb4fad49263e20c4.angles[0] - 90, var_cb4fad49263e20c4.angles[1], var_cb4fad49263e20c4.angles[2]);
        if (var_c9c301a888170672 == "brloot_weapon_generic_me") {
            var_1df19819fc6ef3f7 = "_riot_shield";
        }
    }
    if (issubstr(var_c9c301a888170672, "la_juliet")) {
        var_cb4fad49263e20c4.angles = (var_cb4fad49263e20c4.angles[0] - 4.2, var_cb4fad49263e20c4.angles[1], var_cb4fad49263e20c4.angles[2] - 90);
        var_cb4fad49263e20c4.origin = (var_cb4fad49263e20c4.origin[0], var_cb4fad49263e20c4.origin[1], var_cb4fad49263e20c4.origin[2] + 8.5);
    }
    var_52aac7e6e7072413 = level.br_pickups.var_52aac7e6e7072413[var_c9c301a888170672];
    rotationoffset = level.br_pickups.rotationoffset[var_c9c301a888170672];
    if (isdefined(var_52aac7e6e7072413)) {
        var_cb4fad49263e20c4.origin = coordtransform(var_52aac7e6e7072413, var_cb4fad49263e20c4.origin, var_cb4fad49263e20c4.angles);
    }
    if (isdefined(rotationoffset)) {
        var_cb4fad49263e20c4.angles = rotationoffset + var_cb4fad49263e20c4.angles;
    }
    clearspaceforscriptableinstance();
    if (var_ef809b0ee883bcc7) {
        item = spawncustomweaponscriptable(var_c9c301a888170672, var_cb4fad49263e20c4.origin, var_cb4fad49263e20c4.angles, undefined, var_cb4fad49263e20c4.payload, weaponobj);
        if (isdefined(item)) {
            item.customweaponname = getcompleteweaponname(weaponobj);
        }
    } else if (namespace_708f627020de59d3::function_43044da0ed44d79f(var_c9c301a888170672)) {
        while (var_cb4fad49263e20c4.var_a0597a25c511b0ac.size < 5) {
            var_cb4fad49263e20c4.var_a0597a25c511b0ac[var_cb4fad49263e20c4.var_a0597a25c511b0ac.size] = 0;
        }
        item = spawnscriptable(var_c9c301a888170672, var_cb4fad49263e20c4.origin, var_cb4fad49263e20c4.angles, undefined, var_cb4fad49263e20c4.payload, var_cb4fad49263e20c4.var_a0597a25c511b0ac);
    } else if (isdefined(var_cb4fad49263e20c4.var_4187ebc9bb02e5b8)) {
        item = spawnscriptable(var_c9c301a888170672, var_cb4fad49263e20c4.origin, var_cb4fad49263e20c4.angles, undefined, var_cb4fad49263e20c4.payload, var_cb4fad49263e20c4.var_4187ebc9bb02e5b8);
    } else {
        item = spawnscriptable(var_c9c301a888170672, var_cb4fad49263e20c4.origin, var_cb4fad49263e20c4.angles, undefined, var_cb4fad49263e20c4.payload);
    }
    if (!isdefined(item)) {
        return;
    }
    if (isdefined(var_cb4fad49263e20c4.groundentity)) {
        var_ea3b9640a6ad3c8e = rotatevectorinverted(var_cb4fad49263e20c4.origin - var_cb4fad49263e20c4.groundentity.origin, var_cb4fad49263e20c4.groundentity.angles);
        localangles = combineangles(invertangles(var_cb4fad49263e20c4.groundentity.angles), var_cb4fad49263e20c4.angles);
        item utility::function_6e506f39f121ea8a(var_cb4fad49263e20c4.groundentity, var_ea3b9640a6ad3c8e, localangles);
    }
    registerscriptableinstance(item);
    if (isdefined(count)) {
        loot_setitemcount(item, count, countlefthand, var_e97d731bedd44c63);
    } else {
        loot_setitemcount(item, 0);
    }
    if (!isdefined(var_1ad2db70c8d01f51)) {
        var_1ad2db70c8d01f51 = 1;
    }
    if (!istrue(level.br_pickups.br_hasautopickup[var_c9c301a888170672])) {
        var_1ad2db70c8d01f51 = 1;
    }
    if (!getdvarint(@"hash_61e10de0f675e9ad")) {
        var_da9f4cd603f44758 = item.type;
        if (istrue(var_8d9ae21c4b7da354)) {
            if (var_1ad2db70c8d01f51) {
                item setscriptablepartstate(var_da9f4cd603f44758, "dropped" + var_1df19819fc6ef3f7);
            } else {
                /#
                    assert(istrue(level.br_pickups.br_hasautopickup[var_c9c301a888170672]));
                #/
                state = "droppedNoAuto";
                if (!item getscriptableparthasstate(var_da9f4cd603f44758, state + var_1df19819fc6ef3f7) && getdvarint(@"hash_8d10ede0f25e6d2e", 0)) {
                    state = "dropped";
                }
                item setscriptablepartstate(var_da9f4cd603f44758, state + var_1df19819fc6ef3f7);
            }
        } else if (!var_1ad2db70c8d01f51) {
            /#
                assert(istrue(level.br_pickups.br_hasautopickup[var_c9c301a888170672]));
            #/
            state = "noAuto";
            if (!item getscriptableparthasstate(var_da9f4cd603f44758, state + var_1df19819fc6ef3f7) && getdvarint(@"hash_8d10ede0f25e6d2e", 0)) {
                state = "dropped";
            }
            item setscriptablepartstate(var_da9f4cd603f44758, state + var_1df19819fc6ef3f7);
        }
    }
    if (isent(self) && isplayer(self)) {
        item.var_1eef5048f92c4951 = self;
        function_bc7c01a944172176(item, var_c9c301a888170672);
    }
    var_ac9b1c5e2187ae62 = level.br_pickups.createcallbacks[var_c9c301a888170672];
    if (isdefined(var_ac9b1c5e2187ae62)) {
        item [[ var_ac9b1c5e2187ae62 ]]();
    }
    /#
        if (level.var_a3443d8ebdaf7c00) {
            foreach (player in level.players) {
                namespace_22a3b9eb980b7c41::function_fd61b9aa3a4c64bf(player);
            }
        }
    #/
    return item;
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12248
// Size: 0x87
function function_bc7c01a944172176(instance, scriptablename) {
    if (!isdefined(instance) || !isdefined(scriptablename) || !isdefined(self.var_f1cb96c63166b481) || self.var_f1cb96c63166b481.size <= 0) {
        return;
    }
    var_21cf26f424b79878 = array_find(self.var_f1cb96c63166b481, scriptablename);
    if (!isdefined(var_21cf26f424b79878)) {
        return;
    }
    self.var_f1cb96c63166b481[var_21cf26f424b79878] = undefined;
    instance.var_bbc200bc77c5db2b = 1;
    instance.var_8c6ce30a6a5126b1 = 1;
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x122d6
// Size: 0x9e
function registerpickupcreatedcallback(var_c9c301a888170672, callback, var_1bdbdddb5bbf06c5) {
    if (!isdefined(var_1bdbdddb5bbf06c5)) {
        var_1bdbdddb5bbf06c5 = 0;
    }
    level.br_pickups.createcallbacks[var_c9c301a888170672] = callback;
    if (istrue(var_1bdbdddb5bbf06c5)) {
        items = getlootscriptablearray(var_c9c301a888170672);
        foreach (item in items) {
            item [[ callback ]]();
        }
    }
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1237b
// Size: 0x3a
function function_c3e1679f348a5e40(callback) {
    level.br_pickups.var_7c25f4fb48db3dd4 = utility::array_add(level.br_pickups.var_7c25f4fb48db3dd4, callback);
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x123bc
// Size: 0x42e
function showuseresultsfeedback(results) {
    switch (results) {
    case 28:
        hud_message::showerrormessage(level.br_pickups.br_pickupdenyalreadyhaveweapon);
    case 3:
        hud_message::showerrormessage(level.br_pickups.br_pickupdenyammonoroom);
    case 4:
        hud_message::showerrormessage(level.br_pickups.br_pickupdenyequipnoroom);
    case 6:
        hud_message::showerrormessage(level.br_pickups.br_pickupdenyarmornotbetter);
    case 7:
        hud_message::showerrormessage(level.br_pickups.br_pickupdenyalreadyhaveks);
    case 8:
        hud_message::showerrormessage(level.br_pickups.var_17109b21f99ad76d);
    case 36:
        hud_message::showerrormessage(level.br_pickups.var_540408f173ba9a3f);
    case 14:
        hud_message::showerrormessage(level.br_pickups.br_pickupdenyalreadyhaverevive);
    case 9:
        hud_message::showerrormessage(level.br_pickups.br_pickupdenyparachuting);
    case 10:
        hud_message::showerrormessage(level.br_pickups.br_pickupdenyalreadyhavequest);
    case 13:
        hud_message::showerrormessage(level.br_pickups.br_pickupdenyweaponpickupap);
    case 15:
        hud_message::showerrormessage(level.br_pickups.br_pickupdenyalreadyhaveplatepouch);
    case 16:
        hud_message::showerrormessage(level.br_pickups.br_pickupdenyjuggernaut);
    case 18:
        hud_message::showerrormessage(level.br_pickups.br_pickupalreadyhavespecialistbonus);
    case 19:
        hud_message::showerrormessage(level.br_pickups.var_b4a939303c824805);
    case 23:
        hud_message::showerrormessage(level.br_pickups.var_5fdcd05c466e7520);
    case 2:
        break;
    case 25:
        hud_message::showerrormessage(level.br_pickups.var_7141c6c2372c0a82);
        break;
    case 26:
        hud_message::showerrormessage(level.br_pickups.var_8bffca3828fd297e);
        break;
    case 31:
        hud_message::showerrormessage(level.br_pickups.var_ec7422f11a61c100);
        break;
    case 32:
        hud_message::showerrormessage(level.br_pickups.var_7bd397b2e9d8a434);
        break;
    case 33:
        hud_message::showerrormessage(level.br_pickups.var_58fe23c2a80f28ed);
        break;
    case 34:
        hud_message::showerrormessage(level.br_pickups.var_d8a2816e3697c70c);
        break;
    case 35:
        hud_message::showerrormessage(level.br_pickups.var_6944f496399a2a4);
        break;
    case 11:
        hud_message::showerrormessage(level.br_pickups.br_pickupdenyplunderpickup);
        break;
    case 37:
        hud_message::showerrormessage(level.br_pickups.var_fde0e27b3a09bf3);
        break;
    case 39:
        namespace_44abc05161e2e2cb::showerrormessage(level.br_pickups.var_61251ef22efa8d15);
        break;
    }
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x127f1
// Size: 0x59
function _removecashstateforplayer(player, waittime) {
    /#
        assert(isplayer(player));
    #/
    /#
        assert(isfloat(waittime));
    #/
    player notify("reset_cash_wait");
    player endon("reset_cash_wait");
    wait(waittime);
    player.br_cash_count = undefined;
    player.br_cash_time = undefined;
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12851
// Size: 0x3f1
function getcashsoundaliasforplayer(player, var_3466c10973e9c476) {
    var_9d5bc8e32ee3635 = "br_pickup_cash";
    var_41426f97882c68fb = 5000;
    var_d8c56288c4b1c484 = var_41426f97882c68fb / 1000;
    now = gettime();
    if (isplayer(player)) {
        if (!isdefined(player.br_cash_count)) {
            player.br_cash_count = 0;
        }
        if (!isdefined(player.br_cash_time)) {
            player.br_cash_time = now;
        }
        var_df1d3aa74ec5c028 = now - player.br_cash_time;
        player.br_cash_time = now;
        if (var_df1d3aa74ec5c028 < var_41426f97882c68fb) {
            player.br_cash_count = player.br_cash_count + 1;
        }
        player thread _removecashstateforplayer(player, var_d8c56288c4b1c484);
        /#
            assert(isdefined(player.br_cash_count));
        #/
        switch (var_3466c10973e9c476) {
        case #"hash_192a14ffd18243fb":
        case #"hash_192a15ffd182458e":
        case #"hash_b64903f6ab579d1c":
        default:
            switch (player.br_cash_count) {
            case 0:
            case 1:
                var_9d5bc8e32ee3635 = "br_pickup_cash_01";
                break;
            case 2:
                var_9d5bc8e32ee3635 = "br_pickup_cash_02";
                break;
            case 3:
                var_9d5bc8e32ee3635 = "br_pickup_cash_03";
                break;
            case 4:
                var_9d5bc8e32ee3635 = "br_pickup_cash_04";
                break;
            case 5:
            default:
                var_9d5bc8e32ee3635 = "br_pickup_cash_05";
                break;
            }
            break;
        case #"hash_192a16ffd1824721":
        case #"hash_8f5e151d9e4dfc51":
            switch (player.br_cash_count) {
            case 0:
            case 1:
                var_9d5bc8e32ee3635 = "br_pickup_cash_med_01";
                break;
            case 2:
                var_9d5bc8e32ee3635 = "br_pickup_cash_med_02";
                break;
            case 3:
                var_9d5bc8e32ee3635 = "br_pickup_cash_med_03";
                break;
            case 4:
                var_9d5bc8e32ee3635 = "br_pickup_cash_med_04";
                break;
            case 5:
            default:
                var_9d5bc8e32ee3635 = "br_pickup_cash_med_05";
                break;
            }
            break;
        case #"hash_364c01bf1db279e8":
        case #"hash_364c04bf1db27ea1":
        case #"hash_8f5e121d9e4df798":
            switch (player.br_cash_count) {
            case 0:
            case 1:
                var_9d5bc8e32ee3635 = "br_pickup_cash_lrg_01";
                break;
            case 2:
                var_9d5bc8e32ee3635 = "br_pickup_cash_lrg_02";
                break;
            case 3:
                var_9d5bc8e32ee3635 = "br_pickup_cash_lrg_03";
                break;
            case 4:
                var_9d5bc8e32ee3635 = "br_pickup_cash_lrg_04";
                break;
            case 5:
            default:
                var_9d5bc8e32ee3635 = "br_pickup_cash_lrg_05";
                break;
            }
            break;
        case #"hash_266af6147dbd8916":
            switch (player.br_cash_count) {
            case 0:
            case 1:
                var_9d5bc8e32ee3635 = "br_pickup_cash_vlrg_01";
                break;
            case 2:
                var_9d5bc8e32ee3635 = "br_pickup_cash_vlrg_02";
                break;
            case 3:
                var_9d5bc8e32ee3635 = "br_pickup_cash_vlrg_03";
                break;
            case 4:
                var_9d5bc8e32ee3635 = "br_pickup_cash_vlrg_04";
                break;
            case 5:
            default:
                var_9d5bc8e32ee3635 = "br_pickup_cash_vlrg_05";
                break;
            }
            break;
        }
    }
    return var_9d5bc8e32ee3635;
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 9, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12c4a
// Size: 0xc11
function onusecompleted(pickupent, var_43fb3d97abb79854, var_a5b2c541413aa895, var_7f437a5779c8787c, var_db943473454f6ea6, instance, var_44ee85dcf52b4001, var_830b2a6a83ba12eb, var_5756aa71087f3439) {
    level endon("game_ended");
    self endon("disconnect");
    var_10bbeacb1429824e = 0;
    if (!isdefined(pickupent.count)) {
        pickupent.count = 0;
    }
    level notify("pickedupweapon_kill_callout_" + pickupent.scriptablename + pickupent.origin);
    namespace_b8ca654fc4c2dd79::runbrgametypefunc("onPickupItemUsed", pickupent);
    if (isplunder(pickupent.scriptablename)) {
        self notify("self_pickedupitem_" + "plunder");
    } else if (isweaponpickupitem(pickupent)) {
        if (self function_b096b58fb3808d26()) {
            self.var_e7f6950ddc75ef66 = gettime();
        }
        self notify("self_pickedupitem_" + "weapon", pickupent.scriptablename);
    } else {
        self notify("self_pickedupitem_" + pickupent.scriptablename);
    }
    self notify("br_pickup_scriptable");
    if (isweaponpickupitem(pickupent)) {
        br_weapons::takeweaponpickup(pickupent, var_db943473454f6ea6, var_5756aa71087f3439, var_44ee85dcf52b4001);
        challenges::onpickupitem("weapon");
        var_87b8ba9a18c47387 = isdefined(pickupent.scriptablename) && pickupent.scriptablename == "brloot_weapon_lm_dblmg_lege";
        if (var_87b8ba9a18c47387) {
            manageminigunpickup();
        }
    } else if (namespace_a548bd428a566cf3::isammo(pickupent.scriptablename)) {
        var_10bbeacb1429824e = br_weapons::takeammopickup(pickupent);
        namespace_e50e624d9af51c8c::function_5baaa0ce73d6fe84(self, pickupent.scriptablename);
    } else if (namespace_a548bd428a566cf3::isarmorplate(pickupent.scriptablename)) {
        if (!istrue(var_7f437a5779c8787c) && perk::_hasperk("specialty_fast_armor")) {
            var_10bbeacb1429824e = namespace_30a6d7a07831c1e2::function_de6e36b06bd630c4(pickupent, var_7f437a5779c8787c, var_db943473454f6ea6, var_44ee85dcf52b4001);
        } else {
            var_10bbeacb1429824e = takeequipmentpickup(pickupent, var_7f437a5779c8787c, var_db943473454f6ea6, var_44ee85dcf52b4001);
        }
        namespace_3169ff42d7051988::function_1976438a8865ac27("br_ftue_armor");
        thread armor::function_ef6d8b8c2ed89e8a(pickupent.count);
    } else if (namespace_a548bd428a566cf3::function_4aa12e0ed3f6b745(pickupent.scriptablename)) {
        if (function_990be1aa4ad3c9d4()) {
            if (istrue(var_44ee85dcf52b4001) && isdefined(var_db943473454f6ea6)) {
                namespace_e50e624d9af51c8c::function_db1dd76061352e5b(var_db943473454f6ea6);
                var_a9e3e0fc7f984716 = function_479558ebb71377bc();
                lootid = loot::function_fae5e1d3de32d3f7(var_a9e3e0fc7f984716);
                var_60227bff1e9478cc = spawnstruct();
                var_60227bff1e9478cc.scriptablename = loot::getScriptableFromLootID(lootid);
                var_60227bff1e9478cc.count = 1;
                namespace_e50e624d9af51c8c::addItemToBackpack(lootid, var_60227bff1e9478cc);
            } else {
                dropstruct = function_7b9f3966a7a42003();
                function_c15a28fc6247ad60(dropstruct, 1);
                namespace_b16531563568eaba::function_ea96b27797c7e268(self);
            }
        }
        var_e9cfd120b0b43ef = function_e98a5a4e0e001ac3(self, pickupent.scriptablename);
        if (pickupent.scriptablename == "brloot_plate_carrier_high_capacity" && !istrue(self.var_e75b458675200e42)) {
            fillmaxarmorplate();
            self.var_e75b458675200e42 = 1;
        }
    } else if (namespace_a548bd428a566cf3::isequipment(pickupent.scriptablename)) {
        var_10bbeacb1429824e = takeequipmentpickup(pickupent, var_7f437a5779c8787c, var_db943473454f6ea6, var_44ee85dcf52b4001);
    } else if (namespace_a548bd428a566cf3::isarmor(pickupent.scriptablename)) {
        takearmorpickup(pickupent);
    } else if (pickupent.scriptablename == "Pillage_Cache" && isdefined(level.givetagsfromcache)) {
        self [[ level.givetagsfromcache ]]();
    } else if (isplunder(pickupent.scriptablename)) {
        br_plunder::takeplunderpickup(pickupent);
        challenges::onpickupitem("plunder");
    } else if (function_1a4d30da7f8971fd(pickupent.scriptablename)) {
        function_966d64f200872160(pickupent);
    } else if (istokenpickup(pickupent.scriptablename)) {
        if (issubstr(pickupent.scriptablename, "redeploy_token")) {
            takerespawntokenpickup(pickupent);
        }
        if (issubstr(pickupent.scriptablename, "gulag_token")) {
            function_68c46fe15ed38d9b(pickupent);
        }
    } else if (isrevivepickup(pickupent.scriptablename)) {
        takerevivepickup(pickupent, var_db943473454f6ea6, var_44ee85dcf52b4001);
    } else if (iskillstreak(pickupent.scriptablename)) {
        takekillstreakpickup(pickupent, var_7f437a5779c8787c, var_db943473454f6ea6, var_44ee85dcf52b4001);
    } else if (issuperpickup(pickupent.scriptablename)) {
        takesuperpickup(pickupent, var_7f437a5779c8787c, var_db943473454f6ea6);
    } else if (function_1950b02c25bad779(pickupent.scriptablename)) {
        function_bae867278a38b69a(pickupent.scriptablename, var_7f437a5779c8787c, var_db943473454f6ea6, var_44ee85dcf52b4001);
    } else if (isgasmask(pickupent.scriptablename)) {
        takegasmask(pickupent, var_7f437a5779c8787c, var_db943473454f6ea6, var_44ee85dcf52b4001);
    } else if (isquesttablet(pickupent.scriptablename)) {
        if (getdvarint(@"hash_82bde055b11e6698", 0)) {
            namespace_bd5b51637804dbad::takequesttablet(pickupent.instance);
        } else {
            namespace_1eb3c4e0e28fac71::function_bb413728bc5231d0(pickupent.instance);
        }
    } else if (pickupent.scriptablename == "brloot_ammo_grenade") {
        takegenericgrenadepickup(pickupent);
    } else if (function_a5202e2fc8ecb076(pickupent.scriptablename)) {
        function_b379c8b0a6564107(pickupent);
    } else if (isaccesscard(pickupent.scriptablename)) {
        takeaccesscardpickup(pickupent);
    } else if (isdefined(pickupent.scriptablename) && pickupent.scriptablename == "loot_key_mrap") {
        if (isdefined(self.vehicle)) {
            ref = self.vehicle namespace_1f188a13f7e79610::function_d93ec4635290febd();
            if (isdefined(ref) && ref == "veh9_mil_lnd_mrap" && is_equal(self.vehicle.owner, self)) {
                if (self.vehicle namespace_1fbd40990ee60ede::function_72f871bf74995298()) {
                    self.vehicle namespace_1fbd40990ee60ede::function_474237292e64417e();
                    namespace_aead94004cf4c147::function_e900e7e66383ad97(self, var_db943473454f6ea6, 0);
                } else {
                    namespace_44abc05161e2e2cb::showerrormessage("MP/MRAP_ALREADY_UNLOCKED");
                }
                namespace_8361bad7391de074::function_7fc83d63a85c14d(self);
            } else {
                namespace_44abc05161e2e2cb::showerrormessage("MP/CANNOT_USE_MRAP_KEY");
            }
        } else {
            namespace_44abc05161e2e2cb::showerrormessage("MP/CANNOT_USE_MRAP_KEY");
        }
    } else if (function_82d45592d750d388(pickupent.scriptablename)) {
        if (function_9a5d18fbdad686c2(pickupent.scriptablename)) {
            if (namespace_d36e6800233f4f97::function_cfe304859f30e747("gulagKeyAcquired")) {
                namespace_d36e6800233f4f97::function_3cceb052d780fef1("gulagKeyAcquired");
            }
            return 0;
        } else {
            return 1;
        }
    } else {
        if (function_f92615e29aff3602(pickupent.scriptablename)) {
            goto LOC_00000b46;
        }
        if (function_e4b6260dbb04b43d(pickupent.scriptablename)) {
            function_ed254d7be7ff977a(pickupent);
        } else if (isspecialistbonus(pickupent.scriptablename)) {
            addspecialistbonuspickup();
        } else if (function_e066d6b70dda15f1(pickupent.scriptablename)) {
            function_afcb53228e48f6a(pickupent);
            return 1;
        } else if (function_f262c137ed78e6eb(pickupent.scriptablename)) {
            if (istrue(self.var_45b8e84de48bb89f)) {
                thread namespace_210d6dd43cfaf195::function_a232d3c610006843(pickupent, self);
            } else {
                thread namespace_f01a5da246ac06b4::function_57ac6111c7db410f(pickupent, self);
            }
        } else if (function_4ebfdbfa1b8e0339(pickupent.scriptablename)) {
            thread namespace_187c351a4cbe3e54::function_4cc3562c55625e70(instance);
        } else if (function_4cf229c2265183a9(pickupent.scriptablename)) {
            if (isdefined(level.var_db78248e94853165)) {
                self thread [[ level.var_db78248e94853165.var_3a91667e613d19c1 ]]();
            }
        } else if (function_6b5f3fb6550ae6d5(pickupent.scriptablename)) {
            thread iodine_pills::function_7430b01f931d7e4e(undefined, pickupent);
        } else if (function_5449da9d3d0358a4(pickupent.scriptablename)) {
            var_62cc4a0ecde06ecf = pickupent.scriptablename == "brloot_gascan_palfa";
            error = namespace_141c4634b6ea7b27::function_557da58e3ad8a579(pickupent, var_62cc4a0ecde06ecf);
            if (isdefined(error)) {
                namespace_44abc05161e2e2cb::showerrormessage(error);
            } else {
                namespace_aead94004cf4c147::function_e900e7e66383ad97(self, var_db943473454f6ea6, pickupent.count);
                if (istrue(var_830b2a6a83ba12eb)) {
                    playPickupFeedback(pickupent, var_a5b2c541413aa895);
                }
                playsoundatpos(self.origin + (0, 0, 30), "eqp_gas_can_use");
                if (var_62cc4a0ecde06ecf) {
                    namespace_39beb6d4ea2b65f4::function_354bd1ba3062243d();
                }
            }
        } else if (function_b1e944a2b3e15e9d(pickupent.scriptablename)) {
            var_db02edbac967fb02 = namespace_e50e624d9af51c8c::function_3188d9c94b3d56c2(pickupent.scriptablename);
            var_31dafc6ba15dfbc9 = namespace_e50e624d9af51c8c::function_b13e35608b336d65(self);
            lootid = loot::function_fae5e1d3de32d3f7(pickupent.scriptablename);
            var_f6af44bb087c3da5 = namespace_e50e624d9af51c8c::function_102abd6883c5f9bf(self);
            if (var_f6af44bb087c3da5 != 0) {
                dropstruct = function_7b9f3966a7a42003();
                scriptablename = loot::getScriptableFromLootID(var_f6af44bb087c3da5);
                var_cb4fad49263e20c4 = getitemdroporiginandangles(dropstruct, self.origin, self.angles, self, undefined, pickupent.var_96c7526f4ab04875, undefined, undefined, pickupent.origin);
                item = spawnpickup(scriptablename, var_cb4fad49263e20c4, 1, 1, undefined, 0);
            }
            namespace_b16531563568eaba::function_5b7dc44bb66553a6(self);
            namespace_b16531563568eaba::function_92d947129ea5ba6e(self, lootid);
            namespace_e50e624d9af51c8c::function_d28f52da6ede0191(self, var_db02edbac967fb02, undefined, lootid);
            if (istrue(var_44ee85dcf52b4001) && isdefined(var_db943473454f6ea6)) {
                namespace_e50e624d9af51c8c::function_db1dd76061352e5b(var_db943473454f6ea6);
            }
            namespace_e50e624d9af51c8c::function_6491bd812bb47efb(self, var_db02edbac967fb02, pickupent.scriptablename);
        } else if (function_36de08ea672b354c(pickupent.scriptablename)) {
            thread function_4e335a6589199847(pickupent, var_a5b2c541413aa895, var_db943473454f6ea6, var_44ee85dcf52b4001, var_7f437a5779c8787c);
        } else {
            if (isDogTag(pickupent.scriptablename) && game_utility::getsubgametype() != "dmz" && isdefined(level.var_547167a7517600fb)) {
                goto LOC_00000b46;
            }
            if (function_9e686ab118ac7725(pickupent.scriptablename) && utility::issharedfuncdefined("exgm_force_recon", "reveal_intel")) {
                utility::function_f3bb4f4911a1beb2("exgm_force_recon", "reveal_intel", pickupent);
            } else if (function_5aa2768ce2289fe7(pickupent.scriptablename)) {
                namespace_d20f8ef223912e12::onscavengerbagpickup(pickupent.instance);
                var_10bbeacb1429824e = 0;
            } else if (isGametypeItem(pickupent.scriptablename) && istrue(namespace_71073fa38f11492::isbrgametypefuncdefined("onGametypeItemPickup"))) {
                namespace_71073fa38f11492::runbrgametypefunc("onGametypeItemPickup", pickupent, self);
            } else {
                amount = 1;
                if (isdefined(pickupent.count)) {
                    amount = pickupent.count;
                }
                trypickupitem(pickupent.scriptablename, amount);
            LOC_00000b46:
            }
        LOC_00000b46:
        }
    LOC_00000b46:
    }
LOC_00000b46:
    amount = 1;
    if (isdefined(pickupent.count)) {
        amount = pickupent.count;
    }
    if (isdefined(pickupent.instance) && isdefined(pickupent.instance.uniquelootitemid)) {
        processuniquelootitem(pickupent.instance.uniquelootitemid, self);
    }
    function_b96bd81b0107ad4c(pickupent);
    namespace_9cb8bb5897c3d5b2::branalytics_lootpickup(self, pickupent.scriptablename, amount);
    namespace_3169ff42d7051988::function_1976438a8865ac27("br_ftue_inventory");
    if (!istrue(var_43fb3d97abb79854) && !istrue(var_830b2a6a83ba12eb)) {
        if (var_10bbeacb1429824e) {
            pickupent.count = pickupent.count - var_10bbeacb1429824e;
        }
        playPickupFeedback(pickupent, var_a5b2c541413aa895);
    }
    return var_10bbeacb1429824e;
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13863
// Size: 0x215
function onPickupTakenIntoBackpack(pickup) {
    if (isDogTag(pickup.scriptablename)) {
        namespace_b5b2cbfd27ff2a4e::function_b5d4fcc3fab92696(pickup);
        if (isdefined(level.var_9a3c2481a4cd4b46)) {
            [[ level.var_9a3c2481a4cd4b46 ]](self, pickup.count);
        }
        if (namespace_b5b2cbfd27ff2a4e::function_1129ba5718d33025(self, pickup.count)) {
            thread namespace_b5b2cbfd27ff2a4e::function_ea29bccf97cb1b9a(self, pickup.count);
        }
        namespace_b5b2cbfd27ff2a4e::function_b5fbe3cb4ed955f4(self, pickup.count);
    }
    if (isdefined(level.var_5635125e56693c8) && isdefined(level.var_5635125e56693c8[pickup.scriptablename])) {
        [[ level.var_5635125e56693c8[pickup.scriptablename] ]](pickup, self);
    }
    if (function_2d86ba79a58bb62(pickup.scriptablename)) {
        blacksite = undefined;
        originalteam = undefined;
        if (isdefined(pickup.instance)) {
            blacksite = pickup.instance.blacksite;
            originalteam = pickup.instance.originalteam;
        } else {
            blacksite = pickup.blacksite;
            originalteam = pickup.originalteam;
        }
        if (isdefined(blacksite)) {
            self.blacksite = blacksite;
            teamplayers = namespace_e47104b48662385b::getteamarray(self.team, 0);
            namespace_c62d39d6e6afb119::function_7bc622d2fe4b2017(blacksite, 0, teamplayers, originalteam, self.team);
            if (istrue(level.var_68f5630f7b06743a) && isdefined(level.var_b6148c58d443fe52)) {
                self thread [[ level.var_b6148c58d443fe52 ]](pickup);
            }
        }
    }
    if (function_68f7f39db3bc7fa4(pickup.scriptablename)) {
        if (issharedfuncdefined("br_puzzle_drone_repair", "setDronePartFound")) {
            level thread [[ getsharedfunc("br_puzzle_drone_repair", "setDronePartFound") ]](pickup, self);
        }
    }
    function_b96bd81b0107ad4c(pickup);
    namespace_b8ca654fc4c2dd79::runbrgametypefunc("onPickupTakenIntoBackpack", pickup);
    level notify("backpack_item", self);
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13a7f
// Size: 0x7c
function function_b96bd81b0107ad4c(pickup) {
    if (istrue(pickup.var_8c6ce30a6a5126b1) || isdefined(pickup.instance) && istrue(pickup.instance.var_8c6ce30a6a5126b1)) {
        if (!isdefined(self.var_f1cb96c63166b481)) {
            self.var_f1cb96c63166b481 = [];
        }
        self.var_f1cb96c63166b481[self.var_f1cb96c63166b481.size] = pickup.scriptablename;
    }
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13b02
// Size: 0x1d
function function_734b7a21be53f605() {
    self setclientomnvar("ui_loot_splash_item_id", 0);
    self setclientomnvar("ui_loot_splash_item_quantity", 0);
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13b26
// Size: 0x19e
function updateLootSplash(pickupent) {
    self notify("updateLootSplash");
    self endon("disconnect");
    lootid = 0;
    quantity = 0;
    if (isweaponpickup(pickupent.scriptablename)) {
        if (isdefined(pickupent.customweaponname)) {
            lootid = weapon::function_b0d37b9be0027733(pickupent.customweaponname);
        } else {
            weaponobj = getfullweaponobjforpickup(pickupent);
            lootid = weapon::function_9c331f88be5a1478(weaponobj);
        }
    } else {
        lootid = level.br_pickups.var_7b2bff2d04ee1017[pickupent.scriptablename];
        if (!isdefined(lootid)) {
            lootid = 0;
        }
        var_c21291cd8d120c4a = isdefined(pickupent.stackable) && pickupent.stackable > 0 || isplunder(pickupent.scriptablename) || ispickupstackable(pickupent.scriptablename) || function_e68e1669597a3f4d(pickupent.scriptablename) || function_4f6e89c88bb9605(pickupent.scriptablename);
        if (var_c21291cd8d120c4a && isdefined(pickupent.count)) {
            quantity = pickupent.count;
        }
    }
    waitframe();
    if (isdefined(lootid)) {
        self setclientomnvar("ui_loot_splash_item_id", lootid);
        self setclientomnvar("ui_loot_splash_item_quantity", quantity);
    } else {
        logstring("ui_loot_splash_item_id LootID: undefined    pickupEnt: " + pickupent.scriptablename);
    }
    self endon("updateLootSplash");
    wait(0.05);
    function_734b7a21be53f605();
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13ccb
// Size: 0x7b
function function_37be6e543436f3b3(lootid, origin, var_8598d3d3bc3d9ceb, quantity) {
    pickup = spawnstruct();
    pickup.scriptablename = loot::getScriptableFromLootID(lootid);
    pickup.origin = origin;
    pickup.count = quantity;
    if (isdefined(var_8598d3d3bc3d9ceb)) {
        pickup.var_8598d3d3bc3d9ceb = var_8598d3d3bc3d9ceb;
    }
    playPickupFeedback(pickup);
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13d4d
// Size: 0x48f
function playPickupFeedback(pickupent, var_a5b2c541413aa895) {
    var_9d5bc8e32ee3635 = "br_pickup_generic";
    var_a0bea370d6a72ceb = undefined;
    var_97fa758a2336c7c4 = undefined;
    if (isdefined(pickupent.scriptablename)) {
        if (isplunder(pickupent.scriptablename)) {
            var_9d5bc8e32ee3635 = getcashsoundaliasforplayer(self, pickupent.scriptablename);
        } else if (function_e68e1669597a3f4d(pickupent.scriptablename)) {
            var_9d5bc8e32ee3635 = namespace_210d6dd43cfaf195::function_5d4530ebfa3da544(self);
        } else if (isdefined(level.br_pickups.br_pickupsfx[pickupent.scriptablename]) && level.br_pickups.br_pickupsfx[pickupent.scriptablename] != function_1823ff50bb28148d("") && !(getdvarint(@"hash_be1b706f310c8e63", 0) != 0 && level.br_pickups.br_pickupsfx[pickupent.scriptablename] == function_1823ff50bb28148d("br_legendary_loot_pickup"))) {
            if (level.br_pickups.br_pickupsfx[pickupent.scriptablename] == function_1823ff50bb28148d("br_legendary_loot_pickup")) {
                var_a0bea370d6a72ceb = level.br_pickups.br_pickupsfx[pickupent.scriptablename];
                if (isweaponpickupitem(pickupent)) {
                    var_9d5bc8e32ee3635 = "br_pickup_weap";
                } else {
                    var_9d5bc8e32ee3635 = "br_pickup_generic";
                }
            } else if (level.br_pickups.br_pickupsfx[pickupent.scriptablename] == function_1823ff50bb28148d("uin_dmz_valuable_loot_pickup")) {
                var_97fa758a2336c7c4 = level.br_pickups.br_pickupsfx[pickupent.scriptablename];
                if (isweaponpickupitem(pickupent)) {
                    var_9d5bc8e32ee3635 = "br_pickup_weap";
                } else {
                    var_9d5bc8e32ee3635 = "br_pickup_generic";
                }
            } else {
                var_9d5bc8e32ee3635 = level.br_pickups.br_pickupsfx[pickupent.scriptablename];
            }
        } else if (isweaponpickupitem(pickupent)) {
            var_9d5bc8e32ee3635 = "br_pickup_weap";
        } else {
            var_9d5bc8e32ee3635 = "br_pickup_generic";
        }
        if (isdefined(level.br_pickups.br_itemrow[pickupent.scriptablename]) && (istrue(level.br_pickups.var_a5e4b146866d7fd[pickupent.scriptablename]) || isweaponpickup(pickupent.scriptablename) && getdvarint(@"hash_68583a19a03dfdbc", 0))) {
            self setclientomnvar("ui_br_loot_index_picked_up", level.br_pickups.br_itemrow[pickupent.scriptablename]);
        }
    }
    var_c872e61a2a2659b6 = self getvieworigin();
    var_f6c83b7007d82d88 = undefined;
    if (isvector(pickupent.origin)) {
        var_f6c83b7007d82d88 = pickupent.origin;
    } else if (isstruct(pickupent)) {
        container = utility::function_53c4c53197386572(pickupent.container, self.var_2fa5b49969def47);
        if (isdefined(container)) {
            var_f6c83b7007d82d88 = container.origin;
            var_f6c83b7007d82d88 = (var_f6c83b7007d82d88[0], var_f6c83b7007d82d88[1], var_c872e61a2a2659b6[2] - 20);
        }
    }
    if (!isvector(var_f6c83b7007d82d88)) {
        /#
            assertmsg("playPickupFeedback unexpected pickupEnt");
        #/
        var_f6c83b7007d82d88 = var_c872e61a2a2659b6 + anglestoforward(self getplayerangles()) * 36 + (0, 0, -20);
    }
    /#
        assertex(isvector(var_f6c83b7007d82d88), "playPickupFeedback unexpected pickupEnt");
    #/
    origin_delta = var_f6c83b7007d82d88 - var_c872e61a2a2659b6;
    origin_offset = origin_delta * 0.666;
    var_67b91d0a42b0578e = var_c872e61a2a2659b6 + origin_offset;
    if (isdefined(self) && namespace_e47104b48662385b::_isalive() && !function_6dc7c10050a0622b(self)) {
        if (isdefined(var_a0bea370d6a72ceb)) {
            self playlocalsound(var_a0bea370d6a72ceb);
        } else if (isdefined(var_97fa758a2336c7c4)) {
            self playlocalsound(var_97fa758a2336c7c4);
        }
        if (utility::issharedfuncdefined("player", "isReallyAlive")) {
            if ([[ utility::getsharedfunc("player", "isReallyAlive") ]](self)) {
                self playsoundonmovingent(var_9d5bc8e32ee3635);
            }
        }
    }
    if (!istrue(pickupent.var_c03c4ef51659ba4c)) {
        thread updateLootSplash(pickupent);
    }
    if (!istrue(var_a5b2c541413aa895) && !istrue(pickupent.var_8598d3d3bc3d9ceb)) {
        thread playerplaypickupanim(pickupent);
    }
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x141e3
// Size: 0x56
function playerplaypickupanim(pickupent) {
    self notify("playerPlayPickupAnim");
    self endon("playerPlayPickupAnim");
    self endon("death");
    self endon("disconnect");
    if (isweaponpickupitem(pickupent) || !namespace_a548bd428a566cf3::playercanplaynotcriticalgesture()) {
        return;
    }
    function_f4361ea8ce0fbca4();
    namespace_a548bd428a566cf3::playerplaygestureweaponanim("iw8_ges_plyr_loot_pickup", 1.17);
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14240
// Size: 0x48
function function_f4361ea8ce0fbca4() {
    var_a7408dbfed49f3f9 = makeweapon("iw8_ges_plyr_loot_pickup");
    if (self hasweapon(var_a7408dbfed49f3f9)) {
        if (self isgestureplaying("iw8_ges_pickup_br")) {
            self stopgestureviewmodel("iw8_ges_pickup_br", 0, 1);
        }
        self takeweapon(var_a7408dbfed49f3f9);
        waitframe();
    }
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1428f
// Size: 0x6e
function function_7b9f3966a7a42003(var_fb6b5e268e9a52de, var_d1e7ececee01c6d5, var_d20ad6ecee27de2b) {
    dropstruct = spawnstruct();
    dropstruct.dropcount = 0;
    dropstruct.var_dfba5a2c3c6f0a07 = 0;
    dropstruct.var_fb6b5e268e9a52de = var_fb6b5e268e9a52de;
    dropstruct.var_d1e7ececee01c6d5 = var_d1e7ececee01c6d5;
    dropstruct.var_d20ad6ecee27de2b = var_d20ad6ecee27de2b;
    return dropstruct;
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14305
// Size: 0x51b
function droponplayerdeath(attacker) {
    victim = self;
    if (getdvarint(@"hash_18c54f044520ba50", 0)) {
        if (isbot(victim)) {
            return;
        }
    }
    if (getdvarint(@"hash_307fc239dc43be41", 0)) {
        return;
    }
    if (game_utility::isteamreviveenabled()) {
        self.var_57c207fde9b78089 = 1;
    }
    if (istrue(namespace_b8ca654fc4c2dd79::runbrgametypefunc("dropOnPlayerDeath"))) {
        return;
    }
    if (!namespace_47fd1e79a44628cd::function_aa3a537ec349120d()) {
        return;
    }
    dropstruct = function_7b9f3966a7a42003();
    if (isdefined(level.adddroponplayerdeath)) {
        self [[ level.adddroponplayerdeath ]](dropstruct, attacker);
    }
    if (killstreak::isjuggernaut()) {
        namespace_702c7cf141169c57::droponplayerdeath(dropstruct);
    }
    if (isdefined(level.var_547167a7517600fb) && isdefined(level.var_547167a7517600fb.var_e393bf4026d0c393)) {
        [[ level.var_547167a7517600fb.var_e393bf4026d0c393 ]](self, attacker);
    }
    if (function_d3204a974cec837b()) {
        self.var_ba19d6a40e652dd6 = namespace_e50e624d9af51c8c::function_b13e35608b336d65(self);
        var_f6af44bb087c3da5 = namespace_e50e624d9af51c8c::function_102abd6883c5f9bf(self);
        if (var_f6af44bb087c3da5 != 0) {
            self.var_cd82e790e825db2 = var_f6af44bb087c3da5;
        }
        if (istrue(level.var_813b4b2211fbaf1d)) {
            namespace_e50e624d9af51c8c::function_c6b3799b231916bb(self, dropstruct);
            if (!istrue(level.var_d034183abf2e274d)) {
                namespace_e50e624d9af51c8c::function_5c5e6619f0b24f90();
                namespace_e50e624d9af51c8c::function_954372d604277278(self);
            }
        } else if (loot::function_8306d72ea2e8889c()) {
            if (!istrue(level.var_a1aab37ec3423e39)) {
                namespace_e50e624d9af51c8c::function_8121cbee12383790(self, dropstruct);
            }
            if (istrue(level.var_51225d738094457d)) {
                namespace_e50e624d9af51c8c::function_ae287e5eb2024104(self, dropstruct);
            }
            if (!istrue(level.var_d034183abf2e274d)) {
                namespace_e50e624d9af51c8c::function_5c5e6619f0b24f90();
                namespace_e50e624d9af51c8c::function_954372d604277278(self);
            }
            if (istrue(level.var_51225d738094457d)) {
                foreach (weapon in self.equippedweapons) {
                    if (shoulddropbrprimary(weapon, self)) {
                        var_facc6a1a18b419f0 = dropbrweapon(weapon, dropstruct);
                        if (isdefined(var_facc6a1a18b419f0)) {
                            self.var_3480393dc131952a = var_facc6a1a18b419f0;
                            break;
                        }
                    }
                }
            }
        }
        if (istrue(level.var_749783dc3aa20c72)) {
            if (getdvarint(@"hash_f924e428ae42dc96")) {
                dropbrammoboxes(dropstruct);
            } else {
                self.var_73bb45340691326c = self.br_ammo;
            }
        } else {
            dropbrammoboxes(dropstruct);
        }
        if (!istrue(level.var_51225d738094457d)) {
            dropbrequipment(dropstruct);
            if (!istrue(level.var_4ca052423b9bb316)) {
                dropbrsuper(dropstruct);
            }
            br_plunder::playerdropplunderondeath(dropstruct, attacker);
            dropbrprimaryweapons(dropstruct, level.var_73dc8cb1481e4a36);
            dropbrhealthpack(dropstruct);
        }
        if (!istrue(level.var_813b4b2211fbaf1d) && !istrue(level.var_73dc8cb1481e4a36)) {
            thread dropbrgasmask(dropstruct);
            dropbrkillstreak(dropstruct);
            function_a61f07010c727c0a(dropstruct);
            dropbrselfrevivetoken(dropstruct);
        } else if (gasmask::hasgasmask(self)) {
            function_75520ea44545c906();
            namespace_b16531563568eaba::function_777c89585478357b(self);
        }
        if (function_990be1aa4ad3c9d4()) {
            function_c15a28fc6247ad60(dropstruct);
        }
        dropspecialistbonus(dropstruct);
        dropbrmissiontablet(dropstruct);
        dropaccesscard(dropstruct);
        if (istrue(getdvarint(@"hash_c2ad3174d4c811df", getsubgametype() != "plunder"))) {
            function_b8faa69b95fe55be(dropstruct);
        }
        if (function_80dd3f82ffe825f()) {
            arena = namespace_de6eb888abbe38e1::function_2f4344abdc200e43(self);
            if (isdefined(arena)) {
                thread function_55463a3679678e2f(dropstruct, arena);
            }
        }
        self notify("canSpawnAsSpectator");
        return;
    }
    if (function_80dd3f82ffe825f()) {
        arena = namespace_de6eb888abbe38e1::function_2f4344abdc200e43(self);
        if (isdefined(arena)) {
            thread function_55463a3679678e2f(dropstruct, arena);
        }
    }
    namespace_e50e624d9af51c8c::function_2c226f050114f4b2(dropstruct, self);
    if (function_990be1aa4ad3c9d4()) {
        function_c15a28fc6247ad60(dropstruct);
    }
    if (!istrue(level.var_d034183abf2e274d)) {
        namespace_e50e624d9af51c8c::function_5c5e6619f0b24f90();
    }
    if (!istrue(level.skipweapondropondeath)) {
        dropbrprimaryweapons(dropstruct);
    }
    thread dropbrgasmask(dropstruct);
    function_a61f07010c727c0a(dropstruct);
    if (istrue(level.var_749783dc3aa20c72)) {
        if (getdvarint(@"hash_f924e428ae42dc96")) {
            dropbrammoboxes(dropstruct);
        } else {
            self.var_73bb45340691326c = self.br_ammo;
        }
    } else {
        dropbrammoboxes(dropstruct);
    }
    dropbrhealthpack(dropstruct);
    dropspecialistbonus(dropstruct);
    if (!istrue(level.skipequipmentdropondeath)) {
        dropbrequipment(dropstruct);
    }
    br_plunder::playerdropplunderondeath(dropstruct, attacker);
    if (game_utility::getsubgametype() != "kingslayer") {
        dropbrkillstreak(dropstruct);
    }
    dropbrsuper(dropstruct);
    dropbrmissiontablet(dropstruct);
    dropaccesscard(dropstruct);
    if (istrue(getdvarint(@"hash_c2ad3174d4c811df", getsubgametype() != "plunder"))) {
        function_b8faa69b95fe55be(dropstruct);
    }
    self notify("canSpawnAsSpectator");
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14827
// Size: 0x59
function function_d3204a974cec837b() {
    player = self;
    if ((istrue(player.jailed) || istrue(player.gulagarena)) && namespace_d36e6800233f4f97::function_1980065ce4dc067b()) {
        return 0;
    }
    if (istrue(level.var_51225d738094457d) || istrue(level.var_aa5679ebf3504e13)) {
        return 1;
    }
    return 0;
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14888
// Size: 0x49
function function_479558ebb71377bc() {
    if (!isdefined(self.var_bed158a6dfac230d) || self.var_bed158a6dfac230d <= 1) {
        return undefined;
    }
    if (isdefined(self.var_4045f099f3da4bd)) {
        return self.var_4045f099f3da4bd;
    }
    return "brloot_plate_carrier_" + self.var_bed158a6dfac230d;
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x148d9
// Size: 0x122
function function_c15a28fc6247ad60(dropstruct, var_ab404eb77736d9a7) {
    if (!isdefined(self.var_bed158a6dfac230d)) {
        return;
    }
    if (self.var_bed158a6dfac230d <= 1) {
        return;
    }
    var_cb4fad49263e20c4 = getitemdroporiginandangles(dropstruct, self.origin, self.angles, self);
    item = undefined;
    var_c0dd242ffcb18bd2 = function_479558ebb71377bc();
    item = spawnpickup(var_c0dd242ffcb18bd2, var_cb4fad49263e20c4, 1, 1, undefined, 0);
    if (istrue(var_ab404eb77736d9a7)) {
        return;
    }
    if (istrue(level.var_595938569c3fe806)) {
        self setplayerdata(level.var_5d69837cf4db0407, "dmzPlateCarrierLevel", 1);
    }
    if (isdefined(item)) {
        function_2f4e0022c686dbe6(item);
        if (function_4294e9b331377c31(item.type)) {
            namespace_282db5a41b643e19::function_6af20073381a18d3();
            self.var_e75b458675200e42 = undefined;
        }
    }
    if (istrue(level.var_595938569c3fe806)) {
        self.var_bed158a6dfac230d = 1;
    } else {
        self.var_bed158a6dfac230d = 2;
    }
    self.var_8790c077c95db752 = namespace_f8d3520d3483c1::function_829e435158d419cf() * 50;
    armor::setArmorHealth(0, 1);
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14a02
// Size: 0xf2
function dropbrammoboxes(dropstruct) {
    foreach (ammotype in level.br_ammo_types) {
        if (self.br_ammo[ammotype] > 0 && isdefined(level.br_pickups.br_itemrow[ammotype])) {
            scriptablename = ammotype;
            var_cb4fad49263e20c4 = getitemdroporiginandangles(dropstruct, self.origin, self.angles, self);
            var_1ad2db70c8d01f51 = isalive(self) || getdvarint(@"hash_671a6a4aaed8033e", 1);
            spawnpickup(scriptablename, var_cb4fad49263e20c4, self.br_ammo[ammotype], 1, undefined, var_1ad2db70c8d01f51);
        }
    }
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14afb
// Size: 0x146
function dropbrprimaryweapons(dropstruct, var_73dc8cb1481e4a36) {
    foreach (weapon in self.equippedweapons) {
        if (istrue(var_73dc8cb1481e4a36) && !issameweapon(weapon, self.lastweaponobj) && (weapon.basename == self.primaryweaponobj.basename || weapon.basename == self.secondaryweaponobj.basename)) {
            continue;
        }
        if (shoulddropbrprimary(weapon, self)) {
            var_facc6a1a18b419f0 = dropbrweapon(weapon, dropstruct);
            function_2f4e0022c686dbe6(var_facc6a1a18b419f0);
            if (!isdefined(var_facc6a1a18b419f0)) {
                dropstruct.var_dfba5a2c3c6f0a07--;
            }
        }
    }
    if (istrue(level.var_f478c1f94caa7e9) && !istrue(level.var_a3499c286ac570e4)) {
        if (namespace_e50e624d9af51c8c::function_efab78b72d131d76(self)) {
            weapon = namespace_e50e624d9af51c8c::function_2985254128b1c262(self);
            var_facc6a1a18b419f0 = dropbrweapon(weapon, dropstruct);
            if (isdefined(var_facc6a1a18b419f0)) {
                function_2f4e0022c686dbe6(var_facc6a1a18b419f0);
            }
            namespace_e50e624d9af51c8c::function_954372d604277278(self);
        }
    }
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14c48
// Size: 0x2d3
function dropbrweapon(weapon, dropstruct, var_7591ed99e87a77d3) {
    weaponobj = undefined;
    var_ca27530d7310f4 = 1;
    var_6838da24a7b27a10 = 0;
    var_1cb8c0a6d750cf77 = 0;
    if (isdefined(weapon)) {
        if (isweapon(weapon)) {
            weaponobj = weapon;
            var_ca27530d7310f4 = self getweaponammoclip(weaponobj);
            var_6838da24a7b27a10 = self getweaponammoclip(weaponobj, "left");
            if (weaponobj.hasalternate) {
                var_6890a4ce965bba99 = weaponobj getaltweapon();
                if (br_weapons::br_ammo_type_for_weapon(var_6890a4ce965bba99) != br_weapons::br_ammo_type_for_weapon(weaponobj)) {
                    var_1cb8c0a6d750cf77 = self getweaponammoclip(var_6890a4ce965bba99);
                }
            }
            if (br_weapons::function_4267b8888db52ea3(weaponobj)) {
                var_6838da24a7b27a10 = self getweaponammostock(weaponobj);
            }
        } else if (isstring(weapon)) {
            weaponobj = getfullweaponobjfromscriptablename(weapon);
            if (isdefined(weaponobj)) {
                var_ca27530d7310f4 = weaponobj.clipsize;
            } else if (isdefined(level.br_ammo_clipsize[weapon])) {
                var_ca27530d7310f4 = level.br_ammo_clipsize[weapon];
            }
        }
    }
    if (!isdefined(weaponobj)) {
        /#
            print("<unknown string>");
        #/
        return;
    }
    var_cb4fad49263e20c4 = getitemdroporiginandangles(dropstruct, self.origin, self.angles, self, undefined, undefined, undefined, undefined, var_7591ed99e87a77d3);
    var_e1147886ccf51970 = undefined;
    weaponindex = br_weapons::function_2ab3bda08c595a32(self, weaponobj);
    if (isdefined(weaponindex)) {
        var_e1147886ccf51970 = br_weapons::function_86a5c7670325346b(self, weaponindex);
    }
    var_c9614496b843196e = br_weapons::weaponspawn(weaponobj, self, var_cb4fad49263e20c4, 0, 1);
    if (isdefined(var_c9614496b843196e)) {
        var_c9614496b843196e.var_e1147886ccf51970 = var_e1147886ccf51970;
        ammotype = br_weapons::br_ammo_type_for_weapon(weaponobj);
        var_c9614496b843196e.ammotype = ammotype;
        if (getdvarint(@"hash_752eeed3ddcbd04b", 0) == 0 && br_weapons::function_ad972c1d0f29841c(self, weaponobj) && self.br_ammo[ammotype] > 0) {
            var_660523cff419f0b = getdvarint(@"hash_3c4edd0a748e4053", 1);
            dropstruct.var_dfba5a2c3c6f0a07 = 1;
            var_9edc776840baff95 = undefined;
            if (isdefined(var_7591ed99e87a77d3)) {
                var_9edc776840baff95 = self.origin + rotatevector(var_7591ed99e87a77d3 - self.origin, (0, 45, 0));
            }
            var_cb4fad49263e20c4 = getitemdroporiginandangles(dropstruct, self.origin, self.angles, self, undefined, undefined, undefined, undefined, var_9edc776840baff95);
            var_c9614496b843196e.var_ac26ec91048ac2e3 = spawnpickup(ammotype, var_cb4fad49263e20c4, self.br_ammo[ammotype], 1, undefined, var_660523cff419f0b);
            br_weapons::br_ammo_take_type(self, ammotype, self.br_ammo[ammotype]);
        }
        loot_setitemcount(var_c9614496b843196e, var_ca27530d7310f4, var_6838da24a7b27a10, var_1cb8c0a6d750cf77);
    }
    return var_c9614496b843196e;
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14f23
// Size: 0x3a
function function_80dd3f82ffe825f() {
    player = self;
    if (player namespace_a548bd428a566cf3::isplayerinorgoingtogulag()) {
        if (namespace_d36e6800233f4f97::function_cfe304859f30e747("gulagCanPlayerDropKey")) {
            if (player namespace_d36e6800233f4f97::function_3cceb052d780fef1("gulagCanPlayerDropKey")) {
                return 1;
            }
        }
    }
    return 0;
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14f65
// Size: 0x16f
function function_55463a3679678e2f(dropstruct, arena) {
    player = self;
    scriptable = level.br_pickups.var_838863c4848d4c26["loot_key_gulag"];
    var_cb4fad49263e20c4 = getitemdroporiginandangles(dropstruct, player.origin, player.angles, player, level.br_pickups.var_ad49a38dd7c4c10f, level.br_pickups.var_3b53bc0eee6ae84e);
    item = spawnpickup(scriptable, var_cb4fad49263e20c4, 1, 1, undefined, 0);
    if (isplayer(player)) {
        player function_2f4e0022c686dbe6(item);
    }
    arena.var_6d4e3b180776136f[arena.var_6d4e3b180776136f.size] = item;
    playsoundatpos(player.origin, "flag_spawned");
    foreach (p in arena.arenaplayers) {
        p thread hud_message::showsplash("br_twotwo_gulag_key_dropped");
    }
    wait(0.5);
    if (!isdefined(item)) {
        return;
    }
    namespace_de6eb888abbe38e1::function_9f7b9a86a5328f0b(arena, item.origin);
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x150dc
// Size: 0x154
function function_a10adec57ad9e3a4(dropstruct, arena, killer) {
    agent = self;
    if (!isdefined(agent)) {
        return;
    }
    scriptable = level.br_pickups.var_838863c4848d4c26["loot_key_spectator_gulag"];
    var_cb4fad49263e20c4 = getitemdroporiginandangles(dropstruct, agent.origin, agent.angles, agent, undefined, 25);
    item = spawnpickup(scriptable, var_cb4fad49263e20c4, 1, 1, undefined, 0);
    item.var_bbc200bc77c5db2b = 1;
    item.var_c001ccfc802f487 = 1;
    arena.var_f1d536b9f8efc97c = item;
    playsoundatpos(agent.origin, "flag_spawned");
    var_8799b0dc8555323c = utility::array_remove_array(arena.jailedplayers, arena.arenaplayers);
    foreach (player in var_8799b0dc8555323c) {
        player thread hud_message::showsplash("gulagbreak_got_key");
    }
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15238
// Size: 0x4c
function getfullweaponobjfromscriptablename(var_4b71202f07149879) {
    weaponname = undefined;
    if (!isdefined(level.br_lootiteminfo) && !isdefined(level.br_lootiteminfo[var_4b71202f07149879])) {
        return;
    }
    return level.br_lootiteminfo[var_4b71202f07149879].fullweaponobj;
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1528c
// Size: 0xd0
function shoulddropbrprimary(weapon, player) {
    basename = weapon::getweaponrootname(weapon.basename);
    if (basename == "iw9_me_fists" || basename == "iw9_knifestab" || basename == "iw8_gunless" || basename == "iw9_me_diveknife" || basename == "iw9_swimfists" || basename == "iw9_me_climbfists" || basename == "iw9_pi_stimpistol") {
        return 0;
    }
    if (basename == "ks_use_crate_mp") {
        return 0;
    }
    if (!isweapon(weapon)) {
        return 0;
    }
    if (weapon.inventorytype != "primary") {
        return 0;
    }
    if (player namespace_7efe69864347df52::extract_ismissionweapon(weapon)) {
        return 0;
    }
    if (class::function_da27e3343b019fde() && weapon::function_72ce982d9fc26f1c(weapon)) {
        return 0;
    }
    return 1;
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15364
// Size: 0x326
function dropbrequipment(dropstruct, var_7f437a5779c8787c, var_1e736a37c3737585, equipmentref, var_f24fbd36a9751174) {
    var_11f2059012065537 = istrue(var_1e736a37c3737585) && isdefined(equipmentref);
    if (var_11f2059012065537) {
        var_1a37fa6c580bb395 = utility::array_find(level.br_pickups.br_equipname, equipmentref);
        if (isdefined(var_1a37fa6c580bb395)) {
            function_73ffc9bcd6d1e62d(var_7f437a5779c8787c);
            baseorigin = self.origin;
            baseangles = self.angles;
            var_ad49a38dd7c4c10f = level.br_pickups.var_ad49a38dd7c4c10f;
            var_3b53bc0eee6ae84e = level.br_pickups.var_3b53bc0eee6ae84e;
            if (istrue(var_7f437a5779c8787c) && isdefined(self.br_kiosk)) {
                baseorigin = self.br_kiosk.origin;
                baseangles = self.br_kiosk.angles;
                var_3b53bc0eee6ae84e = undefined;
                var_ad49a38dd7c4c10f = undefined;
            }
            var_2fb86e1c9b4c6464 = 1;
            if (isdefined(var_f24fbd36a9751174)) {
                var_2fb86e1c9b4c6464 = var_f24fbd36a9751174;
            }
            var_cb4fad49263e20c4 = getitemdroporiginandangles(dropstruct, baseorigin, baseangles, self, var_ad49a38dd7c4c10f, var_3b53bc0eee6ae84e);
            item = spawnpickup(var_1a37fa6c580bb395, var_cb4fad49263e20c4, var_2fb86e1c9b4c6464, 1, undefined, isalive(self));
            function_2f4e0022c686dbe6(item);
        }
        return;
    }
    var_bb7a7034f796af47 = self.equipment["primary"];
    if (isdefined(var_bb7a7034f796af47)) {
        if (var_bb7a7034f796af47 == "equip_hb_sensor") {
            ammocount = hb_sensor::function_db61876aca4e4cd3();
        } else {
            ammocount = equipment::getequipmentslotammo("primary");
        }
        if (ammocount > 0) {
            var_feb782334dd23a66 = utility::array_find(level.br_pickups.br_equipname, self.equipment["primary"]);
            if (isdefined(var_feb782334dd23a66)) {
                var_cb4fad49263e20c4 = getitemdroporiginandangles(dropstruct, self.origin, self.angles, self);
                var_1ad2db70c8d01f51 = isalive(self) || getdvarint(@"hash_91f6b5dd6fa6844", 0);
                item = spawnpickup(var_feb782334dd23a66, var_cb4fad49263e20c4, ammocount, 1, undefined, var_1ad2db70c8d01f51);
                function_2f4e0022c686dbe6(item);
            }
        }
    }
    var_79a42e6a2f51cf87 = self.equipment["secondary"];
    if (isdefined(var_79a42e6a2f51cf87)) {
        if (var_79a42e6a2f51cf87 == "equip_hb_sensor") {
            ammocount = hb_sensor::function_db61876aca4e4cd3();
        } else {
            ammocount = equipment::getequipmentslotammo("secondary");
        }
        if (ammocount > 0) {
            var_feb782334dd23a66 = utility::array_find(level.br_pickups.br_equipname, self.equipment["secondary"]);
            if (isdefined(var_feb782334dd23a66)) {
                var_cb4fad49263e20c4 = getitemdroporiginandangles(dropstruct, self.origin, self.angles, self);
                var_1ad2db70c8d01f51 = isalive(self) || getdvarint(@"hash_f74983a33e4ce283", 0);
                item = spawnpickup(var_feb782334dd23a66, var_cb4fad49263e20c4, ammocount, 1, undefined, var_1ad2db70c8d01f51);
                function_2f4e0022c686dbe6(item);
            }
        }
    }
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15691
// Size: 0x178
function dropbrsuper(dropstruct, var_7f437a5779c8787c, var_1e736a37c3737585, var_ebec497ff8b18a45) {
    var_85efdd4e2c86f214 = istrue(var_1e736a37c3737585) && isdefined(var_ebec497ff8b18a45);
    if (var_85efdd4e2c86f214) {
        var_1a37fa6c580bb395 = utility::array_find(level.br_pickups.br_equipname, var_ebec497ff8b18a45);
        if (isdefined(var_1a37fa6c580bb395)) {
            function_73ffc9bcd6d1e62d(var_7f437a5779c8787c);
            var_c017376249a45a39 = getitemdroporiginandangles(dropstruct, self.origin, self.angles, self, level.br_pickups.var_ad49a38dd7c4c10f, level.br_pickups.var_3b53bc0eee6ae84e);
            var_a6717fae5964e4c6 = var_c017376249a45a39[2];
            dropangles = var_c017376249a45a39[1];
            droporigin = var_c017376249a45a39[0];
            item = spawnpickup(var_1a37fa6c580bb395, droporigin, dropangles, 1, 1, var_a6717fae5964e4c6);
            function_2f4e0022c686dbe6(item);
        }
        return;
    }
    if (isdefined(self.equipment["super"])) {
        ammocount = function_fcde72dcbcec206b();
        if (isdefined(ammocount) && ammocount > 0) {
            var_ebec497ff8b18a45 = supers::getcurrentsuperref();
            if (isdefined(var_ebec497ff8b18a45) && var_ebec497ff8b18a45 == "super_fulton") {
                if (!istrue(level.allowfultondropondeath)) {
                    return;
                }
            }
            dropequipmentinslot(dropstruct, "super", var_7f437a5779c8787c, ammocount);
        }
    }
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15810
// Size: 0x8b
function dropbrmissiontablet(dropstruct) {
    if (isdefined(self.extractquest_missionitem) && isdefined(self.extractquest_unlockablelootid)) {
        var_cb4fad49263e20c4 = getitemdroporiginandangles(dropstruct, self.origin, self.angles, self);
        pickup = spawnpickup(self.extractquest_missionitem, var_cb4fad49263e20c4, 1, 1, undefined, isalive(self));
        function_2f4e0022c686dbe6(pickup);
        pickup namespace_79df2a50da8bf4e3::blueprintextract_setunlockablelootid(self.extractquest_unlockablelootid);
    }
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x158a2
// Size: 0x224
function dropbrhealthpack(dropstruct) {
    itemcount = 0;
    itemname = undefined;
    if (!isdefined(level.br_pickups) || istrue(self.gulag)) {
        return;
    }
    if (isdefined(self.equipment["health"])) {
        itemname = level.br_pickups.br_equipnametoscriptable[self.equipment["health"]];
        itemcount = equipment::getequipmentslotammo("health");
    } else if (istrue(level.dropArmorOnDeath)) {
        itemname = level.br_pickups.br_equipnametoscriptable["equip_armorplate"];
        itemcount = level.armorDropAmount;
    }
    if (istrue(level.var_611672c472b8c9a9) && istrue(level.dropArmorOnDeath) && istrue(level.armorDropAmount)) {
        itemcount = level.var_611672c472b8c9a9;
    }
    if (istrue(level.armorDropAmount) && itemcount < level.armorDropAmount) {
        itemcount = level.armorDropAmount;
        if (!isdefined(itemname)) {
            itemname = level.br_pickups.br_equipnametoscriptable["equip_armorplate"];
        }
    }
    if (itemcount > 0 && isdefined(itemname)) {
        var_1ad2db70c8d01f51 = getdvarint(@"hash_654510829e5b59d7", 1) || isalive(self);
        if (itemcount > level.br_pickups.maxcounts[itemname]) {
            itemcount = itemcount - level.br_pickups.maxcounts[itemname];
            var_cb4fad49263e20c4 = getitemdroporiginandangles(dropstruct, self.origin, self.angles, self);
            item = spawnpickup(itemname, var_cb4fad49263e20c4, level.br_pickups.maxcounts[itemname], 1, undefined, isalive(self));
        }
        var_cb4fad49263e20c4 = getitemdroporiginandangles(dropstruct, self.origin, self.angles, self);
        item = spawnpickup(itemname, var_cb4fad49263e20c4, itemcount, 1, undefined, var_1ad2db70c8d01f51);
        function_2f4e0022c686dbe6(item);
    }
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15acd
// Size: 0x133
function dropbrgasmask(dropstruct, var_180513e5b195f19a, var_56881dadd4ec5ad1) {
    level endon("game_ended");
    self endon("death_or_disconnect");
    if (gasmask::hasgasmask(self)) {
        if (istrue(var_56881dadd4ec5ad1) && level.var_e79884673ac9666e) {
            function_8206bc54a1ed73cb("br_circle");
            wait(0.6);
            if (!gasmask::hasgasmask(self)) {
                return;
            }
        }
        var_cb4fad49263e20c4 = getitemdroporiginandangles(dropstruct, self.origin, self.angles, self);
        var_1ad2db70c8d01f51 = isalive(self) || getdvarint(@"hash_4508c701f27f5496", 0);
        gasmask = undefined;
        if (!istrue(var_180513e5b195f19a) && self.gasmaskhealth > 0) {
            gasmask = spawnpickup(self.gasmasktype, var_cb4fad49263e20c4, int(self.gasmaskhealth), 1, undefined, var_1ad2db70c8d01f51);
        }
        if (isdefined(gasmask)) {
            gasmask.gasmaskmaxhealth = self.gasmaskmaxhealth;
        }
        function_75520ea44545c906();
        if (isdefined(gasmask)) {
            function_2f4e0022c686dbe6(gasmask);
        }
        namespace_b16531563568eaba::function_777c89585478357b(self);
        if (!istrue(var_180513e5b195f19a)) {
            function_8e9b00a1d2b23d72();
        }
    }
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15c07
// Size: 0x11a
function function_aa702bcdeeb2b827(dropstruct, var_7f437a5779c8787c, var_1e736a37c3737585, var_fe0f715fc43f378, pickup) {
    var_aa702bcdeeb2b827 = istrue(var_1e736a37c3737585) && isdefined(var_fe0f715fc43f378);
    if (var_aa702bcdeeb2b827) {
        function_73ffc9bcd6d1e62d(var_7f437a5779c8787c);
        var_3b53bc0eee6ae84e = level.br_pickups.var_3b53bc0eee6ae84e;
        var_7591ed99e87a77d3 = undefined;
        if (isdefined(pickup)) {
            if (isdefined(pickup.var_96c7526f4ab04875)) {
                var_3b53bc0eee6ae84e = pickup.var_96c7526f4ab04875;
            }
            if (isdefined(pickup.origin)) {
                var_7591ed99e87a77d3 = pickup.origin;
            }
        }
        var_cb4fad49263e20c4 = getitemdroporiginandangles(dropstruct, self.origin, self.angles, self, level.br_pickups.var_ad49a38dd7c4c10f, var_3b53bc0eee6ae84e, undefined, undefined, var_7591ed99e87a77d3);
        spawnpickup(level.br_pickups.var_838863c4848d4c26[var_fe0f715fc43f378], var_cb4fad49263e20c4);
        return;
    }
    dropbrkillstreak(dropstruct, var_7f437a5779c8787c);
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15d28
// Size: 0x2c2
function dropbrkillstreak(dropstruct, var_7f437a5779c8787c, var_db943473454f6ea6, var_4c6eba41707c461f, pickup) {
    if (hasanykillstreak()) {
        function_73ffc9bcd6d1e62d(var_7f437a5779c8787c);
        scriptable = level.br_pickups.var_838863c4848d4c26[self.streakdata.streaks[1].streakname];
        if (isdefined(var_db943473454f6ea6)) {
            lootid = loot::function_fae5e1d3de32d3f7(scriptable);
            namespace_e50e624d9af51c8c::function_3c3ee4c5700e0e32(self, var_db943473454f6ea6, lootid, 1, 65535, 0);
        } else {
            var_3b53bc0eee6ae84e = level.br_pickups.var_3b53bc0eee6ae84e;
            var_7591ed99e87a77d3 = undefined;
            if (isdefined(pickup)) {
                if (isdefined(pickup.var_96c7526f4ab04875)) {
                    var_3b53bc0eee6ae84e = pickup.var_96c7526f4ab04875;
                }
                if (isdefined(pickup.origin)) {
                    var_7591ed99e87a77d3 = pickup.origin;
                }
            }
            baseorigin = self.origin;
            baseangles = self.angles;
            var_ad49a38dd7c4c10f = level.br_pickups.var_ad49a38dd7c4c10f;
            if (istrue(var_7f437a5779c8787c) && isdefined(self.br_kiosk)) {
                var_3b53bc0eee6ae84e = undefined;
                var_7591ed99e87a77d3 = undefined;
                var_ad49a38dd7c4c10f = undefined;
                baseorigin = self.br_kiosk.origin;
                baseangles = self.br_kiosk.angles;
                if (isdefined(self.br_kiosk.var_afc028d00356e443)) {
                    baseorigin = self.br_kiosk.var_afc028d00356e443;
                }
                if (isdefined(self.br_kiosk.var_bf8e5f003146af44)) {
                    baseorigin = self.br_kiosk.var_bf8e5f003146af44.origin + rotatevector(baseorigin, self.br_kiosk.var_bf8e5f003146af44.angles);
                }
            }
            var_cb4fad49263e20c4 = getitemdroporiginandangles(dropstruct, baseorigin, baseangles, self, var_ad49a38dd7c4c10f, var_3b53bc0eee6ae84e, undefined, undefined, var_7591ed99e87a77d3);
            var_1ad2db70c8d01f51 = isalive(self) || getdvarint(@"hash_75376790b7cf7e23", 0);
            item = spawnpickup(scriptable, var_cb4fad49263e20c4, 1, 1, undefined, var_1ad2db70c8d01f51);
            function_2f4e0022c686dbe6(item);
            killstreaks::removekillstreak(1);
            if (istrue(var_4c6eba41707c461f)) {
                quickdropplaysound(3, var_cb4fad49263e20c4.origin, scriptable, item);
            }
        }
    } else if (isdefined(var_db943473454f6ea6)) {
        namespace_e50e624d9af51c8c::function_ad05407157b7d86d(self, var_db943473454f6ea6);
    }
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15ff1
// Size: 0x6d
function dropaccesscard(dropstruct) {
    if (namespace_a548bd428a566cf3::hasaccesscard()) {
        var_cb4fad49263e20c4 = getitemdroporiginandangles(dropstruct, self.origin, self.angles, self);
        item = spawnpickup(self.accesscard, var_cb4fad49263e20c4, undefined, undefined, undefined, isalive(self));
        function_2f4e0022c686dbe6(item);
        removeaccesscard();
    }
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16065
// Size: 0x66
function dropbrselfrevivetoken(dropstruct) {
    if (namespace_a548bd428a566cf3::hasselfrevivetoken()) {
        var_cb4fad49263e20c4 = getitemdroporiginandangles(dropstruct, self.origin, self.angles, self);
        item = spawnpickup(namespace_a548bd428a566cf3::function_791e72676cd7b544(self), var_cb4fad49263e20c4, 1, 1);
        function_2f4e0022c686dbe6(item);
        removeselfrevivetoken();
    }
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x160d2
// Size: 0x1ca
function dropbrcustompickupitem(scriptablename, var_8e4538d786fb9418, var_7f437a5779c8787c, var_1e736a37c3737585) {
    var_7feba4ec6c35d82d = istrue(var_1e736a37c3737585) && isdefined(scriptablename);
    if (var_7feba4ec6c35d82d) {
        function_73ffc9bcd6d1e62d(var_7f437a5779c8787c);
        dropstruct = function_7b9f3966a7a42003();
        if (istrue(var_7f437a5779c8787c) && isdefined(self.br_kiosk) && isdefined(self.br_kiosk.dropstruct)) {
            var_e1d097c517c3af5b = self.br_kiosk function_4f4d537c794b2bf5();
            self.br_kiosk.dropstruct.var_dfba5a2c3c6f0a07 = var_e1d097c517c3af5b;
            dropstruct = self.br_kiosk.dropstruct;
            var_8e4538d786fb9418 = utility::function_53c4c53197386572(var_8e4538d786fb9418, 1);
            var_285b7129b392cf3d = self.br_kiosk quickdropaddtoexisting(undefined, scriptablename, var_8e4538d786fb9418);
            if (!var_285b7129b392cf3d) {
                var_cb4fad49263e20c4 = getitemdroporiginandangles(dropstruct, utility::function_53c4c53197386572(self.br_kiosk.var_afc028d00356e443, self.br_kiosk.origin), self.br_kiosk.angles, self);
                item = spawnpickup(scriptablename, var_cb4fad49263e20c4, var_8e4538d786fb9418, 1, undefined, 0);
                self.br_kiosk quickdropaddtocache(scriptablename, undefined, item, var_cb4fad49263e20c4.origin, var_cb4fad49263e20c4.angles);
            }
        } else {
            var_cb4fad49263e20c4 = getitemdroporiginandangles(dropstruct, self.origin, self.angles, self);
            item = spawnpickup(scriptablename, var_cb4fad49263e20c4, var_8e4538d786fb9418);
            function_2f4e0022c686dbe6(item);
        }
    }
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x162a3
// Size: 0x69
function dropspecialistbonus(dropstruct) {
    if (namespace_a548bd428a566cf3::hasspecialistbonus()) {
        var_cb4fad49263e20c4 = getitemdroporiginandangles(dropstruct, self.origin, self.angles, self);
        item = spawnpickup("brloot_specialist_bonus", var_cb4fad49263e20c4, undefined, undefined, undefined, isalive(self));
        function_2f4e0022c686dbe6(item);
        removespecialistbonuspickup();
    }
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16313
// Size: 0x43
function function_b8faa69b95fe55be(dropstruct) {
    if (isdefined(self.var_28c944f222f4814) && isdefined(self.var_28c944f222f4814.var_183ec729c8876d57)) {
        item = namespace_126f4192a2d090c4::function_3af23b0bfaf91dbd(dropstruct);
    }
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1635d
// Size: 0x11c
function function_a61f07010c727c0a(dropstruct) {
    if (namespace_b5b2cbfd27ff2a4e::function_c07675f2ce32fcb5(self)) {
        quantity = namespace_b5b2cbfd27ff2a4e::function_57711583c5d26490(self);
        if (isdefined(quantity)) {
            var_c01bc46249a98627 = namespace_b5b2cbfd27ff2a4e::function_379463a84adb07b4(quantity);
            var_dab81ead77442a10 = var_c01bc46249a98627[2];
            var_59bd51afc73df2cd = var_c01bc46249a98627[1];
            itemcount = var_c01bc46249a98627[0];
            var_cb4fad49263e20c4 = getitemdroporiginandangles(dropstruct, self.origin, self.angles, self);
            var_5983083928ce568c = namespace_b5b2cbfd27ff2a4e::function_59771b0cc100410a(self);
            var_3dd3adfb27186cd7 = spawnpickup(var_5983083928ce568c, var_cb4fad49263e20c4, itemcount, 0, undefined, 0, var_59bd51afc73df2cd, var_dab81ead77442a10);
            if (isdefined(var_3dd3adfb27186cd7)) {
                namespace_b5b2cbfd27ff2a4e::function_bc03aa369196f2bf(self, 0);
                self.dogtag = var_3dd3adfb27186cd7;
                function_2f4e0022c686dbe6(var_3dd3adfb27186cd7);
            }
            if (isdefined(level.var_547167a7517600fb) && isdefined(level.var_547167a7517600fb.var_a5354afeb0d5dfcc)) {
                [[ level.var_547167a7517600fb.var_a5354afeb0d5dfcc ]](self);
            }
        }
    }
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x16480
// Size: 0x86
function function_5ebf3e99b419d949(dropstruct) {
    if (getdvarint(@"hash_74abb928ab13113b", 0) == 0) {
        return;
    }
    var_c01bc36249a983f4 = namespace_2d7f47b19ccdb41d::function_c1a30db229b1311d(self, 0);
    lootid = var_c01bc36249a983f4[1];
    itemindex = var_c01bc36249a983f4[0];
    while (isdefined(itemindex)) {
        function_b41950c9b54b12e0(dropstruct, itemindex, lootid);
        var_c01bc66249a98a8d = namespace_2d7f47b19ccdb41d::function_c1a30db229b1311d(self, itemindex + 1);
        lootid = var_c01bc66249a98a8d[1];
        itemindex = var_c01bc66249a98a8d[0];
    }
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1650d
// Size: 0x8a
function function_b41950c9b54b12e0(dropstruct, itemindex, lootid) {
    var_2713f4a3502d1624 = namespace_e50e624d9af51c8c::function_91c1be871300a518(lootid);
    if (isdefined(namespace_2d7f47b19ccdb41d::function_96a1620d901981d1(var_2713f4a3502d1624, 0))) {
        var_cb4fad49263e20c4 = getitemdroporiginandangles(dropstruct, self.origin, self.angles, self);
        namespace_2d7f47b19ccdb41d::function_3a7809be256adadb(var_cb4fad49263e20c4, self);
        var_18795864529a7fcf = spawnpickup(var_2713f4a3502d1624, var_cb4fad49263e20c4, 1, 0, undefined, 0);
        namespace_2d7f47b19ccdb41d::function_a5130b39363778b7(self, var_18795864529a7fcf, itemindex);
    }
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1659e
// Size: 0x33
function function_2f4e0022c686dbe6(item) {
    if (!player::isreallyalive(self) && isdefined(item)) {
        self.var_d2dbb2fa012e6d9c[self.var_d2dbb2fa012e6d9c.size] = item;
    }
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x165d8
// Size: 0x22
function ispickupstackable(scriptablename) {
    return istrue(level.br_pickups.stackable[scriptablename]);
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16602
// Size: 0x2f
function isitemslotopen() {
    for (i = 0; i < 8; i++) {
        if (!isdefined(self.br_inventory_slots[i])) {
            return 1;
        }
    }
    return 0;
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16639
// Size: 0x2d
function isitemfull(item, pickupcount) {
    return pickupcount + item.count > item.maxcount;
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1666e
// Size: 0x90
function canstackpickup(scriptablename, pickupcount) {
    foreach (item in self.br_inventory_slots) {
        if (isdefined(item.scriptablename) && item.scriptablename == scriptablename) {
            if (!isitemfull(item, pickupcount)) {
                return 1;
            }
        }
    }
    return 0;
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16706
// Size: 0x32
function canslotitem(scriptablename, pickupcount) {
    if (ispickupstackable(scriptablename)) {
        if (canstackpickup(scriptablename, pickupcount)) {
            return 1;
        }
    }
    return isitemslotopen();
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16740
// Size: 0x2f
function getfirstopenslot() {
    for (i = 0; i < 8; i++) {
        if (!isdefined(self.br_inventory_slots[i])) {
            return i;
        }
    }
    return -1;
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16777
// Size: 0x141
function pickupitemintoinventory(pickup) {
    if (ispickupstackable(pickup.scriptablename)) {
        if (canstackpickup(pickup.scriptablename, pickup.count)) {
            foreach (item in self.br_inventory_slots) {
                if (isdefined(item.scriptablename) && item.scriptablename == pickup.scriptablename) {
                    if (!isitemfull(item, pickup.count)) {
                        item.count = item.count + pickup.count;
                        item.count = int(min(item.count, pickup.maxcount));
                        return;
                    }
                }
            }
        }
    }
    var_1475ce431472ad = getfirstopenslot();
    if (var_1475ce431472ad == -1) {
        return;
    }
    self.br_inventory_slots[var_1475ce431472ad] = pickup;
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x168bf
// Size: 0x149
function dropitemfrominventory(slot) {
    if (isdefined(self.br_inventory_slots[slot])) {
        item = self.br_inventory_slots[slot];
        var_cb4fad49263e20c4 = getitemdropinfo(self.origin + level.br_pickups.br_dropoffsets[0], self.angles);
        pickupent = spawnpickup(item.scriptablename, var_cb4fad49263e20c4, item.count);
        utility::function_f3bb4f4911a1beb2(item.scriptablename, "dropped", pickupent, self, var_cb4fad49263e20c4.origin);
        if (isdefined(item.armorhealth)) {
            pickupent.armorhealth = item.armorhealth;
        } else if (isdefined(item.helmethealth)) {
            pickupent.helmethealth = item.helmethealth;
        } else if (isdefined(item.gasmaskhealth)) {
            pickupent.gasmaskhealth = item.gasmaskhealth;
        }
        namespace_9cb8bb5897c3d5b2::branalytics_lootdrop(self, item.scriptablename);
        namespace_a548bd428a566cf3::removeitemfrominventory(slot);
    }
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16a0f
// Size: 0x61
function takegenericgrenadepickup(pickupent) {
    ammocount = equipment::getequipmentslotammo("primary");
    if (isdefined(ammocount) && ammocount < 2) {
        equipment::incrementequipmentslotammo("primary");
    }
    ammocount = equipment::getequipmentslotammo("secondary");
    if (isdefined(ammocount) && ammocount < 2) {
        equipment::incrementequipmentslotammo("secondary");
    }
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x16a77
// Size: 0x4e
function trypickupitemfroment(pickupent) {
    if (canslotitem(pickupent.scriptablename, pickupent.count)) {
        pickupitemintoinventory(pickupent);
    } else {
        self iprintlnbold("No room in inventory");
        self playlocalsound("br_pickup_deny");
    }
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16acc
// Size: 0x11e
function trypickupitem(scriptablename, count) {
    if (!isdefined(scriptablename) || !isdefined(level.br_pickups.maxcounts[scriptablename]) || !isdefined(level.br_pickups.stackable[scriptablename])) {
        return;
    }
    pickup = spawnstruct();
    pickup.scriptablename = scriptablename;
    pickup.count = count;
    pickup.maxcount = level.br_pickups.maxcounts[scriptablename];
    pickup.stackable = level.br_pickups.stackable[scriptablename];
    pickup.itemtype = level.br_pickups.br_itemtype[scriptablename];
    if (canslotitem(pickup.scriptablename, pickup.count)) {
        pickupitemintoinventory(pickup);
    } else {
        self iprintlnbold("No room in inventory");
        self playlocalsound("br_pickup_deny");
    }
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16bf1
// Size: 0xcf
function droparmor(itemtype, var_9300220825e28f00) {
    var_cb4fad49263e20c4 = getitemdropinfo(self.origin + level.br_pickups.br_dropoffsets[0], self.angles);
    pickupent = spawnpickup(itemtype, var_cb4fad49263e20c4);
    pickupent.count = 1;
    pickupent.helmethealth = 0;
    pickupent.armorhealth = 0;
    pickupent.gasmaskhealth = 0;
    if (issubstr(itemtype, "helmet")) {
        pickupent.helmethealth = var_9300220825e28f00;
        if (itemtype == "brloot_armor_helmet_3") {
            perk::removeperk("specialty_stun_resistance");
        }
    }
    namespace_9cb8bb5897c3d5b2::branalytics_lootdrop(self, itemtype);
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16cc7
// Size: 0x53
function trydroparmorfornewarmor(scriptablename) {
    if (namespace_a548bd428a566cf3::ishelmet(scriptablename)) {
        if (isdefined(self.br_helmetlevel)) {
            itemtype = armor::helmetitemtypeforlevel(self.br_helmetlevel);
            if (isdefined(itemtype)) {
                droparmor(itemtype, self.br_helmethealth);
            }
        }
    }
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16d21
// Size: 0x96
function tryequiparmor(item, slot) {
    if (isdefined(slot)) {
        self.br_inventory_slots[slot] = undefined;
    }
    trydroparmorfornewarmor(item.scriptablename);
    if (item.scriptablename == "brloot_armor_helmet_1") {
        armor::takehelmet(item, 1);
    } else if (item.scriptablename == "brloot_armor_helmet_2") {
        armor::takehelmet(item, 2);
    } else if (item.scriptablename == "brloot_armor_helmet_3") {
        armor::takehelmet(item, 3);
    }
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16dbe
// Size: 0x14
function initpickupusability() {
    interactive::interactive_addusedcallback(&brpickupsusecallback, "br_pickups");
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16dd9
// Size: 0x63
function brpickupsusecallback(entity, player) {
    results = player cantakepickup(entity);
    player showuseresultsfeedback(results);
    if (results != 1) {
        return;
    }
    player onusecompleted(entity);
    deregisterscriptableinstance(entity);
    if (entity isscriptable()) {
        entity freescriptable();
    } else {
        entity delete();
    }
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16e43
// Size: 0x157
function handleexplosivepickup(equipname, slot) {
    dropstruct = function_7b9f3966a7a42003();
    if (namespace_e50e624d9af51c8c::function_7e103028c464ab9a(loot::function_b88cfb4893ceedac(equipname))) {
        var_feb782334dd23a66 = utility::array_find(level.br_pickups.br_equipname, equipname);
        lootid = loot::function_fae5e1d3de32d3f7(var_feb782334dd23a66);
        result = namespace_e50e624d9af51c8c::function_e01d9736b2d100ac(lootid, 1);
        if (istrue(result) && !pickupissameasequipmentslot(equipname, slot) && equipment::getequipmentslotammo(slot) > 0) {
            var_60227bff1e9478cc = spawnstruct();
            var_60227bff1e9478cc.scriptablename = var_feb782334dd23a66;
            var_60227bff1e9478cc.count = 1;
            playPickupFeedback(var_60227bff1e9478cc);
            namespace_e50e624d9af51c8c::addItemToBackpack(lootid, var_60227bff1e9478cc);
        } else {
            if (isdefined(self.equipment[slot]) && equipment::getequipmentslotammo(slot) > 0) {
                dropequipmentinslot(dropstruct, slot);
            }
            equipment::giveequipment(equipname, slot);
            equipment::setequipmentammo(equipname, 1);
        }
    } else {
        if (isdefined(self.equipment[slot]) && equipment::getequipmentslotammo(slot) > 0) {
            dropequipmentinslot(dropstruct, slot);
        }
        equipment::giveequipment(equipname, slot);
        equipment::setequipmentammo(equipname, 1);
    }
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16fa1
// Size: 0x39
function superslotcleanup(owner) {
    if (game_utility::isBRStyleGameType() && !level.allowsupers && !namespace_30a6d7a07831c1e2::function_66f0cbd5ff8458fe()) {
        owner equipment::takeequipment("super");
    }
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16fe1
// Size: 0x3c
function function_75520ea44545c906() {
    if (istrue(self.gasmaskequipped)) {
        self detach("hat_child_hadir_gas_mask_wm_br", "j_head");
        self.gasmaskequipped = 0;
    }
    self.gasmaskswapinprogress = 0;
    function_4d16b9c52efa3b8();
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17024
// Size: 0x15f
function function_4d16b9c52efa3b8() {
    self.gasmaskmaxhealth = undefined;
    self.gasmaskhealth = undefined;
    self.var_fe63300b318b76b0 = undefined;
    namespace_7c996eebd51b5b1f::removeScubaGasMaskFromPlayer(self);
    self setclientomnvar("ui_gas_mask", 0);
    self setclientomnvar("ui_head_equip_class", 0);
    self setclientomnvar("ui_gasmask_damage", 0);
    self setclientomnvar("ui_gas_mask_opacity_override", 0);
    if (isdefined(self.operatorcustomization) && isdefined(self.operatorcustomization.skinref) && self.operatorcustomization.skinref + "" == "355") {
        self function_555e2d32e2756625("gasmask_female");
    } else if (isdefined(self.operatorcustomization.gender) && self.operatorcustomization.gender == "female") {
        self function_555e2d32e2756625("female");
    } else if (isdefined(self.operatorcustomization) && isdefined(self.operatorcustomization.skinref) && self.operatorcustomization.skinref + "" == "319") {
        self setentitysoundcontext("gender", "bongmask_male");
    } else {
        self function_555e2d32e2756625("");
    }
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1718a
// Size: 0xf4
function function_874048c58e96731() {
    /#
        br_forcegivecustompickupitem(self, "<unknown string>", 1, 3);
        foreach (ammotype, ammomax in level.br_ammo_max) {
            self.br_ammo[ammotype] = ammomax;
            br_weapons::br_ammo_player_hud_update_ammotype(ammotype);
        }
        br_weapons::br_ammo_update_weapons(self);
        br_plunder::playerplunderpickup(500);
        br_forcegivecustompickupitem(self, "<unknown string>", 1);
        br_forcegivecustompickupitem(self, "<unknown string>", 1);
        br_forcegivecustompickupitem(self, "<unknown string>", 1);
        br_forcegivecustompickupitem(self, "<unknown string>", 1);
        br_forcegivecustompickupitem(self, "<unknown string>", 1);
        br_forcegivecustompickupitem(self, "<unknown string>", 1);
        br_forcegivecustompickupitem(self, "<unknown string>", 1);
    #/
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x17285
// Size: 0x8b
function function_849640d4a4d5ae98() {
    /#
        br_forcegivecustompickupitem(self, "<unknown string>", 1, 3);
        foreach (ammotype, ammomax in level.br_ammo_max) {
            self.br_ammo[ammotype] = ammomax;
            br_weapons::br_ammo_player_hud_update_ammotype(ammotype);
        }
        br_weapons::br_ammo_update_weapons(self);
        br_plunder::playerplunderpickup(500);
    #/
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x17317
// Size: 0x9b
function getquickdroparmorcount(var_53aaae2c915f815b) {
    var_16d3878433169434 = "brloot_armor_plate";
    equipname = level.br_pickups.br_equipname[var_16d3878433169434];
    var_e97f18cf8c7e296b = level.equipment.table[equipname].defaultslot;
    if (isdefined(self.equipment[var_e97f18cf8c7e296b])) {
        currentammo = equipment::getequipmentslotammo(var_e97f18cf8c7e296b);
        if (currentammo > 0) {
            if (istrue(var_53aaae2c915f815b)) {
                return currentammo;
            } else {
                return 1;
            }
        }
    }
    return 0;
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x173ba
// Size: 0x66
function getquickdropammocount(ammotype, var_53aaae2c915f815b) {
    var_41fe346fd14b2567 = self.br_ammo[ammotype];
    clipsize = level.br_ammo_clipsize[ammotype];
    if (!isdefined(var_41fe346fd14b2567) || !isdefined(clipsize)) {
        return 0;
    }
    if (istrue(var_53aaae2c915f815b)) {
        return int(var_41fe346fd14b2567);
    }
    return int(min(clipsize, var_41fe346fd14b2567));
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17428
// Size: 0x59
function getquickdropplundercount(var_53aaae2c915f815b) {
    plunderDropSomeAmount = getmatchrulesdata("brData", "plunderDropSomeAmount");
    if (istrue(var_53aaae2c915f815b)) {
        return int(min(self.plundercount, 2048 - 1));
    }
    return int(min(self.plundercount, plunderDropSomeAmount));
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17489
// Size: 0x61
function getquickdropweapon(itemindex) {
    var_cb8fea2b4525691 = function_13ecf3644442a3e7(self, itemindex);
    /#
        assert(isdefined(var_cb8fea2b4525691));
    #/
    /#
        assert(!isnullweapon(var_cb8fea2b4525691));
    #/
    /#
        assert(var_cb8fea2b4525691 != makeweapon("iw9_me_fists_mp"));
    #/
    weaponname = getcompleteweaponname(var_cb8fea2b4525691);
    return weaponname;
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x174f2
// Size: 0xf4
function function_13ecf3644442a3e7(player, itemindex) {
    if (itemindex == 2) {
        return namespace_e50e624d9af51c8c::function_2985254128b1c262(player);
    }
    weaponlist = player.equippedweapons;
    var_be28c7bbf8bd3f10 = itemindex == 0;
    foreach (weapon in weaponlist) {
        if (weapon::function_d3c77884d93d850(weapon)) {
            continue;
        } else if (weapon::function_3f15e5e526ff94ce(weapon)) {
            continue;
        } else if (weapon::isgunlessweapon(weapon)) {
            continue;
        } else if (weapon.inventorytype != "primary") {
            continue;
        } else if (weapon::ismeleeoverrideweapon(weapon)) {
            continue;
        } else if (var_be28c7bbf8bd3f10) {
            return weapon;
        } else {
            var_be28c7bbf8bd3f10 = 1;
        }
    }
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x175ed
// Size: 0xbc
function quickdropremovearmorfrominventory(itemslotindex, itemcount) {
    var_16d3878433169434 = "brloot_armor_plate";
    equipname = level.br_pickups.br_equipname[var_16d3878433169434];
    var_e97f18cf8c7e296b = level.equipment.table[equipname].defaultslot;
    equipment::decrementequipmentslotammo(var_e97f18cf8c7e296b, itemcount);
    if (istrue(self.insertingarmorplate)) {
        ref = equipment::getcurrentequipment(var_e97f18cf8c7e296b);
        var_3dbc3b058135cbfb = equipment::getequipmentammo(ref);
        if (var_3dbc3b058135cbfb < 1) {
            self notify("try_armor_cancel", "all_armor_plates_dropped");
        }
    }
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x176b0
// Size: 0x29b
function function_d655f2006cfe7789(var_ec22a950f210e39) {
    var_3184653fdf31db44 = makeweapon("iw9_me_fists_mp");
    /#
        assert(isdefined(var_ec22a950f210e39));
    #/
    /#
        assert(!isnullweapon(var_ec22a950f210e39));
    #/
    /#
        assert(var_ec22a950f210e39 != var_3184653fdf31db44);
    #/
    var_102d661b1caa8bc1 = var_3184653fdf31db44;
    primaryweapons = self getweaponslistprimaries();
    foreach (weapon in primaryweapons) {
        if (weapon.inventorytype != "primary") {
            continue;
        }
        if (class::function_da27e3343b019fde() && weapon::function_72ce982d9fc26f1c(weapon)) {
            continue;
        }
        if (weapon != var_3184653fdf31db44 && weapon != var_ec22a950f210e39 && !weapon::ismeleeoverrideweapon(weapon) && !weapon::function_d3c77884d93d850(weapon) && !weapon::function_3f15e5e526ff94ce(weapon)) {
            if (!self isalternatemode(weapon)) {
                var_102d661b1caa8bc1 = weapon;
            } else {
                foreach (altweapon in primaryweapons) {
                    if (altweapon.basename == weapon.basename && altweapon.inventorytype == "altmode") {
                        var_102d661b1caa8bc1 = altweapon;
                        break;
                    }
                }
            }
            break;
        }
    }
    if (!namespace_45ecbe78f599af72::isriotshield(var_ec22a950f210e39)) {
        ammostock = self getweaponammostock(var_ec22a950f210e39);
        var_811abfdb6c33f17f = br_weapons::br_ammo_type_for_weapon(var_ec22a950f210e39);
        if (isdefined(var_811abfdb6c33f17f)) {
            self.br_ammo[var_811abfdb6c33f17f] = min(ammostock, level.var_e6ea72fc5e3fcd00[var_811abfdb6c33f17f]);
            self.br_ammo[var_811abfdb6c33f17f] = utility::get_int_or_0(self.br_ammo[var_811abfdb6c33f17f]);
        }
    }
    if (weapon::isminigunweapon(var_ec22a950f210e39)) {
        self notify("dropped_minigun");
    }
    if (getdvarint(@"hash_218b826f84233424", 0)) {
        function_5ef33bffaeda4fa9(var_ec22a950f210e39, 0);
    }
    weaponindex = br_weapons::function_2ab3bda08c595a32(self, var_ec22a950f210e39);
    if (isdefined(weaponindex)) {
        br_weapons::function_ae30366a2d519a57(self, weaponindex, undefined);
    }
    namespace_8b68a49ebf57ab74::_takeweapon(var_ec22a950f210e39);
    namespace_a548bd428a566cf3::function_64fa4c213439177f();
    if (!self hasweapon(var_3184653fdf31db44)) {
        self giveweapon(var_3184653fdf31db44);
    }
    br_weapons::br_ammo_update_weapons(self);
    self switchtoweaponimmediate(var_102d661b1caa8bc1);
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 9, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17952
// Size: 0x382
function function_62f068cec343a111(player, itemtype, itemindex, itemcount, var_53aaae2c915f815b, var_180513e5b195f19a, var_96c7526f4ab04875, var_7591ed99e87a77d3, var_e063b28d208e9a42) {
    var_ec22a950f210e39 = function_13ecf3644442a3e7(player, itemindex);
    if (!isdefined(var_ec22a950f210e39) || weapon::function_d3c77884d93d850(var_ec22a950f210e39) || weapon::function_3f15e5e526ff94ce(var_ec22a950f210e39) || weapon::function_1e9278ba699927f7(var_ec22a950f210e39)) {
        return;
    }
    itemcount = 0;
    var_59bd51afc73df2cd = 0;
    var_dab81ead77442a10 = 0;
    weaponobj = undefined;
    if (!isdefined(var_ec22a950f210e39) || isnullweapon(var_ec22a950f210e39) || var_ec22a950f210e39 == makeweapon("iw9_me_fists_mp") || self isskydiving() || class::function_da27e3343b019fde() && weapon::function_72ce982d9fc26f1c(var_ec22a950f210e39)) {
        return 0;
    } else {
        if (itemindex == 2) {
            itemcount = ter_op(isdefined(player.var_3ef503345dc57957), player.var_3ef503345dc57957, player getweaponammoclip(var_ec22a950f210e39));
            var_59bd51afc73df2cd = ter_op(isdefined(player.var_ad7897ecdbcb63), player.var_ad7897ecdbcb63, player getweaponammoclip(var_ec22a950f210e39, "left"));
            if (var_ec22a950f210e39.hasalternate) {
                var_6890a4ce965bba99 = var_ec22a950f210e39 getaltweapon();
                if (isdefined(player.var_86b32aff94b5714e)) {
                    var_dab81ead77442a10 = player.var_86b32aff94b5714e;
                } else if (br_weapons::br_ammo_type_for_weapon(var_6890a4ce965bba99) != br_weapons::br_ammo_type_for_weapon(var_ec22a950f210e39)) {
                    var_dab81ead77442a10 = player getweaponammoclip(var_6890a4ce965bba99);
                }
            }
        } else {
            itemcount = player getweaponammoclip(var_ec22a950f210e39);
            var_59bd51afc73df2cd = player getweaponammoclip(var_ec22a950f210e39, "left");
            if (var_ec22a950f210e39.hasalternate) {
                var_6890a4ce965bba99 = var_ec22a950f210e39 getaltweapon();
                if (br_weapons::br_ammo_type_for_weapon(var_6890a4ce965bba99) != br_weapons::br_ammo_type_for_weapon(var_ec22a950f210e39)) {
                    var_dab81ead77442a10 = player getweaponammoclip(var_6890a4ce965bba99);
                }
            }
            if (br_weapons::function_4267b8888db52ea3(var_ec22a950f210e39)) {
                var_59bd51afc73df2cd = player getweaponammostock(var_ec22a950f210e39);
            }
        }
        weaponobj = var_ec22a950f210e39;
    }
    var_96c4059aa2eabfb8 = undefined;
    if (namespace_b16531563568eaba::function_e0fc1230452cf4e7()) {
        if (itemindex == 2) {
            var_96c4059aa2eabfb8 = namespace_b16531563568eaba::function_74031e3249a6f69e(player, 2);
        } else {
            var_96c4059aa2eabfb8 = namespace_b16531563568eaba::function_74031e3249a6f69e(player, itemindex);
        }
    }
    weaponindex = br_weapons::function_2ab3bda08c595a32(player, weaponobj);
    var_e1147886ccf51970 = undefined;
    if (isdefined(weaponindex)) {
        var_e1147886ccf51970 = br_weapons::function_86a5c7670325346b(player, weaponindex);
    }
    var_62f068cec343a111 = getquickdropweapon(itemindex);
    if (itemindex == 2) {
        namespace_e50e624d9af51c8c::function_954372d604277278(player);
    } else {
        function_d655f2006cfe7789(var_ec22a950f210e39);
        namespace_b16531563568eaba::function_bfedeb20f8b77f3f(player, itemindex, istrue(var_e063b28d208e9a42));
    }
    if (istrue(var_180513e5b195f19a)) {
        return 1;
    }
    item = quickdropnewitem(itemtype, var_62f068cec343a111, itemcount, var_59bd51afc73df2cd, var_dab81ead77442a10, weaponobj, var_96c4059aa2eabfb8, var_96c7526f4ab04875, var_7591ed99e87a77d3);
    if (isdefined(item)) {
        namespace_8361bad7391de074::function_d882e5d473c9b258(player, item, var_ec22a950f210e39);
        item.var_e1147886ccf51970 = var_e1147886ccf51970;
    }
    /#
        assert(isdefined(player.tookweaponfrom));
    #/
    if (isdefined(item)) {
        if (isdefined(player.tookweaponfrom[var_62f068cec343a111])) {
            item.owner = player.tookweaponfrom[var_62f068cec343a111];
            player.tookweaponfrom[var_62f068cec343a111] = undefined;
        } else {
            item.owner = player;
        }
        item.objweapon = weaponobj;
    }
    return 1;
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17cdc
// Size: 0x92
function function_8aab3cda02f81c09(player, itemtype, var_53aaae2c915f815b, var_180513e5b195f19a, var_1aa3938720421958) {
    if (getdvarint(@"hash_9e0e52e9b74f15eb", 0)) {
        return 0;
    }
    itemcount = getquickdropplundercount(var_53aaae2c915f815b);
    if (isdefined(var_1aa3938720421958)) {
        itemcount = var_1aa3938720421958;
    }
    if (itemcount == 0) {
        return 0;
    }
    player br_plunder::playerplunderdrop(itemcount);
    var_8e5dd667f5bf1e1e = br_plunder::getplundernamebyamount(itemcount);
    if (istrue(var_180513e5b195f19a)) {
        return 1;
    }
    quickdropnewitem(itemtype, var_8e5dd667f5bf1e1e, itemcount);
    return 1;
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17d76
// Size: 0x44
function function_f5082b4fc43ef59b(scriptablename) {
    if (!isdefined(level.var_f2b443c644970bd7) || level.var_f2b443c644970bd7.size <= 0 || !isdefined(scriptablename)) {
        return 1;
    }
    return !utility::array_contains_key(level.var_f2b443c644970bd7, scriptablename);
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17dc2
// Size: 0x422
function function_6f62cb4fc113349c(player, itemtype, itemindex, var_53aaae2c915f815b, var_180513e5b195f19a) {
    var_c00e2e62499a27c0 = namespace_e50e624d9af51c8c::function_6738846da50730f1(itemindex);
    quantity = var_c00e2e62499a27c0[1];
    lootid = var_c00e2e62499a27c0[0];
    if (lootid == 0) {
        return;
    }
    itemcount = undefined;
    var_59bd51afc73df2cd = undefined;
    var_dab81ead77442a10 = undefined;
    ref = loot::function_793e8a72cedb8ef3(lootid);
    isDogTag = namespace_b5b2cbfd27ff2a4e::function_3c17a26ce6a4668(lootid);
    var_36de08ea672b354c = namespace_126f4192a2d090c4::function_43044da0ed44d79f(ref);
    if (utility::issharedfuncdefined(lootid, "canQuickDrop")) {
        if (!utility::function_f3bb4f4911a1beb2(lootid, "canQuickDrop", player)) {
            return;
        }
    }
    if (function_282d89f7705a2d63(ref)) {
        function_bfc82c27ed3d9308(lootid, quantity, ref, itemindex);
    }
    if (isDogTag) {
        var_c00e2f62499a29f3 = namespace_b5b2cbfd27ff2a4e::function_379463a84adb07b4(quantity);
        var_dab81ead77442a10 = var_c00e2f62499a29f3[2];
        var_59bd51afc73df2cd = var_c00e2f62499a29f3[1];
        itemcount = var_c00e2f62499a29f3[0];
    } else if (var_53aaae2c915f815b || function_d345eec68e01361f(lootid)) {
        itemcount = quantity;
    } else if (namespace_a548bd428a566cf3::isammo(ref)) {
        itemcount = int(min(quantity, level.br_pickups.counts[ref]));
    } else {
        itemcount = 1;
    }
    if (var_36de08ea672b354c && !istrue(var_180513e5b195f19a)) {
        slot = function_4f4d537c794b2bf5();
        thread function_1e450adba8ddc914();
        dropstruct = function_7b9f3966a7a42003();
        dropstruct.var_dfba5a2c3c6f0a07 = slot;
        namespace_126f4192a2d090c4::function_3af23b0bfaf91dbd(dropstruct, undefined, undefined, itemindex);
        var_180513e5b195f19a = 1;
    } else if (function_df3f5431c93ed5a1(lootid)) {
        return 0;
    } else if (function_e4b6260dbb04b43d(ref)) {
        slot = function_4f4d537c794b2bf5();
        thread function_1e450adba8ddc914();
        dropstruct = function_7b9f3966a7a42003();
        dropstruct.var_dfba5a2c3c6f0a07 = slot;
        var_27de1507ed41f01e = namespace_2d7f47b19ccdb41d::function_96a1620d901981d1(lootid, 5);
        var_7e4d1fadecfd0ae5 = namespace_2d7f47b19ccdb41d::function_6844602f3120e900(var_27de1507ed41f01e, 0);
        var_cb4fad49263e20c4 = getitemdroporiginandangles(dropstruct, self.origin, self.angles, self, undefined);
        namespace_2d7f47b19ccdb41d::function_3a7809be256adadb(var_cb4fad49263e20c4, self);
        element = spawnpickup(var_7e4d1fadecfd0ae5, var_cb4fad49263e20c4, itemcount, 1, undefined, 0);
        namespace_2d7f47b19ccdb41d::function_a5130b39363778b7(self, element, itemindex);
        var_180513e5b195f19a = 1;
    } else if (function_2d86ba79a58bb62(ref)) {
        slot = function_4f4d537c794b2bf5();
        thread function_1e450adba8ddc914();
        dropstruct = function_7b9f3966a7a42003();
        dropstruct.var_dfba5a2c3c6f0a07 = slot;
        player namespace_c62d39d6e6afb119::function_f9ff7c89b3792ccc(dropstruct, player.blacksite);
        var_180513e5b195f19a = 1;
    } else if (function_68f7f39db3bc7fa4(ref)) {
        if (issharedfuncdefined("br_puzzle_drone_repair", "onDronePartDropped")) {
            var_f8f319d0ec29034 = loot::getScriptableFromLootID(lootid);
            level thread [[ getsharedfunc("br_puzzle_drone_repair", "onDronePartDropped") ]](var_f8f319d0ec29034, player);
        }
    }
    ref = loot::function_793e8a72cedb8ef3(lootid);
    scriptable = undefined;
    if (namespace_a548bd428a566cf3::isammo(ref)) {
        scriptable = ref;
    } else {
        scriptable = loot::getScriptableFromLootID(lootid);
    }
    if (istrue(var_53aaae2c915f815b) && isdefined(scriptable) && scriptable == "brloot_gascan") {
        var_c00e3062499a2c26 = namespace_141c4634b6ea7b27::function_cf96fb01f9473d0d(itemcount);
        newcount = var_c00e3062499a2c26[1];
        error = var_c00e3062499a2c26[0];
        if (isdefined(error)) {
            namespace_44abc05161e2e2cb::showerrormessage(error);
        } else {
            namespace_aead94004cf4c147::function_e900e7e66383ad97(self, itemindex, newcount);
            playsoundatpos(self.origin + (0, 0, 30), "eqp_gas_can_siphon");
        }
        return;
    }
    player namespace_aead94004cf4c147::function_db1dd76061352e5b(itemindex, ter_op(isDogTag || var_36de08ea672b354c, quantity, itemcount));
    if (istrue(var_180513e5b195f19a)) {
        return;
    }
    if (isdefined(scriptable)) {
        quickdropnewitem(itemtype, scriptable, itemcount, var_59bd51afc73df2cd, var_dab81ead77442a10);
    }
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x181eb
// Size: 0x151
function function_b130392812b25580(player, itemindex, itemtype, var_53aaae2c915f815b, var_180513e5b195f19a) {
    itemcount = player equipment::getequipmentslotammo(equipment::function_4967838290cb31b9(itemindex));
    if (!isdefined(itemcount) || itemcount == 0) {
        return 0;
    }
    slot = equipment::function_4967838290cb31b9(itemindex);
    ref = equipment::getcurrentequipment(slot);
    if (issharedfuncdefined(ref, "getAmmo")) {
        itemcount = player [[ getsharedfunc(ref, "getAmmo") ]]();
        var_53aaae2c915f815b = 1;
    }
    if (!var_53aaae2c915f815b) {
        itemcount = 1;
    }
    equipment::decrementequipmentslotammo(slot, itemcount);
    if (!istrue(var_180513e5b195f19a)) {
        var_5f918fb78f83b464 = function_4f4d537c794b2bf5();
        player thread function_1e450adba8ddc914();
        dropstruct = function_7b9f3966a7a42003();
        dropstruct.var_dfba5a2c3c6f0a07 = var_5f918fb78f83b464;
        player dropequipmentinslot(dropstruct, slot, 0, itemcount, undefined, 0, itemtype, 1);
    }
    if (ref == "equip_armorplate") {
        player armor::function_50deea7508dbf174();
    }
    if (isdefined(ref) && ref == "equip_throwing_knife" && player equipment::getequipmentslotammo(slot) == 0 && player perk::_hasperk("specialty_equip_throwingKnife")) {
        player namespace_70a9c767ad1878e5::throwing_knife_mp_ontake();
    }
    return 1;
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18344
// Size: 0x8a
function function_1503d0b5b4c9d010(player, var_53aaae2c915f815b, var_180513e5b195f19a) {
    itemcount = 1;
    if (!player hasanykillstreak()) {
        return 0;
    }
    if (!istrue(var_180513e5b195f19a)) {
        slot = function_4f4d537c794b2bf5();
        player thread function_1e450adba8ddc914();
        dropstruct = function_7b9f3966a7a42003();
        dropstruct.var_dfba5a2c3c6f0a07 = slot;
        player dropbrkillstreak(dropstruct, 0, undefined, 1);
    }
    killstreaks::removekillstreak(1);
    return 1;
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x183d6
// Size: 0x5b
function function_750e9a7f11becd51(player, var_180513e5b195f19a) {
    slot = function_4f4d537c794b2bf5();
    player thread function_1e450adba8ddc914();
    dropstruct = function_7b9f3966a7a42003();
    dropstruct.var_dfba5a2c3c6f0a07 = slot;
    player thread dropbrgasmask(dropstruct, var_180513e5b195f19a, 1);
    return 1;
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18439
// Size: 0x67
function function_8f803ea058a13cbd(player, var_180513e5b195f19a) {
    if (!istrue(var_180513e5b195f19a)) {
        slot = function_4f4d537c794b2bf5();
        player thread function_1e450adba8ddc914();
        dropstruct = function_7b9f3966a7a42003();
        dropstruct.var_dfba5a2c3c6f0a07 = slot;
        player dropbrselfrevivetoken(dropstruct);
    } else {
        player removeselfrevivetoken();
    }
    return 1;
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x184a8
// Size: 0x11c
function function_b15e36b7bc247ddb(player, var_53aaae2c915f815b, var_180513e5b195f19a) {
    itemcount = player function_fcde72dcbcec206b();
    var_1189bd7fbe2861f8 = self.equipment["super"];
    if (isdefined(self.equipment["super"]) && player namespace_30a6d7a07831c1e2::function_66f0cbd5ff8458fe() && supers::issuperready()) {
        itemcount = 1;
    }
    if (!isdefined(itemcount) || itemcount == 0) {
        return 0;
    }
    if (!var_53aaae2c915f815b) {
        itemcount = 1;
    }
    if (!istrue(var_180513e5b195f19a)) {
        if (isdefined(var_1189bd7fbe2861f8) && namespace_6340662230fe40b3::function_852ea8e204596ed0(var_1189bd7fbe2861f8)) {
            return 0;
        }
        slot = function_4f4d537c794b2bf5();
        player thread function_1e450adba8ddc914();
        dropstruct = function_7b9f3966a7a42003();
        dropstruct.var_dfba5a2c3c6f0a07 = slot;
        player dropequipmentinslot(dropstruct, "super", 0, itemcount, undefined, 0, 4, 1);
    }
    if (supers::issuperinuse()) {
        supers::superusefinished();
    }
    player resetsuper();
    self.equipment["super"] = undefined;
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x185cb
// Size: 0xc6
function function_52df07e94b3ce0df(player, itemindex, itemtype, var_53aaae2c915f815b, var_180513e5b195f19a) {
    ammotype = br_weapons::function_5a80dba504420037(itemindex);
    ammocount = br_weapons::function_1352197e2482f1cf(player, ammotype);
    if (!isdefined(ammocount) || ammocount == 0) {
        return 0;
    }
    if (isdefined(player.var_55562bd5eb6065e5)) {
        activeweapon = player namespace_3bcd40a3005712ec::function_27ef2c36eb95d796();
        if (namespace_d20f8ef223912e12::function_f32857a938336f2b(player, activeweapon)) {
            return 0;
        }
    }
    if (!var_53aaae2c915f815b) {
        ammocount = int(min(ammocount, br_weapons::function_2bf8eaf550fbe399(ammotype)));
    }
    br_weapons::br_ammo_take_type(player, ammotype, ammocount);
    if (!istrue(var_180513e5b195f19a)) {
        quickdropnewitem(itemtype, ammotype, ammocount);
    }
    return 1;
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18699
// Size: 0x5d
function function_9e2cddc7551c1be4(player, var_180513e5b195f19a) {
    if (!istrue(var_180513e5b195f19a)) {
        slot = function_4f4d537c794b2bf5();
        player thread function_1e450adba8ddc914();
        dropstruct = function_7b9f3966a7a42003();
        dropstruct.var_dfba5a2c3c6f0a07 = slot;
        function_b8faa69b95fe55be(dropstruct);
        var_180513e5b195f19a = 1;
    }
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x186fd
// Size: 0x15f
function function_f95a2789ce5b15ff(itemtype, itemindex, var_53aaae2c915f815b, var_180513e5b195f19a) {
    switch (itemtype) {
    case 0:
        function_8aab3cda02f81c09(self, itemtype, var_53aaae2c915f815b, var_180513e5b195f19a);
        break;
    case 1:
        function_62f068cec343a111(self, itemtype, itemindex, undefined, var_53aaae2c915f815b, var_180513e5b195f19a, undefined, undefined, 1);
        break;
    case 10:
        function_6f62cb4fc113349c(self, itemtype, itemindex, var_53aaae2c915f815b, var_180513e5b195f19a);
        break;
    case 2:
        function_b130392812b25580(self, itemindex, itemtype, var_53aaae2c915f815b, var_180513e5b195f19a);
        break;
    case 3:
        function_1503d0b5b4c9d010(self, var_53aaae2c915f815b, var_180513e5b195f19a);
        break;
    case 4:
        function_b15e36b7bc247ddb(self, 1, var_180513e5b195f19a);
        break;
    case 6:
        function_750e9a7f11becd51(self, var_180513e5b195f19a);
        break;
    case 7:
        function_8f803ea058a13cbd(self, var_180513e5b195f19a);
        break;
    case 5:
        function_52df07e94b3ce0df(self, itemindex, itemtype, var_53aaae2c915f815b, var_180513e5b195f19a);
        break;
    case 12:
        break;
    case 13:
        function_9e2cddc7551c1be4(self, var_180513e5b195f19a);
        break;
    default:
        /#
            assertmsg("Invalid quick drop item type: " + itemtype);
        #/
        return;
    }
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18863
// Size: 0x39
function quickdropcleanupcache() {
    var_1ca69ee8605fc45d = 120;
    self notify("quickDropCleanupCache");
    self endon("quickDropCleanupCache");
    self endon("death");
    level endon("game_ended");
    wait(var_1ca69ee8605fc45d);
    self.quickdropcache = undefined;
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x188a3
// Size: 0xf4
function quickdropaddtocache(scriptablename, slot, ent, droporigin, dropangles) {
    if (!isdefined(self.quickdropcache)) {
        self.quickdropcache = [];
    }
    newitem = spawnstruct();
    newitem.scriptablename = scriptablename;
    newitem.slot = slot;
    newitem.ent = ent;
    newitem.droporigin = droporigin;
    newitem.dropangles = dropangles;
    newitem.playerorigin = self.origin;
    newitem.playeryaw = self.angles[1];
    if (isplunder(scriptablename)) {
        self.quickdropcache["cash"] = newitem;
    } else {
        self.quickdropcache[scriptablename] = newitem;
    }
    thread quickdropcleanupcache();
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1899e
// Size: 0x9b
function quickdropcachematchesplayer(var_9dc4edee6e76287a) {
    var_5497da879b5dc06e = 60;
    var_9867768cea965153 = squared(var_5497da879b5dc06e);
    var_46e94fc9f78cebfc = 45;
    var_8336f113929858a6 = distancesquared(self.origin, var_9dc4edee6e76287a.playerorigin);
    if (var_8336f113929858a6 > var_9867768cea965153) {
        return 0;
    }
    anglediff = abs(self.angles[1] - var_9dc4edee6e76287a.playeryaw);
    if (anglediff > var_46e94fc9f78cebfc) {
        return 0;
    }
    return 1;
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18a41
// Size: 0xa8
function quickdropfinditemincache(scriptablename) {
    if (!isdefined(scriptablename)) {
        return;
    }
    if (!isdefined(self.quickdropcache)) {
        return;
    }
    var_4b1dc74724995fb7 = scriptablename;
    if (isplunder(scriptablename)) {
        var_4b1dc74724995fb7 = "cash";
    }
    if (!isdefined(self.quickdropcache[var_4b1dc74724995fb7])) {
        return;
    }
    if (!isdefined(self.quickdropcache[var_4b1dc74724995fb7].ent)) {
        self.quickdropcache[var_4b1dc74724995fb7] = undefined;
        return;
    }
    if (distancesquared(self.quickdropcache[var_4b1dc74724995fb7].droporigin, self.origin) > 20000) {
        return;
    }
    return self.quickdropcache[var_4b1dc74724995fb7];
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x18af1
// Size: 0x106
function quickdropcachefindslot() {
    if (!isdefined(self.quickdropcache)) {
        return 0;
    }
    var_1e299b4f7f8b3f95 = [];
    foreach (var_9dc4edee6e76287a in self.quickdropcache) {
        if (isdefined(var_9dc4edee6e76287a.ent)) {
            if (!quickdropcachematchesplayer(var_9dc4edee6e76287a)) {
                continue;
            }
            var_1e299b4f7f8b3f95[var_9dc4edee6e76287a.slot] = 1;
        }
    }
    var_e1d097c517c3af5b = undefined;
    var_dde65f6afbec7591 = 0;
    var_dbdab5ee7fcac18d = 0;
    var_5b256c2c2dd532e3 = [0:0, 1:8, 2:1];
    while (1) {
        var_e1d097c517c3af5b = var_dbdab5ee7fcac18d * 9 + var_5b256c2c2dd532e3[var_dde65f6afbec7591];
        if (!istrue(var_1e299b4f7f8b3f95[var_e1d097c517c3af5b])) {
            break;
        }
        var_dde65f6afbec7591++;
        if (var_dde65f6afbec7591 >= var_5b256c2c2dd532e3.size) {
            var_dde65f6afbec7591 = 0;
            var_dbdab5ee7fcac18d++;
        }
    }
    return var_e1d097c517c3af5b;
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18bff
// Size: 0xa9
function function_4f4d537c794b2bf5() {
    if (!isdefined(level.var_2dc1d82da1dbfeab)) {
        level.var_2dc1d82da1dbfeab = [0:0, 1:8, 2:1, 3:7, 4:2, 5:9, 6:17, 7:10, 8:16, 9:18, 10:26, 11:19, 12:25];
    }
    if (!isdefined(self.var_1ac656ba9c98b8db)) {
        self.var_1ac656ba9c98b8db = 0;
    } else {
        self.var_1ac656ba9c98b8db++;
    }
    return level.var_2dc1d82da1dbfeab[self.var_1ac656ba9c98b8db % level.var_2dc1d82da1dbfeab.size];
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18cb0
// Size: 0xa2
function function_1e450adba8ddc914() {
    self endon("disconnect");
    if (isdefined(self) && isdefined(self.var_1ac656ba9c98b8db) && self.var_1ac656ba9c98b8db == 0) {
        startorigin = self.origin;
        startangles = self.angles;
        while (isdefined(self) && distancesquared(startorigin, self.origin) < 100 && anglesdelta(startangles, self.angles) < 10) {
            wait(1);
        }
        if (isdefined(self)) {
            self.var_1ac656ba9c98b8db = undefined;
            self notify("reset_slots");
        }
    }
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18d59
// Size: 0xcc
function function_1ce1a3739db60bfb(scriptablename) {
    if (isplunder(scriptablename)) {
        return "br_inventory_drop_plunder_med";
    } else if (namespace_a548bd428a566cf3::isammo(scriptablename)) {
        return "br_inventory_drop_ammo";
    } else if (scriptablename == "brloot_offhand_throwingknife" || scriptablename == "brloot_offhand_shuriken") {
        return "iw9_br_inventory_drop_knife";
    } else if (scriptablename == "brloot_gascan") {
        return "iw9_br_inventory_drop_gas_can";
    } else if (namespace_a548bd428a566cf3::isequipmentlethal(scriptablename)) {
        return "iw9_br_inventory_drop_lethal";
    } else if (namespace_a548bd428a566cf3::isequipmenttactical(scriptablename)) {
        return "iw9_br_inventory_drop_tactical";
    } else if (namespace_a548bd428a566cf3::isarmorplate(scriptablename)) {
        return "br_inventory_drop_armor";
    } else if (isstartstr(scriptablename, "iw")) {
        return "br_inventory_drop_weap";
    } else if (isstartstr(scriptablename, "loot_key")) {
        return "br_inventory_drop_key";
    }
    return "br_inventory_drop_generic";
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18e2d
// Size: 0x1e1
function quickdropplaysound(itemtype, droporigin, scriptablename, newent, weaponobj) {
    aliasname = undefined;
    switch (itemtype) {
    case 5:
        aliasname = "br_inventory_drop_ammo";
        break;
    case 0:
        if (scriptablename == "brloot_plunder_cash_uncommon_1") {
            aliasname = "br_inventory_drop_plunder_sm";
        } else if (scriptablename == "brloot_plunder_cash_uncommon_2") {
            aliasname = "br_inventory_drop_plunder_sm";
        } else if (scriptablename == "brloot_plunder_cash_uncommon_3") {
            aliasname = "br_inventory_drop_plunder_sm";
        } else if (scriptablename == "brloot_plunder_cash_rare_1") {
            aliasname = "br_inventory_drop_plunder_med";
        } else if (scriptablename == "brloot_plunder_cash_rare_2") {
            aliasname = "br_inventory_drop_plunder_med";
        } else if (scriptablename == "brloot_plunder_cash_epic_1") {
            aliasname = "br_inventory_drop_plunder_lrg";
        } else if (scriptablename == "brloot_plunder_cash_epic_2") {
            aliasname = "br_inventory_drop_plunder_lrg";
        } else if (scriptablename == "brloot_plunder_cash_legendary_1") {
            aliasname = "br_inventory_drop_plunder_extra_lrg";
        } else {
            aliasname = "br_inventory_drop_plunder_med";
        }
        break;
    case 1:
        if (isdefined(weaponobj)) {
            thread function_aed7983cf10ca9e2(newent, weaponobj);
            return;
        } else {
            aliasname = "br_inventory_drop_weap";
        }
        break;
    case 2:
    case 3:
    case 4:
    case 6:
    case 7:
    case 10:
        aliasname = function_1ce1a3739db60bfb(scriptablename);
        break;
    default:
        /#
            assertmsg("invalid quick drop item type: " + itemtype);
        #/
        break;
    }
    if (isdefined(aliasname)) {
        if (isdefined(newent) && isvector(newent.origin)) {
            playsoundatpos(newent.origin, aliasname);
        } else {
            self playsound(aliasname);
        }
    }
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19015
// Size: 0x128
function function_aed7983cf10ca9e2(newent, weaponobj) {
    origin = self.origin;
    basename = utility::function_53c4c53197386572(weaponobj.basename, "");
    material = utility::function_53c4c53197386572(weaponobj.material, "");
    if (isdefined(newent) && isvector(newent.origin)) {
        origin = newent.origin;
    } else {
        view_origin = self getvieworigin();
        origin = view_origin + anglestoforward(self getplayerangles()) * 100;
        origin = (origin[0], origin[1], view_origin[2]);
    }
    self playsound("br_inventory_drop_weap_toss_only");
    wait(0.5);
    var_f39a1abbe4ec2b6f = origin + (0, 0, -120);
    trace = trace::ray_trace(origin, var_f39a1abbe4ec2b6f, self, undefined, 1);
    surfacetype = trace["surfacetype"];
    waittillframeend();
    weapons::function_e7dbbe9220d5e27b(surfacetype);
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19144
// Size: 0x2e6
function quickdropaddtoexisting(itemtype, scriptablename, itemcount, var_59bd51afc73df2cd, var_dab81ead77442a10, weaponobj) {
    if (!function_f5082b4fc43ef59b(scriptablename)) {
        return 0;
    }
    var_9dc4edee6e76287a = quickdropfinditemincache(scriptablename);
    if (isdefined(var_9dc4edee6e76287a)) {
        oldent = var_9dc4edee6e76287a.ent;
        oldorigin = var_9dc4edee6e76287a.droporigin;
        oldangles = var_9dc4edee6e76287a.dropangles;
        var_e669dcd7466f65d9 = loot_getitemcount(oldent);
        var_74b23b8eea29a555 = loot_getitemcountlefthand(oldent);
        var_4ff1e9f60bcf8fe8 = function_3a5f7703319142dd(oldent);
        var_7b6c183185edff64 = istrue(var_9dc4edee6e76287a.ent.var_6216e086379def7d);
        var_623f993e8a5ac105 = lootGetScriptableName(var_9dc4edee6e76287a.ent);
        if (!ispickupstackable(scriptablename) && !issubstr(var_623f993e8a5ac105, "_cash")) {
            return 0;
        }
        newcount = var_e669dcd7466f65d9 + itemcount;
        if (newcount >= 2048) {
            return 0;
        }
        if (!isdefined(var_59bd51afc73df2cd)) {
            var_59bd51afc73df2cd = 0;
        }
        var_9e57dc7afe8604c8 = var_74b23b8eea29a555 + var_59bd51afc73df2cd;
        if (!isdefined(var_dab81ead77442a10)) {
            var_dab81ead77442a10 = 0;
        }
        var_a69b5a02ffae97ff = var_4ff1e9f60bcf8fe8 + var_dab81ead77442a10;
        var_a6717fae5964e4c6 = calcscriptablepayloadgravityarc(oldorigin + (0, 0, 12), oldorigin);
        var_cb4fad49263e20c4 = getitemdropinfo(oldorigin, oldangles, var_a6717fae5964e4c6, oldent.var_bf8e5f003146af44);
        var_4b1dc74724995fb7 = scriptablename;
        if (isplunder(scriptablename)) {
            var_4b1dc74724995fb7 = "cash";
            var_3466c10973e9c476 = br_plunder::getplundernamebyamount(newcount);
            if (var_3466c10973e9c476 != scriptablename) {
                scriptablename = var_3466c10973e9c476;
            }
        }
        newent = spawnpickup(scriptablename, var_cb4fad49263e20c4, newcount, 1, weaponobj, 0, var_9e57dc7afe8604c8, var_a69b5a02ffae97ff);
        if (isent(self) && isplayer(self)) {
            namespace_9cb8bb5897c3d5b2::branalytics_lootdrop(self, scriptablename, undefined, itemcount);
        }
        if (isdefined(weaponobj)) {
            level.onweapondropcreated namespace_e23d6eb3062a75be::callback_trigger(newent, self, weaponobj);
        }
        var_cb3339ece72dbdeb = scriptablename;
        if (isplunder(scriptablename)) {
            var_cb3339ece72dbdeb = br_plunder::getplundernamebyamount(newcount);
            if (var_7b6c183185edff64) {
                newent.var_6216e086379def7d = 1;
            }
        }
        if (isdefined(itemtype)) {
            quickdropplaysound(itemtype, oldorigin, var_cb3339ece72dbdeb, newent);
        }
        self.quickdropcache[var_4b1dc74724995fb7].ent = newent;
        thread quickdropcleanupcache();
        deregisterscriptableinstance(oldent);
        if (isent(oldent)) {
            oldent delete();
        } else {
            oldent freescriptable();
        }
        return 1;
    }
    return 0;
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 9, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19432
// Size: 0x39f
function quickdropnewitem(itemtype, scriptablename, itemcount, var_59bd51afc73df2cd, var_dab81ead77442a10, weaponobj, var_96c4059aa2eabfb8, var_96c7526f4ab04875, var_7591ed99e87a77d3) {
    var_285b7129b392cf3d = quickdropaddtoexisting(itemtype, scriptablename, itemcount, var_59bd51afc73df2cd, var_dab81ead77442a10, weaponobj);
    if (var_285b7129b392cf3d) {
        return;
    }
    slot = function_4f4d537c794b2bf5();
    thread function_1e450adba8ddc914();
    dropstruct = function_7b9f3966a7a42003();
    dropstruct.var_dfba5a2c3c6f0a07 = slot;
    var_cb4fad49263e20c4 = getitemdroporiginandangles(dropstruct, self.origin, self.angles, self, undefined, var_96c7526f4ab04875, undefined, undefined, var_7591ed99e87a77d3);
    newent = undefined;
    var_ec7ded352736c3b1 = namespace_7efe69864347df52::extract_ismissionweapon(weaponobj);
    if (!var_ec7ded352736c3b1) {
        newent = spawnpickup(scriptablename, var_cb4fad49263e20c4, itemcount, 1, weaponobj, 0, var_59bd51afc73df2cd, var_dab81ead77442a10);
        utility::function_f3bb4f4911a1beb2(scriptablename, "dropped", newent, self, var_cb4fad49263e20c4.origin);
        namespace_27c74152ccb91331::function_aba04688789ce643(newent, weaponobj);
        quickdropaddtocache(scriptablename, slot, newent, var_cb4fad49263e20c4.origin, var_cb4fad49263e20c4.angles);
        namespace_9cb8bb5897c3d5b2::branalytics_lootdrop(self, scriptablename, undefined, itemcount);
        if (isdefined(weaponobj)) {
            level.onweapondropcreated namespace_e23d6eb3062a75be::callback_trigger(newent, self, weaponobj);
            if (br_weapons::function_b1dd9dcae2f63965()) {
                br_weapons::function_8e7e1da48d7746e5(self, newent);
            }
            if (istrue(level.var_34906263684780b7) && getdvarint(@"hash_752eeed3ddcbd04b", 0) == 0) {
                ammotype = br_weapons::br_ammo_type_for_weapon(weaponobj);
                if (isdefined(ammotype) && br_weapons::function_ad972c1d0f29841c(self, weaponobj) && self.br_ammo[ammotype] > 0) {
                    var_660523cff419f0b = getdvarint(@"hash_3c4edd0a748e4053", 1);
                    var_4e06553818889332 = var_cb4fad49263e20c4.origin - self.origin;
                    upvec = anglestoup(var_cb4fad49263e20c4.angles);
                    var_5a060c381dce3622 = vectorcross(vectornormalize(var_4e06553818889332), upvec);
                    var_5a060c381dce3622 = rotatepointaroundvector(upvec, var_5a060c381dce3622, getdvarint(@"hash_51cb230bbd599b71", 20));
                    var_9edc776840baff95 = var_cb4fad49263e20c4.origin + var_5a060c381dce3622 * getdvarint(@"hash_16e74796df75b8d0", 20);
                    var_1299b62e1fedd7df = function_7b9f3966a7a42003();
                    var_cb4fad49263e20c4 = getitemdroporiginandangles(var_1299b62e1fedd7df, self.origin, self.angles, self, undefined, undefined, undefined, undefined, var_9edc776840baff95);
                    var_f14355041a2a65ab = spawnpickup(ammotype, var_cb4fad49263e20c4, self.br_ammo[ammotype], 1, undefined, var_660523cff419f0b);
                    br_weapons::br_ammo_take_type(self, ammotype, self.br_ammo[ammotype]);
                }
            }
        }
        if (isdefined(var_96c4059aa2eabfb8)) {
            newent.metadata = var_96c4059aa2eabfb8;
        }
    }
    if (isplunder(scriptablename)) {
        newent.var_6216e086379def7d = 1;
        scriptablename = br_plunder::getplundernamebyamount(itemcount);
    }
    if (function_68f7f39db3bc7fa4(scriptablename)) {
        if (issharedfuncdefined("br_puzzle_drone_repair", "onDronePartDropped")) {
            level thread [[ getsharedfunc("br_puzzle_drone_repair", "onDronePartDropped") ]](scriptablename, self);
        }
    }
    namespace_a655003e419fc731::function_1062f2af5c7d843e(scriptablename, weaponobj);
    quickdropplaysound(itemtype, var_cb4fad49263e20c4.origin, scriptablename, newent, weaponobj);
    return newent;
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x197d9
// Size: 0x3c
function quickdropitem(itemtype, itemindex, var_180513e5b195f19a) {
    level endon("game_ended");
    self endon("disconnect");
    self endon("death");
    function_f95a2789ce5b15ff(itemtype, itemindex, 0, var_180513e5b195f19a);
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1981c
// Size: 0x3d
function quickdropall(itemtype, itemindex, var_180513e5b195f19a) {
    level endon("game_ended");
    self endon("disconnect");
    self endon("death");
    function_f95a2789ce5b15ff(itemtype, itemindex, 1, var_180513e5b195f19a);
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19860
// Size: 0x5ab
function function_f7e756154ec35632(itemtype, itemindex) {
    level endon("game_ended");
    self endon("disconnect");
    self endon("death");
    var_baa2def287f02cc9 = self.var_2fa5b49969def47.contents[0]["lootID"];
    var_ee01cb619969c19 = self.var_2fa5b49969def47.contents[0]["quantity"];
    var_bbde9e028d7e5cba = loot::getScriptableFromLootID(var_baa2def287f02cc9);
    var_53aaae2c915f815b = 0;
    var_180513e5b195f19a = 0;
    if (isdefined(self.var_2fa5b49969def47.itemtype) && isdefined(self.var_2fa5b49969def47.itemindex) && self.var_2fa5b49969def47.itemtype == itemtype && self.var_2fa5b49969def47.itemindex == itemindex) {
        return;
    }
    switch (itemtype) {
    case 10:
        var_4c2dffbf69902599 = isdefined(namespace_e50e624d9af51c8c::getAvailableDMZBackpackIndex());
        if (istrue(var_4c2dffbf69902599)) {
            var_60227bff1e9478cc = spawnstruct();
            var_60227bff1e9478cc.scriptablename = var_bbde9e028d7e5cba;
            var_60227bff1e9478cc.count = var_ee01cb619969c19;
            var_60227bff1e9478cc.origin = self.var_2fa5b49969def47.origin;
            if (function_2d86ba79a58bb62(var_bbde9e028d7e5cba)) {
                if (isdefined(self.var_2fa5b49969def47.contents[0]["extraInfoEnt"])) {
                    var_60227bff1e9478cc.blacksite = self.var_2fa5b49969def47.contents[0]["extraInfoEnt"];
                    teamplayers = namespace_e47104b48662385b::getteamarray(self.team, 0);
                    originalteam = self.team;
                    if (isdefined(self.var_2fa5b49969def47.contents[0]["extraInfoTeam"])) {
                        originalteam = self.var_2fa5b49969def47.contents[0]["extraInfoTeam"];
                    }
                    namespace_c62d39d6e6afb119::function_7bc622d2fe4b2017(var_60227bff1e9478cc.blacksite, 0, teamplayers, originalteam, self.team);
                }
            } else if (function_e4b6260dbb04b43d(var_bbde9e028d7e5cba)) {
                var_60227bff1e9478cc.var_84b9876dbe3b246c = self.var_2fa5b49969def47.var_84b9876dbe3b246c;
            }
            namespace_e50e624d9af51c8c::addItemToBackpack(var_baa2def287f02cc9, var_60227bff1e9478cc, undefined, 1);
            self.var_2fa5b49969def47.contents[0]["lootID"] = 0;
            self.var_2fa5b49969def47.contents[0]["quantity"] = 0;
            loot::function_446c7ad7bcc70992(self, self.var_2fa5b49969def47, 0, 0, 0);
            self setclientomnvar("loot_container_open", 0);
            self.var_2fa5b49969def47 notify("closed");
            loothide(self.var_2fa5b49969def47);
        }
        break;
    case 2:
        itemcount = equipment::getequipmentslotammo(equipment::function_4967838290cb31b9(itemindex));
        var_4c2dffbf69902599 = !isdefined(itemcount) || itemcount == 0;
        if (var_4c2dffbf69902599) {
            slot = equipment::function_4967838290cb31b9(itemindex);
            var_cb325ddb4a764623 = loot::function_793e8a72cedb8ef3(var_baa2def287f02cc9);
            var_402526809b38da5f = equipment::getequipmentmaxammo(var_cb325ddb4a764623);
            var_402526809b38da5f = utility::function_53c4c53197386572(var_402526809b38da5f, 1);
            var_75e244e5f45c894d = var_ee01cb619969c19;
            if (var_402526809b38da5f < var_ee01cb619969c19) {
                var_75e244e5f45c894d = var_402526809b38da5f;
                dropstruct = function_7b9f3966a7a42003();
                var_cb4fad49263e20c4 = getitemdroporiginandangles(dropstruct, self.origin, self.angles, self, undefined, undefined, undefined, undefined, self.var_2fa5b49969def47.origin);
                item = spawnpickup(var_bbde9e028d7e5cba, var_cb4fad49263e20c4, var_ee01cb619969c19 - var_402526809b38da5f, 1, undefined, 0);
            }
            self.var_2fa5b49969def47.contents[0]["lootID"] = 0;
            self.var_2fa5b49969def47.contents[0]["quantity"] = 0;
            loot::function_446c7ad7bcc70992(self, self.var_2fa5b49969def47, 0, 0, 0);
            self setclientomnvar("loot_container_open", 0);
            self.var_2fa5b49969def47 notify("closed");
            loothide(self.var_2fa5b49969def47);
            equipment::giveequipment(var_cb325ddb4a764623, slot);
            equipment::setequipmentammo(var_cb325ddb4a764623, var_75e244e5f45c894d);
        }
        break;
    case 4:
        itemcount = equipment::getequipmentslotammo("super");
        var_4c2dffbf69902599 = !isdefined(itemcount) || itemcount == 0;
        if (var_4c2dffbf69902599) {
            equipname = level.br_pickups.br_equipname[var_bbde9e028d7e5cba];
            var_5237a188ccda4d7b = level.br_pickups.var_14bd11727c4b6629[var_bbde9e028d7e5cba];
            self.var_2fa5b49969def47.contents[0]["lootID"] = 0;
            self.var_2fa5b49969def47.contents[0]["quantity"] = 0;
            loot::function_446c7ad7bcc70992(self, self.var_2fa5b49969def47, 0, 0, 0);
            self setclientomnvar("loot_container_open", 0);
            self.var_2fa5b49969def47 notify("closed");
            loothide(self.var_2fa5b49969def47);
            _givebrsuper(equipname, var_5237a188ccda4d7b, var_ee01cb619969c19);
        }
        break;
    default:
        break;
    }
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19e12
// Size: 0xa8
function function_cab3366841d709aa(itemslotindex) {
    level endon("game_ended");
    var_c00e3b62499a4457 = namespace_e50e624d9af51c8c::function_6738846da50730f1(itemslotindex);
    quantity = var_c00e3b62499a4457[1];
    lootid = var_c00e3b62499a4457[0];
    var_cb325ddb4a764623 = loot::function_793e8a72cedb8ef3(lootid);
    if (function_282d89f7705a2d63(var_cb325ddb4a764623)) {
        function_27443a5346bc8120(lootid, quantity, var_cb325ddb4a764623, itemslotindex);
        return;
    }
    if (!isdefined(var_cb325ddb4a764623) || isdefined(var_cb325ddb4a764623) && !namespace_a548bd428a566cf3::isammo(var_cb325ddb4a764623)) {
        self.var_e0c39101bfc15d2[itemslotindex] = 1;
        function_fe539e37b6579930(lootid, quantity, itemslotindex, undefined, 1);
        self.var_e0c39101bfc15d2[itemslotindex] = undefined;
    }
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19ec1
// Size: 0x5d
function function_27443a5346bc8120(lootid, quantity, var_cb325ddb4a764623, itemslotindex) {
    if (var_cb325ddb4a764623 == "brloot_nvg") {
        function_60ea3b868e7a009b();
    } else if (var_cb325ddb4a764623 == "brloot_disguise") {
        if (!disguise::function_d3b190ee881c5ca7()) {
            disguise::function_67d03e329e13f612(var_cb325ddb4a764623);
        } else {
            namespace_c39580665208f0a4::function_3ede6b66136c0f93();
        }
    }
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19f25
// Size: 0x31
function function_60ea3b868e7a009b() {
    ison = self isnightvisionon();
    if (ison) {
        self nightvisionviewoff();
    } else {
        self nightvisionviewon();
    }
    thread namespace_32b635fd0594e0cc::nvg_monitor();
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19f5d
// Size: 0x92
function function_bfc82c27ed3d9308(lootid, quantity, var_cb325ddb4a764623, itemslotindex) {
    if (var_cb325ddb4a764623 == "brloot_nvg") {
        var_c0cdb299fadbabc3 = namespace_aead94004cf4c147::getTotalItemCountInBag(lootid);
        if (var_c0cdb299fadbabc3 <= 1) {
            if (self isnightvisionon()) {
                self nightvisionviewoff();
            }
        }
        thread function_5ddb83e059ee76c9(lootid);
    } else if (var_cb325ddb4a764623 == "brloot_disguise") {
        if (namespace_c39580665208f0a4::function_d3b190ee881c5ca7()) {
            if (namespace_c39580665208f0a4::function_65a78266ead29817()) {
                thread function_2ea494708e46229b(lootid);
            } else {
                namespace_c39580665208f0a4::function_3ede6b66136c0f93();
            }
        }
    }
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19ff6
// Size: 0x54
function function_2ea494708e46229b(lootid) {
    self notify("watch_disguise_backpack");
    level endon("game_ended");
    self endon("watch_disguise_backpack");
    self endon("disconnect");
    while (namespace_c39580665208f0a4::function_65a78266ead29817()) {
        waitframe();
    }
    var_5773c32ec9b66a48 = namespace_aead94004cf4c147::function_d63a7299c6203bf9(lootid);
    if (var_5773c32ec9b66a48) {
        return;
    }
    namespace_c39580665208f0a4::function_3ede6b66136c0f93();
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a051
// Size: 0x54
function function_5ddb83e059ee76c9(lootid) {
    self notify("watch_nvg_backpack");
    level endon("game_ended");
    self endon("watch_nvg_backpack");
    self endon("disconnect");
    self endon("night_vision_off");
    wait(1);
    var_11a1fa68aeb971c0 = namespace_aead94004cf4c147::function_d63a7299c6203bf9(lootid);
    if (var_11a1fa68aeb971c0) {
        return;
    }
    self nightvisionviewoff();
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a0ac
// Size: 0x45
function function_282d89f7705a2d63(var_cb325ddb4a764623) {
    if (!isdefined(var_cb325ddb4a764623)) {
        return 0;
    }
    switch (var_cb325ddb4a764623) {
    case #"hash_5fd271e568cc2313":
    case #"hash_c6fbab1b754d4731":
        return 1;
    default:
        return 0;
        break;
    }
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a0f8
// Size: 0x355
function function_f1a38d2ba0bbcb08(player, itemslotindex, var_5c31c74d6d007e20) {
    if (isdefined(player.plundercount) && player.plundercount >= level.br_plunder.plunderlimit) {
        player hud_message::showerrormessage(level.br_pickups.br_pickupdenyplunderpickup);
        return;
    }
    var_c012b862499f4d15 = namespace_e50e624d9af51c8c::function_6738846da50730f1(itemslotindex);
    quantity = var_c012b862499f4d15[1];
    lootid = var_c012b862499f4d15[0];
    var_cb325ddb4a764623 = loot::getScriptableFromLootID(lootid);
    type = loot::function_282cf83c9eeda744(lootid);
    var_9fb3b576439ee3d = 1;
    if ((istrue(var_5c31c74d6d007e20) || !function_f5082b4fc43ef59b(var_cb325ddb4a764623)) && !namespace_b5b2cbfd27ff2a4e::function_3c17a26ce6a4668(lootid)) {
        var_9fb3b576439ee3d = quantity;
    }
    if (isdefined(var_cb325ddb4a764623) && (isvaluable(var_cb325ddb4a764623) || isDogTag(var_cb325ddb4a764623) || function_eac097ce4c683ab9(var_cb325ddb4a764623) || function_32125eba262380c7(var_cb325ddb4a764623) && utility::array_contains_key(level.br_pickups.var_d93566a78e29d583, var_cb325ddb4a764623) && level.br_pickups.var_d93566a78e29d583[var_cb325ddb4a764623] > 0)) {
        var_b87f7fae01ce754f = var_9fb3b576439ee3d * level.br_pickups.var_d93566a78e29d583[var_cb325ddb4a764623];
        if (isdefined(player.plundercount) && var_b87f7fae01ce754f + player.plundercount > level.br_plunder.plunderlimit) {
            var_2c86af91e7e20602 = var_b87f7fae01ce754f + player.plundercount - level.br_plunder.plunderlimit;
            var_b87f7fae01ce754f = level.br_plunder.plunderlimit - player.plundercount;
            if (var_2c86af91e7e20602 > 0) {
                var_8e5dd667f5bf1e1e = br_plunder::getplundernamebyamount(var_2c86af91e7e20602);
                dropstruct = function_7b9f3966a7a42003();
                var_96c7526f4ab04875 = undefined;
                if (isdefined(player.br_kiosk)) {
                    var_96c7526f4ab04875 = distance2d(player.origin, player.br_kiosk.origin) / 2;
                }
                var_cb4fad49263e20c4 = getitemdroporiginandangles(dropstruct, player.origin, player.angles, player, undefined, var_96c7526f4ab04875);
                spawnpickup(var_8e5dd667f5bf1e1e, var_cb4fad49263e20c4, var_2c86af91e7e20602, 1);
            }
        }
        player br_plunder::playerplunderpickup(var_b87f7fae01ce754f);
        player br_plunder::function_5a2284274d70f7d(2, var_b87f7fae01ce754f);
        var_74806f0c4caa7e55 = var_9fb3b576439ee3d;
        if (isDogTag(var_cb325ddb4a764623)) {
            var_74806f0c4caa7e55 = quantity;
        }
        if (isvaluable(var_cb325ddb4a764623)) {
            pmc_missions::onItemSold(player, var_cb325ddb4a764623);
            namespace_a011fbf6d93f25e5::function_7dcf65411dc17f09(var_cb325ddb4a764623, level.br_pickups.var_d93566a78e29d583[var_cb325ddb4a764623], var_9fb3b576439ee3d, var_b87f7fae01ce754f, player);
        }
        player namespace_e50e624d9af51c8c::function_db1dd76061352e5b(itemslotindex, var_74806f0c4caa7e55);
        player challenges::function_ea50038423fc4cfc(type, var_cb325ddb4a764623, lootid, var_9fb3b576439ee3d, var_b87f7fae01ce754f);
        utility::function_f3bb4f4911a1beb2(lootid, "onItemSold", player, lootid, type, var_9fb3b576439ee3d, var_b87f7fae01ce754f);
    }
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a454
// Size: 0x98
function function_64f0398b29cf7c3e(player) {
    var_1d4db10d5290694a = player namespace_e50e624d9af51c8c::function_254150d1e667dee7();
    foreach (item in var_1d4db10d5290694a) {
        if (!isdefined(item.objweapon) && isdefined(item.index)) {
            function_f1a38d2ba0bbcb08(player, item.index, 1);
        }
    }
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 11, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a4f3
// Size: 0x193
function function_e5845ff9b61ac5d7(weaponobj, quantity, itemslotindex, var_e97d731bedd44c63, var_44ee85dcf52b4001, var_5756aa71087f3439, metadata, var_96c7526f4ab04875, var_7591ed99e87a77d3, var_e1147886ccf51970, var_8beae58a219e6d44) {
    var_bada25504e8844d7 = spawnstruct();
    scriptablename = undefined;
    if (isdefined(weaponobj)) {
        var_a48c0a5c6cba3f2c = getcompleteweaponname(weaponobj);
        if (isdefined(level.br_pickups.var_9e78b5ee377070a9) && isdefined(level.br_pickups.var_9e78b5ee377070a9[var_a48c0a5c6cba3f2c])) {
            scriptablename = level.br_pickups.var_9e78b5ee377070a9[var_a48c0a5c6cba3f2c];
        }
    }
    var_bada25504e8844d7.scriptablename = utility::function_53c4c53197386572(scriptablename, "brloot_weapon_generic_pi");
    var_bada25504e8844d7.origin = utility::ter_op(isdefined(var_7591ed99e87a77d3), var_7591ed99e87a77d3, self.origin);
    var_bada25504e8844d7.count = quantity;
    var_bada25504e8844d7.weapon = weaponobj;
    var_bada25504e8844d7.countlefthand = var_8beae58a219e6d44;
    var_bada25504e8844d7.var_e97d731bedd44c63 = var_e97d731bedd44c63;
    var_bada25504e8844d7.metadata = metadata;
    var_bada25504e8844d7.var_96c7526f4ab04875 = var_96c7526f4ab04875;
    var_bada25504e8844d7.var_e1147886ccf51970 = var_e1147886ccf51970;
    var_bada25504e8844d7.var_c03c4ef51659ba4c = istrue(var_44ee85dcf52b4001);
    onusecompleted(var_bada25504e8844d7, undefined, 1, 0, itemslotindex, undefined, var_44ee85dcf52b4001, 0, var_5756aa71087f3439);
    return 1;
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a68e
// Size: 0xe0
function function_b76f69ce63757cea(var_a0ce8000d303764c) {
    player = self;
    if (!game_utility::isBRStyleGameType() || !getdvarint(@"hash_1f9797aa5675c82a", 1)) {
        return 0;
    }
    lootid = loot::getLootIDFromRef(var_a0ce8000d303764c);
    var_ec3be9f70c7f5ae9 = player namespace_e50e624d9af51c8c::function_5915bdbc5f6302b6([0:lootid]);
    if (isdefined(var_ec3be9f70c7f5ae9) && var_ec3be9f70c7f5ae9.size > 0) {
        player function_cab3366841d709aa(var_ec3be9f70c7f5ae9[0]);
        return 1;
    }
    if (istrue(level.br_pickups.var_5bbd561a9aa69746) && array_contains(level.br_pickups.br_killstreakreference, var_a0ce8000d303764c)) {
        var_a6e8fa1d30b077f9 = player namespace_e50e624d9af51c8c::function_a1ef7227cd878384();
        if (isdefined(var_a6e8fa1d30b077f9) && var_a6e8fa1d30b077f9.size > 0) {
            player function_cab3366841d709aa(var_a6e8fa1d30b077f9[0]);
            return 1;
        }
    }
    return 0;
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 8, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a776
// Size: 0x2f1
function function_fe539e37b6579930(lootid, quantity, itemslotindex, var_e97d731bedd44c63, var_44ee85dcf52b4001, var_5756aa71087f3439, var_96c7526f4ab04875, var_7591ed99e87a77d3) {
    scriptablename = loot::getScriptableFromLootID(lootid);
    if (!isdefined(scriptablename)) {
        return;
    }
    if (issuperpickup(scriptablename)) {
        if (supers::issuperinuse() || supers::function_565913010c84ffca()) {
            var_d3c112e63bf53ee5 = supers::getcurrentsuper();
            var_9cb951de1a571d32 = isdefined(var_d3c112e63bf53ee5) && isdefined(var_d3c112e63bf53ee5.staticdata) && isdefined(var_d3c112e63bf53ee5.staticdata.ref);
            ref = "";
            if (var_9cb951de1a571d32) {
                ref = var_d3c112e63bf53ee5.staticdata.ref;
            }
            if (ref != "super_stimpistol" && ref != "super_oxygen_mask") {
                if (utility::issharedfuncdefined("hud", "showErrorMessage")) {
                    self [[ utility::getsharedfunc("hud", "showErrorMessage") ]]("MP/SUPERS_UNAVAILABLE_EQUIP");
                }
                return;
            } else {
                supers::switchandtakesuperuseweapon();
            }
        }
        if (isdefined(self.equipment["super"])) {
            var_57b0241752598e4a = utility::array_find(level.br_pickups.br_equipname, self.equipment["super"]);
            if (var_57b0241752598e4a == scriptablename) {
                if (equipment::getequipmentammo(self.equipment["super"]) != 0) {
                    hud_message::showerrormessage(level.br_pickups.var_a1a6a7680c4ff1eb);
                    return undefined;
                }
            }
        }
    }
    var_bada25504e8844d7 = spawnstruct();
    var_bada25504e8844d7.scriptablename = scriptablename;
    var_bada25504e8844d7.origin = utility::ter_op(isdefined(var_7591ed99e87a77d3), var_7591ed99e87a77d3, self.origin);
    var_bada25504e8844d7.count = quantity;
    var_bada25504e8844d7.maxcount = level.br_pickups.maxcounts[scriptablename];
    var_bada25504e8844d7.stackable = level.br_pickups.stackable[scriptablename];
    if (isdefined(var_e97d731bedd44c63)) {
        var_bada25504e8844d7.var_e97d731bedd44c63 = var_e97d731bedd44c63;
    }
    var_bada25504e8844d7.countlefthand = 0;
    var_bada25504e8844d7.var_c03c4ef51659ba4c = istrue(var_44ee85dcf52b4001);
    if (isdefined(var_96c7526f4ab04875)) {
        var_bada25504e8844d7.var_96c7526f4ab04875 = var_96c7526f4ab04875;
    }
    if (iskillstreak(scriptablename) || issuperpickup(scriptablename) && !function_1be34022a4acce73(scriptablename)) {
        var_bada25504e8844d7.count = 1;
    }
    var_171e5792f47d0b3f = undefined;
    if (function_5449da9d3d0358a4(scriptablename)) {
        var_171e5792f47d0b3f = 1;
    }
    return onusecompleted(var_bada25504e8844d7, undefined, 1, 0, itemslotindex, undefined, var_44ee85dcf52b4001, var_171e5792f47d0b3f, var_5756aa71087f3439);
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 11, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1aa6f
// Size: 0x213
function function_d8cd9c1941a88194(lootid, quantity, weaponref, var_8598d3d3bc3d9ceb, var_1a33360665b6bb36, var_c03c4ef51659ba4c, var_96c7526f4ab04875, var_7591ed99e87a77d3, var_307bcadb5a20bd5e, var_4a08890fd43d6bc7, var_1e2e085b484205c3) {
    scriptablename = weaponref;
    if (!isdefined(weaponref)) {
        scriptablename = loot::getScriptableFromLootID(lootid);
    }
    var_bada25504e8844d7 = spawnstruct();
    var_bada25504e8844d7.scriptablename = scriptablename;
    var_bada25504e8844d7.origin = utility::ter_op(isdefined(var_7591ed99e87a77d3), var_7591ed99e87a77d3, self.origin);
    var_bada25504e8844d7.maxcount = level.br_pickups.maxcounts[scriptablename];
    var_bada25504e8844d7.stackable = level.br_pickups.stackable[scriptablename];
    if (isweaponpickupitem(var_bada25504e8844d7) && namespace_e50e624d9af51c8c::function_7e103028c464ab9a(scriptablename)) {
        var_c012b562499f467c = namespace_9a3cc734bcf13a48::getDefaultWeaponAmmo(level.br_lootiteminfo[scriptablename].fullweaponobj, 1);
        var_35ead47ed0d7507e = var_c012b562499f467c[2];
        var_4f04b15053655ba = var_c012b562499f467c[1];
        ammo = var_c012b562499f467c[0];
        var_bada25504e8844d7.count = ammo;
        var_bada25504e8844d7.countlefthand = var_4f04b15053655ba;
        var_bada25504e8844d7.var_e97d731bedd44c63 = var_35ead47ed0d7507e;
        var_bada25504e8844d7.var_4a08890fd43d6bc7 = var_4a08890fd43d6bc7;
    } else {
        var_bada25504e8844d7.count = quantity;
        var_bada25504e8844d7.countlefthand = 0;
        var_bada25504e8844d7.var_e97d731bedd44c63 = 0;
    }
    if (isdefined(var_8598d3d3bc3d9ceb)) {
        var_bada25504e8844d7.var_8598d3d3bc3d9ceb = var_8598d3d3bc3d9ceb;
    }
    if (isdefined(var_c03c4ef51659ba4c)) {
        var_bada25504e8844d7.var_c03c4ef51659ba4c = var_c03c4ef51659ba4c;
    }
    if (isdefined(var_96c7526f4ab04875)) {
        var_bada25504e8844d7.var_96c7526f4ab04875 = var_96c7526f4ab04875;
    }
    return function_b5f5576a0017c089(var_bada25504e8844d7, "visible", self, var_307bcadb5a20bd5e, undefined, undefined, var_1a33360665b6bb36, var_1e2e085b484205c3);
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ac8a
// Size: 0x238
function dangercircletick(var_819edacdacb810e4, var_e86632d645c137d0, var_5d954f1724092f5a) {
    if (namespace_b8ca654fc4c2dd79::isfeaturedisabled("loot")) {
        return;
    }
    var_54a45680da242858 = var_e86632d645c137d0 * var_e86632d645c137d0;
    circleindex = level.br_circle.circleindex;
    if (circleindex > level.br_circle.damagetick.size - 1) {
        circleindex = level.br_circle.damagetick.size - 1;
    }
    damagetick = level.br_circle.damagetick[circleindex];
    if (isdefined(level.circledamagemultiplier)) {
        damagetick = damagetick * level.circledamagemultiplier;
    }
    level.br_pickups.droppedgasmasks = utility::array_removeundefined(level.br_pickups.droppedgasmasks);
    for (index = level.br_pickups.droppedgasmasks.size - 1; index >= 0; index--) {
        gasmask = level.br_pickups.droppedgasmasks[index];
        if (istrue(gasmask.var_1b46a808091ea19c)) {
            continue;
        }
        if (distance2dsquared(gasmask.origin, var_819edacdacb810e4) > var_54a45680da242858) {
            var_9511fffec55ba283 = gasmask.count;
            if (level.br_circle.circleindex <= level.var_aa1aaed4a9b80d4b) {
                damagetick = damagetick * float(level.var_152d5a9c5ac5cdad);
                newhealth = int(var_9511fffec55ba283 - damagetick);
            } else {
                newhealth = int(var_9511fffec55ba283 - damagetick);
            }
            if (newhealth <= 0) {
                gasmask setscriptablepartstate(gasmask.type, "death");
                gasmask deletescriptableinstanceaftertime(1);
                level thread deregistergasmaskscriptableatframeend(index);
            } else {
                if (gasmask gasmask::didgasmaskpipschange(var_9511fffec55ba283, newhealth)) {
                    gasmask setscriptablepartstate(gasmask.type, "damage");
                }
                loot_setitemcount(gasmask, newhealth);
            }
        }
    }
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1aec9
// Size: 0x20b
function function_1a1709943670772a() {
    if (namespace_b8ca654fc4c2dd79::isfeaturedisabled("loot")) {
        return;
    }
    circleindex = level.br_circle.circleindex;
    if (circleindex > level.br_circle.damagetick.size - 1) {
        circleindex = level.br_circle.damagetick.size - 1;
    }
    damagetick = level.br_circle.damagetick[circleindex];
    if (isdefined(level.circledamagemultiplier)) {
        damagetick = damagetick * level.circledamagemultiplier;
    }
    level.br_pickups.droppedgasmasks = utility::array_removeundefined(level.br_pickups.droppedgasmasks);
    for (index = level.br_pickups.droppedgasmasks.size - 1; index >= 0; index--) {
        gasmask = level.br_pickups.droppedgasmasks[index];
        if (istrue(gasmask.var_1b46a808091ea19c)) {
            continue;
        }
        if (!namespace_553788426d0f4133::function_ee854fdd1e77efc4(gasmask.origin)) {
            var_9511fffec55ba283 = gasmask.count;
            if (level.br_circle.circleindex <= level.var_aa1aaed4a9b80d4b) {
                damagetick = damagetick * float(level.var_152d5a9c5ac5cdad);
                newhealth = int(var_9511fffec55ba283 - damagetick);
            } else {
                newhealth = int(var_9511fffec55ba283 - damagetick);
            }
            if (newhealth <= 0) {
                gasmask setscriptablepartstate(gasmask.type, "death");
                gasmask deletescriptableinstanceaftertime(1);
                level thread deregistergasmaskscriptableatframeend(index);
            } else {
                if (gasmask gasmask::didgasmaskpipschange(var_9511fffec55ba283, newhealth)) {
                    gasmask setscriptablepartstate(gasmask.type, "damage");
                }
                loot_setitemcount(gasmask, newhealth);
            }
        }
    }
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b0db
// Size: 0x2d
function gasmask_onpickupcreated() {
    level.br_pickups.droppedgasmasks[level.br_pickups.droppedgasmasks.size] = self;
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b10f
// Size: 0x39
function deregistergasmaskscriptableatframeend(index) {
    waittillframeend();
    if (isdefined(level.br_pickups.droppedgasmasks)) {
        level.br_pickups.droppedgasmasks[index] = undefined;
    }
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b14f
// Size: 0x10f
function initscriptablemanagement() {
    levelData = level.br_pickups;
    /#
        assertex(isdefined(levelData), "initScriptableManagement called before initArrays or br_pickups_init.");
    #/
    /#
        assertex(!isdefined(levelData.scriptables), "initScriptableManagement called more than once.");
    #/
    levelData.scriptables = [];
    levelData.scriptablesstartid = 0;
    levelData.scriptablescurid = 0;
    levelData.scriptablesmax = getdvarint(@"hash_3a100e962f0a003a", 750);
    levelData.scriptablescleanupbatchsize = getdvarint(@"hash_1e71982a0a539739", 10);
    /#
        assertex(levelData.scriptablescleanupbatchsize < levelData.scriptablesmax, "cleanupBatchSize should never be greater than or equal to maxSize.");
    #/
    /#
        setdevdvarifuninitialized(@"hash_3a100e962f0a003a", levelData.scriptablesmax);
        setdevdvarifuninitialized(@"hash_1e71982a0a539739", levelData.scriptablescleanupbatchsize);
    #/
    utility::create_func_ref("deregisterScriptable", &function_7b67823458cd14);
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b265
// Size: 0xb7
function registerscriptableinstance(instance) {
    /#
        assertex(isdefined(level.br_pickups), "registerScriptableInstance called before initArrays or br_pickups_init.");
    #/
    /#
        assertex(isdefined(level.br_pickups.scriptables), "registerScriptableInstance called before initScriptableManagement.");
    #/
    /#
        assertex(!isdefined(instance.brpickupscriptableid), "registerScriptableInstance was called twice on the same instances.");
    #/
    id = level.br_pickups.scriptablescurid;
    instance.brpickupscriptableid = id;
    level.br_pickups.scriptables[id] = instance;
    level.br_pickups.scriptablescurid++;
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b323
// Size: 0x8a
function deregisterscriptableinstance(instance) {
    /#
        assertex(isdefined(level.br_pickups), "deregisterScriptableInstance called before initArrays or br_pickups_init.");
    #/
    /#
        assertex(isdefined(level.br_pickups.scriptables), "deregisterScriptableInstance called before initScriptableManagement.");
    #/
    /#
        assertex(isdefined(instance.brpickupscriptableid), "deregisterScriptableInstance called on an unregistered instance.");
    #/
    level.br_pickups.scriptables[instance.brpickupscriptableid] = undefined;
    instance.brpickupscriptableid = undefined;
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b3b4
// Size: 0x15
function function_7b67823458cd14() {
    if (function_f483aacd19d70a1(self)) {
        deregisterscriptableinstance(self);
    }
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b3d0
// Size: 0x1c7
function clearspaceforscriptableinstance() {
    levelData = level.br_pickups;
    /#
        assertex(isdefined(levelData), "clearSpaceForScriptableInstance called before initArrays or br_pickups_init.");
    #/
    /#
        assertex(isdefined(levelData.scriptables), "clearSpaceForScriptableInstance called before initScriptableManagement.");
    #/
    /#
        assertex(levelData.scriptables.size <= levelData.scriptablesmax, "number of scriptables exceeds the maximum");
    #/
    if (levelData.scriptables.size < levelData.scriptablesmax) {
        return;
    }
    function_ff5569044925c628();
    var_406118f36ab85942 = 0;
    for (i = levelData.scriptablesstartid; i < levelData.scriptablescurid; i++) {
        if (var_406118f36ab85942 == levelData.scriptablescleanupbatchsize) {
            break;
        }
        instance = levelData.scriptables[i];
        if (isdefined(instance)) {
            if (istrue(instance.var_bbc200bc77c5db2b)) {
                continue;
            }
            foreach (var_31ab61e6884f3bc2 in level.br_pickups.var_7c25f4fb48db3dd4) {
                instance [[ var_31ab61e6884f3bc2 ]]();
            }
            levelData.scriptables[i] = undefined;
            if (isdefined(instance.var_31ab61e6884f3bc2)) {
                instance [[ instance.var_31ab61e6884f3bc2 ]]();
            } else if (isent(instance)) {
                instance delete();
            } else {
                instance freescriptable();
            }
            var_406118f36ab85942++;
        } else {
            levelData.scriptables[i] = undefined;
        }
        levelData.scriptablesstartid++;
    }
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b59e
// Size: 0x1e
function function_f483aacd19d70a1(instance) {
    return isdefined(instance) && isdefined(instance.brpickupscriptableid);
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b5c4
// Size: 0x50
function deletescriptableinstance(var_1f99273bfef8cf44) {
    if (istrue(self.var_bbc200bc77c5db2b) && !istrue(var_1f99273bfef8cf44)) {
        return;
    }
    if (isdefined(self.brpickupscriptableid)) {
        deregisterscriptableinstance(self);
    }
    if (isent(self)) {
        self delete();
    } else {
        loothide(self);
    }
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b61b
// Size: 0x15
function deletescriptableinstanceaftertime(delaytime) {
    thread deletescriptableinstanceaftertime_proc(delaytime);
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b637
// Size: 0x21
function deletescriptableinstanceaftertime_proc(delaytime) {
    self endon("death");
    wait(delaytime);
    if (isdefined(self)) {
        deletescriptableinstance();
    }
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1b65f
// Size: 0x42
function registeruniquelootcallback(var_7d740d4524ce32a9, callback) {
    while (!isdefined(level.br_pickups)) {
        waitframe();
    }
    level.br_pickups.uniquelootcallbacks["uniqueLootItem_" + var_7d740d4524ce32a9] = callback;
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b6a8
// Size: 0x42
function processuniquelootitem(uniquelootitemid, player) {
    if (isdefined([[ level.br_pickups.uniquelootcallbacks[uniquelootitemid] ]](player))) {
        return;
    } else {
        /#
            assertmsg("There is no callback for the unique loot ID specified.");
        #/
    }
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b6f1
// Size: 0x1b
function manageminigunpickup() {
    thread watchaddminigunrestrictions();
    thread watchremoveminigunrestrictions();
    thread watchminigunweapon();
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b713
// Size: 0x57
function applyminigunrestrictions() {
    self.playerstreakspeedscale = juggernaut::jugg_getmovespeedscalar();
    weapons::updatemovespeedscale();
    val::function_3633b947164be4f3("fakeJugg", 0);
    if (!istrue(level.disablemount)) {
        val::set("fakeJugg", "mount_top", 0);
        val::set("fakeJugg", "mount_side", 0);
    }
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b771
// Size: 0x20
function removeminigunrestrictions() {
    self.playerstreakspeedscale = undefined;
    weapons::updatemovespeedscale();
    val::function_588f2307a3040610("fakeJugg");
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b798
// Size: 0x36
function watchaddminigunrestrictions() {
    self endon("death_or_disconnect");
    self endon("dropped_minigun");
    self endon("juggernaut_start");
    level endon("game_ended");
    while (1) {
        self waittill("switched_to_minigun");
        applyminigunrestrictions();
    }
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b7d5
// Size: 0x54
function watchremoveminigunrestrictions() {
    self endon("death_or_disconnect");
    self endon("juggernaut_start");
    level endon("game_ended");
    while (1) {
        result = utility::waittill_any_return_no_endon_death_2("switched_from_minigun", "dropped_minigun");
        if (isdefined(result)) {
            removeminigunrestrictions();
            if (result == "dropped_minigun") {
                break;
            }
        }
    }
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b830
// Size: 0x67
function watchminigunweapon() {
    self endon("death_or_disconnect");
    self endon("dropped_minigun");
    self endon("juggernaut_start");
    level endon("game_ended");
    var_811a4cb44c776b67 = 0;
    while (1) {
        if (!weapon::isminigunweapon(self getcurrentweapon())) {
            if (istrue(var_811a4cb44c776b67)) {
                var_811a4cb44c776b67 = 0;
                self notify("switched_from_minigun");
            }
        } else if (!istrue(var_811a4cb44c776b67)) {
            var_811a4cb44c776b67 = 1;
            self notify("switched_to_minigun");
        }
        waitframe();
    }
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b89e
// Size: 0xf4
function doesstreakinfomatchequippedstreak(streakinfo) {
    if (!isdefined(streakinfo)) {
        return 0;
    }
    if (!isdefined(self.streakdata)) {
        return 0;
    }
    if (!isdefined(self.streakdata.streaks) || !isdefined(self.streakdata.streaks[1])) {
        return 0;
    }
    streakdata = self.streakdata.streaks[1];
    if (!isdefined(streakinfo.streakname) || !isdefined(streakdata.streakname) || streakinfo.streakname != streakdata.streakname) {
        return 0;
    }
    if (!isdefined(streakinfo.id) || !isdefined(streakdata.uniqueid) || streakinfo.id != streakdata.uniqueid) {
        return 0;
    }
    return 1;
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b99a
// Size: 0x565
function function_e44c2d69db881894(var_a1093166de09e6b8) {
    maxcount = level.br_pickups.var_4138f9ddc1cd22d[var_a1093166de09e6b8];
    if (!isdefined(maxcount) || maxcount == 0) {
        maxcount = level.br_pickups.maxcounts[var_a1093166de09e6b8];
    }
    if (!isdefined(maxcount)) {
        script::demoforcesre("[IW9-672783]: maxCount undefined with lootName: " + var_a1093166de09e6b8);
    }
    lootid = loot::function_fae5e1d3de32d3f7(var_a1093166de09e6b8);
    if (maxcount > 0 && isdefined(lootid)) {
        for (i = 0; i < namespace_e50e624d9af51c8c::function_b13e35608b336d65(self); i++) {
            var_eeeae9defa0c1e95 = namespace_e50e624d9af51c8c::function_6196d9ea9a30e609(i);
            if (var_eeeae9defa0c1e95 == lootid) {
                var_e30b916adc1e2dc8 = namespace_e50e624d9af51c8c::function_897b29adb37f06a7(i);
                if (var_e30b916adc1e2dc8 < maxcount) {
                    return 1;
                }
            }
        }
    }
    if (namespace_a548bd428a566cf3::isammo(var_a1093166de09e6b8)) {
        if (!getdvarint(@"hash_752eeed3ddcbd04b", 0)) {
            var_509d86412c9d7426 = self getweaponslistprimaries();
            foreach (weap in var_509d86412c9d7426) {
                var_7cac4ff8e11f1bca = br_weapons::br_ammo_type_for_weapon(weap);
                if (isdefined(var_7cac4ff8e11f1bca) && var_a1093166de09e6b8 == var_7cac4ff8e11f1bca) {
                    if (getdvarint(@"hash_b5db5ff4b3f9e052", 0)) {
                        return 1;
                    }
                    var_8ee7478bb4789b1a = self.br_ammo[var_a1093166de09e6b8] < level.var_e6ea72fc5e3fcd00[var_a1093166de09e6b8];
                    if (getdvarint(@"hash_d116b9023292a13e", 1)) {
                        return (!namespace_aead94004cf4c147::function_49a39674c4a064e3(var_a1093166de09e6b8) || var_8ee7478bb4789b1a);
                    }
                    return var_8ee7478bb4789b1a;
                }
            }
            if (namespace_e50e624d9af51c8c::function_efab78b72d131d76(self)) {
                var_9ac5e72784815708 = namespace_e50e624d9af51c8c::function_2985254128b1c262(self);
                ammotype = br_weapons::br_ammo_type_for_weapon(var_9ac5e72784815708);
                if (isdefined(ammotype) && ammotype == var_a1093166de09e6b8) {
                    if (getdvarint(@"hash_b5db5ff4b3f9e052", 0)) {
                        return 1;
                    }
                    var_8ee7478bb4789b1a = self.br_ammo[var_a1093166de09e6b8] < level.var_e6ea72fc5e3fcd00[var_a1093166de09e6b8];
                    if (getdvarint(@"hash_d116b9023292a13e", 1)) {
                        return (!namespace_aead94004cf4c147::function_49a39674c4a064e3(var_a1093166de09e6b8) || var_8ee7478bb4789b1a);
                    }
                    return var_8ee7478bb4789b1a;
                }
            }
            return 0;
        } else {
            return 1;
        }
    }
    if (isplunder(var_a1093166de09e6b8)) {
        return 1;
    }
    if (function_5aa2768ce2289fe7(var_a1093166de09e6b8)) {
        return 1;
    }
    if (isweaponpickup(var_a1093166de09e6b8) && self function_b096b58fb3808d26()) {
        return 1;
    }
    if (namespace_a548bd428a566cf3::isarmorplate(var_a1093166de09e6b8)) {
        equipname = level.br_pickups.br_equipname[var_a1093166de09e6b8];
        slot = level.equipment.table[equipname].defaultslot;
        if (!isdefined(self.equipment[slot])) {
            return 1;
        }
        if (equipmentslothasroom(var_a1093166de09e6b8, slot)) {
            return 1;
        }
        if (getdvarint(@"hash_26fdfbd6bcbe5f42", 1) && namespace_e50e624d9af51c8c::isBackpackInventoryEnabled()) {
            if (level.var_66a7a8b388d5de9e != -1) {
                if (function_e52b0b5ab01dfa0c(var_a1093166de09e6b8, level.var_66a7a8b388d5de9e)) {
                    return 1;
                }
            } else {
                return 1;
            }
        }
        if (var_a1093166de09e6b8 == "br_armor_plate" && perk::_hasperk("specialty_fast_armor")) {
            if (isdefined(self.armorhealth) && self.armorhealth <= self.var_8790c077c95db752 - self.maxhealth) {
                return 1;
            }
        }
        return 0;
    }
    if (isGametypeItem(var_a1093166de09e6b8) && istrue(namespace_71073fa38f11492::isbrgametypefuncdefined("gametypeItemIsAutoPickup"))) {
        return namespace_71073fa38f11492::runbrgametypefunc("gametypeItemIsAutoPickup", var_a1093166de09e6b8, self);
    }
    if (function_b989edd9af4f42c7(var_a1093166de09e6b8) && !getdvarint(@"hash_752eeed3ddcbd04b", 0)) {
        equipname = level.br_pickups.br_equipname[var_a1093166de09e6b8];
        slot = level.equipment.table[equipname].defaultslot;
        return (pickupissameasequipmentslot(equipname, slot) && equipmentslothasroom(var_a1093166de09e6b8, slot));
    }
    if (function_d7c5786a0c42ef6c(var_a1093166de09e6b8) && !getdvarint(@"hash_752eeed3ddcbd04b", 0)) {
        equipname = level.br_pickups.br_equipname[var_a1093166de09e6b8];
        slot = level.equipment.table[equipname].defaultslot;
        return (pickupissameasequipmentslot(equipname, slot) && equipmentslothasroom(var_a1093166de09e6b8, slot));
    }
    if (getdvarint(@"hash_752eeed3ddcbd04b", 0)) {
        var_bb9e46e1d8130f2 = 0;
        if (function_b989edd9af4f42c7(var_a1093166de09e6b8)) {
            var_bb9e46e1d8130f2 = self function_6b75060e643e52e9() == 1;
        } else if (function_d7c5786a0c42ef6c(var_a1093166de09e6b8)) {
            var_bb9e46e1d8130f2 = self function_c0a39abe7ec43ad8() == 1;
        } else if (iskillstreak(var_a1093166de09e6b8)) {
            var_bb9e46e1d8130f2 = self function_3aa858d217fb4a1a() == 1;
        } else if (issuperpickup(var_a1093166de09e6b8)) {
            var_bb9e46e1d8130f2 = self function_fa1da77265660058() == 1;
        } else if (isrevivepickup(var_a1093166de09e6b8)) {
            var_bb9e46e1d8130f2 = self function_3feb119f85f6cd82() == 1;
        } else if (isgasmask(var_a1093166de09e6b8)) {
            var_bb9e46e1d8130f2 = self function_50b964d023c440e8() == 1;
        }
        return var_bb9e46e1d8130f2;
    }
    return 0;
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1bf07
// Size: 0x13
function function_4ebfdbfa1b8e0339(var_a1093166de09e6b8) {
    return var_a1093166de09e6b8 == "brloot_dead_agent_radio";
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1bf22
// Size: 0x37
function function_b1e944a2b3e15e9d(var_a1093166de09e6b8) {
    return isdefined(var_a1093166de09e6b8) && !issubstr(var_a1093166de09e6b8, "brloot_backpack_player") && var_a1093166de09e6b8 != "brloot_backpack" && issubstr(var_a1093166de09e6b8, "brloot_backpack");
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1bf61
// Size: 0x17
function function_36de08ea672b354c(var_a1093166de09e6b8) {
    return issubstr(var_a1093166de09e6b8, "brloot_perkpack");
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1bf80
// Size: 0x17
function function_9e686ab118ac7725(var_a1093166de09e6b8) {
    return issubstr(var_a1093166de09e6b8, "jup_exgm_force_recon_");
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1bf9f
// Size: 0x13
function function_5aa2768ce2289fe7(var_a1093166de09e6b8) {
    return var_a1093166de09e6b8 == "brloot_scavenger_bag";
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1bfba
// Size: 0x562
function function_6ff4fee4f07a3392() {
    self endon("disconnect");
    logstring("br_watch_mobile_cheat_pickups finished setup.");
    while (1) {
        var_2150015540242e9e = message = self waittill("luinotifyserver");
        if (message == "mobile_debug_give_killstreak") {
            killstreakref = undefined;
            switch (var_2150015540242e9e) {
            case 0:
                killstreakref = "toma_strike";
                break;
            case 1:
                killstreakref = "precision_airstrike";
                break;
            case 2:
                killstreakref = "uav";
                break;
            case 3:
                killstreakref = "manual_turret";
                break;
            case 4:
                killstreakref = "scrambler_drone_guard";
                break;
            case 5:
                killstreakref = "directional_uav";
                break;
            case 6:
                killstreakref = "assault_drone";
                break;
            case 7:
                killstreakref = "airdrop";
                break;
            case 8:
                killstreakref = "fuel_airstrike";
                break;
            case 9:
                killstreakref = "hover_jet";
                break;
            case 10:
                killstreakref = "airdrop_escort";
                break;
            case 11:
                killstreakref = "auto_drone";
                break;
            case 12:
                killstreakref = "chopper_gunner";
                break;
            case 13:
                killstreakref = "airdrop_multiple";
                break;
            case 14:
                killstreakref = "gunship";
                break;
            case 15:
                killstreakref = "juggernaut";
                break;
            case 16:
                killstreakref = "cruise_predator";
                break;
            case 17:
                killstreakref = "sentry_gun";
                break;
            case 18:
                killstreakref = "pac_sentry";
                break;
            }
            if (isdefined(killstreakref)) {
                forcegivekillstreak(killstreakref, 1, 0);
            }
        } else if (message == "mobile_debug_give_fieldupgrade") {
            var_d782e69ca6374ba6 = undefined;
            switch (var_2150015540242e9e) {
            case 0:
                var_d782e69ca6374ba6 = "super_tac_cover";
                break;
            case 1:
                var_d782e69ca6374ba6 = "super_trophy";
                break;
            case 2:
                var_d782e69ca6374ba6 = "super_deadsilence";
                break;
            case 3:
                var_d782e69ca6374ba6 = "super_support_box";
                break;
            case 4:
                var_d782e69ca6374ba6 = "super_ammo_drop";
                break;
            case 5:
                var_d782e69ca6374ba6 = "super_armor_drop";
                break;
            case 6:
                var_d782e69ca6374ba6 = "super_battlerage";
                break;
            }
            if (isdefined(var_d782e69ca6374ba6)) {
                forcegivesuper(var_d782e69ca6374ba6, 1, 0);
            }
        } else if (message == "mobile_debug_give_equipment") {
            equipmentref = undefined;
            switch (var_2150015540242e9e) {
            case 0:
                equipmentref = "brloot_offhand_frag";
                break;
            case 1:
                equipmentref = "brloot_offhand_atmine";
                break;
            case 2:
                equipmentref = "brloot_offhand_claymore";
                break;
            case 3:
                equipmentref = "brloot_offhand_molotov";
                break;
            case 4:
                equipmentref = "brloot_offhand_semtex";
                break;
            case 5:
                equipmentref = "brloot_offhand_thermite";
                break;
            case 6:
                equipmentref = "brloot_offhand_throwingknife";
                break;
            case 7:
                equipmentref = "brloot_offhand_throwingknife_fire";
                break;
            case 10:
                equipmentref = "brloot_health_adrenaline";
                break;
            case 11:
                equipmentref = "brloot_offhand_concussion";
                break;
            case 12:
                equipmentref = "brloot_offhand_decoy";
                break;
            case 13:
                equipmentref = "brloot_offhand_flash";
                break;
            case 14:
                equipmentref = "brloot_offhand_gas";
                break;
            case 15:
                equipmentref = "brloot_offhand_heartbeatsensor";
                break;
            case 16:
                equipmentref = "brloot_offhand_smoke";
                break;
            case 17:
                equipmentref = "brloot_offhand_snapshot";
                break;
            case 20:
                equipmentref = "brloot_armor_plate";
                break;
            case 21:
                equipmentref = "brloot_offhand_binoculars";
                break;
            case 22:
                equipmentref = "brloot_offhand_bunkerbuster";
                break;
            case 23:
                equipmentref = "brloot_offhand_shockstick";
                break;
            case 24:
                equipmentref = "brloot_offhand_c4";
                break;
            case 25:
                equipmentref = "brloot_offhand_butterfly_mine";
                break;
            }
            if (isdefined(equipmentref)) {
                br_forcegivecustompickupitem(self, equipmentref, 1);
            }
        } else if (message == "mobile_debug_give_br_items") {
            var_cb325ddb4a764623 = undefined;
            switch (var_2150015540242e9e) {
            case 0:
                var_cb325ddb4a764623 = "brloot_equip_gasmask";
                break;
            case 1:
                var_cb325ddb4a764623 = "brloot_equip_gasmask_durable";
                break;
            case 2:
                var_cb325ddb4a764623 = "brloot_self_revive";
                break;
            }
            if (isdefined(var_cb325ddb4a764623)) {
                br_forcegivecustompickupitem(self, var_cb325ddb4a764623, 1);
            }
        }
    }
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c523
// Size: 0x33c
function function_c8a5593cbb13f17c(pickup, weaponobj) {
    if (isplayerads() || getdvarint(@"hash_9fc90311ef111afd", 0) && player::isincombat()) {
        return 0;
    }
    var_fe4cd9dc9393409d = getdvarint(@"hash_ef63562e5f3b14d0", 0);
    currenttime = gettime();
    var_c8a5593cbb13f17c = !isdefined(self.var_e7f6950ddc75ef66) || currenttime - self.var_e7f6950ddc75ef66 > var_fe4cd9dc9393409d;
    if (var_c8a5593cbb13f17c && self function_113c9c35caf6f029()) {
        var_c8a5593cbb13f17c = function_2b4b373533156a88(pickup, weaponobj);
    }
    if (var_c8a5593cbb13f17c && self function_2ebb84ec61fcfaaf()) {
        var_c8a5593cbb13f17c = !function_aaffa8afa2d9c195(weaponobj);
    }
    if (var_c8a5593cbb13f17c) {
        if (self function_c3a5505bc8f25a14()) {
            var_f0e2a7d2c9e08d75 = self.primaryweapons.size;
            var_d05470192f5f4895 = 2 > var_f0e2a7d2c9e08d75;
            for (i = 0; !var_d05470192f5f4895 && i < self.primaryweapons.size; i++) {
                if (isnullweapon(self.primaryweapons[i]) || namespace_3bbb5a98b932c46f::isfistweapon(self.primaryweapons[i]) || !function_af4aefc234671c2f(i) && function_aaffa8afa2d9c195(self.primaryweapons[i])) {
                    var_f0e2a7d2c9e08d75--;
                    var_d05470192f5f4895 = 2 > var_f0e2a7d2c9e08d75;
                }
            }
            var_c8a5593cbb13f17c = var_d05470192f5f4895;
        } else if (self function_362521bcb3a1ba25()) {
            if (!isdefined(level.var_81369e82645391f0)) {
                function_f8b204e807cc62ed();
            }
            var_a6fb744f02d4ffb8 = level.var_81369e82645391f0[weaponclass(weaponobj.basename)];
            var_439466f5277ef2d9 = self function_337e400ead27b7bd(var_a6fb744f02d4ffb8);
            var_c8a5593cbb13f17c = 0;
            for (i = 0; i < self.primaryweapons.size; i++) {
                primaryweaponobj = self.primaryweapons[i];
                if (!isnullweapon(primaryweaponobj)) {
                    if (namespace_3bbb5a98b932c46f::isfistweapon(primaryweaponobj)) {
                        var_c8a5593cbb13f17c = 1;
                    } else {
                        var_83106f206ae5a450 = level.var_81369e82645391f0[weaponclass(primaryweaponobj.basename)];
                        if (var_a6fb744f02d4ffb8 == var_83106f206ae5a450) {
                            var_c8a5593cbb13f17c = 0;
                            break;
                        }
                        if (function_af4aefc234671c2f(i)) {
                            continue;
                        }
                        var_95f9039d76bf3af = self function_337e400ead27b7bd(var_83106f206ae5a450);
                        if (var_95f9039d76bf3af < var_439466f5277ef2d9) {
                            var_c8a5593cbb13f17c = 1;
                        }
                    }
                }
            }
        }
    }
    if (self function_5329138a845b7aa6()) {
        var_92fce7b1696254e3 = weapon::getweaponrootname(weaponobj);
        var_862e2d88178bc2c8 = 0;
        for (i = 0; !var_862e2d88178bc2c8 && i < self.primaryweapons.size; i++) {
            var_e9094c47c8dbe268 = weapon::getweaponrootname(self.primaryweapons[i]);
            if (var_e9094c47c8dbe268 == var_92fce7b1696254e3) {
                var_b68c8dfac38718ab = function_96b5a34cd1572d60(self.primaryweapons[i]);
                var_167e430a395b12ba = level.br_pickups.br_itemrarity[pickup.scriptablename];
                var_862e2d88178bc2c8 = var_b68c8dfac38718ab < var_167e430a395b12ba;
            }
        }
        var_c8a5593cbb13f17c = var_862e2d88178bc2c8;
    }
    return var_c8a5593cbb13f17c;
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c867
// Size: 0x66
function function_2b4b373533156a88(pickup, weapon) {
    ammotype = br_weapons::br_ammo_type_for_weapon(weapon);
    if (isdefined(ammotype)) {
        var_f68fc94bc895254 = br_weapons::function_88d62a65ff69eac(self, ammotype);
        return (var_f68fc94bc895254 > 0 || pickup.count > 0 || pickup.countlefthand > 0);
    }
    return 1;
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c8d5
// Size: 0xc7
function function_aaffa8afa2d9c195(weapon) {
    var_aaffa8afa2d9c195 = 0;
    if (isdefined(level.br_standard_loadout)) {
        if (!isdefined(level.var_ea84a0518343879c)) {
            function_e6cabc9f20dcbc23();
        }
        foreach (var_5c6fa156c22e63e3 in level.var_ea84a0518343879c) {
            var_aaffa8afa2d9c195 = issameweapon(weapon, var_5c6fa156c22e63e3);
            if (var_aaffa8afa2d9c195) {
                break;
            }
        }
    }
    if (!var_aaffa8afa2d9c195 && isdefined(self.gulag)) {
        if (!isdefined(level.var_f67907afe56c4f82)) {
            function_23a8498a6613de14();
        }
        var_aaffa8afa2d9c195 = function_2166628459c78e7a(weapon);
    }
    return var_aaffa8afa2d9c195;
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c9a4
// Size: 0x8b
function function_96b5a34cd1572d60(weaponobj) {
    var_1306ad638cedc772 = 0;
    var_878ab837c6fe40df = getcompleteweaponname(weaponobj);
    if (isdefined(level.br_pickups.br_weapontoscriptable[var_878ab837c6fe40df])) {
        var_c9c301a888170672 = level.br_pickups.br_weapontoscriptable[var_878ab837c6fe40df];
        var_1306ad638cedc772 = level.br_pickups.br_itemrarity[var_c9c301a888170672];
    } else if (br_weapons::isvalidcustomweapon(weaponobj)) {
        var_1306ad638cedc772 = 10;
    }
    return var_1306ad638cedc772;
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ca37
// Size: 0x33
function function_abd2865600352fcd() {
    self.var_c365befd3d253aef = [];
    for (i = 0; i < 2; i++) {
        self.var_c365befd3d253aef[i] = 0;
    }
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ca71
// Size: 0x54
function function_af4aefc234671c2f(var_e1d097c517c3af5b) {
    var_b295a598178d62a3 = 0;
    if (getdvarint(@"hash_218b826f84233424", 0)) {
        if (!isdefined(self.var_c365befd3d253aef)) {
            function_abd2865600352fcd();
        }
        var_b295a598178d62a3 = var_e1d097c517c3af5b < 2 && self.var_c365befd3d253aef[var_e1d097c517c3af5b];
    }
    return var_b295a598178d62a3;
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1cacd
// Size: 0x80
function function_5ef33bffaeda4fa9(weaponobj, blocked) {
    if (!isdefined(self.var_c365befd3d253aef)) {
        function_abd2865600352fcd();
    }
    weaponcount = min(2, self.primaryweapons.size);
    for (i = 0; i < weaponcount; i++) {
        if (issameweapon(self.primaryweapons[i], weaponobj)) {
            self.var_c365befd3d253aef[i] = blocked;
            break;
        }
    }
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1cb54
// Size: 0x1a1
function function_e98a5a4e0e001ac3(player, scriptablename, var_f9beeb3ed076a7a1) {
    var_e9cfd120b0b43ef = namespace_a548bd428a566cf3::function_692c3df266580df6(scriptablename);
    if (istrue(level.var_595938569c3fe806)) {
        player setplayerdata(level.var_5d69837cf4db0407, "dmzPlateCarrierLevel", var_e9cfd120b0b43ef);
    }
    if (istrue(level.var_7f3aafcf56c9ce14)) {
        function_6523c0535fdb1f1f(player, scriptablename);
        var_f24fbd36a9751174 = player function_f792ec0c5b3b6d45(scriptablename);
        if (isdefined(var_f24fbd36a9751174) && var_f24fbd36a9751174 > 0) {
            dropstruct = function_7b9f3966a7a42003();
            player namespace_cb965d2f71fefddc::dropbrequipment(dropstruct, 0, 1, "equip_armorplate", var_f24fbd36a9751174);
        }
        player namespace_f8d3520d3483c1::function_9c6e9a6643b6c9a6(0);
    }
    if (isdefined(scriptablename)) {
        namespace_b16531563568eaba::function_bd01c77ab46f790(player, loot::function_fae5e1d3de32d3f7(scriptablename));
    }
    player.var_4045f099f3da4bd = scriptablename;
    if (!istrue(var_f9beeb3ed076a7a1)) {
        player.var_bed158a6dfac230d = var_e9cfd120b0b43ef;
        player.var_8790c077c95db752 = player namespace_f8d3520d3483c1::function_829e435158d419cf() * 50;
        player notify("try_armor_cancel", "plate_carrier");
        if (!getdvarint(@"hash_43b4bf9a8ba6c500", 1)) {
            armor::setArmorHealth(player.var_8790c077c95db752);
        } else {
            armor::setArmorHealth(player.armorhealth);
            var_364d691b501cd27f = player armor::function_600f6cf462e983f();
            if (getdvarint(@"hash_e1ef460ef24e76e6", 0) && var_364d691b501cd27f < player namespace_f8d3520d3483c1::function_829e435158d419cf() && !istrue(player.var_c7fd13c53dbdc4f6)) {
                player armor::function_9c6e9a6643b6c9a6(player namespace_f8d3520d3483c1::function_829e435158d419cf() - var_364d691b501cd27f);
            }
        }
    }
    return var_e9cfd120b0b43ef;
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ccfd
// Size: 0x69
function function_6523c0535fdb1f1f(player, scriptablename) {
    var_a60ad4ec2ae61226 = function_77702c2321292aa3(scriptablename);
    var_f94b4beacf6b6b59 = function_77702c2321292aa3(player.var_4045f099f3da4bd);
    if (isdefined(var_f94b4beacf6b6b59) && perk::_hasperk(var_f94b4beacf6b6b59)) {
        player perk::removeperk(var_f94b4beacf6b6b59);
    }
    if (isdefined(var_a60ad4ec2ae61226)) {
        player perk::giveperk(var_a60ad4ec2ae61226);
    }
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1cd6d
// Size: 0x95
function function_77702c2321292aa3(scriptablename) {
    if (!isdefined(scriptablename)) {
        return undefined;
    }
    perkname = undefined;
    if (issubstr(scriptablename, "comms")) {
        perkname = "specialty_pc_comms";
    } else if (issubstr(scriptablename, "medic")) {
        perkname = "specialty_pc_medic";
    } else if (issubstr(scriptablename, "stealth")) {
        perkname = "specialty_pc_stealth";
    } else if (issubstr(scriptablename, "tempered")) {
        perkname = "specialty_pc_tempered";
    } else if (issubstr(scriptablename, "high_capacity")) {
        perkname = "specialty_pc_high_capacity";
    }
    return perkname;
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ce0a
// Size: 0x30
function function_a0877dfcb342653a(player) {
    if (istrue(level.var_595938569c3fe806)) {
        player setplayerdata(level.var_5d69837cf4db0407, "dmzPlateCarrierLevel", 1);
    }
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ce41
// Size: 0xd0
function function_f792ec0c5b3b6d45(scriptablename) {
    var_364d691b501cd27f = 0;
    foreach (weapon in self.equippedweapons) {
        basename = namespace_e0ee43ef2dddadaa::getweaponrootname(weapon.basename);
        if (basename == "armorplate") {
            var_364d691b501cd27f = self getweaponammoclip(weapon);
        }
    }
    var_a81adeb0e1f89320 = 3;
    if (isdefined(scriptablename)) {
        if (scriptablename == "brloot_plate_carrier_high_capacity") {
            var_a81adeb0e1f89320 = 8;
        }
    }
    var_f24fbd36a9751174 = undefined;
    if (var_364d691b501cd27f > var_a81adeb0e1f89320) {
        var_f24fbd36a9751174 = var_364d691b501cd27f - var_a81adeb0e1f89320;
    }
    return var_f24fbd36a9751174;
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1cf19
// Size: 0x188
function function_f77406a45e988898(equipname) {
    if (!isdefined(equipname)) {
        return "br_ammo";
    }
    switch (equipname) {
    case #"hash_4320d77f90725183":
        return "c4";
    case #"hash_2354208d9af64220":
        return "claymore";
    case #"hash_15d06a7d7efafe8":
        return "decoy";
    case #"hash_5a562592c930b7d6":
        return "flash";
    case #"hash_8c7819f0a3fbd1e0":
        return "frag";
    case #"hash_8770d1da0d7395b9":
        return "geiger";
    case #"hash_4b4a6458f00d9319":
        return "hb_sensor";
    case #"hash_b1c1a91eb12bd8e5":
        return "iodine_pills";
    case #"hash_142a787e36d7d7ce":
        return "molotov";
    case #"hash_8df9cfc147eb2d86":
        return "shockstick";
    case #"hash_fb6b649176cec75d":
        return "smoke";
    case #"hash_25ac81b822cf0c9f":
        return "stim";
    case #"hash_5fca4943a78ace9c":
        return "stun";
    case #"hash_de4641ddbc44a7ba":
        return "thermite";
    case #"hash_e156752cb79526e8":
        return "bunker_buster";
    case #"hash_4f62b5fa00ecd075":
        return "snapshot";
    case #"hash_3995658e01f4fac1":
        return "at_mine";
    case #"hash_f0907f858c134cb4":
        return "semtex";
    case #"hash_6d194c409057b2":
        return "binoculars";
    default:
        return "br_ammo";
        break;
    }
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d0a8
// Size: 0xd0
function function_990be1aa4ad3c9d4() {
    var_4ae930e26ecee422 = namespace_36f464722d326bbe::function_ba5574c7f287c587();
    var_7fbb956846df343e = namespace_36f464722d326bbe::isBRStyleGameType();
    if (var_7fbb956846df343e && !var_4ae930e26ecee422) {
        var_7483fc2cde6bc9f8 = self.var_bed158a6dfac230d == 2;
        var_2780dc47382969c4 = self.var_4045f099f3da4bd == "brloot_plate_carrier_3";
        if (var_7483fc2cde6bc9f8 || var_2780dc47382969c4) {
            return 0;
        }
        return 1;
    }
    if (isdefined(self.var_bed158a6dfac230d) && getdvarint(@"hash_62882304cc93ba77", 0) == 1 && self.var_bed158a6dfac230d == 2 || self.var_bed158a6dfac230d == 3 && getdvarint(@"hash_86dc98a10dfe9205", 1) == 1 && !var_4ae930e26ecee422) {
        return 1;
    }
    return 0;
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1d180
// Size: 0x56
function function_9035374e6d5f69db() {
    if (!isdefined(self.var_4045f099f3da4bd)) {
        return 1;
    }
    if (!isdefined(self.var_bed158a6dfac230d) || self.var_bed158a6dfac230d <= 1) {
        return 1;
    }
    return self.var_4045f099f3da4bd == "brloot_plate_carrier_2" || self.var_4045f099f3da4bd == "brloot_plate_carrier_3";
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d1de
// Size: 0x12
function function_82c2dc3d57d67f52() {
    return getdvarint(@"hash_8d79947a6199a378", 0);
}

// Namespace br_pickups/namespace_cb965d2f71fefddc
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1d1f8
// Size: 0x17
function function_d53595847895c537() {
    /#
        while (1) {
            wait(60);
            function_ff5569044925c628();
        }
    #/
}

