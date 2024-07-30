#using script_3db04fd1b466bdba;
#using scripts\engine\utility.gsc;
#using script_16ea1b94f0f381b3;

#namespace namespace_e893c4b348cb7bdc;

// Namespace namespace_e893c4b348cb7bdc / namespace_9bd3ffe069c7fbeb
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0x195
// Size: 0x18
function autoexec main() {
    function_df7ab5b0f898e8bc(function_1823ff50bb28148d("laser_charge"), &init);
}

// Namespace namespace_e893c4b348cb7bdc / namespace_9bd3ffe069c7fbeb
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1b5
// Size: 0x9f
function private init() {
    if (issharedfuncdefined("killstreak", "registerKillstreak")) {
        [[ getsharedfunc("killstreak", "registerKillstreak") ]]("laser_charge", &function_8d078aa4eb392280);
    }
    bundle = level.streakglobals.streakbundles["laser_charge"];
    weapon = isdefined(bundle) && isdefined(bundle.var_69539d680440246) ? bundle.var_69539d680440246 : "super_laser_charge_mp";
    function_a41e3a211a9e37a4("laser_charge", weapon, #"low");
}

// Namespace namespace_e893c4b348cb7bdc / namespace_9bd3ffe069c7fbeb
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x25c
// Size: 0xf8
function private function_8d078aa4eb392280(streakinfo) {
    self endon("disconnect");
    level endon("game_ended");
    if (isdefined(level.killstreaktriggeredfunc)) {
        if (!level [[ level.killstreaktriggeredfunc ]](streakinfo)) {
            return 0;
        }
    }
    if (issharedfuncdefined("super_laser_charge", "tryUse")) {
        if (isdefined(level.killstreakbeginusefunc)) {
            if (!level [[ level.killstreakbeginusefunc ]](streakinfo)) {
                return 0;
            }
        }
        bundle = level.streakglobals.streakbundles["laser_charge"];
        result = function_f3bb4f4911a1beb2("super_laser_charge", "tryUse", bundle);
        if (istrue(result)) {
            self notify("disable_super_speed_vfx");
            var_f2eae836d85655f4 = waittill_any_return_no_endon_death_2("superLaserCharge_finishedWithoutRefund", "superLaserCharge_refund");
            result = var_f2eae836d85655f4 == "superLaserCharge_finishedWithoutRefund";
            self notify("enable_super_speed_vfx");
        }
        return result;
    }
    assertmsg("The super version of laser charge is not initialized.");
    return 0;
}

