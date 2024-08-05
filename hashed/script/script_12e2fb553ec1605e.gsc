#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_2669878cf5a1b6bc;
#using scripts\cp\utility.gsc;
#using script_14609b809484646e;
#using script_6775ad452d13858;
#using script_66122a002aff5d57;
#using script_12e2fb553ec1605e;
#using scripts\cp\cp_accessories.gsc;
#using script_3a8f9ace195c9da9;
#using scripts\cp_mp\execution.gsc;
#using script_644c18834356d9dc;
#using script_7ef95bba57dc4b82;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using scripts\cp\calloutmarkerping_cp.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using script_600b944a95c3a7bf;
#using script_5e5507d57bbbb709;
#using scripts\cp_mp\utility\player_utility.gsc;
#using script_afb7e332aee4bf2;
#using script_56ef8d52fe1b48a1;
#using script_74502a9e0ef1f19c;
#using scripts\cp\cp_checkpoint.gsc;
#using scripts\cp_mp\gestures.gsc;
#using scripts\cp\cp_relics.gsc;

#namespace loadout;

// Namespace loadout / namespace_751288259782653c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x119a
// Size: 0xbb
function init() {
    thread function_e3d92c3c4d45add1();
    function_4a1d700183a5a33d(0);
    function_b82b35ca0f5529aa(1);
    initoperatorcustomization();
    level.available_player_characters = [];
    level.player_character_info = [];
    level.playercustomizationdata = [];
    level.custom_giveloadout = &givedefaultloadout;
    level.move_speed_scale = &updatemovespeedscale;
    level.registerplayercharfunc = &registerplayercharacter;
    level.classtablename = "classtable:classtable";
    if (!isdefined(level.loadoutsgroup)) {
        level.loadoutsgroup = getplayerdataloadoutgroup();
    }
    level.var_36074f5db982129d = [];
    level.var_b2640b98dee64871 = [];
    namespace_9c383b14c4908e46::function_8ece37593311858a(&function_8597534afc6fe0d2);
    initnightvisionheadoverrides();
}

// Namespace loadout / namespace_751288259782653c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x125d
// Size: 0x60
function function_376be2185b817bcf() {
    if (level.script == "cp_raid1" || level.script == "cp_raid1_trap") {
        return ["gaz_western", "farah_western", "price_western"];
    }
    return ["farah_western", "price_western", "alex_western"];
}

// Namespace loadout / namespace_751288259782653c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x12c6
// Size: 0x72
function function_e3d92c3c4d45add1() {
    operators = function_376be2185b817bcf();
    var_92e71940e0dbf66c = [];
    for (i = 0; i < operators.size; i++) {
        struct = spawnstruct();
        struct.name = operators[i];
        var_92e71940e0dbf66c[i] = struct;
    }
    level.var_c2f521f34f3e9a27 = create_deck(var_92e71940e0dbf66c, 1, 1, 1);
}

// Namespace loadout / namespace_751288259782653c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1340
// Size: 0x4e
function function_49c93383a0b95567(ref) {
    var_9ba0ad9dcf55406e = array_get_first_item(namespace_465d40bb08a5337a::function_58145d3d8b15c8(ref));
    struct = spawnstruct();
    struct.var_9ba0ad9dcf55406e = var_9ba0ad9dcf55406e;
    struct.name = ref;
    return struct;
}

// Namespace loadout / namespace_751288259782653c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1397
// Size: 0xd
function function_6e059a1906778ec6() {
    return function_49c93383a0b95567("farah_western");
}

// Namespace loadout / namespace_751288259782653c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x13ad
// Size: 0xd
function function_6a4bccfce8aaf66c() {
    return function_49c93383a0b95567("gaz_western");
}

// Namespace loadout / namespace_751288259782653c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x13c3
// Size: 0x63
function function_ed1c871cabc1fe60() {
    operators = ["alex_western"];
    var_92e71940e0dbf66c = [];
    for (i = 0; i < operators.size; i++) {
        struct = spawnstruct();
        struct.name = operators[i];
        var_92e71940e0dbf66c[i] = struct;
    }
    return var_92e71940e0dbf66c[0];
}

// Namespace loadout / namespace_751288259782653c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x142f
// Size: 0xd
function function_db14adefcb598305() {
    return function_49c93383a0b95567("price_western");
}

// Namespace loadout / namespace_751288259782653c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1445
// Size: 0xd1
function function_8597534afc6fe0d2() {
    if (function_138028ca2b958511()) {
        if (isdefined(self.pers["operator_override"])) {
            self.var_dc196d396886fb97 = self.pers["operator_override"];
        } else {
            self.var_dc196d396886fb97 = level.var_c2f521f34f3e9a27 deck_draw();
            self.pers["operator_override"] = self.var_dc196d396886fb97;
            self setclientomnvar("ui_operator_override", self.var_dc196d396886fb97.var_9c9265c6d4356bc6);
        }
    } else if (isdefined(level.var_e129f1e4a5717456)) {
        self.var_dc196d396886fb97 = level.var_e129f1e4a5717456 deck_draw();
        self.pers["operator_override"] = self.var_dc196d396886fb97;
    }
    namespace_6250b14b3f614101::function_2d55e66e05614871();
}

// Namespace loadout / namespace_751288259782653c
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x151e
// Size: 0x1b0
function function_ef21ab05bfa5c5a1(operators, var_460244547a0ce959, var_530b2c16e47231d3, var_76a1043618ec0be, var_7f12155459804d4e, var_461d3a38ea2cbe91) {
    var_92e71940e0dbf66c = [];
    if (!isarray(operators)) {
        operators = [operators];
    }
    if (isdefined(var_460244547a0ce959) && !isarray(var_460244547a0ce959)) {
        var_460244547a0ce959 = [var_460244547a0ce959];
    }
    if (isdefined(var_530b2c16e47231d3) && !isarray(var_530b2c16e47231d3)) {
        var_530b2c16e47231d3 = [var_530b2c16e47231d3];
    }
    if (isdefined(var_76a1043618ec0be) && !isarray(var_76a1043618ec0be)) {
        var_76a1043618ec0be = [var_76a1043618ec0be];
    }
    if (isdefined(var_7f12155459804d4e) && !isarray(var_7f12155459804d4e)) {
        var_7f12155459804d4e = [var_7f12155459804d4e];
    }
    if (isdefined(var_461d3a38ea2cbe91) && !isarray(var_461d3a38ea2cbe91)) {
        var_461d3a38ea2cbe91 = [var_461d3a38ea2cbe91];
    }
    for (i = 0; i < operators.size; i++) {
        var_9ba0ad9dcf55406e = array_get_first_item(namespace_465d40bb08a5337a::function_58145d3d8b15c8(operators[i]));
        struct = spawnstruct();
        struct.var_9ba0ad9dcf55406e = var_9ba0ad9dcf55406e;
        struct.name = operators[i];
        if (isdefined(var_460244547a0ce959)) {
            struct.var_96f5664fb9485230 = var_460244547a0ce959[i];
        }
        if (isdefined(var_530b2c16e47231d3)) {
            struct.var_2127436e1469b192 = var_530b2c16e47231d3[i];
        }
        if (isdefined(var_76a1043618ec0be)) {
            struct.var_7fe2e5faa9c76a39 = var_76a1043618ec0be[i];
        }
        if (isdefined(var_7f12155459804d4e)) {
            struct.var_cc9806a44c8cbb09 = var_7f12155459804d4e[i];
        }
        if (isdefined(var_461d3a38ea2cbe91)) {
            struct.var_1ab89b1504822058 = var_461d3a38ea2cbe91[i];
        }
        var_92e71940e0dbf66c[i] = struct;
    }
    level.var_e129f1e4a5717456 = create_deck(var_92e71940e0dbf66c, 1, 1, 1);
}

// Namespace loadout / namespace_751288259782653c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x16d6
// Size: 0xf5
function function_fbac9497c03a0c89() {
    if (getdvar(@"hash_22221466d25e507c", "") != "" && !istrue(level.var_c198402c3d81ad9)) {
        level.var_c198402c3d81ad9 = 1;
        return function_3ef470f786d308b();
    }
    if (isdefined(self.pers["operator_override"])) {
        return function_3ef470f786d308b(self.pers["operator_override"]);
    }
    if (!isdefined(level.farah)) {
        level.farah = self;
        return namespace_751288259782653c::function_6e059a1906778ec6();
    }
    if (!isdefined(level.gaz) && function_6809a05d2c7cf04a()) {
        level.gaz = self;
        return namespace_751288259782653c::function_6a4bccfce8aaf66c();
    }
    if (!isdefined(level.alex) && function_79c69b5f0766f2a8()) {
        level.alex = self;
        return namespace_751288259782653c::function_ed1c871cabc1fe60();
    }
    if (!isdefined(level.price)) {
        level.price = self;
        return namespace_751288259782653c::function_db14adefcb598305();
    }
}

// Namespace loadout / namespace_751288259782653c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x17d3
// Size: 0x24
function function_6809a05d2c7cf04a() {
    return level.script == "cp_raid1" || level.script == "cp_raid1_trap";
}

// Namespace loadout / namespace_751288259782653c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1800
// Size: 0x24
function function_79c69b5f0766f2a8() {
    return level.script == "cp_raid1_boss1" || level.script == "cp_jugg_maze";
}

// Namespace loadout / namespace_751288259782653c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x182d
// Size: 0xfd
function function_3ef470f786d308b(var_64317638daac04e1) {
    var_30886334d5498514 = undefined;
    if (isdefined(var_64317638daac04e1)) {
        var_30886334d5498514 = var_64317638daac04e1.name;
    }
    if (!isdefined(var_30886334d5498514)) {
        var_30886334d5498514 = tolower(getdvar(@"hash_22221466d25e507c"));
    }
    switch (var_30886334d5498514) {
    case #"hash_4ba1525745ce470f":
    case #"hash_de84392651a76416": 
        level.farah = self;
        return namespace_751288259782653c::function_6e059a1906778ec6();
    case #"hash_5b7c6433642710a":
    case #"hash_5c8dc5ca28a25ca3": 
        level.price = self;
        return namespace_751288259782653c::function_db14adefcb598305();
    case #"hash_3e16212fa7d1d2d8":
    case #"hash_fb36726c0708cd6d": 
        level.gaz = self;
        return namespace_751288259782653c::function_6a4bccfce8aaf66c();
    case #"hash_57d8084cfc540c70":
    case #"hash_e6d8d01e14b10aa5": 
        level.alex = self;
        return namespace_751288259782653c::function_ed1c871cabc1fe60();
    case #"hash_7038dec66d8275be": 
        return;
    }
}

// Namespace loadout / namespace_751288259782653c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1932
// Size: 0x19d
function initnightvisionheadoverrides() {
    if (!function_6aafbdd00b977115()) {
        return;
    }
    level.nvgheadoverrides = [];
    foreach (skinref in namespace_465d40bb08a5337a::function_6ab347c553a20a68()) {
        head = namespace_465d40bb08a5337a::function_223061772e2a61b9(skinref);
        var_8caf1716b3192f8f = namespace_465d40bb08a5337a::function_3af837eb38560aad(skinref);
        var_f164251d2631366a = namespace_465d40bb08a5337a::function_6fa0ec9562a76f6c(skinref);
        if (!isdefined(head) || head == "") {
            break;
        }
        if (var_8caf1716b3192f8f != "") {
            level.nvgheadoverrides[head]["up"] = var_8caf1716b3192f8f;
        }
        if (var_f164251d2631366a != "") {
            level.nvgheadoverrides[head]["down"] = var_f164251d2631366a;
        }
    }
    level.nvgheadoverrides["head_mp_eastern_fireteam_east_ar_1"]["up"] = "nvg_2";
    level.nvgheadoverrides["head_mp_eastern_fireteam_east_ar_2"]["up"] = "nvg_2";
    level.nvgheadoverrides["head_mp_eastern_fireteam_east_ar_3"]["up"] = "nvg_2";
    level.nvgheadoverrides["head_mp_eastern_fireteam_east_ar_4"]["up"] = "nvg_2";
    level.nvgheadoverrides["head_mp_eastern_fireteam_east_lmg"]["up"] = "none";
    level.nvgheadoverrides["head_mp_eastern_fireteam_east_nvg_1"]["down"] = "none";
    level.nvgheadoverrides["head_mp_eastern_fireteam_east_nvg_1"]["up"] = "none";
}

// Namespace loadout / namespace_751288259782653c
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1ad7
// Size: 0x3b7
function givedefaultloadout(var_86db2022c4f0f4bf, var_185ea69b2fe37360, var_7cb3ce39e2414126, var_9b02313fe7ff70da) {
    level endon("game_ended");
    self endon("death_or_disconnect");
    self.gettingloadout = 1;
    self setclientomnvar("ui_options_menu", 0);
    if (istrue(self.is_doing_infil)) {
        self waittill("player_finished_infil");
    }
    var_2cc2b098ae66e28a = istestclient(self);
    scripts\cp\cp_accessories::clearplayeraccessory();
    self takeallweapons();
    _clearperks();
    setupplayermodel();
    flag_wait("introscreen_over");
    self notify("giveLoadout");
    giveperk("specialty_pistoldeath");
    self setperk("specialty_pistoldraw", 1);
    scripts\cp\utility::giveperk("specialty_hack");
    if (isdefined(var_86db2022c4f0f4bf) && var_86db2022c4f0f4bf) {
        self.gettingloadout = undefined;
        return;
    }
    if (!var_2cc2b098ae66e28a && function_b8339b310e7978a1() && function_ff14b67dba97fe88()) {
        function_e37df6c30163c181();
    } else {
        if (!var_2cc2b098ae66e28a) {
            give_weapons_from_loadout(var_7cb3ce39e2414126, 1);
            if (isdefined(self.classstruct.loadoutaccessorydata) && isdefined(self.classstruct.loadoutaccessoryweapon) && self.classstruct.loadoutaccessoryweapon != "none") {
                scripts\cp\cp_accessories::giveplayeraccessory(self.classstruct.loadoutaccessorydata, self.classstruct.loadoutaccessoryweapon, self.classstruct.loadoutaccessorylogic);
            }
        }
        if (function_240f7f4e57340e8f()) {
            thread namespace_1170726b2799ea65::function_8d89ce0ee29f2012();
        } else {
            function_777eaf15441a6bc6();
        }
    }
    function_601ee7c5e1b107f3();
    function_a01818ae9edecbe6();
    function_a6eb74f88574f882();
    function_37640f469a0bd7b4();
    if (!is_raid_gamemode()) {
        allow_player_basejumping(1, "giveDefaultLoadout");
    } else {
        allow_player_basejumping(0, "giveDefaultLoadout");
    }
    if (isdefined(self.operatorcustomization) && isdefined(self.operatorcustomization.execution)) {
        scripts\cp_mp\execution::_giveexecution(self.operatorcustomization.execution);
    }
    if (istrue(level.disable_nvg)) {
        self setactionslot(2, "");
    }
    self setactionslot(3, "altmode");
    thread notify_delay("loadout_given", 0.05);
    self.changing_loadout = undefined;
    if (isdefined(self.operatorcustomization.clothtype) && self.operatorcustomization.clothtype != "") {
        self setclothtype(function_1823ff50bb28148d(self.operatorcustomization.clothtype));
    } else {
        self setclothtype(#"vestlight");
    }
    if (isdefined(self.operatorcustomization.geartype) && self.operatorcustomization.geartype != "") {
        self function_8abe5a968cc3c220(function_1823ff50bb28148d(self.operatorcustomization.geartype));
    } else {
        self function_8abe5a968cc3c220(#"millghtgr");
    }
    thread notify_when_loadout_given();
    if (!istestclient(self) && isdefined(level.var_5966c39cb60075f1)) {
        self [[ level.var_5966c39cb60075f1 ]]();
    }
    if (isdefined(level.var_a980838233f4b37)) {
        if (isdefined(self.var_2a376311c6e39314)) {
            self.var_2a376311c6e39314 = undefined;
            self [[ level.var_a980838233f4b37 ]]();
        }
    }
    self.gettingloadout = undefined;
    thread namespace_751288259782653c::function_7da7bd24b280d295(1);
}

// Namespace loadout / namespace_751288259782653c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1e96
// Size: 0x15
function function_4a1d700183a5a33d(bool) {
    level.var_e29974a766fb9885 = bool;
}

// Namespace loadout / namespace_751288259782653c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1eb3
// Size: 0x15
function function_b82b35ca0f5529aa(bool) {
    level.var_f44eac8d457aa051 = bool;
}

// Namespace loadout / namespace_751288259782653c
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1ed0
// Size: 0x20
function private function_b8339b310e7978a1() {
    return isdefined(self.pers) && isdefined(self.pers["loadout"]);
}

// Namespace loadout / namespace_751288259782653c
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1ef9
// Size: 0xb
function private function_ff14b67dba97fe88() {
    return level.var_e29974a766fb9885;
}

// Namespace loadout / namespace_751288259782653c
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1f0d
// Size: 0xa
function private function_e37df6c30163c181() {
    function_45a6143a0a99851d(self);
}

// Namespace loadout / namespace_751288259782653c
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x1f1f
// Size: 0x41
function private give_weapons_from_loadout(var_7cb3ce39e2414126, var_168b196e80c44544) {
    var_a52c671acca08378 = cac_getloadoutselectedidx();
    if (isdefined(var_7cb3ce39e2414126)) {
        function_ebc4490ce604e98f(var_a52c671acca08378, var_7cb3ce39e2414126, 1);
        return;
    }
    function_ebc4490ce604e98f(var_a52c671acca08378, var_7cb3ce39e2414126, 0);
}

// Namespace loadout / namespace_751288259782653c
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1f68
// Size: 0x1a9
function function_ebc4490ce604e98f(var_a52c671acca08378, var_7cb3ce39e2414126, usedefault) {
    struct = spawnstruct();
    var_d0ef877013d341af = spawnstruct();
    if (usedefault) {
        var_d0ef877013d341af = loadout_updateclassdefault(struct, var_7cb3ce39e2414126);
    } else {
        var_d0ef877013d341af = loadout_updateclasscustom(struct, var_a52c671acca08378);
    }
    var_d0ef877013d341af = function_c03f8f1dc0df9eaa(var_d0ef877013d341af);
    self.custom_loadout_index = var_a52c671acca08378;
    self.classstruct = var_d0ef877013d341af;
    function_210678ff7b05a155(var_d0ef877013d341af);
    var_918c7d3ed87ea3e8 = function_578fa1963d5f94ac(self, "primary", var_d0ef877013d341af);
    primary_gren = function_f505f60c194b2770(var_d0ef877013d341af.loadoutequipmentprimary);
    if (!array_contains_key(level.equipment.table, primary_gren)) {
        primary_gren = "none";
    }
    var_dca226ee1d93a538 = function_578fa1963d5f94ac(self, "secondary", var_d0ef877013d341af);
    secondary_gren = function_f505f60c194b2770(var_d0ef877013d341af.loadoutequipmentsecondary);
    if (!array_contains_key(level.equipment.table, secondary_gren)) {
        secondary_gren = "none";
    }
    total_slots = self getplayerdata("cp", "inventorySlots", "totalSlots");
    if (!istrue(level.var_a244732f8807fc19) && !istrue(self.changing_loadout)) {
        namespace_94359011b63230a6::reset_munitions(self, total_slots);
        namespace_94359011b63230a6::assign_lowest_full_slot_to_active();
    }
    namespace_4fb9dddfb8c1a67a::giveequipment(primary_gren, "primary");
    namespace_4fb9dddfb8c1a67a::setequipmentammo(primary_gren, var_918c7d3ed87ea3e8);
    namespace_4fb9dddfb8c1a67a::giveequipment(secondary_gren, "secondary");
    namespace_4fb9dddfb8c1a67a::setequipmentammo(secondary_gren, var_dca226ee1d93a538);
}

// Namespace loadout / namespace_751288259782653c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2119
// Size: 0x21d
function function_210678ff7b05a155(var_f961da5ee5c149c1) {
    if (var_f961da5ee5c149c1.loadoutprimary == "none") {
        var_f961da5ee5c149c1.loadoutprimaryfullname = "none";
        var_f961da5ee5c149c1.loadoutprimaryobject = undefined;
    } else {
        var_f961da5ee5c149c1.loadoutprimaryobject = buildweapon(var_f961da5ee5c149c1.loadoutprimary, var_f961da5ee5c149c1.loadoutprimaryattachments, var_f961da5ee5c149c1.loadoutprimarycamo, var_f961da5ee5c149c1.loadoutprimaryreticle, var_f961da5ee5c149c1.loadoutprimaryvariantid, var_f961da5ee5c149c1.loadoutprimaryattachmentids, var_f961da5ee5c149c1.loadoutprimarycosmeticattachment, var_f961da5ee5c149c1.loadoutprimarystickers, istrue(var_f961da5ee5c149c1.loadouthasnvg));
        var_f961da5ee5c149c1.loadoutprimaryobject = give_weapon_alt_clip_ammo_hack(self, var_f961da5ee5c149c1.loadoutprimaryobject);
        var_f961da5ee5c149c1.loadoutprimaryfullname = getcompleteweaponname(var_f961da5ee5c149c1.loadoutprimaryobject);
    }
    if (var_f961da5ee5c149c1.loadoutsecondary == "none") {
        var_f961da5ee5c149c1.loadoutsecondaryfullname = "none";
        var_f961da5ee5c149c1.loadoutsecondaryobject = undefined;
    } else {
        var_f961da5ee5c149c1.loadoutsecondaryobject = buildweapon(var_f961da5ee5c149c1.loadoutsecondary, var_f961da5ee5c149c1.loadoutsecondaryattachments, var_f961da5ee5c149c1.loadoutsecondarycamo, var_f961da5ee5c149c1.loadoutsecondaryreticle, var_f961da5ee5c149c1.loadoutsecondaryvariantid, var_f961da5ee5c149c1.loadoutsecondaryattachmentids, var_f961da5ee5c149c1.loadoutsecondarycosmeticattachment, var_f961da5ee5c149c1.loadoutsecondarystickers, istrue(var_f961da5ee5c149c1.loadouthasnvg));
        var_f961da5ee5c149c1.loadoutsecondaryobject = give_weapon_alt_clip_ammo_hack(self, var_f961da5ee5c149c1.loadoutsecondaryobject);
        var_f961da5ee5c149c1.loadoutsecondaryfullname = getcompleteweaponname(var_f961da5ee5c149c1.loadoutsecondaryobject);
    }
    self.starting_weapon = var_f961da5ee5c149c1.loadoutprimaryobject;
    self.primaryweaponobj = self.starting_weapon;
    self.default_starting_pistol = var_f961da5ee5c149c1.loadoutsecondaryobject;
    self.secondaryweaponobj = self.default_starting_pistol;
}

// Namespace loadout / namespace_751288259782653c
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x233e
// Size: 0x238
function loadout_updateclassdefault(struct, classindex) {
    self.class_num = classindex;
    struct.loadoutprimary = table_getweapon(level.classtablename, classindex, 0);
    for (attachmentindex = 0; attachmentindex < 5; attachmentindex++) {
        struct.loadoutprimaryattachments[attachmentindex] = table_getweaponattachment(level.classtablename, classindex, 0, attachmentindex);
    }
    struct.loadoutprimarycamo = table_getweaponcamo(level.classtablename, classindex, 0);
    struct.loadoutprimaryreticle = table_getweaponreticle(level.classtablename, classindex, 0);
    struct.loadoutsecondary = table_getweapon(level.classtablename, classindex, 1);
    for (attachmentindex = 0; attachmentindex < 5; attachmentindex++) {
        struct.loadoutsecondaryattachments[attachmentindex] = table_getweaponattachment(level.classtablename, classindex, 1, attachmentindex);
    }
    struct.loadoutsecondarycamo = table_getweaponcamo(level.classtablename, classindex, 1);
    struct.loadoutsecondaryreticle = table_getweaponreticle(level.classtablename, classindex, 1);
    struct.loadoutequipmentprimary = table_getequipmentprimary(level.classtablename, classindex);
    struct.loadoutextraequipmentprimary = table_getextraequipmentprimary(level.classtablename, classindex);
    struct.loadoutequipmentsecondary = table_getequipmentsecondary(level.classtablename, classindex);
    struct.loadoutextraequipmentsecondary = table_getextraequipmentsecondary(level.classtablename, classindex);
    struct.loadoutgesture = table_getgesture(level.classtablename, classindex);
    struct.loadoutexecution = cac_getexecution();
    function_2dad855d27735128(struct);
    struct.loadoutaccessoryweapon = cac_getaccessoryweapon();
    struct.loadoutaccessorydata = cac_getaccessorydata();
    struct.loadoutaccessorylogic = cac_getaccessorylogic();
    if (getdvarint(@"hash_cef27c8d9e5e0053", 0)) {
        struct.loadoutsuper = "super_bradley";
    }
    return struct;
}

// Namespace loadout / namespace_751288259782653c
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x257f
// Size: 0x94
function function_c2ae0d2db0c581ea(var_9b02313fe7ff70da, var_185ea69b2fe37360) {
    if (istrue(var_9b02313fe7ff70da)) {
        _detachall(1);
        return;
    }
    _detachall();
    if (isdefined(self.headmodel)) {
        self.headmodel = undefined;
    }
    thread setmodelfromcustomization();
    skinref = lookupcurrentoperatorskin(self.team);
    var_e89fd4c2e2e797b9 = getplayerfoleytype(skinref);
    if (var_e89fd4c2e2e797b9 == "") {
        var_e89fd4c2e2e797b9 = "vestlight";
    }
    self setclothtype(function_1823ff50bb28148d(var_e89fd4c2e2e797b9));
}

// Namespace loadout / namespace_751288259782653c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x261b
// Size: 0x192
function function_777eaf15441a6bc6() {
    meleeweapon = self.melee_weapon;
    self.default_starting_melee_weapon = meleeweapon;
    self.currentmeleeweapon = meleeweapon;
    if (isundefinedweapon(self.default_starting_pistol)) {
        if (!isundefinedweapon(self.starting_weapon)) {
            self.default_starting_pistol = self.starting_weapon;
        } else if (isdefined(level.default_weapon)) {
            self.default_starting_pistol = buildweapon(level.default_weapon, [], "none", "none", -1);
        } else {
            self.default_starting_pistol = buildweapon("iw9_pi_papa220_mp", [], "none", "none", -1);
        }
    }
    self.last_stand_pistol = self.default_starting_pistol;
    if (!isundefinedweapon(self.starting_weapon) && self.starting_weapon == self.default_starting_pistol) {
    } else {
        scripts\cp_mp\utility\inventory_utility::_giveweapon(self.default_starting_pistol, undefined, undefined, 1);
    }
    if (!isundefinedweapon(self.starting_weapon)) {
        scripts\cp_mp\utility\inventory_utility::_giveweapon(self.starting_weapon, undefined, undefined, 1);
    }
    if (!(isdefined(self.onkillrelics) && istrue(self.onkillrelics["relic_oneInTheChamber"]))) {
        namespace_6250b14b3f614101::giveammo(self);
    }
    starting_weapon = self.default_starting_pistol;
    if (!isundefinedweapon(self.starting_weapon)) {
        starting_weapon = self.starting_weapon;
    }
    thread wait_and_force_weapon_switch(starting_weapon, 1);
}

// Namespace loadout / namespace_751288259782653c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x27b5
// Size: 0x24
function function_720f2129e0579003() {
    var_2a9f3313825d58d = buildweapon("iw9_me_climbfists");
    scripts\cp_mp\utility\inventory_utility::_giveweapon(var_2a9f3313825d58d, undefined, undefined, 1);
}

// Namespace loadout / namespace_751288259782653c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x27e1
// Size: 0x28
function function_601ee7c5e1b107f3() {
    scripts\cp_mp\utility\inventory_utility::_giveweapon("super_default_zm");
    self assignweaponoffhandspecial("super_default_zm");
    self.specialoffhandgrenade = "super_default_zm";
}

// Namespace loadout / namespace_751288259782653c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2811
// Size: 0xe0
function notify_when_loadout_given() {
    self endon("disconnect");
    self waittill("loadout_given");
    if (!is_raid_gamemode() && !istrue(level.dogtag_revive)) {
        allow_player_basejumping(1, "loadout_given");
    }
    if (!flag_exist("player_spawned_with_loadout")) {
        flag_init("player_spawned_with_loadout");
    }
    if (function_240f7f4e57340e8f()) {
        flag_init("player_spawned_pre_loadout");
        flag_set("player_spawned_pre_loadout");
        self waittill("loadout_class_selected");
    }
    flag_set("player_spawned_with_loadout");
    if (!ent_flag_exist("player_spawned_with_loadout")) {
        ent_flag_init("player_spawned_with_loadout");
    }
    ent_flag_set("player_spawned_with_loadout");
    if (getdvarint(@"hash_2d950b6324a825d9", 0) != 0) {
        self nightvisionviewon();
    }
    scripts\cp\calloutmarkerping_cp::setuppingspecificvars(self);
    if (is_wave_gametype()) {
        thread namespace_94359011b63230a6::clear_legacy_pickup_munitions();
    }
}

// Namespace loadout / namespace_751288259782653c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x28f9
// Size: 0x27
function allow_super(player) {
    if (isdefined(level.allow_super)) {
        return [[ level.allow_super ]](player);
    }
    return 1;
}

// Namespace loadout / namespace_751288259782653c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2929
// Size: 0x7f
function setmodelfromcustomization() {
    assert(isdefined(self));
    assert(isplayer(self));
    customization = getcustomization();
    self setcustomization(customization["body"], customization["head"]);
    bodymodelname = self getcustomizationbody();
    headmodelname = self getcustomizationhead();
    viewmodelname = self getcustomizationviewmodel();
    setcharactermodels(bodymodelname, headmodelname, viewmodelname);
}

// Namespace loadout / namespace_751288259782653c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x29b0
// Size: 0x36
function getplayerviewmodelfrombody(bodyref) {
    viewmodel = namespace_465d40bb08a5337a::function_aa32c85a2c2a2d8b(bodyref);
    if (!isdefined(viewmodel) || viewmodel == "") {
        viewmodel = "viewhands_mp_base_iw8";
    }
    return viewmodel;
}

// Namespace loadout / namespace_751288259782653c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x29ef
// Size: 0xf9
function setupplayermodel() {
    if (!isdefined(self.operatorcustomization) || self.operatorcustomization.rebuild == 1) {
        createoperatorcustomization();
    }
    body = self.operatorcustomization.defaultbody;
    head = self.operatorcustomization.defaulthead;
    vm = self.operatorcustomization.defaultvm;
    if (self getclientomnvar("ui_assault_suit_on") == 0) {
        setcharactermodels(body, head, vm);
    } else {
        setcharactermodels("body_sp_opforce_shadow_company_elite_3_1", "head_sp_opforce_shadow_company_elite_1_1", "mp_vm_arms_jugg_aq_iw9_1_1");
    }
    function_7fdd3f9148f37ece(self.operatorcustomization.suit);
    scripts\cp_mp\execution::_giveexecution(self.operatorcustomization.execution);
    function_3ac7d9a950f1f115();
}

// Namespace loadout / namespace_751288259782653c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2af0
// Size: 0x13e
function function_3ac7d9a950f1f115() {
    if (!isdefined(self.var_dc196d396886fb97)) {
        return;
    }
    if (function_240f7f4e57340e8f()) {
        return;
    }
    if (!isdefined(level.operators)) {
        level.operators = [];
    }
    if (isstartstr(self.var_dc196d396886fb97.name, "price")) {
        level.price = self;
        level.operators["price"] = self;
        self.var_938e8b2ca6549759 = "price";
        return;
    }
    if (isstartstr(self.var_dc196d396886fb97.name, "farah")) {
        level.farah = self;
        level.operators["farah"] = self;
        self.var_938e8b2ca6549759 = "farah";
        return;
    }
    if (isstartstr(self.var_dc196d396886fb97.name, "gaz")) {
        level.gaz = self;
        level.operators["gaz"] = self;
        self.var_938e8b2ca6549759 = "gaz";
        return;
    }
    level.alex = self;
    level.operators["alex"] = self;
    self.var_938e8b2ca6549759 = "alex";
}

// Namespace loadout / namespace_751288259782653c
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2c36
// Size: 0x66f
function createoperatorcustomization(operatorref, operatorskin) {
    self.operatorcustomization = undefined;
    operatorcustomization = spawnstruct();
    if (!isdefined(operatorref) || !isdefined(operatorskin)) {
        operatorref = lookupcurrentoperator(self.team);
        operatorskin = function_ed273e317490cb02(operatorref);
    }
    if (getdvarint(@"hash_a464cb031c16ee87", 0) > 0) {
        if (isdefined(self.team) && self.team == "allies") {
            operatorref = "t10_usa_bravo_infiltration";
            operatorskin = "t10_usa_bravo_infiltration_a";
        } else {
            operatorref = "t10_uk_stone_security";
            operatorskin = "t10_uk_stone_security_a";
        }
    }
    if (isdefined(self.var_dc196d396886fb97)) {
        operatorref = self.var_dc196d396886fb97.name;
    }
    operatorcustomization.operatorref = operatorref;
    operatorcustomization.skinref = operatorskin;
    operatorcustomization.var_d947b7e87c7243ab = function_29b2af59258d6501(operatorskin);
    operatorcustomization.gender = getoperatorgender(operatorref);
    operatorcustomization.voice = getoperatorvoice(operatorref, operatorskin);
    operatorcustomization.clothtype = getoperatorclothtype(operatorskin);
    operatorcustomization.geartype = function_e8770349a2b50bec(operatorskin);
    operatorcustomization.superfaction = getoperatorsuperfaction(operatorref);
    operatorcustomization.execution = getoperatorexecution(operatorref);
    operatorcustomization.executionquip = getoperatorexecutionquip(operatorref);
    if (getdvarint(@"hash_a464cb031c16ee87", 0) > 0) {
        operatorcustomization.suit = "t10_defaultsuit_mp";
    } else {
        operatorcustomization.suit = function_ada9a2308a4046e2(operatorref);
    }
    operatorcustomization.brinfilsmokesuffix = getoperatorbrinfilsmokesuffix(operatorskin);
    operatorcustomization.rebuild = 0;
    self.operatorcustomization = operatorcustomization;
    customization = getoperatorcustomization();
    var_b053941c7f2ab656 = customization[0];
    var_229b1605ac29bd9c = customization[1];
    if (isdefined(self.var_dc196d396886fb97)) {
        body = default_to(self.var_dc196d396886fb97.var_2127436e1469b192, var_b053941c7f2ab656);
        head = default_to(self.var_dc196d396886fb97.var_96f5664fb9485230, var_229b1605ac29bd9c);
        if (isdefined(self.var_dc196d396886fb97.var_cc9806a44c8cbb09)) {
            self.operatorcustomization.suit = self.var_dc196d396886fb97.var_cc9806a44c8cbb09;
        }
    } else {
        body = var_b053941c7f2ab656;
        head = var_229b1605ac29bd9c;
    }
    bodymodelname = self getcustomizationbody();
    headmodelname = self getcustomizationhead();
    var_e69fcb0bb9e108b = self getcustomizationviewmodel();
    viewmodelname = getplayerviewmodelfrombody(body);
    if (!isagent(self)) {
        if (isdefined(self.var_dc196d396886fb97) && istrue(self.var_dc196d396886fb97.var_dfa2e3093d69c2f3)) {
            skin = operatorskin;
            body = namespace_465d40bb08a5337a::function_8eba78e65f4be793(skin);
            head = namespace_465d40bb08a5337a::function_223061772e2a61b9(skin);
            self setcustomization(body, head);
            bodymodelname = self.var_dc196d396886fb97.var_513025047d19dd6e;
            headmodelname = self.var_dc196d396886fb97.var_bd1057014361ee4;
            var_e69fcb0bb9e108b = self.var_dc196d396886fb97.var_7daca24cff128e1b;
            viewmodelname = self.var_dc196d396886fb97.var_7daca24cff128e1b;
        } else if (isdefined(self.var_dc196d396886fb97) && istrue(self.var_dc196d396886fb97.var_1ab89b1504822058)) {
            if (isdefined(self.var_dc196d396886fb97.var_2127436e1469b192) && isdefined(self.var_dc196d396886fb97.var_7fe2e5faa9c76a39) && isdefined(self.var_dc196d396886fb97.var_96f5664fb9485230)) {
                bodymodelname = self.var_dc196d396886fb97.var_2127436e1469b192;
                headmodelname = self.var_dc196d396886fb97.var_96f5664fb9485230;
                var_e69fcb0bb9e108b = self.var_dc196d396886fb97.var_7fe2e5faa9c76a39;
                viewmodelname = var_e69fcb0bb9e108b;
            } else {
                assertmsg("Must set a body_override, head_override AND view_override if skipping customization; using default operator assets");
                self setcustomization(var_b053941c7f2ab656, var_229b1605ac29bd9c);
                bodymodelname = self getcustomizationbody();
                headmodelname = self getcustomizationhead();
                var_e69fcb0bb9e108b = self getcustomizationviewmodel();
                viewmodelname = getplayerviewmodelfrombody(var_b053941c7f2ab656);
            }
        } else {
            self setcustomization(body, head);
            bodymodelname = self getcustomizationbody();
            headmodelname = self getcustomizationhead();
            var_e69fcb0bb9e108b = self getcustomizationviewmodel();
            viewmodelname = getplayerviewmodelfrombody(body);
        }
    } else if (scripts\cp_mp\utility\game_utility::isbrstylegametype()) {
        bodymodelname = "fullbody_usmc_ar_br_infil";
        headmodelname = undefined;
        var_e69fcb0bb9e108b = "viewhands_mp_base_iw8";
        viewmodelname = "viewhands_mp_base_iw8";
    } else {
        bodymodelname = "body_opforce_london_terrorist_1_2";
        headmodelname = "head_male_bc_03";
        var_e69fcb0bb9e108b = "viewmodel_mp_base_iw8";
        viewmodelname = "viewmodel_mp_base_iw8";
    }
    self.operatorcustomization.body = body;
    self.operatorcustomization.defaultbody = bodymodelname;
    self.operatorcustomization.head = head;
    self.operatorcustomization.defaulthead = headmodelname;
    self.operatorcustomization.vm = viewmodelname;
    self.operatorcustomization.defaultvm = var_e69fcb0bb9e108b;
    if (istrue(game["isLaunchChunk"])) {
        if (isbot(self)) {
            if (self.team == "allies") {
                self.operatorcustomization.voice = "ukft1";
            } else {
                self.operatorcustomization.voice = "ruft1";
            }
        }
    }
    if (!isagent(self) && !isbot(self) && !isdefined(self.vehiclecustomization) && !function_240f7f4e57340e8f()) {
        self.vehiclecustomization = scripts\cp_mp\vehicles\vehicle::function_1cd6d75165ecbc48();
    }
    if (self.operatorcustomization.gender == "female") {
        self function_555e2d32e2756625("female");
    } else {
        self function_555e2d32e2756625("");
    }
    function_1800697eba3f6660(self.operatorcustomization);
}

// Namespace loadout / namespace_751288259782653c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x32ad
// Size: 0x9e
function function_1800697eba3f6660(operatorcustomization) {
    var_cfbd5dfab1e96cb1 = getdvarint(@"hash_838359d5ebdcc7e0", 0);
    if (var_cfbd5dfab1e96cb1 == 0) {
        return;
    }
    if (!level.rankedmatch || !level.matchmakingmatch || !level.onlinestatsenabled) {
        return;
    }
    var_4a654bd9a395c1ff = [];
    var_4a654bd9a395c1ff[var_4a654bd9a395c1ff.size] = self.operatorcustomization.var_d947b7e87c7243ab;
    var_4a654bd9a395c1ff[var_4a654bd9a395c1ff.size] = namespace_38b993c4618e76cd::getlootidfromref(self.operatorcustomization.execution);
    self function_616c0ca219597829(var_4a654bd9a395c1ff);
}

// Namespace loadout / namespace_751288259782653c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3353
// Size: 0x118
function function_ed273e317490cb02(operatorref) {
    team = getoperatorteambyref(operatorref);
    if (getgametype() == "infect" && self.team == "axis") {
        self.pers["operatorSkinRef"] = "kreuger_eastern_a";
    } else if (isdefined(self.operatorcustomization) && isdefined(self.operatorcustomization.skinref)) {
        self.pers["operatorSkinRef"] = self.operatorcustomization.skinref;
    } else if (isai(self) || self isplayerheadless()) {
        self.pers["operatorSkinRef"] = botpickskinid(operatorref);
    } else if (function_240f7f4e57340e8f()) {
        self.pers["operatorSkinRef"] = namespace_465d40bb08a5337a::function_df7d12571397a2b5(operatorref);
    } else {
        self.pers["operatorSkinRef"] = namespace_465d40bb08a5337a::function_b3b2c9581b1eea75(operatorref);
    }
    return self.pers["operatorSkinRef"];
}

// Namespace loadout / namespace_751288259782653c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3474
// Size: 0x2e
function function_e8770349a2b50bec(skinref) {
    assert(!isnumber(skinref));
    geartype = namespace_465d40bb08a5337a::function_112bf281c4f02cd5(skinref);
    return geartype;
}

// Namespace loadout / namespace_751288259782653c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x34ab
// Size: 0x39
function getoperatorbrinfilsmokesuffix(skinref) {
    assert(!isnumber(skinref));
    if (scripts\cp_mp\utility\game_utility::isbrstylegametype()) {
        suffix = namespace_465d40bb08a5337a::function_3d7626401bb1161a(skinref);
        return suffix;
    }
    return undefined;
}

// Namespace loadout / namespace_751288259782653c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x34ed
// Size: 0x3a
function function_7fdd3f9148f37ece(suit) {
    if (isdefined(self.suit) && self.suit == suit) {
        return;
    }
    self setsuit(suit);
    self.suit = suit;
}

// Namespace loadout / namespace_751288259782653c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x352f
// Size: 0x2e6
function lookupcurrentoperator(team) {
    if (!isplayer(self) && !isai(self)) {
        assertex(0, "Non Player or Agent has called LookupCurrentOperator()");
        return "";
    }
    operatorref = undefined;
    if (isdefined(self.var_dc196d396886fb97)) {
        operatorref = self.var_dc196d396886fb97.name;
    } else if (isdefined(self.operatorcustomization) && isdefined(self.operatorcustomization.operatorref)) {
        operatorref = self.operatorcustomization.operatorref;
    } else if (isai(self) || self isplayerheadless()) {
        if (isdefined(self.botoperatorref)) {
            operatorref = self.botoperatorref;
        } else {
            function_d650608c959c9675();
            if (!isdefined(self.botoperatorteam)) {
                self.botoperatorteam = self.team;
                if (!isdefined(level.var_b113f6fe0e7c93bf[self.botoperatorteam])) {
                    var_a35e0c377810107e = getarraykeys(level.var_b113f6fe0e7c93bf);
                    self.botoperatorteam = random(var_a35e0c377810107e);
                }
            }
            team = self.botoperatorteam;
            if (!isdefined(self.pers["operatorIndex"])) {
                selectedOperatorIndex = randomint(level.var_b113f6fe0e7c93bf[team].size);
                self.pers["operatorIndex"] = selectedOperatorIndex;
            } else {
                selectedOperatorIndex = self.pers["operatorIndex"];
            }
            currentindex = 0;
            foreach (operatorkey, var_eef96dced6dd39f1 in level.var_b113f6fe0e7c93bf[team]) {
                if (currentindex == selectedOperatorIndex) {
                    self.botoperatorref = operatorkey;
                    operatorref = operatorkey;
                    break;
                }
                currentindex++;
            }
        }
        if (!isdefined(operatorref) || operatorref == "") {
            assertmsg("Could not find operator reference on an AI Operator");
            operatorref = namespace_465d40bb08a5337a::function_9242a55834c7ead8(ter_op(team == "allies", 0, 1));
        }
    } else {
        selectedOperatorIndex = self getplayerdata(level.loadoutsgroup, "customizationSetup", "selectedOperatorIndex");
        var_e9a5f25420e74f74 = selectedOperatorIndex;
        if (!isdefined(self.defaultoperatorteam)) {
            if (var_e9a5f25420e74f74 == 0) {
                self.defaultoperatorteam = "allies";
            } else {
                self.defaultoperatorteam = "axis";
            }
        }
        operatorref = self getplayerdata(level.loadoutsgroup, "customizationSetup", "operators", var_e9a5f25420e74f74);
        if (!isdefined(operatorref) || operatorref == "") {
            assertmsg("Could not find operator reference on a Player Operator");
            operatorref = namespace_465d40bb08a5337a::function_9242a55834c7ead8(var_e9a5f25420e74f74);
        }
    }
    return operatorref;
}

// Namespace loadout / namespace_751288259782653c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x381e
// Size: 0x254
function function_d650608c959c9675() {
    if (isdefined(level.var_b113f6fe0e7c93bf)) {
        return;
    }
    level.var_b113f6fe0e7c93bf = [];
    setdvar(@"hash_2b669ad6c3e1d864", 1);
    setdvarifuninitialized(@"hash_98c5cadf936aeb15", "");
    var_b96bb7cc6652f794 = ["shared_iw9_t10"];
    var_4d466347829517d4 = getdvar(@"hash_98c5cadf936aeb15", "");
    if (var_4d466347829517d4 != "") {
        var_3f859a3d7af673e9 = strtok(var_4d466347829517d4, " ");
        var_b96bb7cc6652f794 = scripts\engine\utility::array_combine(var_b96bb7cc6652f794, var_3f859a3d7af673e9);
    }
    foreach (operatorref in namespace_465d40bb08a5337a::function_462ac94dd54da47d()) {
        if (!isdefined(operatorref) || operatorref == "") {
            break;
        }
        botgroup = namespace_465d40bb08a5337a::function_efe20cf7f3e2a003(operatorref);
        if (array_contains(var_b96bb7cc6652f794, botgroup)) {
            superfaction = getoperatorsuperfaction(operatorref);
            team = ter_op(superfaction == 0, "allies", "axis");
            unlocked = namespace_465d40bb08a5337a::function_422b054f4a5573e0(operatorref);
            if (unlocked) {
                if (!isdefined(level.var_b113f6fe0e7c93bf[team])) {
                    level.var_b113f6fe0e7c93bf[team] = [];
                }
                level.var_b113f6fe0e7c93bf[team][operatorref] = [];
            }
        }
    }
    foreach (skinref in namespace_465d40bb08a5337a::function_6ab347c553a20a68()) {
        canequip = namespace_465d40bb08a5337a::function_9c50981a840033dc(skinref);
        lootid = namespace_465d40bb08a5337a::function_7efecf1510ed84a1(skinref);
        if (!isdefined(skinref) || skinref == "") {
            break;
        }
        if (canequip) {
            operatorref = namespace_465d40bb08a5337a::function_605079124463a67b(skinref);
            team = getoperatorteambyref(operatorref);
            if (!isdefined(team)) {
                continue;
            }
            level.var_b113f6fe0e7c93bf[team][operatorref][level.var_b113f6fe0e7c93bf[team][operatorref].size] = lootid;
        }
    }
}

// Namespace loadout / namespace_751288259782653c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3a7a
// Size: 0x2b2
function lookupcurrentoperatorskin(team) {
    operatorref = lookupcurrentoperator(team);
    operatorSkinRef = undefined;
    clientnum = self getentitynumber();
    if (getdvarint(@"hash_338da2f6c53885e2", 1) == 1 && self isplayerheadless()) {
        if (!isdefined(level.playercustomizationdata[clientnum][team].operatorSkinRef)) {
            if (!isdefined(level.headlessoperatorcustomization)) {
                initheadlessoperatorcustomization();
            }
            curindex = level.headlessoperatorcustomization[operatorref]["curIndex"];
            level.playercustomizationdata[clientnum][team].operatorSkinRef = level.headlessoperatorcustomization[operatorref]["skinRefs"][curindex];
            level.headlessoperatorcustomization[operatorref]["curIndex"] = level.headlessoperatorcustomization[operatorref]["curIndex"] + 1;
            if (level.headlessoperatorcustomization[operatorref]["curIndex"] >= level.headlessoperatorcustomization[operatorref]["maxIndex"]) {
                level.headlessoperatorcustomization[operatorref]["curIndex"] = 0;
            }
        }
    } else if (!isdefined(level.playercustomizationdata[clientnum][team].operatorSkinRef)) {
        if (isai(self)) {
            if (!isdefined(self.botskinid)) {
                botpickskinid(operatorref);
            }
            level.playercustomizationdata[clientnum][team].operatorSkinRef = self.botskinid;
        } else if (isdefined(self.var_dc196d396886fb97)) {
            level.playercustomizationdata[clientnum][team].operatorSkinRef = self.var_dc196d396886fb97.var_9ba0ad9dcf55406e;
        } else if (function_240f7f4e57340e8f()) {
            level.playercustomizationdata[clientnum][team].operatorSkinRef = namespace_465d40bb08a5337a::function_df7d12571397a2b5(operatorref);
        } else {
            level.playercustomizationdata[clientnum][team].operatorSkinRef = namespace_465d40bb08a5337a::function_b3b2c9581b1eea75(operatorref);
        }
    }
    operatorSkinRef = level.playercustomizationdata[clientnum][team].operatorSkinRef;
    if (isai(self) && (!isdefined(operatorSkinRef) || operatorSkinRef == "") || !isdefined(operatorSkinRef) || operatorSkinRef == "") {
        if (isai(self)) {
            if (isdefined(self.botskinid)) {
                operatorSkinRef = self.botskinid;
            } else {
                botpickskinid(operatorref);
            }
        } else {
            operatorSkinRef = "shadow_smg_western_basic";
        }
    }
    if (isdefined(self.var_dc196d396886fb97)) {
        operatorSkinRef = self.var_dc196d396886fb97.var_9ba0ad9dcf55406e;
    }
    return operatorSkinRef;
}

// Namespace loadout / namespace_751288259782653c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3d35
// Size: 0x9c
function botpickskinid(operatorref) {
    team = self.team;
    if (isdefined(self.botoperatorteam)) {
        team = self.botoperatorteam;
    }
    if (!isdefined(self.pers["operatorSkinRef"])) {
        var_32d984c24ea6f4be = random(getarraykeys(level.operatorcustomization[team][operatorref]));
        self.pers["operatorSkinRef"] = var_32d984c24ea6f4be;
    } else {
        var_32d984c24ea6f4be = self.pers["operatorSkinRef"];
    }
    self.botskinid = var_32d984c24ea6f4be;
}

// Namespace loadout / namespace_751288259782653c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3dd9
// Size: 0x116
function initheadlessoperatorcustomization() {
    if (isdefined(level.headlessoperatorcustomization)) {
        return;
    }
    level.headlessoperatorcustomization = [];
    foreach (skinref in namespace_465d40bb08a5337a::function_6ab347c553a20a68()) {
        if (namespace_465d40bb08a5337a::function_9e28d6dc0ac60d69(skinref) != "") {
            operatorref = namespace_465d40bb08a5337a::function_605079124463a67b(skinref);
            if (!isdefined(level.headlessoperatorcustomization[operatorref])) {
                level.headlessoperatorcustomization[operatorref]["skinRefs"] = [];
                level.headlessoperatorcustomization[operatorref]["curIndex"] = 0;
                level.headlessoperatorcustomization[operatorref]["maxIndex"] = 0;
            }
            level.headlessoperatorcustomization[operatorref]["skinRefs"][level.headlessoperatorcustomization[operatorref]["skinRefs"].size] = skinref;
            level.headlessoperatorcustomization[operatorref]["maxIndex"] = level.headlessoperatorcustomization[operatorref]["maxIndex"] + 1;
        }
    }
}

// Namespace loadout / namespace_751288259782653c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3ef7
// Size: 0x1bd
function initoperatorcustomization() {
    if (isdefined(level.operatorcustomization)) {
        return;
    }
    level.operatorcustomization = [];
    setdvar(@"hash_2b669ad6c3e1d864", 1);
    operatorrefs = namespace_465d40bb08a5337a::function_462ac94dd54da47d();
    foreach (operatorref in operatorrefs) {
        if (!isdefined(operatorref) || operatorref == "") {
            break;
        }
        superfaction = getoperatorsuperfaction(operatorref);
        team = ter_op(superfaction == 0, "allies", "axis");
        unlocked = namespace_465d40bb08a5337a::function_422b054f4a5573e0(operatorref);
        if (unlocked) {
            if (!isdefined(level.operatorcustomization[team])) {
                level.operatorcustomization[team] = [];
            }
            level.operatorcustomization[team][operatorref] = [];
        }
    }
    foreach (skinref in namespace_465d40bb08a5337a::function_6ab347c553a20a68()) {
        operatorref = namespace_465d40bb08a5337a::function_605079124463a67b(skinref);
        body = namespace_465d40bb08a5337a::function_8eba78e65f4be793(skinref);
        head = namespace_465d40bb08a5337a::function_223061772e2a61b9(skinref);
        team = getoperatorteambyref(operatorref);
        if (!isdefined(team)) {
            continue;
        }
        customization = [];
        customization[0] = body;
        customization[1] = head;
        level.operatorcustomization[team][operatorref][skinref] = customization;
    }
}

// Namespace loadout / namespace_751288259782653c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x40bc
// Size: 0x9f
function getoperatorteambyref(operatorref) {
    foreach (operators in level.operatorcustomization) {
        foreach (operatorskins in operators) {
            if (operator == operatorref) {
                return team;
            }
        }
    }
    return undefined;
}

// Namespace loadout / namespace_751288259782653c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4164
// Size: 0x7d
function getcustomization() {
    customization = [];
    if (isdefined(self.operatorcustomization)) {
        customization["body"] = self.operatorcustomization.body;
        customization["head"] = self.operatorcustomization.head;
    } else {
        data = getoperatorcustomization();
        customization["body"] = data[0];
        customization["head"] = data[1];
    }
    return customization;
}

// Namespace loadout / namespace_751288259782653c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x41ea
// Size: 0x58c
function getoperatorcustomization() {
    customization = [];
    body = undefined;
    head = undefined;
    if (istrue(game["isLaunchChunk"])) {
        initlaunchchunkoperatorskins();
        if (!isdefined(self.pers["defaultOperatorSkinIndex"])) {
            self.pers["defaultOperatorSkinIndex"] = picklaunchchunkoperatorskin(self.team);
        }
        body = level.defaultoperatorskins[self.team]["body"][self.pers["defaultOperatorSkinIndex"]];
        head = level.defaultoperatorskins[self.team]["head"][self.pers["defaultOperatorSkinIndex"]];
        customization[0] = body;
        customization[1] = head;
    } else {
        operatorSkinRef = undefined;
        if (!isdefined(self.operatorcustomization)) {
            createoperatorcustomization();
        }
        operatorSkinRef = self.operatorcustomization.skinref;
        if (isdefined(self.var_dc196d396886fb97)) {
            operatorSkinRef = self.var_dc196d396886fb97.var_9ba0ad9dcf55406e;
        }
        if (isdefined(level.modegetforceoperatorcustomization)) {
            operatorref = function_1b5c55cb118d5cb4(operatorSkinRef);
            var_c00a2f624996341c = [[ level.modegetforceoperatorcustomization ]](self, operatorref, operatorSkinRef);
            operatorSkinRef = var_c00a2f624996341c[1];
            operatorref = var_c00a2f624996341c[0];
        }
        if (operatorSkinRef == "274" || operatorSkinRef == "275") {
            initdefaultoperatorskins();
            var_3060e7b91e020425 = level.teambased && !scripts\cp_mp\utility\game_utility::isbrstylegametype();
            if (!isdefined(self.defaultoperatorteam) || var_3060e7b91e020425 && self.defaultoperatorteam != self.team && (self.team == "allies" || self.team == "axis")) {
                self.defaultoperatorteam = self.team;
                if (self.team != "allies" && self.team != "axis") {
                    self.defaultoperatorteam = ter_op(cointoss(), "allies", "axis");
                }
            }
            if (!isdefined(self.pers["defaultOperatorSkinIndex"])) {
                self.pers["defaultOperatorSkinIndex"] = randomint(level.defaultoperatorskins[self.defaultoperatorteam]["body"].size);
            }
            body = level.defaultoperatorskins[self.defaultoperatorteam]["body"][self.pers["defaultOperatorSkinIndex"]];
            if (!isdefined(self.pers["defaultOperatorHeadIndex"])) {
                self.pers["defaultOperatorHeadIndex"] = randomint(level.defaultoperatorskins[self.defaultoperatorteam]["head"][self.pers["defaultOperatorSkinIndex"]].size);
            }
            head = level.defaultoperatorskins[self.defaultoperatorteam]["head"][self.pers["defaultOperatorSkinIndex"]][self.pers["defaultOperatorHeadIndex"]];
        } else {
            body = namespace_465d40bb08a5337a::function_8eba78e65f4be793(operatorSkinRef);
            head = namespace_465d40bb08a5337a::function_223061772e2a61b9(operatorSkinRef);
            if (function_138028ca2b958511()) {
                if (isdefined(self.var_dc196d396886fb97)) {
                    switch (self.var_dc196d396886fb97.name) {
                    case #"hash_5c8dc5ca28a25ca3": 
                        head = "head_hero_price_lod";
                        body = "body_mp_price_highrise";
                        self.var_dc196d396886fb97.var_dfa2e3093d69c2f3 = 1;
                        self.var_dc196d396886fb97.var_bd1057014361ee4 = "head_hero_price_lod";
                        self.var_dc196d396886fb97.var_513025047d19dd6e = "body_mp_price_highrise";
                        self.var_dc196d396886fb97.var_7daca24cff128e1b = "mp_vm_arms_price_iw9_highrise";
                        break;
                    case #"hash_3e16212fa7d1d2d8": 
                        head = "head_mp_kyle_iw9_convoy_hat";
                        body = "body_mp_kyle_highrise";
                        self.var_dc196d396886fb97.var_bd1057014361ee4 = "head_mp_kyle_iw9_convoy_hat";
                        self.var_dc196d396886fb97.var_513025047d19dd6e = "body_mp_kyle_highrise";
                        self.var_dc196d396886fb97.var_7daca24cff128e1b = "mp_vm_arms_kyle_iw9_higrise";
                        self.var_dc196d396886fb97.var_dfa2e3093d69c2f3 = 1;
                        break;
                    case #"hash_de84392651a76416": 
                        head = "head_cp_farah_iw9_1_1";
                        body = "body_mp_farah_iw9_1_1";
                        self.var_dc196d396886fb97.var_bd1057014361ee4 = "head_cp_farah_iw9_1_1";
                        self.var_dc196d396886fb97.var_513025047d19dd6e = "body_mp_farah_iw9_1_1";
                        self.var_dc196d396886fb97.var_7daca24cff128e1b = "mp_vm_arms_farah_iw9_1_1";
                        self.var_dc196d396886fb97.var_dfa2e3093d69c2f3 = 1;
                        break;
                    }
                }
            }
        }
        if (body == "" || head == "") {
            assertmsg("Body or Head came back empty, May need to resetstats. Head is " + head + " Body is " + body);
            var_f91a44e31cde7d97 = namespace_465d40bb08a5337a::function_df7d12571397a2b5(self.operatorcustomization.operatorref);
            body = namespace_465d40bb08a5337a::function_8eba78e65f4be793(var_f91a44e31cde7d97);
            head = namespace_465d40bb08a5337a::function_223061772e2a61b9(var_f91a44e31cde7d97);
        }
        self.bodymodelname = body;
        self.backuphead = head;
        customization[0] = body;
        customization[1] = head;
    }
    return customization;
}

// Namespace loadout / namespace_751288259782653c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x477f
// Size: 0x120
function initlaunchchunkoperatorskins() {
    if (isdefined(level.defaultoperatorskins)) {
        return;
    }
    level.defaultoperatorskins = [];
    level.defaultoperatorskins["allies"] = [];
    level.defaultoperatorskins["allies"]["body"] = ["body_mp_western_fireteam_west_dmr_1_1_lod1", "body_mp_western_fireteam_west_ar_1_1_lod1"];
    level.defaultoperatorskins["allies"]["head"] = ["head_mp_western_fireteam_west_dmr_2_1", "head_mp_western_fireteam_west_ar_1_1"];
    level.defaultoperatorskins["allies"]["suit"] = ["iw8_suit_mp_wyatt"];
    level.defaultoperatorskins["axis"] = [];
    level.defaultoperatorskins["axis"]["body"] = ["body_mp_eastern_fireteam_east_ar_lod1", "body_mp_eastern_fireteam_east_lmg_lod1"];
    level.defaultoperatorskins["axis"]["head"] = ["head_mp_eastern_fireteam_east_ar_2", "head_mp_eastern_fireteam_east_lmg"];
    level.defaultoperatorskins["axis"]["suit"] = ["iw8_suit_mp_wyatt"];
}

// Namespace loadout / namespace_751288259782653c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x48a7
// Size: 0x98
function picklaunchchunkoperatorskin(team) {
    if (!isdefined(level.launchchunkskins)) {
        level.launchchunkskins = [];
        level.launchchunkskins["allies"] = 0;
        level.launchchunkskins["axis"] = 0;
    }
    if (!isdefined(self.launchchunkcustomizationindex)) {
        if (level.launchchunkskins[team] == 2) {
            level.launchchunkskins[team] = 0;
        }
        self.launchchunkcustomizationindex = level.launchchunkskins[team];
        level.launchchunkskins[team]++;
    }
    return self.launchchunkcustomizationindex;
}

// Namespace loadout / namespace_751288259782653c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4948
// Size: 0x4a
function function_6c2ae2b932a9fd51() {
    if (isdefined(self.operatorcustomization)) {
        if (isdefined(self.operatorcustomization.operatorref)) {
            if (issubstr(self.operatorcustomization.operatorref, "milsim")) {
                return true;
            }
        }
    }
    return false;
}

// Namespace loadout / namespace_751288259782653c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x499b
// Size: 0x30b
function initdefaultoperatorskins() {
    if (isdefined(level.defaultoperatorskins)) {
        return;
    }
    level.defaultoperatorskins = [];
    level.defaultoperatorskins["allies"] = [];
    level.defaultoperatorskins["allies"]["body"] = ["body_mp_western_fireteam_west_ar_1_1_lod1", "body_mp_western_fireteam_west_smg_1_1_lod1", "body_mp_western_fireteam_west_dmr_1_1_lod1", "body_mp_western_fireteam_west_lmg_1_1_lod1", "body_mp_western_fireteam_west_sg_1_1_lod1"];
    level.defaultoperatorskins["allies"]["head"][0] = ["head_mp_western_fireteam_west_ar_1_1", "head_mp_western_fireteam_west_ar_2_1"];
    level.defaultoperatorskins["allies"]["head"][1] = ["head_mp_western_fireteam_west_smg_1_1", "head_mp_western_fireteam_west_smg_2_1"];
    level.defaultoperatorskins["allies"]["head"][2] = ["head_mp_western_fireteam_west_dmr_1_1", "head_mp_western_fireteam_west_dmr_2_1"];
    level.defaultoperatorskins["allies"]["head"][3] = ["head_mp_western_fireteam_west_lmg_1_1", "head_mp_western_fireteam_west_lmg_2_1"];
    level.defaultoperatorskins["allies"]["head"][4] = ["head_mp_western_fireteam_west_sg_1_1", "head_mp_western_fireteam_west_sg_2_1"];
    level.defaultoperatorskins["allies"]["suit"] = ["iw9_suit_generic_west_mp", "iw9_suit_generic_west_mp", "iw9_suit_generic_west_mp", "iw9_suit_generic_west_mp", "iw9_suit_generic_west_mp"];
    level.defaultoperatorskins["axis"] = [];
    level.defaultoperatorskins["axis"]["body"] = ["body_mp_eastern_fireteam_east_ar_lod1", "body_mp_eastern_fireteam_east_smg_lod1", "body_mp_eastern_fireteam_east_dmr_lod1", "body_mp_eastern_fireteam_east_lmg_lod1", "body_mp_eastern_fireteam_east_sg_lod1"];
    level.defaultoperatorskins["axis"]["head"][0] = ["head_mp_eastern_fireteam_east_ar_1", "head_mp_eastern_fireteam_east_ar_2", "head_mp_eastern_fireteam_east_ar_3", "head_mp_eastern_fireteam_east_ar_4"];
    level.defaultoperatorskins["axis"]["head"][1] = ["head_mp_eastern_fireteam_east_smg_1", "head_mp_eastern_fireteam_east_smg_2", "head_mp_eastern_fireteam_east_smg_3"];
    level.defaultoperatorskins["axis"]["head"][2] = ["head_mp_eastern_fireteam_east_dmr"];
    level.defaultoperatorskins["axis"]["head"][3] = ["head_mp_eastern_fireteam_east_lmg", "head_mp_eastern_fireteam_east_nvg_1"];
    level.defaultoperatorskins["axis"]["head"][4] = ["head_mp_eastern_fireteam_east_sg"];
    level.defaultoperatorskins["axis"]["suit"] = ["iw9_suit_generic_west_mp", "iw9_suit_generic_west_mp", "iw9_suit_generic_west_mp", "iw9_suit_generic_west_mp", "iw9_suit_generic_west_mp"];
}

// Namespace loadout / namespace_751288259782653c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4cae
// Size: 0x1e
function function_ada9a2308a4046e2(operatorref) {
    suit = namespace_465d40bb08a5337a::function_ada9a2308a4046e2(operatorref);
    return suit;
}

// Namespace loadout / namespace_751288259782653c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4cd5
// Size: 0x40
function getoperatorexecution(operatorref) {
    if (function_240f7f4e57340e8f()) {
        self.loadoutexecution = namespace_465d40bb08a5337a::function_a9722d35258230d2(operatorref);
    } else {
        self.loadoutexecution = namespace_465d40bb08a5337a::function_5e2fa33279816be2(operatorref);
    }
    return self.loadoutexecution;
}

// Namespace loadout / namespace_751288259782653c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4d1e
// Size: 0x40
function getoperatorexecutionquip(operatorref) {
    if (function_240f7f4e57340e8f()) {
        self.loadoutexecutionquip = namespace_465d40bb08a5337a::function_179d82270f3ce3bf(operatorref);
    } else {
        self.loadoutexecutionquip = namespace_465d40bb08a5337a::function_ac45022bf37cddfb(operatorref);
    }
    return self.loadoutexecutionquip;
}

// Namespace loadout / namespace_751288259782653c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4d67
// Size: 0x23
function getoperatorsuperfaction(operatorref) {
    faction = namespace_465d40bb08a5337a::getoperatorsuperfaction(operatorref);
    return int(faction);
}

// Namespace loadout / namespace_751288259782653c
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4d93
// Size: 0x26
function getoperatorvoice(operatorref, operatorskin) {
    voice = namespace_465d40bb08a5337a::getoperatorvoice(operatorref);
    return voice;
}

// Namespace loadout / namespace_751288259782653c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4dc2
// Size: 0x2e
function getoperatorclothtype(skinref) {
    assert(!isnumber(skinref));
    clothtype = namespace_465d40bb08a5337a::function_32d5918a7844bd9a(skinref);
    return clothtype;
}

// Namespace loadout / namespace_751288259782653c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4df9
// Size: 0x12
function function_29b2af59258d6501(skinref) {
    return namespace_465d40bb08a5337a::function_7efecf1510ed84a1(skinref);
}

// Namespace loadout / namespace_751288259782653c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4e14
// Size: 0x12
function function_1b5c55cb118d5cb4(skinref) {
    return namespace_465d40bb08a5337a::function_605079124463a67b(skinref);
}

// Namespace loadout / namespace_751288259782653c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4e2f
// Size: 0x1e
function getoperatorgender(operatorref) {
    gender = namespace_465d40bb08a5337a::getoperatorgender(operatorref);
    return gender;
}

// Namespace loadout / namespace_751288259782653c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4e56
// Size: 0x2
function get_player_character_num() {
    
}

// Namespace loadout / namespace_751288259782653c
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x4e60
// Size: 0x7d
function setcharactermodels(bodymodelname, headmodelname, viewmodelname, hairmodel) {
    if (isdefined(self.headmodel)) {
        self detach(self.headmodel);
    }
    self setmodel(bodymodelname);
    self setviewmodel(viewmodelname);
    self attach(headmodelname, "", 1);
    self.bodymodel = bodymodelname;
    self.headmodel = headmodelname;
    self.viewmodel = viewmodelname;
}

// Namespace loadout / namespace_751288259782653c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4ee5
// Size: 0x12
function getplayerfoleytype(skinref) {
    return getoperatorclothtype(skinref);
}

// Namespace loadout / namespace_751288259782653c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4f00
// Size: 0x1b4
function updatemovespeedscale() {
    speedperc = undefined;
    if (isdefined(self.playerstreakspeedscale)) {
        speedperc = 1;
        speedperc += self.playerstreakspeedscale;
    } else {
        speedperc = getplayerspeedbyweapon(self);
        if (isdefined(self.chargemode_speedscale)) {
            speedperc = self.chargemode_speedscale;
        } else if (isdefined(self.siege_speedscale)) {
            speedperc = self.siege_speedscale;
        } else if (isdefined(self.overrideweaponspeed_speedscale)) {
            speedperc = self.overrideweaponspeed_speedscale;
        }
        chilldata = self.chill_data;
        if (isdefined(chilldata) && isdefined(chilldata.speedmod)) {
            speedperc += chilldata.speedmod;
        }
        if (isdefined(self.speedstripmod)) {
            speedperc += self.speedstripmod;
        }
        if (isdefined(self.phasespeedmod)) {
            speedperc += self.phasespeedmod;
        }
        if (isdefined(self.weaponaffinityspeedboost)) {
            speedperc += self.weaponaffinityspeedboost;
        }
        if (isdefined(self.weaponpassivespeedmod)) {
            speedperc += self.weaponpassivespeedmod;
        }
        if (isdefined(self.weaponpassivespeedonkillmod)) {
            speedperc += self.weaponpassivespeedonkillmod;
        }
        speedperc = min(1.5, speedperc);
    }
    self.weaponspeed = speedperc;
    assert(isdefined(self.weaponspeed));
    assert(isdefined(self.movespeedscaler));
    if (!isdefined(self.combatspeedscalar)) {
        self.combatspeedscalar = 1;
    }
    self setmovespeedscale(speedperc * self.movespeedscaler * self.combatspeedscalar);
}

// Namespace loadout / namespace_751288259782653c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x50bc
// Size: 0x14d
function getplayerspeedbyweapon(player) {
    weaponspeed = 1;
    self.weaponlist = self getweaponslistprimaries();
    if (!self.weaponlist.size) {
        weaponspeed = 0.9;
    } else {
        weapon = self getcurrentweapon();
        if (issuperweapon(weapon)) {
            weaponspeed = level.superweapons[getcompleteweaponname(weapon)].movespeed;
        } else {
            var_a6852f8e66761e58 = weaponinventorytype(weapon);
            if (var_a6852f8e66761e58 != "primary" && var_a6852f8e66761e58 != "altmode") {
                if (isdefined(self.saved_lastweapon)) {
                    weapon = self.saved_lastweapon;
                } else {
                    weapon = undefined;
                }
            }
            if (!isdefined(weapon) || !self hasweapon(weapon)) {
                weaponspeed = getweaponspeedslowest();
            } else {
                weaponspeed = getweaponspeed(weapon);
                /#
                    if (!isdefined(weaponspeed) || weaponspeed == 0) {
                        weaponspeed = 1;
                    }
                #/
                if (scripts\cp_mp\utility\game_utility::function_b2c4b42f9236924()) {
                    class = weaponclass(weapon);
                    if (isdefined(level.var_26109c02a53cea84) && isdefined(level.var_26109c02a53cea84[class])) {
                        weaponspeed = level.var_26109c02a53cea84[class];
                    }
                }
            }
        }
    }
    weaponspeed = clampweaponspeed(weaponspeed);
    return weaponspeed;
}

// Namespace loadout / namespace_751288259782653c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5212
// Size: 0x88
function getweaponspeed(weapon) {
    rootweapon = getbaseweaponname(weapon);
    weaponspeed = 1;
    if (isdefined(rootweapon) && isdefined(level.weaponmapdata) && isdefined(level.weaponmapdata[rootweapon]) && isdefined(level.weaponmapdata[rootweapon].speed)) {
        weaponspeed = level.weaponmapdata[rootweapon].speed;
        if (!isdefined(weaponspeed)) {
            weaponspeed = 1;
        }
    }
    return weaponspeed;
}

// Namespace loadout / namespace_751288259782653c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x52a3
// Size: 0xca
function getweaponspeedslowest() {
    var_6155ff1652d3374f = 2;
    self.weaponlist = self getweaponslistprimaries();
    if (self.weaponlist.size) {
        foreach (weapon in self.weaponlist) {
            weaponspeed = getweaponspeed(weapon);
            if (weaponspeed == 0) {
                continue;
            }
            if (weaponspeed < var_6155ff1652d3374f) {
                var_6155ff1652d3374f = weaponspeed;
            }
        }
        /#
            if (var_6155ff1652d3374f == 2) {
                assertmsg("<dev string:x1c>");
            }
        #/
    } else {
        var_6155ff1652d3374f = 0.9;
    }
    var_6155ff1652d3374f = clampweaponspeed(var_6155ff1652d3374f);
    return var_6155ff1652d3374f;
}

// Namespace loadout / namespace_751288259782653c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5376
// Size: 0x3d
function clampweaponspeed(value) {
    assertex(value >= 0 && value <= 1, "clampWeaponSpeed() passed invalid value: " + value);
    return clamp(value, 0, 1);
}

// Namespace loadout / namespace_751288259782653c
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x53bc
// Size: 0x94
function wait_and_force_weapon_switch(starting_weapon, var_2fbb377edfb4215d) {
    level endon("game_ended");
    self endon("death_or_disconnect");
    wait 0.5;
    weapon_list = self getweaponslistprimaries();
    if (!isdefined(weapon_list) || weapon_list.size <= 0 || !isdefined(starting_weapon)) {
        return;
    }
    if (!istrue(var_2fbb377edfb4215d)) {
        add_ammo_if_needed(weapon_list);
    }
    if (!self hasweapon(starting_weapon)) {
        starting_weapon = weapon_list[0];
        if (starting_weapon.basename == "iw9_me_diveknife_mp" && isdefined(weapon_list[1])) {
            starting_weapon = weapon_list[1];
        }
    }
    self setspawnweapon(starting_weapon);
}

// Namespace loadout / namespace_751288259782653c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5458
// Size: 0x75
function add_ammo_if_needed(weapon_list) {
    if (isdefined(self.perk_data) && istrue(self.perk_data["weapons_have_full_ammo"])) {
        foreach (weapon in weapon_list) {
            function_ad3ce5e1679df13d(weapon);
        }
    }
}

// Namespace loadout / namespace_751288259782653c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x54d5
// Size: 0x160
function function_37640f469a0bd7b4() {
    level endon("game_ended");
    self endon("death_or_disconnect");
    self endon("force_bleed_out");
    self endon("last_stand");
    self endon("revive_success");
    if (game["state"] != "postgame") {
        if (isdefined(level.player_suit)) {
            function_7fdd3f9148f37ece(level.player_suit);
            self.suit = level.player_suit;
        } else if (isdefined(self.operatorcustomization) && isdefined(self.operatorcustomization.suit) && self.operatorcustomization.suit != "") {
            function_7fdd3f9148f37ece(self.operatorcustomization.suit);
            self.suit = self.operatorcustomization.suit;
        } else {
            function_7fdd3f9148f37ece("iw9_suit_cp");
            self.suit = "iw9_suit_cp";
        }
    }
    self allowslide(1);
    self allowmantle(1);
    if (namespace_1f50a6a7107e9381::function_c4fd5298f57f111()) {
        var_50a1492d3aaabb79 = namespace_1f50a6a7107e9381::function_7b2a99b6a0ec3642();
        if (isdefined(var_50a1492d3aaabb79) && var_50a1492d3aaabb79.size > 0) {
            for (i = 0; i < var_50a1492d3aaabb79.size; i++) {
                giveperk(var_50a1492d3aaabb79[i]);
            }
        }
    }
    self notify("set_player_perks");
}

// Namespace loadout / namespace_751288259782653c
// Params 17, eflags: 0x0
// Checksum 0x0, Offset: 0x563d
// Size: 0x172
function registerplayercharacter(character_index, var_80d695139e2ad462, body_model, view_model, head_model, hair_model, vo_prefix, vo_suffix, pap_gesture, revive_gesture, photo_index, fate_card_weapon, intro_music, intro_gesture, melee_weapon, post_setup_func, starting_weapon) {
    var_e060043ac076039 = spawnstruct();
    var_e060043ac076039.body_model = body_model;
    var_e060043ac076039.view_model = view_model;
    var_e060043ac076039.head_model = head_model;
    var_e060043ac076039.hair_model = hair_model;
    var_e060043ac076039.vo_prefix = vo_prefix;
    var_e060043ac076039.vo_suffix = vo_suffix;
    var_e060043ac076039.pap_gesture = pap_gesture;
    var_e060043ac076039.revive_gesture = revive_gesture;
    var_e060043ac076039.photo_index = photo_index;
    var_e060043ac076039.fate_card_weapon = fate_card_weapon;
    var_e060043ac076039.intro_music = intro_music;
    var_e060043ac076039.intro_gesture = intro_gesture;
    var_e060043ac076039.melee_weapon = makeweaponfromstring(melee_weapon);
    var_e060043ac076039.starting_weapon = makeweaponfromstring(starting_weapon);
    var_e060043ac076039.post_setup_func = post_setup_func;
}

// Namespace loadout / namespace_751288259782653c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x57b7
// Size: 0x38
function testclient_run_funcs() {
    if (!istestclient(self)) {
        return;
    }
    if (getdvarint(@"hash_a31a2982a3eb161d", 0) > 0) {
        return;
    }
    thread notify_delay("loadout_given", 7);
    thread testclient_dev_laststand();
}

// Namespace loadout / namespace_751288259782653c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x57f7
// Size: 0xeb
function testclient_dev_laststand() {
    level endon("game_ended");
    self endon("disconnect");
    var_b9c45882c66b8295 = 0;
    if (getdvarint(@"hash_42e908dd6c9a5170", 0) > 0) {
        var_b9c45882c66b8295 = 1;
    }
    wait 5;
    announcement("^2Testclient setting loadout...");
    wait 5;
    if (istestclient(self)) {
        thread testclient_ignoreme_dvar();
    }
    while (true) {
        if (getdvarint(@"hash_42e908dd6c9a5170", 0) == 0) {
            waitframe();
            continue;
        }
        if (var_b9c45882c66b8295 == 2) {
            waittill_any_3("landed_after_respawn", "revive_done", "revive");
            wait 7.5;
        }
        if (scripts\cp_mp\utility\player_utility::_isalive()) {
            self dodamage(self.health + 1, self.origin, self);
            announcement("^1TestClient Downed");
        }
        if (var_b9c45882c66b8295 == 0) {
            setdvar(@"hash_42e908dd6c9a5170", 0);
        }
        if (var_b9c45882c66b8295 == 1) {
            var_b9c45882c66b8295 = 2;
        }
    }
}

// Namespace loadout / namespace_751288259782653c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x58ea
// Size: 0x25
function testclient_ignoreme_dvar() {
    if (getdvarint(@"hash_bb2888f50eae5956", 0) == 0) {
        return;
    }
    wait 3;
    self.ignoreme = 1;
}

// Namespace loadout / namespace_751288259782653c
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x5917
// Size: 0x181
function change_loadout_watcher(player, value) {
    level endon("game_ended");
    player endon("disconnect");
    while (true) {
        channel, value = self waittill("luinotifyserver");
        if (isdefined(channel)) {
            switch (channel) {
            case #"hash_10663f471d3a3f88":
            case #"hash_1100a9df4db9dda4":
            case #"hash_58165056aeb81d28": 
                if (is_player_carrying_special_item()) {
                    self notify("switched_from_core");
                }
                if (channel == "class_select") {
                    if (value >= 100) {
                        classindex = value - 100;
                    } else {
                        classindex = undefined;
                    }
                    if (namespace_d4aab8c9cb8ecb14::player_in_laststand(self)) {
                        self notify("loadout_menu_closed");
                    } else {
                        self.changing_loadout = 1;
                        self.defaultclassindex = classindex;
                        if (ent_flag_exist("player_spawned_with_loadout") && ent_flag("player_spawned_with_loadout")) {
                            self [[ level.custom_giveloadout ]](0, undefined, classindex, 1);
                        } else {
                            self [[ level.custom_giveloadout ]](0, undefined, classindex);
                        }
                        thread display_relics_splash(self, 5);
                    }
                }
                if (channel == "class_menu_closed") {
                    self notify("loadout_menu_closed");
                }
                break;
            case #"hash_7c8c1130ab8a7c58": 
                namespace_44edfb3e2b433c17::give_player_super();
                break;
            case #"hash_d8f95f32fb6eb1d5": 
                total_slots = self getplayerdata("cp", "inventorySlots", "totalSlots");
                namespace_94359011b63230a6::reset_munitions(self, total_slots);
                break;
            }
        }
    }
}

// Namespace loadout / namespace_751288259782653c
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x5aa0
// Size: 0x53
function display_relics_splash(player, time) {
    wait 1.5;
    if (isdefined(level.set_relics) && level.set_relics.size > 0) {
        player setclientomnvar("ui_match_start_countdown", time);
        wait time;
        player setclientomnvar("ui_match_start_countdown", -1);
    }
}

// Namespace loadout / namespace_751288259782653c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5afb
// Size: 0x14
function is_player_carrying_special_item() {
    if (namespace_a0628d6954815ef8::player_has_minigun(self)) {
        return 1;
    }
    return 0;
}

// Namespace loadout / namespace_751288259782653c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5b17
// Size: 0x14
function drop_special_item() {
    if (namespace_a0628d6954815ef8::player_has_minigun(self)) {
        namespace_a0628d6954815ef8::drop_minigun(self);
    }
}

// Namespace loadout / namespace_751288259782653c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5b33
// Size: 0x2fb
function function_7da7bd24b280d295(var_69f988bdf6d3e44a) {
    if (!isdefined(self.pers)) {
        self.pers = [];
    }
    var_df06032cfa393863 = [];
    var_36a258e1e4dbe91 = self getweaponslistprimaries();
    for (i = 0; i < var_36a258e1e4dbe91.size; i++) {
        is_valid_weapon = 1;
        for (j = 0; j < level.additional_laststand_weapon_exclusion.size; j++) {
            if (issameweapon(level.additional_laststand_weapon_exclusion[j], var_36a258e1e4dbe91[i])) {
                is_valid_weapon = 0;
                break;
            }
        }
        var_c47024ab9c2e9dde = 0;
        if (isminigunweapon(var_36a258e1e4dbe91[i])) {
            is_valid_weapon = 0;
            var_c47024ab9c2e9dde = 1;
        }
        if (istrue(var_c47024ab9c2e9dde)) {
            var_df06032cfa393863[var_df06032cfa393863.size] = level.var_bcd25cd23011249["fists"];
        }
        if (is_valid_weapon) {
            var_df06032cfa393863[var_df06032cfa393863.size] = var_36a258e1e4dbe91[i];
        }
    }
    self.pers["loadout"] = var_df06032cfa393863;
    self.pers["powers"] = self.powers;
    self.pers["equipment"] = self.equipment;
    self.pers["last_checkpoint"] = "";
    checkpoint = scripts\cp\cp_checkpoint::function_9eed75023a958c18();
    if (isdefined(checkpoint) && checkpoint != "") {
        self.pers["last_checkpoint"] = checkpoint;
    }
    self.pers["last_checkpoint"] = "";
    checkpoint = scripts\cp\cp_checkpoint::function_9eed75023a958c18();
    if (isdefined(checkpoint) && checkpoint != "") {
        self.pers["last_checkpoint"] = checkpoint;
    }
    if (!istrue(var_69f988bdf6d3e44a)) {
        if (namespace_d4aab8c9cb8ecb14::hasselfrevivetoken()) {
            self.pers["has_revive_token"] = 1;
        } else {
            self.pers["has_revive_token"] = 0;
        }
    }
    if (isdefined(self.munition_slots) && !istrue(var_69f988bdf6d3e44a)) {
        munitions = [];
        foreach (var_a7f7342abaca0e34 in self.munition_slots) {
            munitions[munitions.size] = var_a7f7342abaca0e34.ref;
        }
        var_bbe818d3b1fce218 = [];
        foreach (var_a7f7342abaca0e34 in munitions) {
            var_bbe818d3b1fce218[var_bbe818d3b1fce218.size] = var_a7f7342abaca0e34;
        }
        self.pers["munitions"] = var_bbe818d3b1fce218;
    }
    if (isdefined(self.super)) {
        self.pers["super"] = self.super.supername;
    }
}

// Namespace loadout / namespace_751288259782653c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5e36
// Size: 0x96
function function_82ce5817a5c19f25() {
    var_3d6404612a600581 = [];
    foreach (equipment in self.equipment) {
        var_2eb625d9eaaa9671 = spawnstruct();
        var_2eb625d9eaaa9671.equipment = equipment;
        var_2eb625d9eaaa9671.count = namespace_4fb9dddfb8c1a67a::getequipmentammo(equipment);
        var_3d6404612a600581[slot] = var_2eb625d9eaaa9671;
    }
    self.var_1385a0c5d51c68f1 = var_3d6404612a600581;
}

// Namespace loadout / namespace_751288259782653c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5ed4
// Size: 0x195
function function_249f6d125aefb737(weaponlist) {
    sortedlist = [];
    var_31b2311acbc7abf4 = [];
    var_f5c04f15f6dbacab = [];
    var_a322a76afe84f375 = [];
    foreach (weapon in weaponlist) {
        if (!isweapon(weapon)) {
            continue;
        }
        if (weapon.inventorytype != "primary") {
            var_a322a76afe84f375[var_a322a76afe84f375.size] = weapon;
            continue;
        }
        if (weapon.classname == "pistol") {
            var_f5c04f15f6dbacab[var_f5c04f15f6dbacab.size] = weapon;
            continue;
        }
        var_31b2311acbc7abf4[var_31b2311acbc7abf4.size] = weapon;
    }
    foreach (weapon in var_31b2311acbc7abf4) {
        sortedlist[sortedlist.size] = weapon;
    }
    foreach (weapon in var_f5c04f15f6dbacab) {
        sortedlist[sortedlist.size] = weapon;
    }
    foreach (weapon in var_a322a76afe84f375) {
        sortedlist[sortedlist.size] = weapon;
    }
    return sortedlist;
}

// Namespace loadout / namespace_751288259782653c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6072
// Size: 0x5eb
function function_45a6143a0a99851d(player) {
    if (!isdefined(player.pers)) {
        player.pers = [];
    }
    if (!isdefined(player.pers["loadout"])) {
        return;
    }
    weaponlist = function_249f6d125aefb737(player.pers["loadout"]);
    var_98e31f0a4b5b4fd8 = 0;
    foreach (weapon in weaponlist) {
        if (isweapon(weapon) && weapon.inventorytype == "primary") {
            if (array_contains(level.var_d5ab05b7947de15a, weapon)) {
                continue;
            }
            if (!player hasweapon(weapon)) {
                player scripts\cp_mp\utility\inventory_utility::_giveweapon(weapon);
            }
            player setweaponammoclip(weapon, weaponclipsize(weapon));
            weaponammotype = namespace_6250b14b3f614101::br_ammo_type_for_weapon(weapon);
            if (isdefined(weaponammotype)) {
                maxstock = namespace_6250b14b3f614101::function_ecdfc73e68dcc209(weaponammotype);
                if (isdefined(maxstock)) {
                    namespace_6250b14b3f614101::br_ammo_give_type(player, weaponammotype, maxstock);
                }
            }
            if (!var_98e31f0a4b5b4fd8) {
                player.starting_weapon = weapon;
                player.primaryweaponobj = weapon;
                var_98e31f0a4b5b4fd8 = 1;
                continue;
            }
            player.secondaryweaponobj = weapon;
            player.default_starting_pistol = weapon;
            player.secondaryweaponobj = weapon;
        }
    }
    if (isdefined(player.pers["munitions"])) {
        munitions = player.pers["munitions"];
        foreach (var_a7f7342abaca0e34 in munitions) {
            if (isdefined(var_a7f7342abaca0e34.ref) && var_a7f7342abaca0e34.ref != "" && var_a7f7342abaca0e34.ref != "none") {
                player thread namespace_1f50a6a7107e9381::function_4a1fd54affdaa367(var_a7f7342abaca0e34.ref, 1, 1, 0, 1);
            }
            if (isdefined(var_a7f7342abaca0e34) && var_a7f7342abaca0e34 != "" && var_a7f7342abaca0e34 != "none") {
                player thread namespace_1f50a6a7107e9381::function_4a1fd54affdaa367(var_a7f7342abaca0e34, 1, 1, 0, 1);
            }
            if (isdefined(var_a7f7342abaca0e34.ref) && var_a7f7342abaca0e34.ref != "" && var_a7f7342abaca0e34.ref != "none") {
                player thread namespace_1f50a6a7107e9381::function_4a1fd54affdaa367(var_a7f7342abaca0e34.ref, 1, 1);
            }
        }
    }
    thread wait_and_force_weapon_switch(player.starting_weapon, 1);
    if (!isdefined(player.pers["powers"]) && !isdefined(player.pers["equipment"])) {
        return;
    }
    checkpoint = scripts\cp\cp_checkpoint::function_9eed75023a958c18();
    if (getdvarint(@"hash_bd445b33649ddb33", 0) && isdefined(player.pers["equipment"]) && isdefined(checkpoint)) {
        if (isdefined(player.pers["equipment"]["primary"])) {
            if (isstruct(player.pers["equipment"]["primary"]) && isdefined(player.pers["equipment"]["primary"].equipment)) {
                player thread namespace_4fb9dddfb8c1a67a::giveequipment(player.pers["equipment"]["primary"].equipment, "primary");
                player thread namespace_4fb9dddfb8c1a67a::setequipmentammo(player.pers["equipment"]["primary"].equipment, player.pers["equipment"]["primary"].count);
            } else {
                player thread namespace_4fb9dddfb8c1a67a::giveequipment(player.pers["equipment"]["primary"], "primary");
                player thread namespace_4fb9dddfb8c1a67a::setequipmentammo(player.pers["equipment"]["primary"], player namespace_4fb9dddfb8c1a67a::getequipmentmaxammo(player.pers["equipment"]["primary"]));
            }
        }
        if (isdefined(player.pers["equipment"]["secondary"])) {
            if (isstruct(player.pers["equipment"]["primary"]) && isdefined(player.pers["equipment"]["secondary"].equipment)) {
                player thread namespace_4fb9dddfb8c1a67a::giveequipment(player.pers["equipment"]["secondary"].equipment, "secondary");
                player thread namespace_4fb9dddfb8c1a67a::setequipmentammo(player.pers["equipment"]["secondary"].equipment, player.pers["equipment"]["secondary"].count);
                return;
            }
            player thread namespace_4fb9dddfb8c1a67a::giveequipment(player.pers["equipment"]["secondary"], "secondary");
            player thread namespace_4fb9dddfb8c1a67a::setequipmentammo(player.pers["equipment"]["secondary"], player namespace_4fb9dddfb8c1a67a::getequipmentmaxammo(player.pers["equipment"]["secondary"]));
        }
    }
}

// Namespace loadout / namespace_751288259782653c
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x6665
// Size: 0x1f9
function function_498b69e3a197b893(interaction, var_350509be582a5426, var_ec8578a96ed649bc) {
    self endon("disconnect");
    self endon("last_stand");
    level endon("game_ended");
    interaction.enable_func = &enableplayeruse;
    interaction.disable_func = &disableplayeruse;
    if (istrue(var_ec8578a96ed649bc)) {
        interaction.enable_func = &function_3d60a67e9d120aab;
        interaction.disable_func = &function_d9bed4675ea53492;
    }
    interaction [[ interaction.disable_func ]](self);
    level thread function_3151e0ce2d788cce(self, interaction);
    self setclientomnvar("cp_open_cac", -1);
    self setclientomnvar("ui_options_menu", 2);
    msg = waittill_any_ents_return(self, "loadout_given", self, "loadout_menu_closed");
    if (isdefined(msg) && msg == "loadout_given" && istrue(var_350509be582a5426)) {
        interaction notify("disabled_for_player", self);
    }
    wait 1;
    self setclientomnvar("cp_open_cac", -2);
    if (isdefined(msg) && msg == "loadout_menu_closed") {
        interaction [[ interaction.enable_func ]](self);
        return;
    }
    if (isdefined(msg) && msg == "loadout_given" && !istrue(var_350509be582a5426)) {
        interaction [[ interaction.enable_func ]](self);
        if (isdefined(level.var_377071435edf746d)) {
            namespace_4fb9dddfb8c1a67a::function_707926e6ce8ddc60("primary", level.var_377071435edf746d);
        }
        if (isdefined(level.var_1126cd09894ff2e1)) {
            namespace_4fb9dddfb8c1a67a::function_707926e6ce8ddc60("secondary", level.var_1126cd09894ff2e1);
        }
        wait 1;
        namespace_6250b14b3f614101::giveammo(self);
        return;
    }
    if (isdefined(msg) && msg == "loadout_given" && istrue(var_350509be582a5426)) {
        if (isdefined(level.var_377071435edf746d)) {
            namespace_4fb9dddfb8c1a67a::function_707926e6ce8ddc60("primary", level.var_377071435edf746d);
        }
        if (isdefined(level.var_1126cd09894ff2e1)) {
            namespace_4fb9dddfb8c1a67a::function_707926e6ce8ddc60("secondary", level.var_1126cd09894ff2e1);
        }
        wait 1;
        namespace_6250b14b3f614101::giveammo(self);
    }
}

// Namespace loadout / namespace_751288259782653c
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x6866
// Size: 0x57
function function_3151e0ce2d788cce(player, interaction) {
    level endon("game_ended");
    player endon("death_or_disconnect");
    player endon("loadout_menu_closed");
    player waittill("last_stand_start");
    level thread function_4006819486e3b7cc(player, interaction);
    player setclientomnvar("cp_open_cac", -2);
    player clearsoundsubmix("cp_store_duck", 1);
}

// Namespace loadout / namespace_751288259782653c
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x68c5
// Size: 0x4f
function function_4006819486e3b7cc(player, interaction) {
    level endon("game_ended");
    player endon("disconnect");
    player endon("revive");
    player waittill("respawn_player");
    if (isdefined(interaction) && isplayer(player)) {
        interaction [[ interaction.enable_func ]](player);
    }
}

// Namespace loadout / namespace_751288259782653c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x691c
// Size: 0x3b
function function_3d60a67e9d120aab(player) {
    if (!isdefined(self.playerscaptured)) {
        self.playerscaptured = [];
    }
    self.playerscaptured = array_remove(self.playerscaptured, player);
}

// Namespace loadout / namespace_751288259782653c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x695f
// Size: 0x3b
function function_d9bed4675ea53492(player) {
    if (!isdefined(self.playerscaptured)) {
        self.playerscaptured = [];
    }
    self.playerscaptured = array_add(self.playerscaptured, player);
}

// Namespace loadout / namespace_751288259782653c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x69a2
// Size: 0x50
function function_2dad855d27735128(struct) {
    if (!isdefined(struct.var_e4783b05bc8b859f)) {
        struct.var_e4783b05bc8b859f = "none";
    }
    if (struct.var_e4783b05bc8b859f == "none") {
        struct.var_e4783b05bc8b859f = "iw9_me_diveknife_mp";
    }
}

// Namespace loadout / namespace_751288259782653c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x69fa
// Size: 0x43
function function_9743c56a4d2dc135(struct) {
    if (struct.var_e4783b05bc8b859f != "none") {
        scripts\cp_mp\utility\inventory_utility::_giveweapon(level.var_f9e0e2877b743202);
    }
    self.swimweapon = struct.var_e4783b05bc8b859f;
}

// Namespace loadout / namespace_751288259782653c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6a45
// Size: 0x3b
function function_a01818ae9edecbe6(var_d89162f9d72cbfe1) {
    if (self hasweapon(level.var_f9e0e2877b743202)) {
        return;
    }
    scripts\cp_mp\utility\inventory_utility::_giveweapon(level.var_f9e0e2877b743202);
    if (istrue(var_d89162f9d72cbfe1)) {
        thread function_48c0bdf6dd0f6dde();
    }
}

// Namespace loadout / namespace_751288259782653c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6a88
// Size: 0x2e
function function_a6eb74f88574f882(var_d89162f9d72cbfe1) {
    if (self hasweapon(level.var_a2df868742d5f192)) {
        return;
    }
    scripts\cp_mp\utility\inventory_utility::_giveweapon(level.var_a2df868742d5f192);
}

// Namespace loadout / namespace_751288259782653c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6abe
// Size: 0xf7
function function_48c0bdf6dd0f6dde() {
    self endon("death_or_disconnect");
    currweapon = self getcurrentweapon();
    if (currweapon.basename == "none" || currweapon.basename == "iw9_me_diveknife_mp") {
        var_102d661b1caa8bc1 = undefined;
        var_b954f3014fd20ea1 = self getweaponslistprimaries();
        if (var_b954f3014fd20ea1.size > 0) {
            foreach (var_d5cbbac9155ca995 in var_b954f3014fd20ea1) {
                if (var_d5cbbac9155ca995.basename != "none" && var_d5cbbac9155ca995.basename != "iw9_me_diveknife_mp") {
                    var_102d661b1caa8bc1 = var_d5cbbac9155ca995;
                    break;
                }
            }
        }
        if (isdefined(var_102d661b1caa8bc1)) {
            while (self isswimming()) {
                wait 0.05;
            }
            scripts\cp_mp\utility\inventory_utility::_switchtoweapon(var_102d661b1caa8bc1);
            return;
        }
    }
}

// Namespace loadout / namespace_751288259782653c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6bbd
// Size: 0x1b
function cac_getloadoutselectedidx() {
    return self getplayerdata(level.loadoutsgroup, "squadMembers", "cpLoadoutSel");
}

// Namespace loadout / namespace_751288259782653c
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x6be1
// Size: 0x60
function cac_getloadoutperk(classindex, perkindex) {
    if (is_wave_gametype()) {
        return self getplayerdata(level.loadoutsgroup, "squadMembers", "loadoutWaveMode", "loadoutPerks", perkindex);
    }
    return self getplayerdata(level.loadoutsgroup, "squadMembers", "loadouts", classindex, "loadoutPerks", perkindex);
}

// Namespace loadout / namespace_751288259782653c
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x6c49
// Size: 0x6a
function cac_getweapon(classindex, weaponindex) {
    if (is_wave_gametype()) {
        return self getplayerdata(level.loadoutsgroup, "squadMembers", "loadoutWaveMode", "weaponSetups", weaponindex, "weapon");
    }
    return self getplayerdata(level.loadoutsgroup, "squadMembers", "loadouts", classindex, "weaponSetups", weaponindex, "weapon");
}

// Namespace loadout / namespace_751288259782653c
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x6cbb
// Size: 0x7e
function cac_getweaponattachment(classindex, weaponindex, attachmentindex) {
    if (is_wave_gametype()) {
        return self getplayerdata(level.loadoutsgroup, "squadMembers", "loadoutWaveMode", "weaponSetups", weaponindex, "attachmentSetup", attachmentindex, "attachment");
    }
    return self getplayerdata(level.loadoutsgroup, "squadMembers", "loadouts", classindex, "weaponSetups", weaponindex, "attachmentSetup", attachmentindex, "attachment");
}

// Namespace loadout / namespace_751288259782653c
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x6d41
// Size: 0x46
function cac_getweaponattachmentid(classindex, weaponindex, attachmentindex) {
    return self getplayerdata(level.loadoutsgroup, "squadMembers", "loadouts", classindex, "weaponSetups", weaponindex, "attachmentSetup", attachmentindex, "variantID");
}

// Namespace loadout / namespace_751288259782653c
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x6d90
// Size: 0x6a
function cac_getweaponlootitemid(classindex, weaponindex) {
    if (is_wave_gametype()) {
        return self getplayerdata(level.loadoutsgroup, "squadMembers", "loadoutWaveMode", "weaponSetups", weaponindex, "lootItemID");
    }
    return self getplayerdata(level.loadoutsgroup, "squadMembers", "loadouts", classindex, "weaponSetups", weaponindex, "lootItemID");
}

// Namespace loadout / namespace_751288259782653c
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x6e02
// Size: 0x6a
function cac_getweaponvariantid(classindex, weaponindex) {
    if (is_wave_gametype()) {
        return self getplayerdata(level.loadoutsgroup, "squadMembers", "loadoutWaveMode", "weaponSetups", weaponindex, "variantID");
    }
    return self getplayerdata(level.loadoutsgroup, "squadMembers", "loadouts", classindex, "weaponSetups", weaponindex, "variantID");
}

// Namespace loadout / namespace_751288259782653c
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x6e74
// Size: 0x6a
function cac_getweaponcamo(classindex, weaponindex) {
    if (is_wave_gametype()) {
        return self getplayerdata(level.loadoutsgroup, "squadMembers", "loadoutWaveMode", "weaponSetups", weaponindex, "camo");
    }
    return self getplayerdata(level.loadoutsgroup, "squadMembers", "loadouts", classindex, "weaponSetups", weaponindex, "camo");
}

// Namespace loadout / namespace_751288259782653c
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x6ee6
// Size: 0x6a
function cac_getweaponreticle(classindex, weaponindex) {
    if (is_wave_gametype()) {
        return self getplayerdata(level.loadoutsgroup, "squadMembers", "loadoutWaveMode", "weaponSetups", weaponindex, "reticle");
    }
    return self getplayerdata(level.loadoutsgroup, "squadMembers", "loadouts", classindex, "weaponSetups", weaponindex, "reticle");
}

// Namespace loadout / namespace_751288259782653c
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x6f58
// Size: 0x6a
function cac_getweaponcosmeticattachment(classindex, weaponindex) {
    if (is_wave_gametype()) {
        return self getplayerdata(level.loadoutsgroup, "squadMembers", "loadoutWaveMode", "weaponSetups", weaponindex, "cosmeticAttachment");
    }
    return self getplayerdata(level.loadoutsgroup, "squadMembers", "loadouts", classindex, "weaponSetups", weaponindex, "cosmeticAttachment");
}

// Namespace loadout / namespace_751288259782653c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6fca
// Size: 0x62
function cac_getequipmentprimary(classindex) {
    if (is_wave_gametype()) {
        return self getplayerdata(level.loadoutsgroup, "squadMembers", "loadoutWaveMode", "equipmentSetups", 0, "equipment");
    }
    return self getplayerdata(level.loadoutsgroup, "squadMembers", "loadouts", classindex, "equipmentSetups", 0, "equipment");
}

// Namespace loadout / namespace_751288259782653c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7034
// Size: 0x62
function cac_getextraequipmentprimary(classindex) {
    if (is_wave_gametype()) {
        return self getplayerdata(level.loadoutsgroup, "squadMembers", "loadoutWaveMode", "equipmentSetups", 0, "extraCharge");
    }
    return self getplayerdata(level.loadoutsgroup, "squadMembers", "loadouts", classindex, "equipmentSetups", 0, "extraCharge");
}

// Namespace loadout / namespace_751288259782653c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x709e
// Size: 0x64
function cac_getequipmentsecondary(classindex) {
    if (is_wave_gametype()) {
        return self getplayerdata(level.loadoutsgroup, "squadMembers", "loadoutWaveMode", "equipmentSetups", 1, "equipment");
    }
    return self getplayerdata(level.loadoutsgroup, "squadMembers", "loadouts", classindex, "equipmentSetups", 1, "equipment");
}

// Namespace loadout / namespace_751288259782653c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x710a
// Size: 0x64
function cac_getextraequipmentsecondary(classindex) {
    if (is_wave_gametype()) {
        return self getplayerdata(level.loadoutsgroup, "squadMembers", "loadoutWaveMode", "equipmentSetups", 1, "extraCharge");
    }
    return self getplayerdata(level.loadoutsgroup, "squadMembers", "loadouts", classindex, "equipmentSetups", 1, "extraCharge");
}

// Namespace loadout / namespace_751288259782653c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7176
// Size: 0x357
function loadout_getclassstruct() {
    struct = spawnstruct();
    struct.loadoutarchetype = "none";
    struct.loadoutprimary = "none";
    struct.loadoutprimaryattachments = [];
    struct.loadoutprimaryattachmentids = [];
    for (attachmentindex = 0; attachmentindex < 5; attachmentindex++) {
        struct.loadoutprimaryattachments[attachmentindex] = "none";
        struct.loadoutprimaryattachmentids[attachmentindex] = 0;
    }
    struct.loadoutprimarycamo = "none";
    struct.loadoutprimaryreticle = "none";
    struct.loadoutprimarylootitemid = 0;
    struct.loadoutprimaryvariantid = -1;
    struct.loadoutprimarycosmeticattachment = "none";
    struct.loadoutprimaryweaponstickers = [];
    for (var_36d2abbdcbcb186c = 0; var_36d2abbdcbcb186c < 5; var_36d2abbdcbcb186c++) {
        struct.loadoutprimarystickers[var_36d2abbdcbcb186c] = "none";
    }
    struct.loadoutsecondary = "none";
    struct.loadoutsecondaryattachments = [];
    struct.loadoutsecondaryattachmentids = [];
    for (attachmentindex = 0; attachmentindex < 5; attachmentindex++) {
        struct.loadoutsecondaryattachments[attachmentindex] = "none";
        struct.loadoutsecondaryattachmentids[attachmentindex] = 0;
    }
    struct.loadoutsecondarycamo = "none";
    struct.loadoutsecondaryreticle = "none";
    struct.loadoutsecondarylootitemid = 0;
    struct.loadoutsecondaryvariantid = -1;
    struct.loadoutsecondarycosmeticattachment = "none";
    struct.loadoutsecondaryweaponstickers = [];
    for (var_36d2abbdcbcb186c = 0; var_36d2abbdcbcb186c < 4; var_36d2abbdcbcb186c++) {
        struct.loadoutsecondaryweaponstickers[var_36d2abbdcbcb186c] = "none";
    }
    struct.loadoutmeleeslot = "none";
    struct.loadoutperksfromgamemode = 0;
    struct.loadoutperks = [];
    struct.loadoutstandardperks = [];
    struct.loadoutextraperks = [];
    struct.loadoutrigtrait = "specialty_null";
    struct.loadoutequipmentprimary = "none";
    struct.loadoutextraequipmentprimary = 0;
    struct.loadoutequipmentsecondary = "none";
    struct.loadoutextraequipmentsecondary = 0;
    struct.loadoutsuper = "none";
    struct.loadoutfieldupgrade1 = "none";
    struct.loadoutfieldupgrade2 = "none";
    struct.loadoutgesture = "none";
    struct.loadoutaccessorydata = "none";
    struct.loadoutaccessoryweapon = "none";
    struct.loadoutexecution = "none";
    struct.loadoutstreaksfilled = 0;
    struct.loadoutstreaktype = "streaktype_assault";
    struct.loadoutkillstreak1 = "none";
    struct.loadoutkillstreak2 = "none";
    struct.loadoutkillstreak3 = "none";
    struct.var_e4783b05bc8b859f = "none";
    return struct;
}

// Namespace loadout / namespace_751288259782653c
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x74d6
// Size: 0x2bf
function loadout_updateclasscustom(struct, class, var_168b196e80c44544) {
    classindex = class;
    self.class_num = classindex;
    struct.loadoutprimary = cac_getweapon(classindex, 0);
    for (attachmentindex = 0; attachmentindex < 5; attachmentindex++) {
        struct.loadoutprimaryattachments[attachmentindex] = cac_getweaponattachment(classindex, 0, attachmentindex);
        struct.loadoutprimaryattachmentids[attachmentindex] = cac_getweaponattachmentid(classindex, 0, attachmentindex);
    }
    if (!istrue(var_168b196e80c44544)) {
        struct.loadoutprimarycamo = cac_getweaponcamo(classindex, 0);
        struct.loadoutprimaryreticle = cac_getweaponreticle(classindex, 0);
        struct.loadoutprimarylootitemid = cac_getweaponlootitemid(classindex, 0);
        struct.loadoutprimaryvariantid = cac_getweaponvariantid(classindex, 0);
        struct.loadoutprimarycosmeticattachment = cac_getweaponcosmeticattachment(classindex, 0);
        for (var_36d2abbdcbcb186c = 0; var_36d2abbdcbcb186c < 5; var_36d2abbdcbcb186c++) {
            struct.loadoutprimarystickers[var_36d2abbdcbcb186c] = cac_getweaponsticker(classindex, 0, var_36d2abbdcbcb186c);
        }
    }
    struct.loadoutsecondary = cac_getweapon(classindex, 1);
    for (attachmentindex = 0; attachmentindex < 5; attachmentindex++) {
        struct.loadoutsecondaryattachments[attachmentindex] = cac_getweaponattachment(classindex, 1, attachmentindex);
        struct.loadoutsecondaryattachmentids[attachmentindex] = cac_getweaponattachmentid(classindex, 1, attachmentindex);
    }
    if (!istrue(var_168b196e80c44544)) {
        struct.loadoutsecondarycamo = cac_getweaponcamo(classindex, 1);
        struct.loadoutsecondaryreticle = cac_getweaponreticle(classindex, 1);
        struct.loadoutsecondarylootitemid = cac_getweaponlootitemid(classindex, 1);
        struct.loadoutsecondaryvariantid = cac_getweaponvariantid(classindex, 1);
        struct.loadoutsecondarycosmeticattachment = cac_getweaponcosmeticattachment(classindex, 1);
        for (var_36d2abbdcbcb186c = 0; var_36d2abbdcbcb186c < 4; var_36d2abbdcbcb186c++) {
            struct.loadoutsecondarystickers[var_36d2abbdcbcb186c] = cac_getweaponsticker(classindex, 1, var_36d2abbdcbcb186c);
        }
    }
    struct.loadoutequipmentprimary = cac_getequipmentprimary(classindex);
    struct.loadoutextraequipmentprimary = cac_getextraequipmentprimary(classindex);
    struct.loadoutequipmentsecondary = cac_getequipmentsecondary(classindex);
    struct.loadoutextraequipmentsecondary = cac_getextraequipmentsecondary(classindex);
    struct.loadoutgesture = cac_getgesture();
    struct.loadoutexecution = cac_getexecution();
    struct.loadoutaccessoryweapon = cac_getaccessoryweapon();
    struct.loadoutaccessorydata = cac_getaccessorydata();
    struct.loadoutaccessorylogic = cac_getaccessorylogic();
    function_2dad855d27735128(struct);
    return struct;
}

// Namespace loadout / namespace_751288259782653c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x779e
// Size: 0x458
function validateloadout(loadout) {
    /#
        if (getdvarint(@"unlockAllItems", 0) == 1) {
            return loadout;
        }
    #/
    replaceweapon = 0;
    if (!function_89497fa763d431c0(loadout.loadoutprimary)) {
        replaceweapon = 1;
    } else if (isweaponuihidden(loadout.loadoutprimary)) {
        replaceweapon = 1;
    }
    if (weaponisrestricted(loadout.loadoutprimary)) {
        replaceweapon = 1;
        var_bc72f32b1575d517 = 1;
    }
    if (replaceweapon) {
        loadout.loadoutprimary = "iw9_ar_mike4";
        loadout.loadoutprimaryattachments = [];
        loadout.loadoutprimarycamo = "none";
        loadout.loadoutprimaryreticle = "none";
        loadout.loadoutprimaryvariantid = -1;
        loadout.loadoutprimaryattachmentids = [];
        loadout.loadoutprimarycosmeticattachment = "none";
        loadout.loadoutprimarystickers[0] = "none";
        loadout.loadoutprimarystickers[1] = "none";
        loadout.loadoutprimarystickers[2] = "none";
        loadout.loadoutprimarystickers[3] = "none";
        loadout.loadoutprimarystickers[4] = "none";
    } else {
        if (isweaponvariantlocked(loadout.loadoutprimary, loadout.loadoutprimaryvariantid)) {
            loadout.loadoutprimaryvariantid = -1;
        }
        for (i = 0; i < loadout.loadoutprimaryattachments.size; i++) {
            attachment = loadout.loadoutprimaryattachments[i];
            var_e7ba2038935530db = loadout.loadoutprimaryattachmentids[i];
            if (isattachmentvariantlocked(loadout.loadoutprimary, attachment, var_e7ba2038935530db)) {
                loadout.loadoutprimaryattachmentids[i] = 0;
            }
            if (attachment != "none" && (attachmentisrestricted(attachment, loadout.loadoutprimary) || !isvalidattachmentunlock(loadout.loadoutprimary, attachment))) {
                loadout.loadoutprimaryattachments[i] = "none";
                var_e1388376a5be9b75 = 1;
            }
        }
    }
    replaceweapon = 0;
    if (!function_89497fa763d431c0(loadout.loadoutsecondary)) {
        replaceweapon = 1;
    } else if (isweaponuihidden(loadout.loadoutsecondary)) {
        replaceweapon = 1;
    }
    if (weaponisrestricted(loadout.loadoutsecondary)) {
        replaceweapon = 1;
        var_bc72f32b1575d517 = 1;
    }
    if (replaceweapon) {
        loadout.loadoutsecondary = "iw9_pi_golf17";
        loadout.loadoutsecondaryattachments = [];
        loadout.loadoutsecondarycamo = "none";
        loadout.loadoutsecondaryreticle = "none";
        loadout.loadoutsecondaryvariantid = -1;
        loadout.loadoutsecondaryattachmentids = [];
        loadout.loadoutsecondarycosmeticattachment = "none";
        loadout.loadoutsecondarystickers[0] = "none";
        loadout.loadoutsecondarystickers[1] = "none";
        loadout.loadoutsecondarystickers[2] = "none";
        loadout.loadoutsecondarystickers[3] = "none";
        loadout.loadoutsecondarystickers[4] = "none";
    } else {
        if (isweaponvariantlocked(loadout.loadoutsecondary, loadout.loadoutsecondaryvariantid)) {
            loadout.loadoutsecondaryvariantid = -1;
        }
        for (i = 0; i < loadout.loadoutsecondaryattachments.size; i++) {
            attachment = loadout.loadoutsecondaryattachments[i];
            var_e7ba2038935530db = loadout.loadoutsecondaryattachmentids[i];
            if (isattachmentvariantlocked(loadout.loadoutsecondary, attachment, var_e7ba2038935530db)) {
                loadout.loadoutsecondaryattachmentids[i] = 0;
            }
            if (attachment != "none" && (attachmentisrestricted(attachment, loadout.loadoutsecondary) || !isvalidattachmentunlock(loadout.loadoutsecondary, attachment))) {
                loadout.loadoutsecondaryattachments[i] = "none";
                var_e1388376a5be9b75 = 1;
            }
        }
    }
    return loadout;
}

// Namespace loadout / namespace_751288259782653c
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x7bff
// Size: 0x3f
function isvalidattachmentunlock(var_49e6ef3edadd524e, attachmentbasename) {
    var_338c04a2f19ba8b6 = getdvarint(@"hash_464624f0183de3d0", 0) == 1;
    if (var_338c04a2f19ba8b6) {
        return attachmentisselectablerootname(var_49e6ef3edadd524e, attachmentbasename);
    }
    return 1;
}

// Namespace loadout / namespace_751288259782653c
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x7c47
// Size: 0x33
function attachmentisselectablerootname(var_49e6ef3edadd524e, attachmentbasename) {
    var_d38c5f29184756dd = level.weaponattachments[var_49e6ef3edadd524e];
    return isdefined(var_d38c5f29184756dd) && isdefined(var_d38c5f29184756dd[attachmentbasename]);
}

// Namespace loadout / namespace_751288259782653c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7c83
// Size: 0x31
function isweaponuihidden(var_49e6ef3edadd524e) {
    return isdefined(level.weaponmapdata[var_49e6ef3edadd524e]) && istrue(level.weaponmapdata[var_49e6ef3edadd524e].uihidden);
}

// Namespace loadout / namespace_751288259782653c
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x7cbd
// Size: 0x5c
function isweaponvariantlocked(var_49e6ef3edadd524e, variantid) {
    if (!isdefined(variantid) || variantid <= 0) {
        return false;
    }
    variantkey = var_49e6ef3edadd524e + "|" + variantid;
    return isdefined(level.weaponlootmapdata[variantkey]) && istrue(level.weaponlootmapdata[variantkey].islocked);
}

// Namespace loadout / namespace_751288259782653c
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x7d22
// Size: 0x128
function isattachmentvariantlocked(var_49e6ef3edadd524e, attachment, var_1708b873a34eeb50) {
    if (!isdefined(var_1708b873a34eeb50) || var_1708b873a34eeb50 == 0 || attachment == "none") {
        return false;
    }
    attachmentisvalid = 0;
    for (variantindex = 1; true; variantindex++) {
        variantkey = var_49e6ef3edadd524e + "|" + variantindex;
        if (!isdefined(level.weaponlootmapdata[variantkey])) {
            break;
        }
        if (!level.weaponlootmapdata[variantkey].islocked) {
            if (isdefined(level.weaponlootmapdata[variantkey].attachcustomtoidmap)) {
                foreach (id in level.weaponlootmapdata[variantkey].attachcustomtoidmap) {
                    if (var_1708b873a34eeb50 == id && attachment == key) {
                        attachmentisvalid = 1;
                        break;
                    }
                }
            }
            if (attachmentisvalid) {
                break;
            }
        }
    }
    return !attachmentisvalid;
}

// Namespace loadout / namespace_751288259782653c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7e53
// Size: 0x8d
function cac_getgesture() {
    gestureid = "none";
    if (isdefined(self.changedarchetypeinfo)) {
        archetypeindex = level.archetypeids[self.changedarchetypeinfo.archetype];
        gestureid = self getplayerdata(level.loadoutsgroup, "squadMembers", "archetypePreferences", archetypeindex, "gesture");
    } else {
        gestureid = self getplayerdata(level.loadoutsgroup, "squadMembers", "gesture");
    }
    return scripts\cp_mp\gestures::getgesturedata(gestureid);
}

// Namespace loadout / namespace_751288259782653c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7ee9
// Size: 0x2d
function cac_getaccessoryweapon() {
    accessoryindex = self getplayerdata(level.loadoutsgroup, "customizationSetup", "operatorWatch");
    return scripts\cp\cp_accessories::getaccessoryweaponbyindex(accessoryindex);
}

// Namespace loadout / namespace_751288259782653c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7f1f
// Size: 0x2d
function cac_getaccessorydata() {
    accessoryindex = self getplayerdata(level.loadoutsgroup, "customizationSetup", "operatorWatch");
    return scripts\cp\cp_accessories::getaccessorydatabyindex(accessoryindex);
}

// Namespace loadout / namespace_751288259782653c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7f55
// Size: 0x2d
function cac_getaccessorylogic() {
    accessoryindex = self getplayerdata(level.loadoutsgroup, "customizationSetup", "operatorWatch");
    return scripts\cp\cp_accessories::getaccessorylogicbyindex(accessoryindex);
}

// Namespace loadout / namespace_751288259782653c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7f8b
// Size: 0x7
function cac_getexecution() {
    return "neck_stab";
}

// Namespace loadout / namespace_751288259782653c
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x7f9b
// Size: 0x41
function cac_getweaponsticker(classindex, weaponindex, var_36d2abbdcbcb186c) {
    return self getplayerdata(level.loadoutsgroup, "squadMembers", "loadouts", classindex, "weaponSetups", weaponindex, "sticker", var_36d2abbdcbcb186c);
}

// Namespace loadout / namespace_751288259782653c
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x7fe5
// Size: 0x8f
function function_578fa1963d5f94ac(player, var_4efdb87f020aae7d, var_d0ef877013d341af) {
    if (is_wave_gametype()) {
        perk = cac_getloadoutperk(undefined, 2);
        if (perk == "specialty_extra_shrapnel") {
            giveperk("specialty_extra_deadly");
        }
    }
    if (_hasperk("specialty_extra_deadly") && var_4efdb87f020aae7d == "primary") {
        return 2;
    }
    if (isdefined(self.perk_data["offhand_count"])) {
        return self.perk_data["offhand_count"];
    }
    return 1;
}

// Namespace loadout / namespace_751288259782653c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x807d
// Size: 0xc
function function_f505f60c194b2770(equipment_name) {
    return equipment_name;
}

// Namespace loadout / namespace_751288259782653c
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x8092
// Size: 0x62
function give_weapon_alt_clip_ammo_hack(player, weaponobj) {
    var_6890a4ce965bba99 = weaponobj getaltweapon();
    if (var_6890a4ce965bba99.basename != "none") {
        var_91093ef03654702c = weaponclass(var_6890a4ce965bba99);
        if (var_91093ef03654702c == "spread") {
            player setweaponammoclip(var_6890a4ce965bba99, weaponclipsize(var_6890a4ce965bba99));
        }
    }
    return weaponobj;
}

// Namespace loadout / namespace_751288259782653c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x80fd
// Size: 0xaa
function function_acad491093697c6c(tablename) {
    if (!isdefined(level.var_f64740277f13e29b) || level.var_f64740277f13e29b.id != tablename) {
        level.var_f64740277f13e29b = spawnstruct();
        level.var_f64740277f13e29b.id = tablename;
        level.var_f64740277f13e29b.classes = [];
        level.var_f64740277f13e29b.var_9ddc180a1a5121d = getscriptbundle(tablename);
        assert(isdefined(level.var_f64740277f13e29b.var_9ddc180a1a5121d));
    }
    return level.var_f64740277f13e29b;
}

// Namespace loadout / namespace_751288259782653c
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x81b0
// Size: 0x94
function function_c7a0b640c398497(tablename, classindex) {
    var_f64740277f13e29b = function_acad491093697c6c(tablename);
    if (!isdefined(var_f64740277f13e29b.classes[classindex])) {
        classtableentry = var_f64740277f13e29b.var_9ddc180a1a5121d.classlist[classindex];
        assert(isdefined(classtableentry));
        var_f64740277f13e29b.classes[classindex] = getscriptbundle("classtableentry:" + classtableentry.entry);
    }
    return var_f64740277f13e29b.classes[classindex];
}

// Namespace loadout / namespace_751288259782653c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x824d
// Size: 0x33
function function_df2933f96d726d71(tablename) {
    var_f64740277f13e29b = function_acad491093697c6c(tablename);
    return var_f64740277f13e29b.var_9ddc180a1a5121d.classlist.size;
}

// Namespace loadout / namespace_751288259782653c
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x8289
// Size: 0x5e
function table_getweapon(tablename, classindex, weaponindex) {
    if (weaponindex == 0) {
        return function_c7a0b640c398497(tablename, classindex).primaryweapon.weapon;
    }
    return function_c7a0b640c398497(tablename, classindex).secondaryweapon.weapon;
}

// Namespace loadout / namespace_751288259782653c
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x82ef
// Size: 0x210
function table_getweaponattachment(tablename, classindex, weaponindex, attachmentindex) {
    tempname = "none";
    classstruct = function_c7a0b640c398497(tablename, classindex);
    if (!isdefined(classstruct.primaryweapon.attachments)) {
        classstruct.primaryweapon.attachments = [classstruct.primaryweapon.attachment1, classstruct.primaryweapon.attachment2, classstruct.primaryweapon.attachment3, classstruct.primaryweapon.attachment4, classstruct.primaryweapon.attachment5, classstruct.primaryweapon.attachment6];
    }
    if (!isdefined(classstruct.secondaryweapon.attachments)) {
        classstruct.secondaryweapon.attachments = [classstruct.secondaryweapon.attachment1, classstruct.secondaryweapon.attachment2, classstruct.secondaryweapon.attachment3, classstruct.secondaryweapon.attachment4, classstruct.secondaryweapon.attachment5];
    }
    if (weaponindex == 0) {
        tempname = classstruct.primaryweapon.attachments[attachmentindex];
    } else {
        tempname = classstruct.secondaryweapon.attachments[attachmentindex];
    }
    if (!isdefined(tempname) || tempname == "") {
        return "none";
    }
    return tempname;
}

// Namespace loadout / namespace_751288259782653c
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x8507
// Size: 0x5e
function table_getweaponcamo(tablename, classindex, weaponindex) {
    if (weaponindex == 0) {
        return function_c7a0b640c398497(tablename, classindex).primaryweapon.camo;
    }
    return function_c7a0b640c398497(tablename, classindex).secondaryweapon.camo;
}

// Namespace loadout / namespace_751288259782653c
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x856d
// Size: 0x5e
function table_getweaponreticle(tablename, classindex, weaponindex) {
    if (weaponindex == 0) {
        return function_c7a0b640c398497(tablename, classindex).primaryweapon.reticle;
    }
    return function_c7a0b640c398497(tablename, classindex).secondaryweapon.reticle;
}

// Namespace loadout / namespace_751288259782653c
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x85d3
// Size: 0x2f
function table_getequipmentprimary(tablename, classindex) {
    return function_c7a0b640c398497(tablename, classindex).equipment.primary;
}

// Namespace loadout / namespace_751288259782653c
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x860b
// Size: 0x47
function table_getextraequipmentprimary(tablename, classindex) {
    value = function_c7a0b640c398497(tablename, classindex).extrapower.primary;
    return isdefined(value) && value == "1";
}

// Namespace loadout / namespace_751288259782653c
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x865b
// Size: 0x2f
function table_getequipmentsecondary(tablename, classindex) {
    return function_c7a0b640c398497(tablename, classindex).equipment.secondary;
}

// Namespace loadout / namespace_751288259782653c
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x8693
// Size: 0x44
function table_getextraequipmentsecondary(tablename, classindex) {
    value = function_c7a0b640c398497(tablename, classindex).extrapower.secondary;
    return isdefined(value) && value == 1;
}

// Namespace loadout / namespace_751288259782653c
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x86e0
// Size: 0x25
function table_getgesture(tablename, classindex) {
    return function_c7a0b640c398497(tablename, classindex).gesture;
}

// Namespace loadout / namespace_751288259782653c
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x870e
// Size: 0xaf
function table_getperk(tablename, classindex, perkindex) {
    assert(perkindex <= 3);
    classstruct = function_c7a0b640c398497(tablename, classindex);
    if (!isdefined(classstruct.perksarray)) {
        classstruct.perksarray = [classstruct.perks.perk1, classstruct.perks.perk2, classstruct.perks.perk3];
    }
    return classstruct.perksarray[perkindex];
}

// Namespace loadout / namespace_751288259782653c
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x87c6
// Size: 0x36b
function function_e2d370937c694c58(loadoutprimary, var_8424b86904d76746, loadoutsecondary, var_ec4f8b19b8a264df, loadoutequipmentprimary, loadoutequipmentsecondary) {
    if (scripts\cp\cp_relics::is_relic_active("relic_oneInTheChamber")) {
        loadoutprimary = "iw9_dm_xmike2010_mp";
        var_8424b86904d76746 = ["silencer", "laser"];
        loadoutsecondary = "iw9_pi_decho_mp";
        var_ec4f8b19b8a264df = ["silencer", "laserpstl_ads01"];
        loadoutequipmentprimary = "equip_throwing_knife";
    }
    var_d0ef877013d341af = spawnstruct();
    if (isdefined(loadoutprimary)) {
        var_85c961f7be4fba08 = namespace_a0628d6954815ef8::function_768c9a047aed19f4(loadoutprimary);
        var_d0ef877013d341af.loadoutprimary = var_85c961f7be4fba08.basename;
        if (isdefined(var_8424b86904d76746)) {
            var_85c961f7be4fba08 = var_85c961f7be4fba08 namespace_a0628d6954815ef8::function_dcb52bcbbcb80b00(var_8424b86904d76746);
            var_d0ef877013d341af.loadoutprimaryattachments = var_85c961f7be4fba08.attachments;
        } else {
            var_8424b86904d76746 = ["none", "none", "none", "none", "none", "none"];
            var_d0ef877013d341af.loadoutprimaryattachments = var_8424b86904d76746;
        }
        var_d0ef877013d341af.loadoutprimarycamo = "none";
        var_d0ef877013d341af.loadoutprimaryreticle = "none";
        var_d0ef877013d341af.loadoutprimaryvariantid = -1;
        var_d0ef877013d341af.loadoutprimarypaintjobid = 0;
        var_d0ef877013d341af.loadoutprimarycosmeticattachment = "none";
        var_d0ef877013d341af.loadoutprimarystickers[0] = "none";
        var_d0ef877013d341af.loadoutprimarystickers[1] = "none";
        var_d0ef877013d341af.loadoutprimarystickers[2] = "none";
        var_d0ef877013d341af.loadoutprimarystickers[3] = "none";
        var_d0ef877013d341af.loadoutprimarystickers[4] = "none";
    }
    if (isdefined(loadoutsecondary)) {
        s_weapon = namespace_a0628d6954815ef8::function_768c9a047aed19f4(loadoutsecondary);
        var_d0ef877013d341af.loadoutsecondary = s_weapon.basename;
        if (isdefined(var_ec4f8b19b8a264df)) {
            s_weapon = s_weapon namespace_a0628d6954815ef8::function_dcb52bcbbcb80b00(var_ec4f8b19b8a264df);
            var_d0ef877013d341af.loadoutsecondaryattachments = s_weapon.attachments;
        } else {
            var_ec4f8b19b8a264df = ["none", "none", "none", "none", "none", "none"];
            var_d0ef877013d341af.loadoutsecondaryattachments = var_ec4f8b19b8a264df;
        }
        if (scripts\cp\cp_relics::is_relic_active("relic_oneInTheChamber")) {
            var_d0ef877013d341af.loadoutsecondarycamo = "camo_k_04";
        } else {
            var_d0ef877013d341af.loadoutsecondarycamo = "none";
        }
        var_d0ef877013d341af.loadoutsecondaryreticle = "none";
        var_d0ef877013d341af.loadoutsecondaryvariantid = -1;
        var_d0ef877013d341af.var_ac15239127ef4391 = 0;
        var_d0ef877013d341af.loadoutsecondarycosmeticattachment = "none";
        var_d0ef877013d341af.loadoutsecondarystickers[0] = "none";
        var_d0ef877013d341af.loadoutsecondarystickers[1] = "none";
        var_d0ef877013d341af.loadoutsecondarystickers[2] = "none";
        var_d0ef877013d341af.loadoutsecondarystickers[3] = "none";
        var_d0ef877013d341af.loadoutsecondarystickers[4] = "none";
    }
    level.var_36074f5db982129d[level.var_36074f5db982129d.size] = var_d0ef877013d341af;
}

// Namespace loadout / namespace_751288259782653c
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x8b39
// Size: 0x53
function function_ebf2582b122904fc(loadoutequipmentprimary, loadoutequipmentsecondary) {
    var_d0ef877013d341af = spawnstruct();
    var_d0ef877013d341af.loadoutequipmentprimary = loadoutequipmentprimary;
    var_d0ef877013d341af.loadoutequipmentsecondary = loadoutequipmentsecondary;
    level.var_b2640b98dee64871[level.var_b2640b98dee64871.size] = var_d0ef877013d341af;
}

// Namespace loadout / namespace_751288259782653c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8b94
// Size: 0x2cb
function function_c03f8f1dc0df9eaa(var_d0ef877013d341af) {
    if (isdefined(level.var_36074f5db982129d) && isdefined(var_d0ef877013d341af) && level.var_36074f5db982129d.size > 0) {
        var_f790a21d25442e99 = level.var_36074f5db982129d[randomint(level.var_36074f5db982129d.size)];
        if (isdefined(var_f790a21d25442e99.loadoutprimary)) {
            var_d0ef877013d341af.loadoutprimary = var_f790a21d25442e99.loadoutprimary;
        }
        if (isdefined(var_f790a21d25442e99.loadoutprimaryattachments)) {
            var_d0ef877013d341af.loadoutprimaryattachments = var_f790a21d25442e99.loadoutprimaryattachments;
        }
        if (isdefined(var_f790a21d25442e99.loadoutprimarycamo)) {
            var_d0ef877013d341af.loadoutprimarycamo = var_f790a21d25442e99.loadoutprimarycamo;
        }
        if (isdefined(var_f790a21d25442e99.loadoutprimaryreticle)) {
            var_d0ef877013d341af.loadoutprimaryreticle = var_f790a21d25442e99.loadoutprimaryreticle;
        }
        if (isdefined(var_f790a21d25442e99.loadoutprimaryvariantid)) {
            var_d0ef877013d341af.loadoutprimaryvariantid = var_f790a21d25442e99.loadoutprimaryvariantid;
        }
        if (isdefined(var_f790a21d25442e99.loadoutprimarypaintjobid)) {
            var_d0ef877013d341af.loadoutprimarypaintjobid = var_f790a21d25442e99.loadoutprimarypaintjobid;
        }
        if (isdefined(var_f790a21d25442e99.loadoutprimarycosmeticattachment)) {
            var_d0ef877013d341af.loadoutprimarycosmeticattachment = var_f790a21d25442e99.loadoutprimarycosmeticattachment;
        }
        if (isdefined(var_f790a21d25442e99.loadoutsecondary)) {
            var_d0ef877013d341af.loadoutsecondary = var_f790a21d25442e99.loadoutsecondary;
        }
        if (isdefined(var_f790a21d25442e99.loadoutsecondaryattachments)) {
            var_d0ef877013d341af.loadoutsecondaryattachments = var_f790a21d25442e99.loadoutsecondaryattachments;
        }
        if (isdefined(var_f790a21d25442e99.loadoutsecondarycamo)) {
            var_d0ef877013d341af.loadoutsecondarycamo = var_f790a21d25442e99.loadoutsecondarycamo;
        }
        if (isdefined(var_f790a21d25442e99.loadoutsecondaryreticle)) {
            var_d0ef877013d341af.loadoutsecondaryreticle = var_f790a21d25442e99.loadoutsecondaryreticle;
        }
        if (isdefined(var_f790a21d25442e99.loadoutsecondaryvariantid)) {
            var_d0ef877013d341af.loadoutsecondaryvariantid = var_f790a21d25442e99.loadoutsecondaryvariantid;
        }
        if (isdefined(var_f790a21d25442e99.var_33e425a1f6c8b34d)) {
            var_d0ef877013d341af.var_33e425a1f6c8b34d = var_f790a21d25442e99.var_33e425a1f6c8b34d;
        }
    }
    if (isdefined(level.var_b2640b98dee64871) && isdefined(var_d0ef877013d341af) && level.var_b2640b98dee64871.size > 0) {
        var_f790a21d25442e99 = level.var_b2640b98dee64871[randomint(level.var_b2640b98dee64871.size)];
        if (isdefined(var_f790a21d25442e99.loadoutequipmentprimary)) {
            var_d0ef877013d341af.loadoutequipmentprimary = var_f790a21d25442e99.loadoutequipmentprimary;
        }
        if (isdefined(var_f790a21d25442e99.loadoutequipmentsecondary)) {
            var_d0ef877013d341af.loadoutequipmentsecondary = var_f790a21d25442e99.loadoutequipmentsecondary;
        }
    }
    return var_d0ef877013d341af;
}

// Namespace loadout / namespace_751288259782653c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8e68
// Size: 0x97
function lookupotheroperator(team) {
    if (!isplayer(self) && !isai(self)) {
        return "";
    }
    teamindex = ter_op(team == "allies", 1, 0);
    operatorref = "";
    if (!scripts\cp_mp\utility\game_utility::isbrstylegametype() && !function_138028ca2b958511()) {
        if (level.teambased && !isai(self)) {
            operatorref = self getplayerdata(level.loadoutsgroup, "customizationSetup", "operators", teamindex);
        }
    }
    return operatorref;
}

// Namespace loadout / namespace_751288259782653c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8f08
// Size: 0x15
function respawnitems_assignrespawnitems(respawnitems) {
    self.respawnitems = respawnitems;
}

