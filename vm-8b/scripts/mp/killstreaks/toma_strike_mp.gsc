#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\cp_mp\utility\killstreak_utility.gsc;
#using scripts\mp\utility\killstreak.gsc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\hud_util.gsc;
#using scripts\mp\killstreaks\killstreaks.gsc;
#using scripts\cp_mp\killstreaks\toma_strike.gsc;
#using scripts\mp\damage.gsc;
#using scripts\mp\equipment\molotov.gsc;

#namespace toma_strike_mp;

// Namespace toma_strike_mp / scripts\mp\killstreaks\toma_strike_mp
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x15b
// Size: 0xa5
function init() {
    scripts\mp\killstreaks\killstreaks::registerkillstreak("toma_strike", &scripts\cp_mp\killstreaks\toma_strike::tryusetomastrikefromstruct);
    scripts\engine\utility::registersharedfunc("toma_strike", "monitorDamage", &toma_strike_monitordamage);
    scripts\engine\utility::registersharedfunc("toma_strike", "molotov_branch_draw_hits", &toma_strike_molotov_branch_draw_hits);
    bundle = level.streakglobals.streakbundles["toma_strike"];
    if (isdefined(bundle) && isdefined(bundle.var_d2a6e2899c72649b)) {
        [[ getsharedfunc("killstreak", "registerKillstreakDamageDealingWeapon") ]]("toma_strike", bundle.var_d2a6e2899c72649b, #"medium");
    }
}

// Namespace toma_strike_mp / scripts\mp\killstreaks\toma_strike_mp
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0x208
// Size: 0x4a
function toma_strike_monitordamage(maxhealth, damagefeedback, ondeathfunc, var_d7b6456018542238, biskillstreak, rumble, resetdamagetaken) {
    scripts\mp\damage::monitordamage(maxhealth, damagefeedback, ondeathfunc, var_d7b6456018542238, biskillstreak, rumble, resetdamagetaken);
}

// Namespace toma_strike_mp / scripts\mp\killstreaks\toma_strike_mp
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x25a
// Size: 0xd
function toma_strike_molotov_branch_draw_hits() {
    /#
        thread scripts\mp\equipment\molotov::molotov_branch_draw_hits();
    #/
}

