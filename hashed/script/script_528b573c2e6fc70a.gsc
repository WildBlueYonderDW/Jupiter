// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\weapons.gsc;
#using scripts\engine\trace.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\equipment.gsc;
#using scripts\mp\utility\print.gsc;
#using scripts\mp\utility\script.gsc;
#using scripts\mp\utility\perk.gsc;
#using script_5762ac2f22202ba2;
#using scripts\mp\equipment\claymore.gsc;
#using scripts\cp_mp\ent_manager.gsc;
#using scripts\mp\sentientpoolmanager.gsc;
#using scripts\cp_mp\emp_debuff.gsc;
#using script_736dec95a49487a6;
#using scripts\common\elevators.gsc;
#using scripts\mp\equipment_interact.gsc;

#namespace agent_claymore;

// Namespace agent_claymore / namespace_d4389b4b98ee0dc0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x156
// Size: 0x14
function function_af4eb22319ad376(grenade) {
    grenade function_4a6f3ce45560d2a4();
}

// Namespace agent_claymore / namespace_d4389b4b98ee0dc0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x171
// Size: 0x1ad
function function_4a6f3ce45560d2a4() {
    self endon("mine_triggered");
    self endon("mine_destroyed");
    self endon("death");
    owner = self.owner;
    team = self.owner.team;
    var_541986f994da2469 = isagent(owner);
    ent_manager::registerspawn(1, &claymore::sweepclaymore);
    namespace_26be03d9c56f9498::registersentient("Lethal_Static", owner, 1);
    owner onequipmentplanted(self, "equip_claymore", &claymore::claymore_delete, 1);
    self missilethermal();
    self missileoutline();
    self setentityowner(owner);
    self setotherent(owner);
    self setnodeploy(1);
    thread weapons::minedamagemonitor();
    thread claymore::claymore_explodeonnotify();
    emp_debuff::set_apply_emp_callback(&claymore::claymore_empapplied);
    haywire::function_172d848d58051fdf(&claymore::function_4373872960a2d51a);
    claymore::function_49197cd063a740ea(&claymore::claymore_destroy);
    if (isdefined(level.elevators)) {
        foreach (elevators in level.elevators) {
            elevators thread elevators::function_5c07037726ae5001(self);
        }
    }
    claymore::claymore_updatedangerzone();
    self setscriptablepartstate("plant", "active", 0);
    owner setscriptablepartstate("equipClaymoreFXView", "plant", 0);
    thread claymore::claymore_forceclampangles();
    wait(1);
    self setscriptablepartstate("arm", "active", 0);
    thread claymore::claymore_watchfortrigger();
    thread equipment_interact::remoteinteractsetup(&claymore::claymore_trigger, 1, 1);
}

