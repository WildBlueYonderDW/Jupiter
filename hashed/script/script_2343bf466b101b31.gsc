// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_4c770a9a4ad7659c;
#using script_38eb8f4be20d54f4;
#using script_639bf783929acf9b;
#using script_3a4480ba1c5664d0;
#using script_860bfdfe82326e3;
#using scripts\mp\utility\lui_game_event_aggregator.gsc;
#using script_2583ee5680cf4736;
#using script_7ef95bba57dc4b82;
#using script_2b264b25c7da0b12;
#using scripts\mp\killstreaks\killstreaks.gsc;
#using script_7b2517368c79e5bc;
#using script_7c40fa80892a721;

#namespace crafting_table;

// Namespace crafting_table/namespace_7aa73459ddbf130b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2d1
// Size: 0x1a
function function_207ef3b2b9684645() {
    level thread function_92e996e62ae888cc();
    level.var_38f3f357808bd969 = &function_c302c35a4fb18338;
}

// Namespace crafting_table/namespace_7aa73459ddbf130b
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x2f2
// Size: 0x5b
function private function_92e996e62ae888cc() {
    namespace_4e16584f2211900a::function_72f3dd0512f43c96("crafting_table", &function_699b88a1e45c0279);
    waittillframeend();
    wait(1);
    var_e10b8f561af1621c = utility::getstructarray("content_destination", "variantname");
    if (isdefined(var_e10b8f561af1621c) && var_e10b8f561af1621c.size > 0) {
        level thread function_1f7ebac4e277ffa3(var_e10b8f561af1621c[0]);
    }
    /#
        level thread function_3575e808663ab031();
    #/
}

// Namespace crafting_table/namespace_7aa73459ddbf130b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x354
// Size: 0x17e
function function_7e01e70947d29a55() {
    s_menu = namespace_7bf99ef58659a6f1::function_cfd0e1fb13d7e080(#"crafting_table");
    if (isdefined(s_menu) && isdefined(s_menu.items)) {
        foreach (item in s_menu.items) {
            if (isdefined(item.category)) {
                switch (item.category) {
                case #"hash_25789111b74943b4":
                    item.var_d2d5fe0a1af43d77 = &function_a98f099f96cf1fe;
                    break;
                case #"hash_339227cb650975db":
                    item.slot = "primary";
                    item.var_d2d5fe0a1af43d77 = &function_4b8c209f32a8c216;
                    break;
                case #"hash_850999d7864fa3b4":
                    item.slot = "secondary";
                    item.var_d2d5fe0a1af43d77 = &function_4b8c209f32a8c216;
                    break;
                case #"hash_605929bc0f7f95c8":
                    item.var_d2d5fe0a1af43d77 = &function_af5a04f875da4a0d;
                    break;
                default:
                    utility::error("crafting_table item: " + item.var_cb325ddb4a764623 + " does not have a category set.");
                    break;
                }
            }
        }
    }
    namespace_95a52c4860eaf4dd::registeronluieventcallback(&function_fcdcc8a41c178a71);
}

// Namespace crafting_table/namespace_7aa73459ddbf130b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4d9
// Size: 0xd3
function function_1f7ebac4e277ffa3(destination) {
    foreach (location in destination.locations) {
        var_bc645435006193ac = location.instances["crafting_table"];
        if (isdefined(var_bc645435006193ac)) {
            foreach (instance in var_bc645435006193ac.var_67b2b78e28eaa758) {
                namespace_4e16584f2211900a::function_7e2984b7610f3616(instance);
            }
        }
    }
}

// Namespace crafting_table/namespace_7aa73459ddbf130b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5b3
// Size: 0x6
function function_3575e808663ab031() {
    /#
    #/
}

// Namespace crafting_table/namespace_7aa73459ddbf130b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5c0
// Size: 0x7b
function function_699b88a1e45c0279(instance) {
    var_fbde2cbac7586151 = utility::getstructarray("crafting_table_trigger", "targetname");
    foreach (struct in var_fbde2cbac7586151) {
        struct function_56432a6c9dc16f88();
    }
    function_7e01e70947d29a55();
}

// Namespace crafting_table/namespace_7aa73459ddbf130b
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x642
// Size: 0xde
function private function_56432a6c9dc16f88() {
    var_1bd8d5f24190f942 = utility::getstruct(self.target2, "targetname");
    self.var_a790b0a3bf450e9d = namespace_4e16584f2211900a::spawn_script_model(var_1bd8d5f24190f942, "t10_zm_machine_crafting_fxanim", 1, 1);
    self.var_a790b0a3bf450e9d thread function_bf5ef5411b8ab9fe("static");
    self.var_a790b0a3bf450e9d.interact = interaction::function_90472496b91b94b3(self.var_a790b0a3bf450e9d, self.radius, &function_fd14e351e1c3868e);
    self.var_a790b0a3bf450e9d.interact interaction::function_e6c63f16f2258b80(&function_6a4771c206414984);
    self.var_a790b0a3bf450e9d.interact sethinttag("tag_hint");
    self.var_a790b0a3bf450e9d.interact.struct = self;
}

// Namespace crafting_table/namespace_7aa73459ddbf130b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x727
// Size: 0x24
function function_fd14e351e1c3868e(player) {
    if (istrue(player.interactions_disabled)) {
        return;
    }
    function_2cf60e1dd7c2f302(player);
}

// Namespace crafting_table/namespace_7aa73459ddbf130b
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x752
// Size: 0x87
function private function_6a4771c206414984(usable, player) {
    if (isdefined(player) && isdefined(usable)) {
        if (istrue(player.interactions_disabled)) {
            return {string:"", type:"HINT_NOICON"};
        }
        return {string:"SHARED_HINTSTRINGS/CRAFTING_TABLE_START_HINT", type:"HINT_BUTTON"};
    }
    return {string:"", type:"HINT_NOICON"};
}

// Namespace crafting_table/namespace_7aa73459ddbf130b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7e1
// Size: 0xd0
function function_2cf60e1dd7c2f302(player) {
    s_menu = namespace_7bf99ef58659a6f1::function_cfd0e1fb13d7e080(#"crafting_table");
    if (!isdefined(s_menu)) {
        return;
    }
    player.var_8db644cf41dc3e3 = utility::function_53c4c53197386572(player.var_8db644cf41dc3e3, 0);
    var_bf1eb50af72af = utility::function_53c4c53197386572(s_menu.id, -1);
    player setclientomnvar("ui_self_revive_bought_count", player.var_8db644cf41dc3e3);
    player setclientomnvar("ui_purchasemenu_id", var_bf1eb50af72af);
    player setclientomnvar(s_menu.var_c7ffb2549ca8ab4b, gettime());
    player.var_8e01cb22f32302fa = player.origin;
    player.var_c68b28fc5b112297 = self;
    player thread function_dddb14a98ae3b238();
}

// Namespace crafting_table/namespace_7aa73459ddbf130b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8b8
// Size: 0x75
function function_dddb14a98ae3b238() {
    self endon("death");
    level endon("game_ended");
    self.var_b31a1fb061f9e07b = undefined;
    while (1) {
        if (!isdefined(self.var_8e01cb22f32302fa)) {
            break;
        }
        if (distance(self.var_8e01cb22f32302fa, self.origin) > 100) {
            break;
        }
        if (istrue(self.var_b31a1fb061f9e07b)) {
            break;
        }
        wait(0.25);
    }
    if (isdefined(self)) {
        function_baa9f4ba6ddc9e64();
    }
}

// Namespace crafting_table/namespace_7aa73459ddbf130b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x934
// Size: 0x6c
function function_baa9f4ba6ddc9e64() {
    s_menu = namespace_7bf99ef58659a6f1::function_cfd0e1fb13d7e080(#"crafting_table");
    if (!isdefined(s_menu)) {
        return;
    }
    self setclientomnvar(s_menu.var_8b8931f97eef184, 2);
    self setclientomnvar(s_menu.var_fd0ea8a834fa0398, gettime());
    self.var_8e01cb22f32302fa = undefined;
    self.var_c68b28fc5b112297 = undefined;
    self.var_b31a1fb061f9e07b = undefined;
}

// Namespace crafting_table/namespace_7aa73459ddbf130b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9a7
// Size: 0xa3
function function_bf5ef5411b8ab9fe(state) {
    if (!self isscriptable()) {
        return;
    }
    if (istrue(self.var_49af41ee9139ef53)) {
        return;
    }
    self.var_49af41ee9139ef53 = 0;
    switch (state) {
    case #"hash_b196217e12b52a9b":
        self setscriptablepartstate("base", "static");
        break;
    case #"hash_b389e7ddef378fd0":
        self setscriptablepartstate("base", "activate");
        self.var_49af41ee9139ef53 = 1;
        wait(6.7);
        self setscriptablepartstate("base", "static");
        self.var_49af41ee9139ef53 = 0;
        break;
    }
}

// Namespace crafting_table/namespace_7aa73459ddbf130b
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xa51
// Size: 0x5b
function function_fcdcc8a41c178a71(channel, var_1657e74c9190d2a2) {
    if (isdefined(var_1657e74c9190d2a2)) {
        if (channel == "craft_purchase") {
            var_efd15f839f4d2f0a = var_1657e74c9190d2a2 - 1;
            function_852065477601a51d(var_efd15f839f4d2f0a);
        } else if (namespace_7bf99ef58659a6f1::function_5c9b6f1c3c67dd97(#"crafting_table", channel)) {
            self.var_b31a1fb061f9e07b = 1;
        }
    }
}

// Namespace crafting_table/namespace_7aa73459ddbf130b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xab3
// Size: 0xf1
function function_852065477601a51d(var_efd15f839f4d2f0a) {
    s_menu = namespace_7bf99ef58659a6f1::function_cfd0e1fb13d7e080(#"crafting_table");
    if (!isdefined(s_menu)) {
        return;
    }
    item = namespace_7bf99ef58659a6f1::function_904f24ea774b8f6f(#"crafting_table", var_efd15f839f4d2f0a);
    if (isdefined(item)) {
        response = self [[ s_menu.items[var_efd15f839f4d2f0a].var_d2d5fe0a1af43d77 ]](item);
        if (response == 1) {
            self playsoundtoplayer("ui_zm_core_purchase_success", self);
            self.var_c68b28fc5b112297.struct.var_a790b0a3bf450e9d thread function_bf5ef5411b8ab9fe("activate");
        } else if (response == 3) {
            self playsoundtoplayer("ui_zm_core_purchase_deny", self);
        }
        self setclientomnvar(s_menu.var_8b8931f97eef184, response);
        self setclientomnvar(s_menu.var_fd0ea8a834fa0398, gettime());
    }
}

// Namespace crafting_table/namespace_7aa73459ddbf130b
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xbab
// Size: 0xab
function function_c302c35a4fb18338(var_1189bd7fbe2861f8, slot) {
    var_2609eaa87f8f47c6 = equipment::getcurrentequipment(slot);
    currentammo = 0;
    var_5707f57a2da6a33e = undefined;
    if (isdefined(var_2609eaa87f8f47c6)) {
        currentammo = equipment::getequipmentammo(var_2609eaa87f8f47c6);
        var_5707f57a2da6a33e = equipment::getequipmentmaxammo(var_2609eaa87f8f47c6);
    }
    if (isdefined(var_2609eaa87f8f47c6) && isdefined(currentammo) && var_2609eaa87f8f47c6 != var_1189bd7fbe2861f8 && currentammo > 0) {
        drop_item(var_2609eaa87f8f47c6, currentammo);
        currentammo = 0;
        var_5707f57a2da6a33e = equipment::getequipmentmaxammo(var_1189bd7fbe2861f8);
    }
    if (isdefined(var_5707f57a2da6a33e) && currentammo >= var_5707f57a2da6a33e) {
        return 5;
    } else {
        currentammo++;
    }
    equipment::giveequipment(var_1189bd7fbe2861f8, slot);
    equipment::setequipmentammo(var_1189bd7fbe2861f8, currentammo);
    return undefined;
}

// Namespace crafting_table/namespace_7aa73459ddbf130b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xc5e
// Size: 0xa1
function function_4b8c209f32a8c216(item) {
    item_struct = namespace_7bf99ef58659a6f1::function_fcb72b7f642e750e(#"crafting_table", item.index);
    if (currency::function_15975e20bbd2c824(item.currency) < item.cost) {
        return 3;
    }
    var_3632c5578a471059 = function_c302c35a4fb18338(item.var_cb325ddb4a764623, item_struct.slot);
    if (isdefined(var_3632c5578a471059)) {
        return var_3632c5578a471059;
    }
    currency::function_a06aa3b8c98e131e(item.currency, item.cost);
    return 1;
}

// Namespace crafting_table/namespace_7aa73459ddbf130b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xd07
// Size: 0x1cc
function function_af5a04f875da4a0d(item) {
    cost = item.cost;
    if (item.var_cb325ddb4a764623 == "equip_self_revive" && isdefined(item.var_aa0377db58a92018)) {
        cost = cost + self.var_8db644cf41dc3e3 * item.var_aa0377db58a92018;
    }
    if (!currency::function_bcc79745d547a99c(item.currency, cost)) {
        return 3;
    }
    switch (item.var_cb325ddb4a764623) {
    case #"hash_66b1dce46fb55c22":
        if (laststand::function_85bcfa7d00b8bb6b()) {
            laststand::function_7eba90a4d2ef6d6f();
            self.var_8db644cf41dc3e3++;
            self setclientomnvar("ui_self_revive_bought_count", self.var_8db644cf41dc3e3);
            currency::function_a06aa3b8c98e131e(item.currency, cost);
            return 1;
        } else {
            return 5;
        }
        break;
    default:
        var_e9710ff35394078c = 1;
        killstreak_name = item.var_cb325ddb4a764623;
        if (isdefined(level.killstreaksetups[killstreak_name])) {
            slot_item = killstreaks::getkillstreakinslot(var_e9710ff35394078c);
            if (isdefined(slot_item) && slot_item.available >= item.maxstack) {
                if (killstreak_name == slot_item.streakname) {
                    return 5;
                } else {
                    drop_item(slot_item.streakname, 1);
                    killstreaks::removekillstreak(var_e9710ff35394078c);
                    killstreaks::updatekillstreakuislot(var_e9710ff35394078c);
                }
            }
            var_cf2008b9e0e08999 = killstreaks::createstreakitemstruct(killstreak_name);
            killstreaks::awardkillstreakfromstruct(var_cf2008b9e0e08999, "other", undefined, undefined, undefined, var_e9710ff35394078c);
            currency::function_a06aa3b8c98e131e(item.currency, cost);
            return 1;
        }
        break;
    }
    return 2;
}

// Namespace crafting_table/namespace_7aa73459ddbf130b
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xedb
// Size: 0x89
function drop_item(var_7e4a50ac06299be, n_count) {
    dist = 64;
    player_forward = anglestoforward(self.angles);
    player_forward = vectornormalize(player_forward);
    player_forward = player_forward * -1;
    var_c9844d4eb04faec9 = self.origin + player_forward * 64;
    dropstruct = function_59a2e61d79065dca();
    dropstruct.var_d8cf705570b19696 = var_c9844d4eb04faec9;
    namespace_49e179ec476603d6::function_105c431a9b8cac6b(var_7e4a50ac06299be, n_count, dropstruct);
}

// Namespace crafting_table/namespace_7aa73459ddbf130b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xf6b
// Size: 0xc3
function function_a98f099f96cf1fe(item) {
    if (currency::function_15975e20bbd2c824(item.currency) < item.cost) {
        return 3;
    }
    var_9c0714e8870e2ac7 = item.var_cb325ddb4a764623 == "armor_repair";
    if (var_9c0714e8870e2ac7) {
        if (!armor::function_e47b13babb51a365()) {
            armor::function_32bc8e85688648f4(self.var_8790c077c95db752);
        } else {
            return 4;
        }
    } else if (self.var_bed158a6dfac230d == item.tier - 1) {
        give_armor(item.tier);
    } else {
        return 4;
    }
    currency::function_a06aa3b8c98e131e(item.currency, item.cost);
    return 1;
}

// Namespace crafting_table/namespace_7aa73459ddbf130b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1036
// Size: 0xce
function give_armor(var_bed158a6dfac230d) {
    var_5c6e0121240cb514 = 100;
    var_5c6e0421240cbbad = 200;
    var_5c6e0321240cb97a = 300;
    switch (var_bed158a6dfac230d) {
    case 1:
        self.var_bed158a6dfac230d = 1;
        self.var_8790c077c95db752 = var_5c6e0121240cb514;
        armor::setArmorHealth(var_5c6e0121240cb514);
        break;
    case 2:
        self.var_bed158a6dfac230d = 2;
        self.var_8790c077c95db752 = var_5c6e0421240cbbad;
        armor::setArmorHealth(var_5c6e0421240cbbad);
        break;
    case 3:
        self.var_bed158a6dfac230d = 3;
        self.var_8790c077c95db752 = var_5c6e0321240cb97a;
        armor::setArmorHealth(var_5c6e0321240cb97a);
        break;
    }
    self setclientomnvar("ui_armor_current_level", var_bed158a6dfac230d);
}

