#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\hud_util.gsc;
#using scripts\mp\killstreaks\deployablebox.gsc;
#using scripts\mp\lightarmor.gsc;
#using scripts\mp\perks\perkfunctions.gsc;

#namespace namespace_3f74497c7fa61c36;

// Namespace namespace_3f74497c7fa61c36 / scripts\mp\killstreaks\deployablebox_vest
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x273
// Size: 0x1f9
function init() {
    var_86280fefb94b6b28 = spawnstruct();
    var_86280fefb94b6b28.id = "deployable_vest";
    var_86280fefb94b6b28.weaponinfo = "deployable_vest_marker_mp";
    var_86280fefb94b6b28.modelbase = "prop_ballistic_vest_iw6";
    var_86280fefb94b6b28.modelbombsquad = "prop_ballistic_vest_iw6_bombsquad";
    var_86280fefb94b6b28.hintstring = %KILLSTREAKS_HINTS_LIGHT_ARMOR_PICKUP;
    var_86280fefb94b6b28.capturingstring = %KILLSTREAKS_BOX_GETTING_VEST;
    var_86280fefb94b6b28.event = "deployable_vest_taken";
    var_86280fefb94b6b28.streakname = "deployable_vest";
    var_86280fefb94b6b28.splashname = "used_deployable_vest";
    var_86280fefb94b6b28.shadername = "compass_objpoint_deploy_friendly";
    var_86280fefb94b6b28.headiconoffset = 20;
    var_86280fefb94b6b28.lifespan = 90;
    var_86280fefb94b6b28.usexp = 50;
    var_86280fefb94b6b28.scorepopup = "destroyed_vest";
    var_86280fefb94b6b28.vodestroyed = "ballistic_vest_destroyed";
    var_86280fefb94b6b28.deployedsfx = "mp_vest_deployed_ui";
    var_86280fefb94b6b28.onusesfx = "ammo_crate_use";
    var_86280fefb94b6b28.onusecallback = &onusedeployable;
    var_86280fefb94b6b28.canusecallback = &canusedeployable;
    var_86280fefb94b6b28.usetime = 1000;
    var_86280fefb94b6b28.maxhealth = 220;
    var_86280fefb94b6b28.damagefeedback = "deployable_bag";
    var_86280fefb94b6b28.deathvfx = loadfx("vfx/iw7/_requests/mp/vfx_generic_equipment_exp.vfx");
    var_86280fefb94b6b28.allowmeleedamage = 1;
    var_86280fefb94b6b28.allowgrenadedamage = 0;
    var_86280fefb94b6b28.maxuses = 4;
    var_86280fefb94b6b28.canuseotherboxes = 0;
    level.boxsettings["deployable_vest"] = var_86280fefb94b6b28;
    assertmsg("If this killstreak is used in the future, it needs to be updated to do it's own deployment.");
    level.deployable_box["deployable_vest"] = [];
}

// Namespace namespace_3f74497c7fa61c36 / scripts\mp\killstreaks\deployablebox_vest
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x474
// Size: 0x57
function tryusedeployablevest(lifeid, streakname) {
    result = scripts\mp\killstreaks\deployablebox::begindeployableviamarker(lifeid, "deployable_vest");
    if (!isdefined(result) || !result) {
        return false;
    }
    utility::trycall(level.matchdata_logkillstreakevent, "deployable_vest", self.origin);
    return true;
}

// Namespace namespace_3f74497c7fa61c36 / scripts\mp\killstreaks\deployablebox_vest
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4d4
// Size: 0x13
function canusedeployable(boxent) {
    return !scripts\mp\lightarmor::haslightarmor(self);
}

// Namespace namespace_3f74497c7fa61c36 / scripts\mp\killstreaks\deployablebox_vest
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4f0
// Size: 0x12
function onusedeployable(boxent) {
    scripts\mp\perks\perkfunctions::setlightarmor();
}

// Namespace namespace_3f74497c7fa61c36 / scripts\mp\killstreaks\deployablebox_vest
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x50a
// Size: 0x44
function get_adjusted_armor(var_f6415502bdc3ac54, rank) {
    if (var_f6415502bdc3ac54 + level.deployablebox_vest_rank[rank] > level.deployablebox_vest_max) {
        return level.deployablebox_vest_max;
    }
    return var_f6415502bdc3ac54 + level.deployablebox_vest_rank[rank];
}

