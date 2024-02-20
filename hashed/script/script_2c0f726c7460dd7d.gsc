// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_5d813d45c6b1b1be;
#using script_4c770a9a4ad7659c;

#namespace namespace_a461e274605f517e;

// Namespace namespace_a461e274605f517e/namespace_ae612cf681deb69f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x113
// Size: 0xdd
function init(var_5179c48492d1d2c2) {
    function_efabc5ae0422de9e(var_5179c48492d1d2c2, 1, undefined, "sitting");
    var_5179c48492d1d2c2.challenge_complete = 0;
    var_6f843dba685f7427 = getstruct(var_5179c48492d1d2c2.target, "targetname");
    var_996e17f57fe6dbc2 = function_698513ab21b7913d(var_6f843dba685f7427);
    var_5179c48492d1d2c2.var_996e17f57fe6dbc2 = var_996e17f57fe6dbc2;
    var_c219b38a2b399431 = getstruct(var_6f843dba685f7427.target, "targetname");
    var_c857498ee35557b4 = function_698513ab21b7913d(var_c219b38a2b399431);
    var_5179c48492d1d2c2.var_c857498ee35557b4 = var_c857498ee35557b4;
    var_5179c48492d1d2c2.reward_struct = getstruct(var_c219b38a2b399431.target, "targetname");
    thread function_7997e8c2ef236551(var_5179c48492d1d2c2);
    thread function_d1db5a0838b22a18(var_5179c48492d1d2c2);
}

// Namespace namespace_a461e274605f517e/namespace_ae612cf681deb69f
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1f7
// Size: 0x96
function private function_7997e8c2ef236551(var_5179c48492d1d2c2) {
    while (isdefined(var_5179c48492d1d2c2) && !istrue(var_5179c48492d1d2c2.challenge_complete)) {
        data = var_5179c48492d1d2c2.var_996e17f57fe6dbc2 waittill("trigger");
        if (isplayer(data) && !data isonground()) {
            if (!istrue(data.var_c9a127bae678ade5)) {
                /#
                    iprintlnbold("<unknown string>");
                #/
                data.var_c9a127bae678ade5 = 1;
                data.var_6453e34a7bfd9886 = 1;
                data thread function_6a4ceb59f0de0801();
            }
        }
    }
}

// Namespace namespace_a461e274605f517e/namespace_ae612cf681deb69f
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x294
// Size: 0x5a
function private function_6a4ceb59f0de0801() {
    self endon("MRP_CANNONBALL_NOTIFY_SUCCESS");
    self endon("MRP_CANNONBALL_NOTIFY_FAIL");
    while (!self isonground()) {
        wait(0.1);
    }
    if (istrue(self.var_6453e34a7bfd9886)) {
        /#
            iprintlnbold("<unknown string>");
        #/
        self.var_c9a127bae678ade5 = undefined;
        self.var_6453e34a7bfd9886 = undefined;
        self notify("MRP_CANNONBALL_NOTIFY_FAIL");
    }
}

// Namespace namespace_a461e274605f517e/namespace_ae612cf681deb69f
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x2f5
// Size: 0x50
function private function_a3fb62f5dda0b5a() {
    self endon("MRP_CANNONBALL_NOTIFY_SUCCESS");
    self endon("MRP_CANNONBALL_NOTIFY_FAIL");
    self waittill("skydive_deployparachute");
    if (istrue(self.var_6453e34a7bfd9886)) {
        /#
            iprintlnbold("<unknown string>");
        #/
        self.var_c9a127bae678ade5 = undefined;
        self.var_6453e34a7bfd9886 = undefined;
        self notify("MRP_CANNONBALL_NOTIFY_FAIL");
    }
}

// Namespace namespace_a461e274605f517e/namespace_ae612cf681deb69f
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x34c
// Size: 0xd9
function private function_d1db5a0838b22a18(var_5179c48492d1d2c2) {
    var_5179c48492d1d2c2 endon("MRP_CANNONBALL_NOTIFY_SUCCESS");
    while (isdefined(var_5179c48492d1d2c2) && !istrue(var_5179c48492d1d2c2.challenge_complete)) {
        data = var_5179c48492d1d2c2.var_c857498ee35557b4 waittill("trigger");
        if (isplayer(data) && data isswimming() && istrue(data.var_6453e34a7bfd9886)) {
            /#
                iprintlnbold("<unknown string>");
            #/
            data.var_c9a127bae678ade5 = undefined;
            data.var_6453e34a7bfd9886 = undefined;
            var_5179c48492d1d2c2.challenge_complete = 1;
            var_5179c48492d1d2c2.var_996e17f57fe6dbc2 delete();
            var_5179c48492d1d2c2.var_c857498ee35557b4 delete();
            thread function_82d05bedc3350817(data, var_5179c48492d1d2c2);
            data notify("MRP_CANNONBALL_NOTIFY_SUCCESS");
            var_5179c48492d1d2c2 notify("MRP_CANNONBALL_NOTIFY_SUCCESS");
        }
    }
}

// Namespace namespace_a461e274605f517e/namespace_ae612cf681deb69f
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x42c
// Size: 0x2d
function private function_82d05bedc3350817(player, var_5179c48492d1d2c2) {
    function_568b8a57e0fa955f(var_5179c48492d1d2c2, player);
    namespace_8eedd8f6cf5d9f19::function_a4dfabe55dd4a652(player, undefined, "ob_jup_items_activity_mrp_pool", 1);
}

