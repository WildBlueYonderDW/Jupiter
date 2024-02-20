// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\cp_mp\killstreaks\airdrop.gsc;
#using scripts\cp_mp\utility\killstreak_utility.gsc;
#using scripts\mp\utility\killstreak.gsc;
#using scripts\mp\killstreaks\killstreaks.gsc;
#using scripts\mp\damage.gsc;

#namespace namespace_36d70b271b5b0361;

// Namespace namespace_36d70b271b5b0361/namespace_3413711df74a6e30
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbf
// Size: 0x2a
function airdrop_multiple_init() {
    namespace_58a74e7d54b56e8d::registerkillstreak("airdrop_multiple", &namespace_6c578d6ef48f10ef::tryuseairdropmarkerfromstruct);
    namespace_3c37cb17ade254d::registersharedfunc("airdrop_multiple", "monitorDamage", &airdrop_multiple_monitordamage);
}

// Namespace namespace_36d70b271b5b0361/namespace_3413711df74a6e30
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf0
// Size: 0x4b
function airdrop_multiple_monitordamage(maxhealth, damagefeedback, var_c5d89c3a1224b118, var_d7b6456018542238, var_a1823ac1157568db, rumble, var_22435c27e2916650) {
    namespace_3e725f3cc58bddd3::monitordamage(maxhealth, damagefeedback, var_c5d89c3a1224b118, var_d7b6456018542238, var_a1823ac1157568db, rumble, var_22435c27e2916650);
}

