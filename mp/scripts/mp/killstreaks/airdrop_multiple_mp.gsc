#using scripts\common\utility;
#using scripts\cp_mp\killstreaks\airdrop;
#using scripts\cp_mp\utility\killstreak_utility;
#using scripts\engine\utility;
#using scripts\mp\damage;
#using scripts\mp\killstreaks\killstreaks;
#using scripts\mp\utility\killstreak;

#namespace namespace_36d70b271b5b0361;

// Namespace namespace_36d70b271b5b0361 / scripts\mp\killstreaks\airdrop_multiple_mp
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe5
// Size: 0x29
function airdrop_multiple_init() {
    scripts\mp\killstreaks\killstreaks::registerkillstreak("airdrop_multiple", &scripts\cp_mp\killstreaks\airdrop::tryuseairdropmarkerfromstruct);
    scripts\engine\utility::registersharedfunc("airdrop_multiple", "monitorDamage", &airdrop_multiple_monitordamage);
}

// Namespace namespace_36d70b271b5b0361 / scripts\mp\killstreaks\airdrop_multiple_mp
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0x116
// Size: 0x4a
function airdrop_multiple_monitordamage(maxhealth, damagefeedback, ondeathfunc, var_d7b6456018542238, biskillstreak, rumble, resetdamagetaken) {
    scripts\mp\damage::monitordamage(maxhealth, damagefeedback, ondeathfunc, var_d7b6456018542238, biskillstreak, rumble, resetdamagetaken);
}

