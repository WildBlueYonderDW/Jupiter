// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\utility\perk.gsc;
#using scripts\mp\archetypes\archassault.gsc;

#namespace namespace_1f3dad5168a71f24;

// Namespace namespace_1f3dad5168a71f24/namespace_93ae9c099aee8626
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfb
// Size: 0xaf
function init() {
    level.archetypes = [];
    level.archetypeids = [];
    for (row = 0; 1; row++) {
        index = tablelookupbyrow("mp/battleRigTable.csv", row, 0);
        if (!isdefined(index) || index == "") {
            break;
        }
        index = int(index);
        ref = tablelookupbyrow("mp/battleRigTable.csv", row, 1);
        /#
            assertex(isdefined("ref"), "Battle rig #" + index + " has no ref");
        #/
        level.archetypes[index] = ref;
        level.archetypeids[ref] = index;
    }
}

// Namespace namespace_1f3dad5168a71f24/namespace_93ae9c099aee8626
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b1
// Size: 0x54
function removearchetype(loadoutarchetype) {
    if (!isdefined(loadoutarchetype)) {
        return;
    }
    var_f3297d3d4075dcb7 = undefined;
    switch (loadoutarchetype) {
    case #"hash_98ff6f21872f18e0":
        var_f3297d3d4075dcb7 = &namespace_c3864852d989b3e2::removearchetype;
        break;
    default:
        return;
    }
    if (isdefined(var_f3297d3d4075dcb7)) {
        self [[ var_f3297d3d4075dcb7 ]]();
    }
}

// Namespace namespace_1f3dad5168a71f24/namespace_93ae9c099aee8626
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x20c
// Size: 0x27
function _allowbattleslide(allow) {
    if (allow) {
        giveperk("specialty_battleslide");
    } else {
        self notify("battleslide_unset");
    }
}

// Namespace namespace_1f3dad5168a71f24/namespace_93ae9c099aee8626
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x23a
// Size: 0x53
function getrigindexfromarchetyperef(var_c156d240d6457e18) {
    if (!isdefined(var_c156d240d6457e18) || var_c156d240d6457e18 == "none") {
        return 0;
    }
    for (rigindex = 0; rigindex < level.archetypes.size; rigindex++) {
        if (level.archetypes[rigindex] == var_c156d240d6457e18) {
            return rigindex;
        }
    }
    return 0;
}

