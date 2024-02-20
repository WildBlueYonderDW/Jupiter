// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;

#namespace turret;

// Namespace turret/namespace_f9b483201b8dd924
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x90
// Size: 0xb1
function turret_vm_playeranims_think() {
    self endon("death");
    while (1) {
        self waittill("turretownerchange");
        player = self getturretowner();
        weap = undefined;
        if (isdefined(player) && isplayer(player) && !isbot(player)) {
            player giveweapon(self.weaponinfo);
            weap = player getcurrentweapon();
            player switchtoweaponimmediate(self.weaponinfo);
        }
        self waittill("turretownerchange");
        if (isdefined(player) && isplayer(player) && !isbot(player)) {
            player switchtoweaponimmediate(weap);
            player takeweapon(self.weaponinfo);
        }
    }
}

