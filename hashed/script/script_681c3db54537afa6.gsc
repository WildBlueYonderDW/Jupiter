// mwiii decomp prototype
#using scripts\mp\hud_util.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\cp_mp\utility\callback_group.gsc;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using scripts\cp_mp\utility\train_utility.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using scripts\cp_mp\vehicles\vehicle_occupancy.gsc;
#using scripts\cp_mp\emp_debuff.gsc;
#using script_2669878cf5a1b6bc;
#using scripts\engine\trace.gsc;
#using scripts\mp\weapons.gsc;
#using scripts\mp\hostmigration.gsc;
#using scripts\mp\utility\killstreak.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\entity.gsc;
#using scripts\mp\utility\points.gsc;
#using scripts\mp\utility\outline.gsc;
#using scripts\mp\utility\perk.gsc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\utility\print.gsc;
#using script_45c10ca5cb8409bf;
#using scripts\cp_mp\ent_manager.gsc;
#using scripts\mp\sentientpoolmanager.gsc;
#using scripts\mp\damage.gsc;
#using script_736dec95a49487a6;
#using scripts\common\elevators.gsc;

#namespace namespace_59b4686a745dd963;

// Namespace namespace_59b4686a745dd963 / namespace_ade096b4b575e46c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1cc
// Size: 0x259
function function_7b988e1bb56ca747(grenade) {
    grenade endon("death");
    /#
        print::printgameaction("<unknown string>", self);
    #/
    if (!isdefined(level.var_4405e76242d7cb8e)) {
        level.var_4405e76242d7cb8e = 0;
    }
    grenade ent_manager::registerspawn(1, &sound_veil::function_558d562eb33ea61d);
    grenade setscriptablepartstate("visibility", "show", 0);
    stuckto = grenade waittill("missile_stuck");
    if (isdefined(stuckto) && stuckto vehicle::isvehicle()) {
        grenade.vehicle_stuck = 1;
    }
    if (isdefined(level.var_ca4e08767cbdae12)) {
        canplant = grenade [[ level.var_ca4e08767cbdae12 ]]();
        if (!canplant) {
            grenade delete();
            return;
        }
    }
    grenade setscriptablepartstate("plant", "active", 0);
    grenade setotherent(self);
    grenade setnodeploy(1);
    grenade setnonstick(1);
    grenade.usedcount = 0;
    grenade.deployingplayer = self;
    grenade.activetargets = [];
    trigger = spawn("trigger_rotatable_radius", grenade.origin, 0, 80, 300);
    trigger.angles = grenade.angles;
    grenade.trigger = trigger;
    trigger enablelinkto();
    trigger linkto(grenade);
    onequipmentplanted(grenade, "equip_sound_veil", &sound_veil::function_558d562eb33ea61d, 1);
    grenade namespace_26be03d9c56f9498::registersentient("Tactical_Static", self);
    maxhealth = 100;
    grenade thread damage::monitordamage(maxhealth, "hitequip", &sound_veil::function_f313405d166290be, &sound_veil::function_50b1d2352a6a686a, 0);
    grenade emp_debuff::set_apply_emp_callback(&sound_veil::function_b434ea15774ed770);
    grenade haywire::function_172d848d58051fdf(&sound_veil::function_391ebdde9e0eec71);
    grenade sound_veil::function_49197cd063a740ea(&sound_veil::function_558d562eb33ea61d);
    if (isdefined(level.elevators)) {
        foreach (elevators in level.elevators) {
            elevators thread elevators::function_5c07037726ae5001(grenade);
        }
    }
    grenade sound_veil::function_74844a68121c9b36();
}

