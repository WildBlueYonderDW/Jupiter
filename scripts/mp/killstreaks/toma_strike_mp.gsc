// mwiii decomp prototype
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

#namespace namespace_736c1c104571a33;

// Namespace namespace_736c1c104571a33/namespace_593aa949abab02a4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12c
// Size: 0xa5
function init() {
    namespace_58a74e7d54b56e8d::registerkillstreak("toma_strike", &namespace_25d6bd23fd862a00::tryusetomastrikefromstruct);
    namespace_3c37cb17ade254d::registersharedfunc("toma_strike", "monitorDamage", &toma_strike_monitordamage);
    namespace_3c37cb17ade254d::registersharedfunc("toma_strike", "molotov_branch_draw_hits", &toma_strike_molotov_branch_draw_hits);
    bundle = level.var_b23156d776b1d85.var_38f2a11237246ac["toma_strike"];
    if (isdefined(bundle) && isdefined(bundle.var_d2a6e2899c72649b)) {
        [[ getsharedfunc("killstreak", "registerKillstreakDamageDealingWeapon") ]]("toma_strike", bundle.var_d2a6e2899c72649b, #"medium");
    }
}

// Namespace namespace_736c1c104571a33/namespace_593aa949abab02a4
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d8
// Size: 0x4b
function toma_strike_monitordamage(maxhealth, damagefeedback, var_c5d89c3a1224b118, var_d7b6456018542238, var_a1823ac1157568db, rumble, var_22435c27e2916650) {
    namespace_3e725f3cc58bddd3::monitordamage(maxhealth, damagefeedback, var_c5d89c3a1224b118, var_d7b6456018542238, var_a1823ac1157568db, rumble, var_22435c27e2916650);
}

// Namespace namespace_736c1c104571a33/namespace_593aa949abab02a4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x22a
// Size: 0xe
function toma_strike_molotov_branch_draw_hits() {
    /#
        thread namespace_df478cc572a311d3::molotov_branch_draw_hits();
    #/
}

