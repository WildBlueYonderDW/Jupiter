#using script_1b4114093cd44368;
#using scripts\common\utility;
#using scripts\cp\cp_gameskill;
#using scripts\cp\tripwire_cp;
#using scripts\cp\utility;
#using scripts\cp_mp\entityheadicons;
#using scripts\cp_mp\utility\inventory_utility;
#using scripts\cp_mp\utility\player_utility;
#using scripts\cp_mp\utility\weapon_utility;
#using scripts\engine\trace;
#using scripts\engine\utility;

#namespace namespace_d87ee12eb6625371;

// Namespace namespace_d87ee12eb6625371 / namespace_4bb5eda89afac572
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x544
// Size: 0xba
function function_234851f94416f178() {
    if (!isdefined(level.var_f6bad8618358a031)) {
        level.var_f6bad8618358a031 = spawnstruct();
    }
    level.var_f6bad8618358a031.holdweaponname = "iw9_oxygenmask";
    registersharedfunc("oxygenmask", "onGive", &function_78936156143bf6fa);
    registersharedfunc("oxygenmask", "onEquip", &function_5320a46c0e139cb5);
    registersharedfunc("oxygenmask", "onUse", &function_c6f7c3926e6e4522);
    registersharedfunc("oxygenmask", "onUseComplete", &function_cad73059babfbe29);
    registersharedfunc("oxygenmask", "onRemove", &function_fe80c78bd0d58ebf);
    registersharedfunc("oxygenmask", "onUnusable", &function_afb7a317198d0688);
}

// Namespace namespace_d87ee12eb6625371 / namespace_4bb5eda89afac572
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x606
// Size: 0x7
function function_67939c281eb5c262() {
    return true;
}

// Namespace namespace_d87ee12eb6625371 / namespace_4bb5eda89afac572
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x616
// Size: 0xca
function function_18dfea62f135def6(origin, angles, var_fc1437797f3adf22) {
    droppos = drop_to_ground(origin, 25, -50) + (0, 0, 6);
    model_usable = spawn("script_model", droppos);
    model_usable.angles = angles;
    model_usable setmodel("misc_wm_oxygen_tank_v0");
    model_usable.targetname = "oxygenmask_usable";
    if (istrue(var_fc1437797f3adf22)) {
        icon = "hud_icon_equipment_oxygen";
        model_usable.pickup_headicon = model_usable scripts\cp_mp\entityheadicons::setheadicon_singleimage(level.players, icon, 16, 0, 512, 100, 0, 0, 1, undefined, 1);
    }
    model_usable thread function_dc08efac4aa8bc95();
    return model_usable;
}

// Namespace namespace_d87ee12eb6625371 / namespace_4bb5eda89afac572
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6e9
// Size: 0x66
function function_8fc85383e9f1b6e6() {
    if (istrue(self.var_23a6763562820c70)) {
        /#
            announcement("<dev string:x1c>");
        #/
        if (soundexists("cp_oxygenmask_hiss")) {
            playsoundatpos(self.origin, "cp_oxygenmask_hiss");
        }
        thread namespace_86d0d418da518a0e::function_a51cb31233eacf9e();
        if (isdefined(self.var_72f72f6558f6a22a)) {
            self.var_72f72f6558f6a22a delete();
        }
        return true;
    }
    return false;
}

// Namespace namespace_d87ee12eb6625371 / namespace_4bb5eda89afac572
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x758
// Size: 0x239
function private function_dc08efac4aa8bc95(owner) {
    self endon("death");
    if (!istrue(self.var_e1d86a45df92d80)) {
        self.var_e1d86a45df92d80 = 1;
        self makeusable();
    } else {
        self function_dfb78b3e724ad620(1);
    }
    self.hintstring = %LUA_MENU_CP/SUPER_OXYGENMASK;
    self.hintstring_used = %LUA_MENU_CP/SUPER_OXYGENMASK_IN_USE;
    self setcursorhint("HINT_BUTTON");
    self sethintdisplayfov(200);
    self setuserange(150);
    self setusefov(190);
    self sethintonobstruction("show");
    self setuseholdduration("duration_short");
    self sethintstring(self.hintstring);
    self setuseprioritymax();
    if (isdefined(owner)) {
        self sethintdisplayrange(220);
        foreach (other_player in level.players) {
            if (other_player == owner) {
                self disableplayeruse(other_player);
                continue;
            }
            self enableplayeruse(other_player);
        }
    } else {
        self sethintdisplayrange(620);
    }
    while (true) {
        self waittill("trigger", player);
        if (isdefined(player)) {
            if (!player scripts\cp\utility::is_valid_player()) {
                continue;
            }
            if (istrue(player.var_23a6763562820c70)) {
                continue;
            }
            if (istrue(player.super_activated)) {
                continue;
            }
            if (istrue(self.disable_pickup)) {
                continue;
            }
            if (!istrue(function_b42b8567448e204a(player geteye(), self.origin, self))) {
                continue;
            }
            if (isdefined(owner)) {
                if (owner == player) {
                    continue;
                }
                if (istrue(owner.var_a3bde3b734d04764)) {
                    continue;
                }
                if (!owner scripts\cp\utility::is_valid_player()) {
                    continue;
                }
            }
            self function_dfb78b3e724ad620(1);
            player playlocalsound("cp_generic_pickup_small");
            level notify("player_given_oxygenmask", player);
            if (isdefined(self.pickup_headicon)) {
                scripts\cp_mp\entityheadicons::setheadicon_deleteicon(self.pickup_headicon);
                self.pickup_headicon = undefined;
            }
            player namespace_86d0d418da518a0e::give_oxygenmask();
            if (isdefined(owner)) {
                owner thread namespace_86d0d418da518a0e::function_a51cb31233eacf9e();
            }
            self delete();
        }
    }
}

// Namespace namespace_d87ee12eb6625371 / namespace_4bb5eda89afac572
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x999
// Size: 0x9a
function private function_33fce193be4821aa() {
    model_usable = spawn("script_model", self.origin);
    model_usable.angles = self.angles;
    model_usable setmodel("tag_origin");
    model_usable.targetname = "oxygenmask_usable_player";
    model_usable linkto(self, "j_spine4", (0, 0, 0), (0, 0, 0));
    self.var_72f72f6558f6a22a = model_usable;
    model_usable.owner = self;
    model_usable thread function_dc08efac4aa8bc95(self);
}

// Namespace namespace_d87ee12eb6625371 / namespace_4bb5eda89afac572
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xa3b
// Size: 0xa6
function private function_18dd74772ee0d1fd(toggle) {
    if (isdefined(self.var_72f72f6558f6a22a)) {
        if (istrue(toggle)) {
            var_12b8b74410667a1a = self.var_72f72f6558f6a22a;
            var_12b8b74410667a1a sethintstring(var_12b8b74410667a1a.hintstring);
            var_12b8b74410667a1a setuseholdduration("duration_short");
            var_12b8b74410667a1a.disable_pickup = undefined;
            var_12b8b74410667a1a function_dfb78b3e724ad620(1);
            return;
        }
        var_12b8b74410667a1a = self.var_72f72f6558f6a22a;
        var_12b8b74410667a1a sethintstring(var_12b8b74410667a1a.hintstring_used);
        var_12b8b74410667a1a setuseholdduration("duration_none");
        var_12b8b74410667a1a.disable_pickup = 1;
        var_12b8b74410667a1a function_dfb78b3e724ad620(1);
    }
}

// Namespace namespace_d87ee12eb6625371 / namespace_4bb5eda89afac572
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xae9
// Size: 0x2
function private function_2c9c3bc278844056() {
    
}

// Namespace namespace_d87ee12eb6625371 / namespace_4bb5eda89afac572
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xaf3
// Size: 0x29
function private function_2a830025d8b846f3() {
    while (true) {
        self setweaponammoclip(level.var_f6bad8618358a031.holdweaponname, 99);
        wait 10;
    }
}

// Namespace namespace_d87ee12eb6625371 / namespace_4bb5eda89afac572
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xb24
// Size: 0x18d
function private function_4d3fa9baf4ce4bfb() {
    currentweapon = self getcurrentweapon();
    if (!isdefined(currentweapon) || currentweapon.basename == "none") {
        currentweapon = makeweapon(level.var_f6bad8618358a031.holdweaponname);
    }
    if (currentweapon.basename == "iw9_lm_dblmg2_cp") {
        scripts\cp_mp\utility\inventory_utility::_takeweapon(makeweapon(level.var_f6bad8618358a031.holdweaponname));
    } else {
        var_8bb5ae39fac9a4d2 = array_combine(self.weaponlist, [self getcurrentweapon()]);
        foreach (weapon in var_8bb5ae39fac9a4d2) {
            if (weapon.basename == level.var_f6bad8618358a031.holdweaponname) {
                scripts\cp_mp\utility\inventory_utility::_takeweapon(weapon);
            }
        }
    }
    if (isdefined(self.var_9a46747153a02d2f)) {
        if (isweapon(self.var_9a46747153a02d2f)) {
            self.lastdroppableweaponobj = self.var_9a46747153a02d2f;
            self switchtoweaponimmediate(self.var_9a46747153a02d2f);
            return;
        }
        if (isstring(self.var_9a46747153a02d2f)) {
            weapobj = makeweapon(self.var_9a46747153a02d2f);
            self.lastdroppableweaponobj = weapobj;
            self switchtoweaponimmediate(weapobj);
        }
    }
}

// Namespace namespace_d87ee12eb6625371 / namespace_4bb5eda89afac572
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xcb9
// Size: 0x3e
function function_3ea64f6cdea1d51b() {
    if (!namespace_86d0d418da518a0e::function_23a6763562820c70()) {
        return;
    }
    self.var_72f72f6558f6a22a delete();
    thread namespace_86d0d418da518a0e::function_a51cb31233eacf9e();
    function_18dfea62f135def6(self.origin, self.angles, 1);
}

// Namespace namespace_d87ee12eb6625371 / namespace_4bb5eda89afac572
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xcff
// Size: 0x55
function private function_9154da52b1732c46() {
    self notify("new_oxygenmask_ui");
    self endon("new_oxygenmask_ui");
    scripts\cp\utility::function_c2963cdb537e31a0();
    while (true) {
        if (self.var_fe2b9ee0479ad3cf == "Ready") {
            scripts\cp\utility::hint_prompt("oxygentank_ready", 1, undefined, 1);
        } else {
            scripts\cp\utility::function_c2963cdb537e31a0();
        }
        self waittill("oxygenmask_changestate");
    }
}

// Namespace namespace_d87ee12eb6625371 / namespace_4bb5eda89afac572
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xd5c
// Size: 0x9
function private function_39dbd79f6e9cd21b() {
    scripts\cp\utility::function_c2963cdb537e31a0();
}

// Namespace namespace_d87ee12eb6625371 / namespace_4bb5eda89afac572
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xd6d
// Size: 0xa8
function private enable_headicon() {
    icon = "hud_icon_equipment_oxygen";
    offset = 16;
    drawwalls = 1;
    toshowto = [];
    if (level.players.size == 1) {
        return;
    }
    for (i = 0; i < level.players.size; i++) {
        if (level.players[i] != self) {
            toshowto[toshowto.size] = level.players[i];
        }
    }
    self.var_afd8a16fcba5b91 = scripts\cp_mp\entityheadicons::setheadicon_singleimage(toshowto, icon, offset, 0, 512, 100, 0, 0, drawwalls, undefined, 1);
}

// Namespace namespace_d87ee12eb6625371 / namespace_4bb5eda89afac572
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xe1d
// Size: 0x29
function private disable_headicon() {
    if (isdefined(self.var_afd8a16fcba5b91)) {
        scripts\cp_mp\entityheadicons::setheadicon_deleteicon(self.var_afd8a16fcba5b91);
        self.var_afd8a16fcba5b91 = undefined;
    }
}

// Namespace namespace_d87ee12eb6625371 / namespace_4bb5eda89afac572
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0xe4e
// Size: 0xc3
function private function_b42b8567448e204a(start, end, ignore_ent) {
    content = ["physicscontents_foliage", "physicscontents_foliage_audio", "physicscontents_glass", "physicscontents_ainoshoot", "physicscontents_missileclip", "physicscontents_item", "physicscontents_vehicleclip", "physicscontents_itemclip", "physicscontents_clipshot", "physicscontents_playerclip", "physicscontents_aiclip", "physicscontents_vehicle", "physicscontents_useclip"];
    contents = physics_createcontents(content);
    trace = scripts\engine\trace::ray_trace_passed(start, end, ignore_ent, contents);
    return trace;
}

// Namespace namespace_d87ee12eb6625371 / namespace_4bb5eda89afac572
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xf1a
// Size: 0x39
function private function_6e57e1d3b53987be() {
    self endon("disconnect");
    if (!self isswimunderwater()) {
        return;
    }
    function_18dd74772ee0d1fd(0);
    wait 0.75;
    self.var_af23415abf13e8fa = 1;
    wait 1;
    self.var_af23415abf13e8fa = undefined;
}

// Namespace namespace_d87ee12eb6625371 / namespace_4bb5eda89afac572
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf5b
// Size: 0x5d
function function_a3070be4e578d579() {
    foreach (player in level.players) {
        if (istrue(player.var_23a6763562820c70)) {
            return player;
        }
    }
    return undefined;
}

// Namespace namespace_d87ee12eb6625371 / namespace_4bb5eda89afac572
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xfc1
// Size: 0x109
function function_c3db6a01f32bc12b() {
    level endon("game_ended");
    level notify("single_hardmode_oxygenmask_use_tracker");
    level endon("single_hardmode_oxygenmask_use_tracker");
    level endon("stop_oxygenmask_hardmode");
    level notify("stop_mantaining_oxy_time");
    if (!isdefined(level.var_c53b399b59b83a64)) {
        level.var_c53b399b59b83a64 = getdvarint(@"hash_ba489eed001f6cad", 540);
    }
    level thread function_df3bc24e6aa5a978();
    owner = undefined;
    if (!istrue(level.var_77f52e0ccb8547eb)) {
        setomnvar("cp_countdown_timer_alpha", 4);
    }
    while (true) {
        owner = function_a3070be4e578d579();
        if (!isdefined(owner) || !istrue(owner isswimmingunderwater())) {
            level thread function_df3bc24e6aa5a978();
            wait 2;
        } else {
            level notify("stop_mantaining_oxy_time");
            waitframe();
            if (!istrue(level.var_77f52e0ccb8547eb)) {
                setomnvar("cp_countdown_timer", gettime() + level.var_c53b399b59b83a64 * 1000);
            }
            level.var_c53b399b59b83a64--;
            wait 1;
        }
        if (level.var_c53b399b59b83a64 <= 0) {
            level.var_ec0baa43406de34a = 1;
            return;
        }
    }
}

// Namespace namespace_d87ee12eb6625371 / namespace_4bb5eda89afac572
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x10d2
// Size: 0x52
function function_df3bc24e6aa5a978() {
    level endon("game_ended");
    level endon("stop_mantaining_oxy_time");
    level endon("stop_oxygenmask_hardmode");
    while (true) {
        if (!istrue(level.var_77f52e0ccb8547eb)) {
            setomnvar("cp_countdown_timer", gettime() + int(level.var_c53b399b59b83a64 * 1000));
        }
        wait 1;
    }
}

// Namespace namespace_d87ee12eb6625371 / namespace_4bb5eda89afac572
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x112c
// Size: 0xa7
function function_907feb5caff3d13() {
    level endon("game_ended");
    level notify("single_hardmode_oxygenmask_use_tracker");
    level endon("single_hardmode_oxygenmask_use_tracker");
    level endon("stop_oxygenmask_hardmode");
    if (!isdefined(level.var_c53b399b59b83a64)) {
        level.var_c53b399b59b83a64 = getdvarint(@"hash_f762ab013c10bbdc", 100);
    }
    numuses = 0;
    while (true) {
        level waittill("used_oxygen_mask", player);
        numuses++;
        level.var_c53b399b59b83a64--;
        if (!istrue(level.var_77f52e0ccb8547eb)) {
            function_b8a8587bd0e63ca2();
        }
        if (level.var_c53b399b59b83a64 <= 0) {
            level.var_ec0baa43406de34a = 1;
            return;
        }
    }
}

// Namespace namespace_d87ee12eb6625371 / namespace_4bb5eda89afac572
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x11db
// Size: 0x28
function function_b8a8587bd0e63ca2() {
    setomnvar("cp_objective_sub_count_4", int(level.var_c53b399b59b83a64));
    setomnvar("cp_objective_sub_4_index", 98);
}

// Namespace namespace_d87ee12eb6625371 / namespace_4bb5eda89afac572
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x120b
// Size: 0x80
function stop_oxygenmask_hardmode() {
    level notify("stop_oxygenmask_hardmode");
    level.var_5c966a6569a6f4b5 = undefined;
    if (istrue(level.var_77f52e0ccb8547eb)) {
        if (isdefined(level.var_a80e6d45222f9a47) && level.var_a80e6d45222f9a47 > 0) {
            scripts\cp\cp_gameskill::hardmode_stop_party_wipe_timer(0);
            waitframe();
        }
    }
    if (!istrue(level.var_77f52e0ccb8547eb)) {
        setomnvar("cp_countdown_timer", 0);
        setomnvar("cp_countdown_timer_alpha", 0);
        setomnvar("cp_countdown_color", 0);
        waitframe();
    }
    scripts\cp\cp_gameskill::function_3898e5f82c5c37df(0);
}

// Namespace namespace_d87ee12eb6625371 / namespace_4bb5eda89afac572
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1293
// Size: 0x40
function function_78936156143bf6fa() {
    scripts\cp\tripwire_cp::function_dc7db69812defce8(0);
    self.var_fe2b9ee0479ad3cf = "";
    namespace_86d0d418da518a0e::function_8b61dac63b58c6ce("Not Usable");
    self.var_44c22b10c3c644e1 = scripts\cp\utility::set_carry_item(self, "oxygen_tank");
    enable_headicon();
}

// Namespace namespace_d87ee12eb6625371 / namespace_4bb5eda89afac572
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x12db
// Size: 0x47
function function_5320a46c0e139cb5() {
    childthread function_9154da52b1732c46();
    childthread function_33fce193be4821aa();
    childthread function_6e57e1d3b53987be();
    childthread function_2a830025d8b846f3();
    if (scripts\cp\cp_gameskill::function_f8448fd91abb54c8()) {
        scripts\cp\cp_gameskill::function_3898e5f82c5c37df(1);
        thread function_c3db6a01f32bc12b();
        level.var_5c966a6569a6f4b5 = 1;
    }
}

// Namespace namespace_d87ee12eb6625371 / namespace_4bb5eda89afac572
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x132a
// Size: 0x16
function function_c6f7c3926e6e4522() {
    namespace_86d0d418da518a0e::function_8b61dac63b58c6ce("Activating");
    function_18dd74772ee0d1fd(0);
}

// Namespace namespace_d87ee12eb6625371 / namespace_4bb5eda89afac572
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1348
// Size: 0xb
function function_cad73059babfbe29() {
    function_18dd74772ee0d1fd(1);
}

// Namespace namespace_d87ee12eb6625371 / namespace_4bb5eda89afac572
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x135b
// Size: 0x48
function function_fe80c78bd0d58ebf() {
    scripts\cp\tripwire_cp::function_dc7db69812defce8(1);
    function_39dbd79f6e9cd21b();
    if (isdefined(self.var_44c22b10c3c644e1)) {
        scripts\cp\utility::remove_carry_item(self, self.var_44c22b10c3c644e1.slot);
    }
    disable_headicon();
    function_4d3fa9baf4ce4bfb();
}

// Namespace namespace_d87ee12eb6625371 / namespace_4bb5eda89afac572
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x13ab
// Size: 0x46
function function_afb7a317198d0688() {
    self endon("death_or_disconnect");
    if (istrue(level.var_ec0baa43406de34a)) {
        return;
    }
    if (istrue(self function_635e39fc16a64657())) {
        scripts\cp\utility::hint_prompt("cant_use_while_sprintswim", 1, 2);
        return;
    }
    scripts\cp\utility::hint_prompt("cant_use_outside_water", 1, 2);
}

