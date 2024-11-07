#using scripts\engine\sp\utility.gsc;
#using scripts\sp\utility.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\sp\hud_util.gsc;
#using scripts\sp\equipment\offhands.gsc;
#using scripts\sp\player\cursor_hint.gsc;
#using scripts\sp\loot.gsc;
#using scripts\sp\analytics.gsc;
#using scripts\sp\player.gsc;

#namespace offhand_box;

// Namespace offhand_box / scripts\sp\player\offhand_box
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2a4
// Size: 0x9f
function offhand_box_setup() {
    flag_wait("load_finished");
    level.offhand_boxes = getentarray("offhand_box", "targetname");
    if (!istrue(1)) {
        if (isdefined(level.offhand_boxes)) {
            foreach (offhand_box in level.offhand_boxes) {
                offhand_box delete();
            }
        }
        return;
    }
    array_thread(level.offhand_boxes, &offhand_box_think);
}

// Namespace offhand_box / scripts\sp\player\offhand_box
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x34b
// Size: 0x151
function offhand_box_think() {
    if (isdefined(self.target)) {
        self.item_pos_array = getstructarray(self.target, "targetname");
    } else {
        self.item_pos_array = [];
    }
    self.item_count = self.item_pos_array.size;
    if (isdefined(self.script_count)) {
        if (self.script_count == -1) {
            self.infinite = 1;
        } else {
            self.item_count = min(self.item_count, self.script_count);
        }
    } else if (isdefined(self.script_count_min) && isdefined(self.script_count_max)) {
        self.item_count = min(self.item_count, randomintrange(self.script_count_min, self.script_count_max));
    }
    if (isfloat(self.item_count)) {
        self.item_count = int(self.item_count);
    }
    self.item_models = [];
    thread update_offhand_box_item_models();
    if (!isdefined(self.script_noteworthy)) {
        thread function_863bc5d68813ee8a(360);
        return;
    }
    self.item_type = self.script_noteworthy;
    thread function_250357933f00dc3();
}

// Namespace offhand_box / scripts\sp\player\offhand_box
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x4a4
// Size: 0x6b9
function private function_250357933f00dc3() {
    self endon("death");
    self endon("entitydeleted");
    assert(isdefined(self.item_type));
    var_be70ec4b1b689444 = undefined;
    if (self.item_type != "ammo" && self.item_type != "armor_plates") {
        var_e11f16e2d66fc7d0 = scripts\sp\loot::getoffhandweaponname(self.item_type);
        assert(scripts\sp\equipment\offhands::offhandisprecached(var_e11f16e2d66fc7d0));
        var_be70ec4b1b689444 = getweaponoffhandtype(var_e11f16e2d66fc7d0);
    }
    self notify("update_models");
    while (true) {
        result = waittill_offhand_box_accessed();
        if (isdefined(result)) {
            if (result == "offhand_loot_change") {
                if (isdefined(self.interact)) {
                    self.interact remove_cursor_hint();
                }
                waitframe();
                continue;
            }
            if (result == "offhand_box_update") {
                if (isdefined(self.interact)) {
                    self.interact remove_cursor_hint();
                }
                foreach (var_81901e47ba7d056c in self.item_models) {
                    var_81901e47ba7d056c delete();
                }
                waitframe();
                self notify("update_models");
                continue;
            }
            if (function_a4482d0d3055db9a()) {
                scripts\sp\analytics::analytics_event_upload("offhand_box", self.item_type);
                if (self.item_type == "ammo") {
                    weapons = level.player getweaponslistprimaries();
                    var_ec7d122be30d4834 = 0;
                    foreach (weapon in weapons) {
                        oldammocount = level.player getammocount(weapon);
                        level.player givemaxammo(weapon);
                        var_d5097f6b628af96e = level.player getammocount(weapon);
                        if (oldammocount != var_d5097f6b628af96e) {
                            var_ec7d122be30d4834 = 1;
                        }
                    }
                    if (var_ec7d122be30d4834 && !istrue(self.infinite)) {
                        self.item_count = 0;
                    } else {
                        waitframe();
                        continue;
                    }
                } else if (self.item_type == "armor_plates") {
                    var_2c969f7f11c3c8b9 = level.player scripts\sp\player::function_85e373bb15921966();
                    var_b292f33e2fd2bdbd = level.player scripts\sp\player::function_c241aeec324282f0();
                    var_75e244e5f45c894d = var_b292f33e2fd2bdbd - var_2c969f7f11c3c8b9;
                    var_b46066922139e5c2 = self.item_count;
                    var_75e244e5f45c894d = int(min(var_b46066922139e5c2, var_75e244e5f45c894d));
                    var_a1153d5fc785fbe1 = var_2c969f7f11c3c8b9 + var_75e244e5f45c894d;
                    level.player scripts\sp\player::function_e9e42cffedaa98d5(var_a1153d5fc785fbe1);
                    self.item_count = var_b46066922139e5c2 - var_75e244e5f45c894d;
                } else if (issharedfuncdefined("offhandBox", "_onUse", 0)) {
                    level.player [[ getsharedfunc("offhandBox", "_onUse") ]](self);
                } else {
                    var_e11f16e2d66fc7d0 = scripts\sp\loot::getoffhandweaponname(self.item_type);
                    if (level.player scripts\sp\loot::has_weapon(var_e11f16e2d66fc7d0)) {
                        lootname = self.item_type;
                        var_de8a9ead75a0581 = scripts\sp\loot::function_edf54aa6c57adb98(lootname);
                        max_ammo = scripts\sp\loot::function_57888d406854dc7f(lootname);
                        var_c53e6106621b2d49 = max_ammo - var_de8a9ead75a0581;
                        if (var_c53e6106621b2d49 > self.item_count) {
                            var_c53e6106621b2d49 = self.item_count;
                        }
                        var_b817bc71159038c7 = undefined;
                        foreach (offhand in level.player.offhandinventory) {
                            if (offhand.basename == var_e11f16e2d66fc7d0) {
                                var_b817bc71159038c7 = offhand;
                                break;
                            }
                        }
                        assert(isdefined(var_b817bc71159038c7));
                        level.player setweaponammoclip(var_b817bc71159038c7, var_de8a9ead75a0581 + var_c53e6106621b2d49);
                        self.item_count -= var_c53e6106621b2d49;
                        thread scripts\sp\loot::createnotification(lootname);
                    } else {
                        var_2ad7f6bad1161371 = function_105e215e72df8f98(var_be70ec4b1b689444);
                        var_de8a9ead75a0581 = 0;
                        var_3e77e279a9f4de1e = undefined;
                        if (var_2ad7f6bad1161371 != "none") {
                            var_3e77e279a9f4de1e = scripts\sp\loot::function_3fd5749f637651b7(var_2ad7f6bad1161371);
                            if (!isdefined(var_3e77e279a9f4de1e)) {
                                var_de8a9ead75a0581 = 0;
                            } else {
                                var_de8a9ead75a0581 = scripts\sp\loot::function_edf54aa6c57adb98(var_3e77e279a9f4de1e);
                            }
                            level.player take_player_offhand_by_name(var_2ad7f6bad1161371);
                        }
                        lootname = self.item_type;
                        max_ammo = scripts\sp\loot::function_57888d406854dc7f(lootname);
                        if (isdefined(var_3e77e279a9f4de1e) && var_3e77e279a9f4de1e != lootname) {
                            var_c53e6106621b2d49 = self.item_count;
                        } else {
                            var_c53e6106621b2d49 = max_ammo - var_de8a9ead75a0581;
                        }
                        if (var_c53e6106621b2d49 > self.item_count) {
                            var_c53e6106621b2d49 = self.item_count;
                        }
                        level.player give_offhand(var_e11f16e2d66fc7d0, var_c53e6106621b2d49);
                        if (var_2ad7f6bad1161371 != "none") {
                            self.item_count = var_de8a9ead75a0581;
                            self.item_type = var_3e77e279a9f4de1e;
                            thread update_global_offhand_boxes();
                        } else {
                            self.item_count -= var_c53e6106621b2d49;
                        }
                        thread scripts\sp\loot::createnotification(lootname);
                    }
                }
                delaycall(0.2, &playsound, "loot_pickup_offhand");
            } else {
                waitframe();
            }
            self notify("update_models");
            level.player notify("update_models");
            if (isdefined(self.interact)) {
                self.interact remove_cursor_hint();
            }
            level notify("offhand_box_used");
            self notify("offhand_box_used");
            level.player player_gesture_force("iw9_ges_pickup");
            wait 0.3;
            if (self.item_count == 0 && !istrue(self.infinite)) {
                self notify("offhand_box_kill");
                hudoutline_disable();
                waitframe();
                if (isdefined(self.item_models)) {
                    foreach (var_81901e47ba7d056c in self.item_models) {
                        if (isdefined(var_81901e47ba7d056c)) {
                            var_81901e47ba7d056c delete();
                        }
                    }
                }
                self notify("update_models");
                return;
            }
            wait 1.75;
        } else {
            waitframe();
        }
        self notify("update_models");
    }
}

// Namespace offhand_box / scripts\sp\player\offhand_box
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xb65
// Size: 0xed
function private function_863bc5d68813ee8a(radius) {
    self endon("death");
    self endon("entitydeleted");
    radiussq = squared(radius);
    while (isdefined(self)) {
        wait randomfloatrange(0.5, 1);
        if (!isdefined(self)) {
            return;
        }
        foreach (player in level.players) {
            if (distancesquared(player.origin, self.origin) < radiussq) {
                spawnpool = scripts\sp\loot::function_bea35dd59e0df4ac("Offhand", "frag");
                if (spawnpool.size > 0) {
                    self.item_type = spawnpool[randomintrange(0, spawnpool.size)];
                    thread function_250357933f00dc3();
                }
                return;
            }
        }
    }
}

// Namespace offhand_box / scripts\sp\player\offhand_box
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc5a
// Size: 0x64
function function_a4482d0d3055db9a() {
    if (self.item_type == "ammo") {
        return true;
    }
    if (self.item_type == "armor_plates" && utility::playerarmorenabled()) {
        return true;
    }
    weaponname = scripts\sp\loot::getoffhandweaponname(self.item_type);
    if (isdefined(weaponname) && scripts\sp\equipment\offhands::offhandisprecached(weaponname)) {
        return true;
    }
    return false;
}

// Namespace offhand_box / scripts\sp\player\offhand_box
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xcc7
// Size: 0x4a
function private function_d5eecb716a502c5f(lootitem) {
    player = level.player;
    var_e11f16e2d66fc7d0 = scripts\sp\loot::getoffhandweaponname(lootitem.item_type);
    if (isdefined(var_e11f16e2d66fc7d0)) {
        return player scripts\sp\loot::has_weapon(var_e11f16e2d66fc7d0);
    }
    return 0;
}

// Namespace offhand_box / scripts\sp\player\offhand_box
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd1a
// Size: 0x288
function waittill_offhand_box_accessed() {
    result = undefined;
    if (self.item_type == "ammo") {
        var_3f09b9a4149cc197 = 1;
    } else if (self.item_type == "armor_plates") {
        var_3f09b9a4149cc197 = utility::playerarmorenabled() && level.player scripts\sp\player::function_c241aeec324282f0() != level.player scripts\sp\player::function_85e373bb15921966();
    } else {
        var_3f09b9a4149cc197 = 0;
        if (issharedfuncdefined("offhandBox", "_allowUse", 0)) {
            var_3f09b9a4149cc197 = level.player [[ getsharedfunc("offhandBox", "_allowUse") ]](self);
        } else {
            var_3f09b9a4149cc197 = !function_d5eecb716a502c5f(self) || scripts\sp\loot::function_edf54aa6c57adb98(self.item_type) < scripts\sp\loot::function_57888d406854dc7f(self.item_type);
        }
    }
    if (var_3f09b9a4149cc197) {
        var_9c85d90245c105ba = 256;
        if (isdefined(self.radius)) {
            var_9c85d90245c105ba = int(self.radius);
        }
        var_b4f2e5026eb0a11f = get_offhand_item_pickup_hint(self.item_type == "ammo" || function_d5eecb716a502c5f(self));
        var_828f4d4b39d42b57 = (0, 0, 10);
        var_86f1a7d124dc2a6d = 35;
        if (self.item_type == "ammo") {
            var_828f4d4b39d42b57 = (0, 0, 12);
        }
        if (self.model == "un_military_backpack_open_01") {
            var_828f4d4b39d42b57 = (10, 7, 10);
        } else if (self.model == "un_military_storage_container_small_open_01") {
            var_828f4d4b39d42b57 = (12, 7, 17);
        } else if (self.model == "un_military_storage_container_02_open") {
            var_828f4d4b39d42b57 = (14, 8, 25);
        }
        self.interact = spawn_tag_origin(self gettagorigin("tag_origin"));
        self.interact linkto(self, "tag_origin");
        self.interact create_cursor_hint("tag_origin", var_828f4d4b39d42b57, var_b4f2e5026eb0a11f, var_86f1a7d124dc2a6d, var_9c85d90245c105ba, 90, 0, undefined, undefined, self.icon, "duration_none", undefined, undefined, 30);
        self.interact notsolid();
        result = level.player waittill_any_ents_return(self.interact, "trigger", self.interact, "offhand_box_update", level.player, "offhand_loot_change");
    }
    return result;
}

// Namespace offhand_box / scripts\sp\player\offhand_box
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xfab
// Size: 0xa9
function function_dce9c4c9d68ad200() {
    if (istrue(self.var_2a055f031d3ee403)) {
        return;
    }
    foreach (model in self.item_models) {
        if (model != "lm_loot_wm_armor_plate_iw9_carbon_fiber" && model != "empty_model") {
            return;
        }
        if (model == "lm_loot_wm_armor_plate_iw9_carbon_fiber") {
            model.angles += (0, 90, 0);
        }
    }
    self.var_2a055f031d3ee403 = 1;
}

// Namespace offhand_box / scripts\sp\player\offhand_box
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x105c
// Size: 0x228
function update_offhand_box_item_models() {
    self endon("death");
    self endon("entitydeleted");
    self endon("offhand_box_kill");
    while (true) {
        self.item_models = array_removeundefined(self.item_models);
        var_dd53030b256aa23b = get_offhand_item_model();
        function_dce9c4c9d68ad200();
        while (self.item_models.size != self.item_count) {
            if (self.item_count > self.item_models.size) {
                var_8acc266afda40d29 = get_offhand_box_item_slot_struct();
                model = spawn("script_model", var_8acc266afda40d29.origin);
                if (!istrue(self.var_2a055f031d3ee403)) {
                    model.angles = var_8acc266afda40d29.angles;
                }
                var_8acc266afda40d29.item = model;
                model setmodel(var_dd53030b256aa23b);
                self.item_models[self.item_models.size] = model;
            } else if (isdefined(self.item_models[0])) {
                foreach (var_d7b44cb498fdacdb in self.item_pos_array) {
                    if (isdefined(var_d7b44cb498fdacdb.item) && var_d7b44cb498fdacdb.item == self.item_models[0]) {
                        var_d7b44cb498fdacdb.item = undefined;
                    }
                }
                self.item_models[0] delete();
            }
            self.item_models = array_removeundefined(self.item_models);
        }
        foreach (var_81901e47ba7d056c in self.item_models) {
            if (var_81901e47ba7d056c.model != var_dd53030b256aa23b) {
                var_81901e47ba7d056c setmodel(var_dd53030b256aa23b);
            }
        }
        self waittill("update_models");
    }
}

// Namespace offhand_box / scripts\sp\player\offhand_box
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x128c
// Size: 0x63
function get_offhand_box_item_slot_struct() {
    foreach (var_d7b44cb498fdacdb in self.item_pos_array) {
        if (isdefined(var_d7b44cb498fdacdb) && !isdefined(var_d7b44cb498fdacdb.item)) {
            return var_d7b44cb498fdacdb;
        }
    }
    return undefined;
}

// Namespace offhand_box / scripts\sp\player\offhand_box
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x12f8
// Size: 0xf9
function get_offhand_item_pickup_hint(var_7d101a473fc7e1f4) {
    var_b4f2e5026eb0a11f = "Pickup";
    var_b4f2e5026eb0a11f = %EQUIPMENT/IMPROVISED_MINE_PICKUP;
    self.icon = undefined;
    if (!isdefined(var_7d101a473fc7e1f4)) {
        var_7d101a473fc7e1f4 = 0;
    }
    if (!var_7d101a473fc7e1f4) {
        var_7d101a473fc7e1f4 = level.player getoffhandprimaryclass() == "none";
    }
    if (isdefined(level.loot.types[self.item_type])) {
        loot = level.loot.types[self.item_type];
        if (isdefined(loot.var_900d6f1e847c0657)) {
            var_b4f2e5026eb0a11f = loot.var_900d6f1e847c0657;
        }
        self.icon = loot.shader;
        if (isdefined(loot.var_38822c6b743bb385) && !var_7d101a473fc7e1f4 && isdefined(loot.var_3204fabacb4e47bf)) {
            var_b4f2e5026eb0a11f = loot.var_3204fabacb4e47bf;
        }
    }
    return var_b4f2e5026eb0a11f;
}

// Namespace offhand_box / scripts\sp\player\offhand_box
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x13fa
// Size: 0x86
function get_offhand_item_model() {
    var_81901e47ba7d056c = "empty_model";
    if (isdefined(self.item_type) && isdefined(level.loot.types[self.item_type])) {
        loot = level.loot.types[self.item_type];
        if (isdefined(loot.model)) {
            var_81901e47ba7d056c = loot.model;
        }
    }
    return var_81901e47ba7d056c;
}

// Namespace offhand_box / scripts\sp\player\offhand_box
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1489
// Size: 0x8d
function update_global_offhand_boxes() {
    foreach (offhand_box in level.offhand_boxes) {
        if (isdefined(offhand_box.interact)) {
            offhand_box.interact notify("offhand_box_update");
        }
        if (isdefined(offhand_box.pickup_trig)) {
            offhand_box.pickup_trig notify("offhand_box_update");
        }
    }
}

// Namespace offhand_box / scripts\sp\player\offhand_box
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x151e
// Size: 0x83
function function_105e215e72df8f98(var_be70ec4b1b689444) {
    foreach (offhand in level.player.offhandinventory) {
        if (level.player getoffhandslot(offhand) == var_be70ec4b1b689444) {
            return offhand.basename;
        }
    }
    return "none";
}

// Namespace offhand_box / scripts\sp\player\offhand_box
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x15aa
// Size: 0x2e
function take_player_offhand_by_name(weapon_name) {
    var_9798f1fbce8c381e = get_player_offhand_weapon(weapon_name);
    level.player take_offhand(var_9798f1fbce8c381e);
}

// Namespace offhand_box / scripts\sp\player\offhand_box
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x15e0
// Size: 0x76
function get_player_offhand_weapon(weapon_name) {
    foreach (offhand in level.player.offhandinventory) {
        if (tolower(offhand.basename) == weapon_name) {
            return offhand;
        }
    }
    return undefined;
}

