#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\values.gsc;
#using scripts\common\callbacks.gsc;
#using scripts\mp\damage.gsc;
#using script_5762ac2f22202ba2;
#using scripts\mp\equipment.gsc;
#using script_7f36f22bad523244;
#using scripts\mp\gametypes\br_public.gsc;
#using scripts\mp\supers.gsc;
#using scripts\common\system.gsc;
#using script_fdbc9069851786a;
#using scripts\engine\scriptable.gsc;

#namespace namespace_1503345c374a488f;

// Namespace namespace_1503345c374a488f / namespace_3261d6ca34bcacba
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0x160
// Size: 0x2a
function autoexec function_1a508c7664d1f6c1() {
    level waittill("mp_equipment_init");
    function_2fe1faaffe9ed832();
    level callback::add("force_field_deploy", &force_field_deploy);
    namespace_70f55ec9ba5b3e64::function_f705d78f8780628d();
}

// Namespace namespace_1503345c374a488f / namespace_3261d6ca34bcacba
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x192
// Size: 0x3a
function function_2fe1faaffe9ed832() {
    scripts\engine\scriptable::scriptable_adddamagedcallback(&namespace_70f55ec9ba5b3e64::function_774a2c15e69350e4);
    level.equipment.callbacks["equip_mutation_shield"]["onFired"] = &namespace_70f55ec9ba5b3e64::function_2bd59ecbe10c6ca7;
    namespace_70f55ec9ba5b3e64::function_308f48ed405d1347();
}

// Namespace namespace_1503345c374a488f / namespace_3261d6ca34bcacba
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1d4
// Size: 0x19
function force_field_deploy(params) {
    namespace_70f55ec9ba5b3e64::function_308f48ed405d1347();
    namespace_70f55ec9ba5b3e64::function_4b3a8e81d4a07ffc();
}

// Namespace namespace_1503345c374a488f / namespace_3261d6ca34bcacba
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x1f5
// Size: 0x83
function function_ebf9c5039dea6423(health, player, attacker, victim, damage) {
    player setclientomnvar("ui_arcade_forcefield_progress", health);
    if (getdvarint(@"hash_4b664c074a868ac5", 0) && getdvarint(@"hash_8a8ff6ed00ccc7a", 0)) {
        waskilled = health <= 0 ? 1 : 0;
        damage::function_c54b2cc2e762c201(attacker, victim, damage, undefined, waskilled, 1);
    }
}

