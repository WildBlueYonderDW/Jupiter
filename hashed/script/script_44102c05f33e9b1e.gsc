// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\outline.gsc;
#using scripts\mp\utility\inventory.gsc;
#using scripts\mp\gametypes\br_circle.gsc;
#using scripts\mp\gametypes\br_public.gsc;
#using script_600b944a95c3a7bf;
#using script_c7a00602fb8e464;
#using script_61565a6c1fdee6ac;
#using script_3f3c7170aedfefd7;
#using script_89c4e8e66e8a360;
#using script_5961052449eb875f;
#using script_b5c3028255f05a7;
#using script_2f981f68661d5e1a;
#using script_5dfa1fb6b030bdcb;
#using script_35ee5e2cef30eea2;
#using script_6981400abfcd765c;
#using script_32d93a194074fa6a;
#using script_4bcf78b337139620;
#using script_458ce44388c14a5f;
#using script_47a7dd805c87b33f;
#using script_45e6947be98e16e3;
#using script_64acb6ce534155b7;
#using script_239a365a92ee4476;
#using scripts\mp\gametypes\br_pickups.gsc;

#namespace namespace_5026cc22a303fab7;

// Namespace namespace_5026cc22a303fab7/namespace_d3289d7a0f087014
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x27d
// Size: 0x28
function function_607860ac17c15475(var_4b2538e850df3357) {
    function_9e0151baa208fe9e(var_4b2538e850df3357);
    wait(20);
    function_6fba31415caeee6e(1);
    self notify("currentContextualTipCompleted");
}

// Namespace namespace_5026cc22a303fab7/namespace_d3289d7a0f087014
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ac
// Size: 0x13
function function_6cc0fad885fba316() {
    function_607860ac17c15475(#"prematch");
}

// Namespace namespace_5026cc22a303fab7/namespace_d3289d7a0f087014
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c6
// Size: 0x12
function function_84e789c4db729df(params) {
    return function_f656ad666eda6d08();
}

// Namespace namespace_5026cc22a303fab7/namespace_d3289d7a0f087014
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e0
// Size: 0x24
function function_4f7909e93cb375f3() {
    function_914e9d5e71cc6efb();
    function_f339c5c73d11ea20(#"hash_2ff64f9e50cbb371", 1);
    self notify("currentContextualTipCompleted");
}

// Namespace namespace_5026cc22a303fab7/namespace_d3289d7a0f087014
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x30b
// Size: 0x2c
function function_4f7908e93cb373c0() {
    function_f339c5c73d11ea20(#"hash_75ee328f5a5405a8", 1);
    function_9e0151baa208fe9e(#"hash_2ff64f9e50cbb371");
    function_4f7909e93cb375f3();
}

// Namespace namespace_5026cc22a303fab7/namespace_d3289d7a0f087014
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x33e
// Size: 0x1f
function function_4f790be93cb37a59() {
    function_9e0151baa208fe9e(#"hash_75ee328f5a5405a8");
    function_ba481c5cd3c4f5b4(&function_4f7908e93cb373c0);
}

// Namespace namespace_5026cc22a303fab7/namespace_d3289d7a0f087014
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x364
// Size: 0x12
function function_b81ffcc9f35975ea(params) {
    return function_6fc17f2a58009875();
}

// Namespace namespace_5026cc22a303fab7/namespace_d3289d7a0f087014
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x37e
// Size: 0x1d
function function_cfc8bdc369b56448() {
    namespace_2e77b62bcb3c8d4b::function_4d03b9ef456d0972(self.var_657f5a0d17435bc.objectiveid);
}

// Namespace namespace_5026cc22a303fab7/namespace_d3289d7a0f087014
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a2
// Size: 0x11a
function function_d42c23c4731aed7() {
    function_9e0151baa208fe9e(#"hash_c7dfcf6eee67c1d7");
    var_592b90b9adb13198 = self.var_657f5a0d17435bc.var_93bacbf8fe541c21;
    /#
        assert(isdefined(var_592b90b9adb13198));
    #/
    self.var_657f5a0d17435bc.objectiveid = namespace_2e77b62bcb3c8d4b::function_e5524fb8509827bf(var_592b90b9adb13198.origin + (0, 0, 18), "FTUE_BR/OPEN", "icon_ping_ftue_waypoint", 15, self);
    childthread function_7fdf3cf66304f3c5(self, 60, &function_cfc8bdc369b56448);
    self waittill("ftue_supply_cache_opened");
    function_81771105fc1a47cb(self);
    function_cfc8bdc369b56448();
    function_6fba31415caeee6e(1);
    function_9e0151baa208fe9e(#"hash_3212e2ac3c7eb3a8");
    childthread function_7fdf3cf66304f3c5(self, 20);
    while (1) {
        var_a5b2c541413aa895 = quantity = lootid = self waittill("looted_item");
        if (!istrue(var_a5b2c541413aa895)) {
            break;
        }
    }
    function_f339c5c73d11ea20(#"hash_3212e2ac3c7eb3a8", 1);
    self notify("currentContextualTipCompleted");
}

// Namespace namespace_5026cc22a303fab7/namespace_d3289d7a0f087014
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4c3
// Size: 0x2d
function function_6fb2d2cba92b8aaf(data) {
    if (isdefined(data.player)) {
        data.player notify("ftue_supply_cache_opened");
    }
}

// Namespace namespace_5026cc22a303fab7/namespace_d3289d7a0f087014
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4f7
// Size: 0x46
function function_985d1992fa345d50(params) {
    if (istrue(self.var_f64605f38a1c7a57)) {
        var_36b81911e31bb387 = function_203032caf2ef038b(1500);
        self.var_657f5a0d17435bc.var_93bacbf8fe541c21 = var_36b81911e31bb387;
        return isdefined(var_36b81911e31bb387);
    }
    return 0;
}

// Namespace namespace_5026cc22a303fab7/namespace_d3289d7a0f087014
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x545
// Size: 0x2a
function function_78836cda2eb475b4() {
    function_9e0151baa208fe9e(#"hash_ca1310808b335ed6");
    childthread function_7fdf3cf66304f3c5(self, 30);
    namespace_80da074a96524381::function_59ded31f4834f8de(&function_e3ee001185cb9871);
}

// Namespace namespace_5026cc22a303fab7/namespace_d3289d7a0f087014
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x576
// Size: 0x41
function function_4d97fbd4a3f4901f() {
    level endon("game_ended");
    while (1) {
        item = player = level waittill("backpack_item");
        player function_28f32fc9e57814f6(#"inventory");
    }
}

// Namespace namespace_5026cc22a303fab7/namespace_d3289d7a0f087014
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5be
// Size: 0x14
function function_e3ee001185cb9871() {
    function_6fba31415caeee6e(1);
    self notify("currentContextualTipCompleted");
}

// Namespace namespace_5026cc22a303fab7/namespace_d3289d7a0f087014
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5d9
// Size: 0x2b
function function_57d935cb919f862a() {
    function_9e0151baa208fe9e(#"hash_3e4f50da48b191cc");
    childthread function_7fdf3cf66304f3c5(self, 30);
    childthread function_b804651ee5f4e495(&function_57d934cb919f83f7);
}

// Namespace namespace_5026cc22a303fab7/namespace_d3289d7a0f087014
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x60b
// Size: 0x18
function function_57d934cb919f83f7() {
    function_81771105fc1a47cb(self);
    childthread function_2c280502c93dcdf4(&function_57d933cb919f81c4);
}

// Namespace namespace_5026cc22a303fab7/namespace_d3289d7a0f087014
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x62a
// Size: 0x22
function function_57d933cb919f81c4() {
    wait(0.5);
    function_6fba31415caeee6e(1);
    function_607860ac17c15475(#"hash_e6ebcd8d8d88008c");
}

// Namespace namespace_5026cc22a303fab7/namespace_d3289d7a0f087014
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x653
// Size: 0x22
function function_ed70f678fba22fc9(params) {
    return level.br_circle.circleindex >= 1;
}

// Namespace namespace_5026cc22a303fab7/namespace_d3289d7a0f087014
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x67d
// Size: 0x34
function function_6a79e9b0370877a3() {
    if (isdefined(self.var_657f5a0d17435bc.objectiveid)) {
        namespace_2e77b62bcb3c8d4b::function_4d03b9ef456d0972(self.var_657f5a0d17435bc.objectiveid);
    }
}

// Namespace namespace_5026cc22a303fab7/namespace_d3289d7a0f087014
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6b8
// Size: 0x8e
function function_c34995ac4640424c() {
    childthread function_cd83759e21f3ff42(&function_c34998ac464048e5);
    wait(3);
    if (!istrue(self.var_657f5a0d17435bc.var_e5f4f1115bddd970)) {
        function_9e0151baa208fe9e(#"buy_station");
        childthread function_7fdf3cf66304f3c5(self, 60, &function_6a79e9b0370877a3);
        self.var_657f5a0d17435bc.objectiveid = namespace_2e77b62bcb3c8d4b::function_e5524fb8509827bf(self.var_657f5a0d17435bc.var_e7cee4fbb5b46ef2.origin, "FTUE_BR/OPEN", "icon_ping_ftue_waypoint", 40, self);
    }
}

// Namespace namespace_5026cc22a303fab7/namespace_d3289d7a0f087014
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x74d
// Size: 0x35
function function_c34998ac464048e5() {
    function_81771105fc1a47cb(self);
    self.var_657f5a0d17435bc.var_e5f4f1115bddd970 = 1;
    function_6a79e9b0370877a3();
    childthread function_b40f17685dbcc4e6(&function_ee934ee06dde4bf4);
}

// Namespace namespace_5026cc22a303fab7/namespace_d3289d7a0f087014
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x789
// Size: 0x22
function function_ee934ee06dde4bf4() {
    wait(0.5);
    function_6fba31415caeee6e(1);
    function_607860ac17c15475(#"hash_8bb9a820eb837b00");
}

// Namespace namespace_5026cc22a303fab7/namespace_d3289d7a0f087014
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7b2
// Size: 0x39
function function_eee8c0a14817d1fd(params) {
    if (!istrue(self.var_f64605f38a1c7a57)) {
        return 0;
    }
    if (!function_8635d35b49720a75(2000)) {
        return 0;
    }
    if (!function_622045a32f8f175a(1500)) {
        return 0;
    }
    return 1;
}

// Namespace namespace_5026cc22a303fab7/namespace_d3289d7a0f087014
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7f3
// Size: 0x3f
function function_44487063b4b3727f() {
    function_9e0151baa208fe9e(#"armor");
    childthread function_7fdf3cf66304f3c5(self, 20);
    self waittill("armor_plate_inserted");
    function_81771105fc1a47cb(self);
    function_6fba31415caeee6e(1);
    self notify("currentContextualTipCompleted");
}

// Namespace namespace_5026cc22a303fab7/namespace_d3289d7a0f087014
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x839
// Size: 0x13
function function_17cebffd7c7c117c(params) {
    return function_d022875f2be5b645(params);
}

// Namespace namespace_5026cc22a303fab7/namespace_d3289d7a0f087014
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x854
// Size: 0x1d
function function_994c7d1d60d2711e() {
    namespace_2e77b62bcb3c8d4b::function_4d03b9ef456d0972(self.var_657f5a0d17435bc.objectiveid);
}

// Namespace namespace_5026cc22a303fab7/namespace_d3289d7a0f087014
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x878
// Size: 0xe9
function function_f7642b5100fab139() {
    function_9e0151baa208fe9e(#"loadout_drop");
    loadoutdrop = self.var_657f5a0d17435bc.var_495bb1c9678267c7;
    /#
        assert(isdefined(loadoutdrop));
    #/
    self.var_657f5a0d17435bc.objectiveid = namespace_2e77b62bcb3c8d4b::function_e5524fb8509827bf(loadoutdrop.origin + (0, 0, 67), "FTUE_BR/OPEN", "icon_ping_ftue_waypoint", 10, self);
    self.var_657f5a0d17435bc.var_2996fcbfab69d923 = #"loadout_drop";
    childthread namespace_d4c274f52daa4e49::function_4ae36036bf751abe(&function_78e6b7ae51b19e28);
    wait(4);
    if (isdefined(self.var_657f5a0d17435bc.var_2996fcbfab69d923)) {
        function_6fba31415caeee6e(1);
        function_9e0151baa208fe9e(#"hash_fc22821fd73e4c40");
        childthread function_7fdf3cf66304f3c5(self, 60, &function_994c7d1d60d2711e);
    }
}

// Namespace namespace_5026cc22a303fab7/namespace_d3289d7a0f087014
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x968
// Size: 0xa
function function_78e6b7ae51b19e28() {
    function_f764285100faaaa0();
}

// Namespace namespace_5026cc22a303fab7/namespace_d3289d7a0f087014
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x979
// Size: 0x2b
function function_f764285100faaaa0() {
    childthread namespace_d4c274f52daa4e49::function_43a9b7793648c22a(&function_f5ebdd40dec5a364);
    self.var_657f5a0d17435bc.var_2996fcbfab69d923 = undefined;
    function_81771105fc1a47cb(self);
}

// Namespace namespace_5026cc22a303fab7/namespace_d3289d7a0f087014
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9ab
// Size: 0x32
function function_f5ebdd40dec5a364(var_92be64cfae1e3ad6) {
    function_994c7d1d60d2711e();
    wait(0.5);
    function_6fba31415caeee6e(1);
    function_607860ac17c15475(#"hash_d7f9cb5b711a4e8");
}

// Namespace namespace_5026cc22a303fab7/namespace_d3289d7a0f087014
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9e4
// Size: 0x2b
function function_d1d6119f9061fd66(params) {
    if (!istrue(self.var_f64605f38a1c7a57)) {
        return 0;
    }
    if (!function_ab9169e967fe63e1(1500)) {
        return 0;
    }
    return 1;
}

// Namespace namespace_5026cc22a303fab7/namespace_d3289d7a0f087014
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa17
// Size: 0x1d
function function_ba3bccf05344c039() {
    namespace_2e77b62bcb3c8d4b::function_4d03b9ef456d0972(self.var_657f5a0d17435bc.objectiveid);
}

// Namespace namespace_5026cc22a303fab7/namespace_d3289d7a0f087014
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa3b
// Size: 0x15b
function function_81dc1fbdd05cbfbe() {
    function_9e0151baa208fe9e(#"contract");
    tablet = self.var_657f5a0d17435bc.var_352cb060814cbdf8;
    self.var_657f5a0d17435bc.objectiveid = namespace_2e77b62bcb3c8d4b::function_e5524fb8509827bf(tablet.origin, "FTUE_BR/PICKUP", "icon_ping_ftue_waypoint", 30, self);
    childthread function_7fdf3cf66304f3c5(self, 60, &function_ba3bccf05344c039);
    tablet waittill("onTabletHidden");
    function_81771105fc1a47cb(self);
    success = 0;
    if (isdefined(tablet.task.var_d154ac2657c5f44) && tablet.task.var_d154ac2657c5f44 == self) {
        success = 1;
    } else {
        checkteam = self.team;
        foreach (team in tablet.task.teams) {
            if (team == checkteam) {
                success = 1;
                break;
            }
        }
    }
    function_ba3bccf05344c039();
    function_6fba31415caeee6e(success);
    self notify("currentContextualTipCompleted");
}

// Namespace namespace_5026cc22a303fab7/namespace_d3289d7a0f087014
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb9d
// Size: 0x44
function function_a524f2861ab5b873(params) {
    if (!function_f656ad666eda6d08()) {
        return 0;
    }
    tablet = namespace_1eb3c4e0e28fac71::function_531ddda805acc45a(1000000);
    self.var_657f5a0d17435bc.var_352cb060814cbdf8 = tablet;
    return isdefined(tablet);
}

// Namespace namespace_5026cc22a303fab7/namespace_d3289d7a0f087014
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbe9
// Size: 0x13
function function_bb7f060ccd476483() {
    function_607860ac17c15475(#"hash_9fd26eb3cbd89c5d");
}

// Namespace namespace_5026cc22a303fab7/namespace_d3289d7a0f087014
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc03
// Size: 0x55
function function_1c786072fea7ca5a(params) {
    if (level.br_circle.circleindex < 0) {
        return 0;
    }
    if (!function_f656ad666eda6d08()) {
        return 0;
    }
    var_71dd2a61430c603f = function_8eb62efbab104b05();
    if (!isdefined(var_71dd2a61430c603f)) {
        return 0;
    }
    if (var_71dd2a61430c603f >= 2000) {
        return 0;
    }
    return 1;
}

// Namespace namespace_5026cc22a303fab7/namespace_d3289d7a0f087014
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc60
// Size: 0x13
function function_555708e0d1167ada() {
    function_607860ac17c15475(#"hash_28e5ba10e13cb57c");
}

// Namespace namespace_5026cc22a303fab7/namespace_d3289d7a0f087014
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xc7a
// Size: 0x39
function function_f3542fee745a1e3b(params) {
    if (level.br_circle.circleindex < 0) {
        return 0;
    }
    if (!function_f656ad666eda6d08()) {
        return 0;
    }
    return function_2f3ee72261187d51() == 0;
}

// Namespace namespace_5026cc22a303fab7/namespace_d3289d7a0f087014
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcbb
// Size: 0x13
function function_2c4c7b5ddc885005() {
    function_607860ac17c15475(#"gas_mask");
}

// Namespace namespace_5026cc22a303fab7/namespace_d3289d7a0f087014
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcd5
// Size: 0x82
function function_af1b1e3822028b73() {
    self endon("currentContextualTipCompleted");
    self endon("currentContextualTipAborted");
    function_9e0151baa208fe9e(#"hash_7aa905f1373a3e97");
    self.var_657f5a0d17435bc.objectiveid = namespace_2e77b62bcb3c8d4b::function_e5524fb8509827bf(self.var_657f5a0d17435bc.var_e7cee4fbb5b46ef2.origin, "FTUE_BR/OPEN", "icon_ping_ftue_waypoint", 40, self);
    childthread function_7fdf3cf66304f3c5(self, 60, &function_f41d1849666c096c);
    childthread function_759d3ef2d52c3723(&function_af1b1f3822028da6);
}

// Namespace namespace_5026cc22a303fab7/namespace_d3289d7a0f087014
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd5e
// Size: 0x1b
function function_af1b1f3822028da6() {
    function_f41d1849666c096c();
    function_6fba31415caeee6e(1);
    self notify("currentContextualTipCompleted");
}

// Namespace namespace_5026cc22a303fab7/namespace_d3289d7a0f087014
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd80
// Size: 0x1d
function function_f41d1849666c096c() {
    namespace_2e77b62bcb3c8d4b::function_4d03b9ef456d0972(self.var_657f5a0d17435bc.objectiveid);
}

// Namespace namespace_5026cc22a303fab7/namespace_d3289d7a0f087014
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xda4
// Size: 0x5e
function function_c640f7c92a1dcfb4(params) {
    if (!istrue(self.var_f64605f38a1c7a57)) {
        return 0;
    }
    var_b80e4d5abb5c9ab5 = function_259117d315c099f7();
    if (!isdefined(var_b80e4d5abb5c9ab5)) {
        return 0;
    }
    if (function_bbd25202175d7f6f(self, var_b80e4d5abb5c9ab5)) {
        return 0;
    }
    if (!function_8635d35b49720a75(3000)) {
        return 0;
    }
    if (!function_622045a32f8f175a(1500)) {
        return 0;
    }
    return 1;
}

// Namespace namespace_5026cc22a303fab7/namespace_d3289d7a0f087014
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe0a
// Size: 0x13
function function_ab02c605e39f879c() {
    function_607860ac17c15475(#"hash_2a0bf0ed33afed34");
}

// Namespace namespace_5026cc22a303fab7/namespace_d3289d7a0f087014
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe24
// Size: 0xe
function function_30f3ffbf8846e773(params) {
    return 1;
}

// Namespace namespace_5026cc22a303fab7/namespace_d3289d7a0f087014
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe3a
// Size: 0x13
function function_ceb7eff43423a647() {
    function_607860ac17c15475(#"hash_ab135d3ee145ff13");
}

// Namespace namespace_5026cc22a303fab7/namespace_d3289d7a0f087014
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe54
// Size: 0x7d
function function_cf0f867f8dfbea14(alive) {
    function_81771105fc1a47cb(self);
    currenttime = gettime();
    delta = currenttime - self.var_657f5a0d17435bc.var_17f4a3612d1a9962;
    if (delta < 2000) {
        wait((2000 - delta) / 1000);
    }
    if (alive) {
        function_7fd621b8ba80e652();
        self notify("currentContextualTipAborted");
    } else {
        function_6fba31415caeee6e(1);
        self notify("currentContextualTipCompleted");
    }
}

// Namespace namespace_5026cc22a303fab7/namespace_d3289d7a0f087014
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xed8
// Size: 0xb3
function function_cf0f897f8dfbf0ad() {
    function_9e0151baa208fe9e(#"hash_8f24aa6b15fa8c49");
    var_b75722a168830a14 = undefined;
    foreach (enemy in self.var_5a532b3d41b19c7a) {
        if (istrue(enemy.inlaststand)) {
            var_b75722a168830a14 = enemy;
            break;
        }
    }
    self.var_657f5a0d17435bc.var_17f4a3612d1a9962 = gettime();
    childthread function_7fdf3cf66304f3c5(self, 30);
    childthread function_79ff3ea7e538a94a(var_b75722a168830a14, &function_cf0f867f8dfbea14);
}

// Namespace namespace_5026cc22a303fab7/namespace_d3289d7a0f087014
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf92
// Size: 0x12
function function_96012a932e9bf76a(params) {
    return function_9505d2ab79b97ea();
}

// Namespace namespace_5026cc22a303fab7/namespace_d3289d7a0f087014
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfac
// Size: 0x3b
function function_5ccc391930eff3fe(alive) {
    function_81771105fc1a47cb(self);
    if (alive) {
        function_6fba31415caeee6e(1);
        self notify("currentContextualTipCompleted");
    } else {
        function_7fd621b8ba80e652();
        self notify("currentContextualTipAborted");
    }
}

// Namespace namespace_5026cc22a303fab7/namespace_d3289d7a0f087014
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfee
// Size: 0x99
function function_5ccc381930eff1cb() {
    function_9e0151baa208fe9e(#"hash_739cf57ee74f95af");
    var_fe042a8a4b5f075a = undefined;
    foreach (ally in self.var_ffddba74f404a30) {
        if (istrue(ally.inlaststand)) {
            var_fe042a8a4b5f075a = ally;
            break;
        }
    }
    childthread function_7fdf3cf66304f3c5(self, 30);
    function_79ff3ea7e538a94a(var_fe042a8a4b5f075a, &function_5ccc391930eff3fe);
}

// Namespace namespace_5026cc22a303fab7/namespace_d3289d7a0f087014
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x108e
// Size: 0x12
function function_8e58b2b46876536a(params) {
    return function_8721b096ae4bee70();
}

// Namespace namespace_5026cc22a303fab7/namespace_d3289d7a0f087014
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10a8
// Size: 0x60
function function_84abeabd27c888e2() {
    var_85eb4bbfb8235f57 = 0;
    var_c44d6763b7f8d4f0 = 0;
    while (1) {
        wait(0.5);
        if (self issprintsliding()) {
            var_85eb4bbfb8235f57 = 1;
        }
        if (self function_e5bf22923d0004bc()) {
            var_c44d6763b7f8d4f0 = 1;
        }
        if (var_85eb4bbfb8235f57 && var_c44d6763b7f8d4f0) {
            break;
        }
    }
    function_6fba31415caeee6e(1);
    self notify("currentContextualTipCompleted");
}

// Namespace namespace_5026cc22a303fab7/namespace_d3289d7a0f087014
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x110f
// Size: 0x1c
function function_1b9b4f723d9feac9() {
    childthread function_607860ac17c15475(#"movement");
    childthread function_84abeabd27c888e2();
}

// Namespace namespace_5026cc22a303fab7/namespace_d3289d7a0f087014
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1132
// Size: 0x33
function function_667299d35d882a50(params) {
    if (!istrue(self.var_f64605f38a1c7a57)) {
        return 0;
    }
    if (!self issprinting()) {
        return 0;
    }
    if (!function_f656ad666eda6d08()) {
        return 0;
    }
    return 1;
}

// Namespace namespace_5026cc22a303fab7/namespace_d3289d7a0f087014
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x116d
// Size: 0x2e
function function_e68d3859909c0911() {
    while (1) {
        wait(1);
        if (!self isswimming()) {
            break;
        }
    }
    function_6fba31415caeee6e(1);
    self notify("currentContextualTipCompleted");
}

// Namespace namespace_5026cc22a303fab7/namespace_d3289d7a0f087014
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11a2
// Size: 0x1c
function function_dc7c24595cd45511() {
    childthread function_607860ac17c15475(#"swimming");
    childthread function_e68d3859909c0911();
}

// Namespace namespace_5026cc22a303fab7/namespace_d3289d7a0f087014
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11c5
// Size: 0x24
function function_517845029dff50a8(params) {
    if (!function_36aef9bc7f44e7d4()) {
        return 0;
    }
    if (!self isswimming()) {
        return 0;
    }
    return 1;
}

// Namespace namespace_5026cc22a303fab7/namespace_d3289d7a0f087014
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11f1
// Size: 0x13
function function_80805c1c42953611() {
    function_607860ac17c15475(#"hash_a4bb8c12b7dac1bf");
}

// Namespace namespace_5026cc22a303fab7/namespace_d3289d7a0f087014
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x120b
// Size: 0x13
function function_314529a28163a3b9() {
    function_607860ac17c15475(#"hash_3b76ad87155a6c47");
}

// Namespace namespace_5026cc22a303fab7/namespace_d3289d7a0f087014
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1225
// Size: 0x84
function function_f8e3bba28792512c() {
    starttime = gettime();
    function_9e0151baa208fe9e(#"sprint");
    childthread function_7fdf3cf66304f3c5(self, 20);
    while (1) {
        if (self issprinting()) {
            break;
        }
        waitframe();
    }
    currenttime = gettime();
    delta = currenttime - starttime;
    if (delta < 2000) {
        wait((2000 - delta) / 1000);
    }
    function_6fba31415caeee6e(1);
    self notify("currentContextualTipCompleted");
}

// Namespace namespace_5026cc22a303fab7/namespace_d3289d7a0f087014
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12b0
// Size: 0x3f
function function_600c2050e11fc551(params) {
    if (!istrue(self.var_f64605f38a1c7a57)) {
        return 0;
    }
    vel = self getvelocity();
    if (length2dsquared(vel) == 0) {
        return 0;
    }
    return 1;
}

// Namespace namespace_5026cc22a303fab7/namespace_d3289d7a0f087014
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12f7
// Size: 0x13
function function_57e7ab31b49a7316() {
    function_607860ac17c15475(#"hash_d4a0158f1a7aa1d7");
}

// Namespace namespace_5026cc22a303fab7/namespace_d3289d7a0f087014
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1311
// Size: 0x16
function function_732b91978acfb157(params) {
    return istrue(self.var_f64605f38a1c7a57);
}

// Namespace namespace_5026cc22a303fab7/namespace_d3289d7a0f087014
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x132f
// Size: 0x13
function function_5f9daa57cf99f444() {
    function_607860ac17c15475(#"hash_489325c89046a3ac");
}

// Namespace namespace_5026cc22a303fab7/namespace_d3289d7a0f087014
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1349
// Size: 0xd
function function_23cb9539b0097a63(params) {
    return 0;
}

// Namespace namespace_5026cc22a303fab7/namespace_d3289d7a0f087014
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x135e
// Size: 0x13
function function_977607749534a65c() {
    function_607860ac17c15475(#"hash_5fc7d6a8dccc423a");
}

// Namespace namespace_5026cc22a303fab7/namespace_d3289d7a0f087014
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1378
// Size: 0x12
function function_390588110ddad141() {
    self notify("FTUEAbortedTipParachute");
    namespace_91fad7208d9cd856::function_5ebbaba0d200b31();
}

// Namespace namespace_5026cc22a303fab7/namespace_d3289d7a0f087014
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1391
// Size: 0xb5
function function_9a20a7c14d389880() {
    self endon("disconnect");
    self endon("contextual_tips_disable");
    while (1) {
        var_a5b2c541413aa895 = quantity = lootid = self waittill("looted_item");
        if (isdefined(lootid)) {
            scriptablename = loot::getScriptableFromLootID(lootid);
            if (!isdefined(scriptablename)) {
                continue;
            }
            if (namespace_cb965d2f71fefddc::isgasmask(scriptablename)) {
                namespace_91fad7208d9cd856::function_28f32fc9e57814f6(#"gasmask");
            } else if (namespace_cb965d2f71fefddc::function_36de08ea672b354c(scriptablename)) {
                namespace_91fad7208d9cd856::function_28f32fc9e57814f6(#"hash_67b4a0e4770477a8");
            } else if (namespace_a548bd428a566cf3::function_4aa12e0ed3f6b745(scriptablename)) {
                namespace_91fad7208d9cd856::function_28f32fc9e57814f6(#"hash_f06bff220930473e");
            }
        }
    }
}

// Namespace namespace_5026cc22a303fab7/namespace_d3289d7a0f087014
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x144d
// Size: 0x97
function function_58583531a63a9abb(player_action, params) {
    if (!isdefined(self.var_657f5a0d17435bc)) {
        return;
    }
    switch (player_action) {
    case #"hash_d4132d67eea54c62":
        function_28f32fc9e57814f6(#"hash_67ceeff853cbbd03");
        break;
    case #"hash_3c12c1b463a4d046":
        function_28f32fc9e57814f6(#"hash_aa2010e86bdbccad");
        break;
    case #"hash_17d62f3c71ab9938":
        function_28f32fc9e57814f6(#"hash_c16776e7ab43bb8b");
        break;
    default:
        break;
    }
}

