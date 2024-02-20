// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\engine\trace.gsc;
#using script_247745a526421ba7;
#using scripts\mp\loot.gsc;
#using scripts\mp\gametypes\br_weapons.gsc;
#using script_48614492ef09b23;
#using scripts\mp\utility\game.gsc;
#using scripts\engine\scriptable.gsc;
#using scripts\mp\hud_message.gsc;
#using scripts\mp\supers.gsc;
#using scripts\mp\gametypes\br.gsc;
#using script_2d9d24f7c63ac143;
#using script_6fc415ff6a905dc1;
#using script_600b944a95c3a7bf;
#using script_6a8ec730b2bfa844;
#using scripts\cp_mp\parachute.gsc;
#using scripts\mp\gametypes\br_pickups.gsc;
#using script_2669878cf5a1b6bc;
#using scripts\mp\equipment.gsc;
#using scripts\mp\gametypes\br_public.gsc;
#using script_74b851b7aa1ef32d;

#namespace namespace_2ece5c141ed0581e;

// Namespace namespace_2ece5c141ed0581e/namespace_eaf4e9860fe32d68
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4af
// Size: 0x67
function function_9b095d72f2911ec8() {
    game["dialog"]["plunder_extract_fail_fulton"] = "plunder_plunder_extract_fail_fulton";
    level._effect["vfx_fulton_explode"] = loadfx("vfx/iw8_br/gameplay/vfx_br_money_fulton_destr.vfx");
    namespace_17c25f0877bfb620::scriptable_addusedcallbackbypart("balloon_extract_use", &function_cf1b1f86951a9209);
    level.var_392f3323920e27f8 = getdvarint(@"hash_780b498909ad7b76", 4) - 1;
    level.var_3b87ef46ee857a23 = [];
}

// Namespace namespace_2ece5c141ed0581e/namespace_eaf4e9860fe32d68
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x51d
// Size: 0x12c
function function_231a038d18c51203(grenade) {
    self endon("death_or_disconnect");
    stuckto = grenade waittill("missile_stuck");
    if (isdefined(stuckto)) {
        function_f4dacbd721b7c845(grenade, stuckto);
        if (!isdefined(grenade.moving_platform)) {
            self playlocalsound("br_pickup_deny");
            namespace_44abc05161e2e2cb::showerrormessage("MP/EXTRACT_BALLOON_CANNOT_PLACE");
            if (isdefined(self.super)) {
                function_28c5995798975a53();
            }
            grenade delete();
            return;
        }
    }
    if (!function_7abaca741b57cec(grenade)) {
        self playlocalsound("br_pickup_deny");
        namespace_44abc05161e2e2cb::showerrormessage("MP/EXTRACT_BALLOON_BLOCKED");
        if (isdefined(self.super)) {
            function_28c5995798975a53();
        }
        grenade delete();
        return;
    } else if (1 && isdefined(self.var_3f4415b5819ab778)) {
        self playlocalsound("br_pickup_deny");
        namespace_44abc05161e2e2cb::showerrormessage("MP/EXTRACT_BALLOON_TOO_MANY");
        if (isdefined(self.super)) {
            function_28c5995798975a53();
        }
        grenade delete();
        return;
    }
    if (isdefined(self.super)) {
        namespace_85d036cb78063c4a::superusefinished(undefined, undefined, undefined, 1);
    }
    function_91bcbeaba08b3c76(grenade);
    if (isdefined(grenade)) {
        grenade delete();
    }
}

// Namespace namespace_2ece5c141ed0581e/namespace_eaf4e9860fe32d68
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x650
// Size: 0xc0
function function_91bcbeaba08b3c76(grenade) {
    var_3f4415b5819ab778 = spawn("script_model", grenade.origin);
    var_3f4415b5819ab778 setautoboxcalculationusingdobj(1);
    var_3f4415b5819ab778 setmodel("military_skyhook_far_mp_ballon_extract");
    var_3f4415b5819ab778.angles = grenade.angles * (0, 1, 0);
    var_3f4415b5819ab778.owner = self;
    var_3f4415b5819ab778.team = self.team;
    if (isdefined(grenade.moving_platform)) {
        var_3f4415b5819ab778.moving_platform = grenade.moving_platform;
    }
    self.var_3f4415b5819ab778 = var_3f4415b5819ab778;
    var_3f4415b5819ab778 function_5b3519ad8f058a26();
}

// Namespace namespace_2ece5c141ed0581e/namespace_eaf4e9860fe32d68
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x717
// Size: 0x5b
function function_5b3519ad8f058a26() {
    playsoundatpos(self.origin, "iw9_extraction_balloon_drop");
    thread namespace_d20f8ef223912e12::teamsplashbr("br_fulton_device_placed", self.owner, self.team);
    if (isdefined(self.moving_platform)) {
        self linkto(self.moving_platform);
    }
    thread function_9f3765a323f6212a();
}

// Namespace namespace_2ece5c141ed0581e/namespace_eaf4e9860fe32d68
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x779
// Size: 0x1bb
function function_9f3765a323f6212a() {
    level endon("game_ended");
    scriptable = self getlinkedscriptableinstance();
    scriptable.var_febe9aacdd2e47b2 = !getdvarint(@"hash_1d7f857b2cd9dba2", 0);
    self setscriptablepartstate("anims", "opening");
    self setscriptablepartstate("balloon_extract_use", "usable");
    var_c0bc9948aab59ac2 = [];
    foreach (player in level.players) {
        if (player.team == self.team) {
            var_c0bc9948aab59ac2[var_c0bc9948aab59ac2.size] = player;
            player namespace_44abc05161e2e2cb::showerrormessage("MP/BALLOON_EXTRACT_TIP");
        } else {
            scriptable disablescriptableplayeruse(player);
        }
    }
    wait(function_d55141fe77fa88e8());
    self setscriptablepartstate("anims", "open");
    thread function_26e3ede964cf78d9(var_c0bc9948aab59ac2);
    wait(30);
    self setscriptablepartstate("balloon_extract_use", "unusable");
    self setscriptablepartstate("effects", "neutral");
    foreach (player in scriptable.var_2bc73315bd31809c) {
        if (isalive(player)) {
            player setclientomnvar("loot_container_open", 0);
        }
    }
    self setscriptablepartstate("anims", "takeoff");
    wait(function_529acf4763e6abc7());
    scriptable function_8e5aab643e51aaf9();
    self notify("death");
    self delete();
}

// Namespace namespace_2ece5c141ed0581e/namespace_eaf4e9860fe32d68
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x93b
// Size: 0x305
function function_8e5aab643e51aaf9() {
    foreach (player in self.var_2bc73315bd31809c) {
        if (!isdefined(self.var_556db0b72a96514e)) {
            continue;
        }
        /#
            println(player getplayerdata(level.var_5d69837cf4db0407, "lootID") + "Invalid quick drop item type: ");
        #/
        /#
            println(player.name + "<unknown string>");
        #/
        player namespace_aead94004cf4c147::function_f1f10297297d06c8();
        var_e1cf43f3ae9d77e7 = function_9e02f22decaaaf1f(self.var_556db0b72a96514e[player.guid].contents);
        var_bbac576aade31a1e = player namespace_512200f0f9e6ebc9::function_e2f4f470c55123b8(var_e1cf43f3ae9d77e7, 1);
        /#
            println(player getplayerdata(level.var_5d69837cf4db0407, "lootID") + "<unknown string>");
        #/
        foreach (item in self.var_556db0b72a96514e[player.guid].contents) {
            ref = namespace_38b993c4618e76cd::function_793e8a72cedb8ef3(item["lootID"]);
            var_25978461c6e4f61b = level.br_pickups.var_838863c4848d4c26[ref];
            itemtype = undefined;
            if (isdefined(var_25978461c6e4f61b)) {
                itemtype = level.br_pickups.br_itemtype[var_25978461c6e4f61b];
            }
            if (isdefined(itemtype) && (itemtype == #"hash_c583d0faabb7fa37" || itemtype == #"dogtag")) {
                continue;
            }
            player namespace_512200f0f9e6ebc9::function_c324d060cde743e3(item["lootID"], item["quantity"]);
        }
        var_98f7ce981bb1f93c = player namespace_3f0ea7483345a2c0::function_d6a3266145bab76d("loot_container_weapon");
        if (istrue(var_98f7ce981bb1f93c)) {
            player namespace_512200f0f9e6ebc9::function_c324d060cde743e3(var_98f7ce981bb1f93c, 1);
        }
        /#
            println(player.name + "<unknown string>");
        #/
        player namespace_aead94004cf4c147::function_f1f10297297d06c8();
        var_68c58fc50db46dc6 = player getplayerdata(level.var_5d69837cf4db0407, "dmzBankedCash");
        player setplayerdata(level.var_5d69837cf4db0407, "dmzBankedCash", var_68c58fc50db46dc6 + var_bbac576aade31a1e);
        weaponitem = undefined;
        if (istrue(var_98f7ce981bb1f93c)) {
            weaponitem = spawnstruct();
            weaponitem.lootid = var_98f7ce981bb1f93c;
            weaponitem.quantity = 1;
            var_e1cf43f3ae9d77e7[var_e1cf43f3ae9d77e7.size] = weaponitem;
        }
        namespace_8361bad7391de074::function_b0537ee3a491b4dd(player, var_e1cf43f3ae9d77e7, var_bbac576aade31a1e);
        if (!istrue(self.var_febe9aacdd2e47b2)) {
            player setclientomnvar("loot_container_weapon", 0);
        }
        player.var_3eedb8574bae470a = undefined;
    }
}

// Namespace namespace_2ece5c141ed0581e/namespace_eaf4e9860fe32d68
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc47
// Size: 0x13
function function_d55141fe77fa88e8() {
    return [[ level.var_74320167a9d0ecac ]]("wm_skyhook_ground_open");
}

// Namespace namespace_2ece5c141ed0581e/namespace_eaf4e9860fe32d68
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc62
// Size: 0x13
function function_529acf4763e6abc7() {
    return [[ level.var_74320167a9d0ecac ]]("wm_skyhook_ground_takeoff");
}

// Namespace namespace_2ece5c141ed0581e/namespace_eaf4e9860fe32d68
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc7d
// Size: 0x9b
function function_f4dacbd721b7c845(grenade, stuckto) {
    if (isdefined(stuckto.linked_brush)) {
        if (isdefined(stuckto.linked_brush.targetname)) {
            if (stuckto.linked_brush.targetname == "train_wz") {
                grenade.moving_platform = stuckto;
            }
        }
    } else if (isdefined(stuckto.targetname) && stuckto.targetname == "train_wz") {
        grenade.moving_platform = stuckto;
    }
}

// Namespace namespace_2ece5c141ed0581e/namespace_eaf4e9860fe32d68
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd1f
// Size: 0x75
function function_28c5995798975a53() {
    self setweaponammoclip(self.super.staticdata.weapon, 1);
    self notify("super_use_finished_lb");
    self notify("super_use_finished");
    var_19163e14365d9264 = namespace_85d036cb78063c4a::getcurrentsuper();
    namespace_85d036cb78063c4a::setsuperisinuse(0);
    namespace_85d036cb78063c4a::setsuperexpended(0);
    var_19163e14365d9264.wasrefunded = 1;
    namespace_85d036cb78063c4a::setsuperbasepoints(namespace_85d036cb78063c4a::getsuperpointsneeded());
}

// Namespace namespace_2ece5c141ed0581e/namespace_eaf4e9860fe32d68
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd9b
// Size: 0xb1
function function_7abaca741b57cec(grenade) {
    var_57f6e7d1be00d5f9 = 25;
    planeflyheight = namespace_5078ee98abb32db9::getc130height();
    start = grenade.origin + (0, 0, var_57f6e7d1be00d5f9 + 1);
    end = (grenade.origin[0], grenade.origin[1], planeflyheight);
    contents = create_contents(0, 1, 1, 1, 1, 1, 0);
    var_e96577032a7740fc = sphere_trace(start, end, var_57f6e7d1be00d5f9, grenade, contents);
    return var_e96577032a7740fc["fraction"] == 1;
}

// Namespace namespace_2ece5c141ed0581e/namespace_eaf4e9860fe32d68
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe54
// Size: 0xa6
function function_9e02f22decaaaf1f(contents) {
    var_1c1dd30a3c77139c = [];
    foreach (key, item in contents) {
        var_1c1dd30a3c77139c[key] = spawnstruct();
        var_1c1dd30a3c77139c[key].lootid = item["lootID"];
        var_1c1dd30a3c77139c[key].quantity = item["quantity"];
        var_1c1dd30a3c77139c[key].index = item["index"];
    }
    return var_1c1dd30a3c77139c;
}

// Namespace namespace_2ece5c141ed0581e/namespace_eaf4e9860fe32d68
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xf02
// Size: 0x304
function function_cbca59c109ae17af(itemtype, itemindex) {
    switch (itemtype) {
    case 0:
        return [0:8395, 1:5];
    case 1:
        if (itemindex == 2) {
            if (!namespace_aead94004cf4c147::function_efab78b72d131d76(self)) {
                return [0:0, 1:0, 2:undefined];
            }
            lootid = self getplayerdata(level.var_5d69837cf4db0407, "dmzWeapon", "lootItemID");
            var_ec22a950f210e39 = namespace_aead94004cf4c147::function_2985254128b1c262(self);
            return [0:lootid, 1:1, 2:var_ec22a950f210e39];
        }
        var_ec22a950f210e39 = namespace_cb965d2f71fefddc::function_13ecf3644442a3e7(self, itemindex);
        if (!isdefined(var_ec22a950f210e39)) {
            return [0:0, 1:0, 2:undefined];
        }
        rootname = namespace_e0ee43ef2dddadaa::getweaponrootname(var_ec22a950f210e39);
        variantid = var_ec22a950f210e39.variantid;
        if (!isdefined(var_ec22a950f210e39.variantid)) {
            variantid = 0;
        }
        lootid = namespace_e0ee43ef2dddadaa::function_79d6e6c22245687a(rootname, variantid);
        return [0:lootid, 1:1, 2:var_ec22a950f210e39];
    case 10:
        lootid = namespace_aead94004cf4c147::function_6196d9ea9a30e609(itemindex);
        quantity = 1;
        if (namespace_cb965d2f71fefddc::function_d345eec68e01361f(lootid)) {
            quantity = namespace_aead94004cf4c147::function_897b29adb37f06a7(itemindex);
        }
        return [0:lootid, 1:quantity];
    case 2:
        slot = namespace_1a507865f681850e::function_4967838290cb31b9(itemindex);
        if (!isdefined(self.equipment[slot])) {
            return [0:0, 1:0];
        }
        var_feb782334dd23a66 = array_find(level.br_pickups.br_equipname, self.equipment[slot]);
        lootid = namespace_38b993c4618e76cd::function_fae5e1d3de32d3f7(var_feb782334dd23a66);
        return [0:lootid, 1:1];
    case 3:
        if (!isdefined(self.streakdata.streaks[1])) {
            return [0:0, 1:0];
        }
        scriptable = level.br_pickups.var_838863c4848d4c26[self.streakdata.streaks[1].streakname];
        lootid = namespace_38b993c4618e76cd::function_fae5e1d3de32d3f7(scriptable);
        return [0:lootid, 1:1];
    case 4:
        if (!isdefined(self.equipment["super"])) {
            return [0:0, 1:0];
        }
        var_feb782334dd23a66 = array_find(level.br_pickups.br_equipname, self.equipment["super"]);
        lootid = namespace_38b993c4618e76cd::function_fae5e1d3de32d3f7(var_feb782334dd23a66);
        return [0:lootid, 1:1];
    default:
        /#
            assertmsg("Invalid quick drop item type: " + itemtype);
        #/
        return;
    }
}

// Namespace namespace_2ece5c141ed0581e/namespace_eaf4e9860fe32d68
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x120d
// Size: 0x171
function function_26e3ede964cf78d9(players) {
    if (players.size <= 0) {
        level notify("balloon_extract_takeoff");
        return;
    }
    if (!isdefined(level.var_3b87ef46ee857a23)) {
        level.var_3b87ef46ee857a23 = [];
    }
    if (isdefined(level.var_3b87ef46ee857a23[self.team])) {
        level.var_3b87ef46ee857a23[self.team] notify("balloon_extract_countdown_started");
    }
    level.var_3b87ef46ee857a23[self.team] = self;
    self endon("balloon_extract_countdown_started");
    level endon("game_ended");
    currenttime = gettime();
    endtime = currenttime + 30 * 1000;
    while (currenttime < endtime) {
        if (gettime() - currenttime >= 1000) {
            var_44c653d588db89a7 = int(max(0, (endtime - gettime()) / 1000));
            foreach (player in players) {
                if (isdefined(player) && isalive(player) && !player namespace_d3d40f75bb4e4c32::isplayeringulag()) {
                    player namespace_44abc05161e2e2cb::showerrormessage("MP/BALLOON_EXTRACT_LEAVING_IN", var_44c653d588db89a7);
                }
            }
            currenttime = gettime();
        }
        wait(0.05);
    }
    level.var_3b87ef46ee857a23[self.team] = undefined;
}

// Namespace namespace_2ece5c141ed0581e/namespace_eaf4e9860fe32d68
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1385
// Size: 0x60
function function_6de1128240216723(itemtype, lootid) {
    if (itemtype == 1) {
        return 1;
    }
    scriptablename = namespace_38b993c4618e76cd::getScriptableFromLootID(lootid);
    if (scriptablename == "brloot_durable_loot" || isdefined(level.var_a98214b4bdc952cd) && array_contains(level.var_a98214b4bdc952cd, scriptablename)) {
        return 1;
    }
    return 0;
}

// Namespace namespace_2ece5c141ed0581e/namespace_eaf4e9860fe32d68
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x13ed
// Size: 0xa2
function function_f71f8470e2fb527c(player) {
    var_ccc0df5641a7616b = namespace_aead94004cf4c147::function_b13e35608b336d65(player);
    var_bb778d2be7708cfc = 0;
    for (i = 0; i < var_ccc0df5641a7616b; i++) {
        var_f1cbc68c79ebf1ea = player namespace_aead94004cf4c147::function_6196d9ea9a30e609(i);
        if (!isdefined(var_f1cbc68c79ebf1ea)) {
            continue;
        }
        var_a1093166de09e6b8 = namespace_aead94004cf4c147::function_91c1be871300a518(var_f1cbc68c79ebf1ea);
        if (!isdefined(var_a1093166de09e6b8)) {
            continue;
        }
        if (var_a1093166de09e6b8 == "brloot_durable_loot") {
            player function_f184ae16fb9720f3(i);
            var_bb778d2be7708cfc = 1;
            return;
        }
    }
    if (var_bb778d2be7708cfc) {
        player namespace_a850435086c88de3::function_693d12aa2c1c02c5(1, "extractionBalloonDeposit");
    }
}

// Namespace namespace_2ece5c141ed0581e/namespace_eaf4e9860fe32d68
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1496
// Size: 0x24
function function_f184ae16fb9720f3(var_93c2531abecb92e3) {
    thread namespace_aead94004cf4c147::function_db1dd76061352e5b(var_93c2531abecb92e3, 1);
    thread namespace_44abc05161e2e2cb::showsplash("br_durable_loot_item_extracted");
}

