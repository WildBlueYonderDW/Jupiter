// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\cp_mp\utility\weapon_utility.gsc;

#namespace popsmoke;

// Namespace popsmoke/namespace_5867b152e0697992
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa8
// Size: 0xd3
function function_933806fb8408353d(var_d874d4b7cf5258db) {
    if (!isdefined(var_d874d4b7cf5258db)) {
        var_d874d4b7cf5258db = [0:"tag_origin"];
    }
    if (!isarray(var_d874d4b7cf5258db)) {
        var_d874d4b7cf5258db = [0:var_d874d4b7cf5258db];
    }
    owner = self.owner;
    foreach (tag in var_d874d4b7cf5258db) {
        function_3677f2be30fdd581(tag, "popsmoke");
        grenade = magicgrenademanual("popsmoke_grenade_mp", self gettagorigin(tag), anglestoup(self gettagangles(tag)) * 300);
        grenade.owner = owner;
        wait(0.25);
    }
}

