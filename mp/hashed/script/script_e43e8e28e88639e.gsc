#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\cp_mp\utility\weapon_utility.gsc;

#namespace popsmoke;

// Namespace popsmoke / namespace_5867b152e0697992
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xd1
// Size: 0xcf
function function_933806fb8408353d(smoketags) {
    if (!isdefined(smoketags)) {
        smoketags = ["tag_origin"];
    }
    if (!isarray(smoketags)) {
        smoketags = [smoketags];
    }
    owner = self.owner;
    foreach (tag in smoketags) {
        function_3677f2be30fdd581(tag, "popsmoke");
        grenade = magicgrenademanual("popsmoke_grenade_mp", self gettagorigin(tag), anglestoup(self gettagangles(tag)) * 300);
        grenade.owner = owner;
        wait 0.25;
    }
}

