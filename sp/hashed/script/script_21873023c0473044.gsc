#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using scripts\cp_mp\utility\killstreak_utility.gsc;
#using scripts\cp_mp\utility\weapon_utility.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\engine\trace.gsc;
#using scripts\cp_mp\killstreaks\helper_drone.gsc;

#namespace namespace_cfd52d213f603cb1;

// Namespace namespace_cfd52d213f603cb1 / namespace_cd93521d79292cf4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd5
// Size: 0xb
function function_c260cd16a5c5a2d9() {
    level thread function_344254816bb001eb();
}

// Namespace namespace_cfd52d213f603cb1 / namespace_cd93521d79292cf4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe8
// Size: 0x3d
function function_344254816bb001eb() {
    waitframe();
    level.helperdronesettings["assault_drone"].var_cb2c3fe0819193eb = 36000000;
    level.helperdronesettings["assault_drone"].var_1947a47c2174d02c = 0;
}

// Namespace namespace_cfd52d213f603cb1 / namespace_cd93521d79292cf4
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x12d
// Size: 0x82
function function_28fc7edb00dd6601(var_876657a6669c093a) {
    flag_clear("player_demigod");
    if (!isdefined(self.lastdroppableweaponobj) || !self hasweapon(self.lastdroppableweaponobj)) {
        lastweaponobj = "iw9_me_fists_mp";
    } else {
        lastweaponobj = scripts\cp_mp\utility\weapon_utility::restoreweaponstates(self.lastdroppableweaponobj);
    }
    _switchtoweaponimmediate(lastweaponobj);
    currentweapon = self getcurrentweapon();
    if (isdefined(currentweapon)) {
        _takeweapon(currentweapon);
    }
}

