#using scripts\common\utility;
#using scripts\cp_mp\utility\killstreak_utility;
#using scripts\engine\utility;

#namespace namespace_36ceff271b52fd4f;

// Namespace namespace_36ceff271b52fd4f / scripts\cp\killstreaks\airdrop_multiple_cp
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9f
// Size: 0x18
function airdrop_multiple_init() {
    scripts\engine\utility::registersharedfunc("airdrop_multiple", "monitorDamage", &airdrop_multiple_monitordamage);
}

// Namespace namespace_36ceff271b52fd4f / scripts\cp\killstreaks\airdrop_multiple_cp
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0xbf
// Size: 0x42
function airdrop_multiple_monitordamage(maxhealth, damagefeedback, ondeathfunc, var_d7b6456018542238, biskillstreak, rumble, resetdamagetaken) {
    coop_handle_invuln_ac130();
}

// Namespace namespace_36ceff271b52fd4f / scripts\cp\killstreaks\airdrop_multiple_cp
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x109
// Size: 0x17
function coop_handle_invuln_ac130() {
    if (istrue(level.invulnerable_airdropmultiple_ac130s)) {
        self setcandamage(0);
    }
}

