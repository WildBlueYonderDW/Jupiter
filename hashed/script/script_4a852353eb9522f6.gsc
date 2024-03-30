// mwiii decomp prototype
#using script_7c40fa80892a721;

#namespace namespace_8e943b1ae0e1a01b;

// Namespace namespace_8e943b1ae0e1a01b / namespace_1f9da9cc2a77d53e
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x165
// Size: 0x5a
function function_cdf4890b38273393(player, position, pickedcallback) {
    var_276f41532514ddcc = function_aebdf233df00e83d(player);
    item = function_59ce33cc585f367e(position, (0, 0, 0), player);
    player thread function_d81f5f7fa0dddb1e(var_276f41532514ddcc, pickedcallback);
    return item;
}

// Namespace namespace_8e943b1ae0e1a01b / namespace_1f9da9cc2a77d53e
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x1c7
// Size: 0x1f
function private function_aebdf233df00e83d(player) {
    count = player namespace_f8d3520d3483c1::function_600f6cf462e983f();
    return count;
}

// Namespace namespace_8e943b1ae0e1a01b / namespace_1f9da9cc2a77d53e
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x1ee
// Size: 0x51
function private function_59ce33cc585f367e(position, rotation, player) {
    item = spawnscriptable("brloot_armor_plate", position, rotation, 0);
    if (!isdefined(item)) {
        return;
    }
    function_e4d73eb84e34c49f(item);
    item.count = 1;
    return item;
}

// Namespace namespace_8e943b1ae0e1a01b / namespace_1f9da9cc2a77d53e
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x247
// Size: 0xb7
function private function_e4d73eb84e34c49f(instance) {
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

// Namespace namespace_8e943b1ae0e1a01b / namespace_1f9da9cc2a77d53e
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x305
// Size: 0x4e
function private function_d81f5f7fa0dddb1e(var_8e973702bc8bb72a, pickedcallback) {
    self endon("death_or_disconnect");
    currentvalue = function_aebdf233df00e83d(self);
    while (var_8e973702bc8bb72a == currentvalue) {
        currentvalue = function_aebdf233df00e83d(self);
        if (currentvalue < var_8e973702bc8bb72a) {
            var_8e973702bc8bb72a = currentvalue;
        }
        waitframe();
    }
    self [[ pickedcallback ]]();
}

// Namespace namespace_8e943b1ae0e1a01b / namespace_1f9da9cc2a77d53e
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x35a
// Size: 0x35
function function_d92343be83930b25(player, equipcallback) {
    var_f9bd260cd70a6187 = player.armorhealth;
    player thread function_dca51bc9d625ec23(var_f9bd260cd70a6187, equipcallback);
}

// Namespace namespace_8e943b1ae0e1a01b / namespace_1f9da9cc2a77d53e
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x396
// Size: 0x4b
function private function_dca51bc9d625ec23(var_f840b1fd8f763c57, equipcallback) {
    self endon("death_or_disconnect");
    while (var_f840b1fd8f763c57 == self.armorhealth) {
        waitframe();
        if (self.armorhealth < var_f840b1fd8f763c57) {
            var_f840b1fd8f763c57 = self.armorhealth;
        }
    }
    self [[ equipcallback ]]();
}

