// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using script_7b2517368c79e5bc;
#using script_3e2f8cc477d57433;

#namespace namespace_41242478a801e045;

// Namespace namespace_41242478a801e045/namespace_82f57af4564d38c5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa9
// Size: 0x28
function function_f2c483126e453846() {
    function_900f562c61c6a5d6("backpack", &function_631b0586e908a3b5, &function_cadc1e993f5a9179, &function_fe2f7ae6de16c38, &function_68adabf8bf68c0f4, &function_6e702ceeac07b35a);
}

// Namespace namespace_41242478a801e045/namespace_82f57af4564d38c5
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd8
// Size: 0x87
function function_631b0586e908a3b5(var_c1c3ecdd33dec5b7, item, var_11648d9cb3869a36) {
    /#
        /#
            assert(isdefined(var_c1c3ecdd33dec5b7) && var_c1c3ecdd33dec5b7.type == "<unknown string>");
        #/
    #/
    function_32c79be2384f10fb(var_c1c3ecdd33dec5b7.backpacksize, var_c1c3ecdd33dec5b7);
    self.var_766fdf296110fa0b = item.type;
    self setclientomnvar("backpack_lootid", function_6d15e119c2779a93(var_c1c3ecdd33dec5b7));
    return item.count - 1;
}

// Namespace namespace_41242478a801e045/namespace_82f57af4564d38c5
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x167
// Size: 0x48
function function_cadc1e993f5a9179(var_c1c3ecdd33dec5b7, item, var_11648d9cb3869a36, var_567689a460beab1c) {
    /#
        /#
            assert(isdefined(var_c1c3ecdd33dec5b7) && var_c1c3ecdd33dec5b7.type == "<unknown string>");
        #/
    #/
    return 0;
}

// Namespace namespace_41242478a801e045/namespace_82f57af4564d38c5
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b7
// Size: 0x7d
function function_fe2f7ae6de16c38(var_c1c3ecdd33dec5b7, item, var_11648d9cb3869a36, var_567689a460beab1c) {
    /#
        /#
            assert(isdefined(var_c1c3ecdd33dec5b7) && var_c1c3ecdd33dec5b7.type == "<unknown string>");
        #/
    #/
    var_7448836fc0de92a7 = function_1b35b10884bd8d67();
    var_e581c3a8c1025c69 = function_53c4c53197386572(var_c1c3ecdd33dec5b7.backpacksize, function_286713f0349afb22());
    return var_7448836fc0de92a7 < var_e581c3a8c1025c69;
}

// Namespace namespace_41242478a801e045/namespace_82f57af4564d38c5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x23c
// Size: 0x8c
function function_68adabf8bf68c0f4() {
    var_c1c3ecdd33dec5b7 = undefined;
    item_count = 0;
    if (isdefined(self.var_766fdf296110fa0b)) {
        var_9ec97bdad14a0a5b = function_2cdc55ba39d97d70(self.var_766fdf296110fa0b);
        if (isdefined(var_9ec97bdad14a0a5b)) {
            var_c1c3ecdd33dec5b7 = getscriptbundle("itemspawnentry:" + var_9ec97bdad14a0a5b);
            if (isdefined(var_c1c3ecdd33dec5b7)) {
                /#
                    /#
                        assert(isdefined(var_c1c3ecdd33dec5b7) && var_c1c3ecdd33dec5b7.type == "<unknown string>");
                    #/
                #/
                item_count = 1;
            }
        }
    }
    return [0:var_c1c3ecdd33dec5b7, 1:item_count];
}

// Namespace namespace_41242478a801e045/namespace_82f57af4564d38c5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d0
// Size: 0x2a
function function_6e702ceeac07b35a(var_7f278373c13f38a7) {
    function_32c79be2384f10fb();
    self.var_766fdf296110fa0b = undefined;
    self setclientomnvar("backpack_lootid", 0);
}

