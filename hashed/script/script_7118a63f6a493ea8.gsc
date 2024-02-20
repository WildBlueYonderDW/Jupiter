// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\asm\asm_mp.gsc;
#using scripts\anim\notetracks_mp.gsc;
#using script_371b4c2ab5861e62;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using scripts\cp_mp\utility\killstreak_utility.gsc;
#using scripts\cp_mp\killstreaks\killstreakdeploy.gsc;
#using script_2669878cf5a1b6bc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\cp_mp\challenges.gsc;
#using scripts\cp_mp\vehicles\vehicle_damage.gsc;
#using scripts\cp_mp\vehicles\vehicle_spawn.gsc;
#using scripts\cp_mp\vehicles\vehicle_occupancy.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\cp_mp\emp_debuff.gsc;
#using scripts\cp_mp\execution.gsc;

#namespace namespace_657dc7e018dcfce9;

// Namespace namespace_657dc7e018dcfce9/namespace_c3fdc5febda99c60
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5ea
// Size: 0x169
function init() {
    setdvar(@"hash_1fc47d6f68e1faf", 1);
    setdvar(@"hash_633e1a62bb5ceeb2", 1);
    if (!isdefined(level.players)) {
        level.players = [];
    }
    level.var_19d38dec02a818ce = &namespace_3c37cb17ade254d::issharedfuncdefined;
    level.var_49b393a31d0b0b95 = &namespace_3c37cb17ade254d::getsharedfunc;
    anim_init();
    hud_init();
    killstreak_init();
    equipment_init();
    perk_init();
    player_init();
    vehicle_init();
    game_init();
    spawn_init();
    emp_init();
    execution_init();
    entity_init();
    weapons_init();
    damage_init();
    sound_init();
    flares_init();
    shellshock_init();
    function_cdf500001f909cca();
    ai_init();
    bots_init();
    function_550bcd278c30275e();
    outline_init();
    game_utility_init();
    rank_init();
    supers_init();
    gamescore_init();
    pers_init();
    dlog_init();
    challenges_init();
    function_a92ed2f4c44e5ffa();
    stealth_init();
    gameskill_init();
    function_c08668fe290fc31a();
    function_c1199c7cd79918b3();
    function_1bc257700c3d014e();
    function_a30b248a8fc67a00();
    function_d3ac40e24c2653a3();
    host_migration_init();
    function_f677f2d747d21482();
}

// Namespace namespace_657dc7e018dcfce9/namespace_c3fdc5febda99c60
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x75a
// Size: 0x3
function gameskill_init() {
    
}

// Namespace namespace_657dc7e018dcfce9/namespace_c3fdc5febda99c60
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x764
// Size: 0x3
function function_c08668fe290fc31a() {
    
}

// Namespace namespace_657dc7e018dcfce9/namespace_c3fdc5febda99c60
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x76e
// Size: 0x3
function stealth_init() {
    
}

// Namespace namespace_657dc7e018dcfce9/namespace_c3fdc5febda99c60
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x778
// Size: 0x45
function anim_init() {
    registersharedfunc("anim", "scriptModelPlayAnimDeltaMotion", &function_3ecab25ce099b78e);
    registersharedfunc("anim", "ASM_PlayFacialAnim", &asm_playfacialanim_mp);
    registersharedfunc("anim", "HandleNoteTrack", &handlenotetrack);
}

// Namespace namespace_657dc7e018dcfce9/namespace_c3fdc5febda99c60
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7c4
// Size: 0x3
function hud_init() {
    
}

// Namespace namespace_657dc7e018dcfce9/namespace_c3fdc5febda99c60
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7ce
// Size: 0x1a5
function killstreak_init() {
    registersharedfunc("killstreak", "registerVisibilityOmnvarForKillstreak", &namespace_9abe40d2af041eb2::registervisibilityomnvarforkillstreak);
    registersharedfunc("killstreak", "createStreakInfo", &namespace_9abe40d2af041eb2::createstreakinfo);
    registersharedfunc("killstreak", "streakDeploy_doWeaponTabletDeploy", &namespace_b3d24e921998a8b::streakdeploy_doweapontabletdeploy);
    registersharedfunc("killstreak", "getKillstreakAirStrikeHeightEnt", &namespace_9abe40d2af041eb2::getkillstreakairstrikeheightent);
    registersharedfunc("killstreak", "playKillstreakOperatorDialog", &namespace_9abe40d2af041eb2::playkillstreakoperatordialog);
    registersharedfunc("killstreak", "setVisibiilityOmnvarForKillstreak", &namespace_9abe40d2af041eb2::_setvisibiilityomnvarforkillstreak);
    registersharedfunc("killstreak", "restoreKillstreakPlayerAngles", &namespace_9abe40d2af041eb2::restorekillstreakplayerangles);
    registersharedfunc("killstreak", "recordKillstreakEndStats", &namespace_9abe40d2af041eb2::recordkillstreakendstats);
    registersharedfunc("killstreak", "killstreak_setMainVision", &namespace_9abe40d2af041eb2::killstreak_setMainVision);
    registersharedfunc("killstreak", "killstreak_setSubVision", &namespace_9abe40d2af041eb2::killstreak_setSubVision);
    registersharedfunc("killstreak", "isKillstreakWeapon", &namespace_e0ee43ef2dddadaa::iskillstreakweapon);
    registersharedfunc("killstreak", "killstreak_registerMinimapInfo", &namespace_9abe40d2af041eb2::killstreak_registerMinimapInfo);
    registersharedfunc("killstreak", "killstreak_setupVehicleDamageFunctionality", &namespace_9abe40d2af041eb2::killstreak_setupVehicleDamageFunctionality);
    registersharedfunc("killstreak", "killstreak_updateDamageState", &namespace_9abe40d2af041eb2::killstreak_updateDamageState);
    registersharedfunc("killstreak", "playerKillstreakGetOwnerLookAtIgnoreEnts", &namespace_9abe40d2af041eb2::playerkillstreakgetownerlookatignoreents);
    registersharedfunc("killstreak", "killstreak_dangerNotifyPlayersInRange", &namespace_9abe40d2af041eb2::killstreak_dangerNotifyPlayersInRange);
    registersharedfunc("killstreak", "streakDeploy_doWeaponFiredDeploy", &namespace_b3d24e921998a8b::streakdeploy_doweaponfireddeploy);
    registersharedfunc("player", "isEnemy", &namespace_f8065cafc523dba5::isenemy);
    registersharedfunc("challenges", "onHack", &namespace_aad14af462a74d08::onhack);
}

// Namespace namespace_657dc7e018dcfce9/namespace_c3fdc5febda99c60
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x97a
// Size: 0x3
function equipment_init() {
    
}

// Namespace namespace_657dc7e018dcfce9/namespace_c3fdc5febda99c60
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x984
// Size: 0x3
function entity_init() {
    
}

// Namespace namespace_657dc7e018dcfce9/namespace_c3fdc5febda99c60
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x98e
// Size: 0x3
function perk_init() {
    
}

// Namespace namespace_657dc7e018dcfce9/namespace_c3fdc5febda99c60
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x998
// Size: 0x43
function player_init() {
    registersharedfunc("player", "_isAlive", &namespace_f8065cafc523dba5::_isalive);
    registersharedfunc("player", "getSuperFaction", &namespace_f8065cafc523dba5::getplayersuperfaction);
    registersharedfunc("player", "getExecutionPartner", &getexecutionpartner);
}

// Namespace namespace_657dc7e018dcfce9/namespace_c3fdc5febda99c60
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9e2
// Size: 0x3
function host_migration_init() {
    
}

// Namespace namespace_657dc7e018dcfce9/namespace_c3fdc5febda99c60
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9ec
// Size: 0x9d
function vehicle_init() {
    registersharedfunc("vehicle", "vehicle_damage_setCanDamage", &namespace_5a0f3ca265d3a4c8::vehicle_damage_setcandamage);
    registersharedfunc("vehicle", "vehicle_spawn_setClearanceCheckMinRadius", &namespace_dace9d390bc4a290::vehicle_spawn_setclearancecheckminradius);
    registersharedfunc("vehicle", "vehicle_damage_clearVisuals", &namespace_5a0f3ca265d3a4c8::vehicle_damage_clearvisuals);
    registersharedfunc("vehicle", "vehicleCanFly", &namespace_1f188a13f7e79610::vehiclecanfly);
    registersharedfunc("vehicle", "getVehicle", &namespace_f8065cafc523dba5::getvehicle);
    registersharedfunc("vehicle", "vehicle_occupancy_getOccupantSeat", &namespace_1fbd40990ee60ede::vehicle_occupancy_getoccupantseat);
    registersharedfunc("vehicle", "vehicle_occupancy_exit", &namespace_1fbd40990ee60ede::vehicle_occupancy_exit);
}

// Namespace namespace_657dc7e018dcfce9/namespace_c3fdc5febda99c60
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa90
// Size: 0x57
function game_init() {
    registersharedfunc("game", "ForceNetfieldHighLoD", &function_c7a3d9af98179e8e);
    registersharedfunc("game", "getProgressionData", &getProgressionData);
    registersharedfunc("game", "setProgressionData", &setProgressionData);
    registersharedfunc("game", "getTimePassed", &namespace_36f464722d326bbe::gettimepassed);
}

// Namespace namespace_657dc7e018dcfce9/namespace_c3fdc5febda99c60
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xaee
// Size: 0x3
function spawn_init() {
    
}

// Namespace namespace_657dc7e018dcfce9/namespace_c3fdc5febda99c60
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xaf8
// Size: 0x87
function emp_init() {
    registersharedfunc("emp", "clear_emp", &namespace_5a51aa78ea0b1b9f::clear_emp);
    registersharedfunc("emp", "allow_emp", &namespace_5a51aa78ea0b1b9f::allow_emp);
    registersharedfunc("emp", "emp_debuff_get_emp_count", &namespace_5a51aa78ea0b1b9f::emp_debuff_get_emp_count);
    registersharedfunc("emp", "is_empd", &namespace_5a51aa78ea0b1b9f::is_empd);
    registersharedfunc("emp", "play_scramble", &namespace_5a51aa78ea0b1b9f::play_scramble);
    registersharedfunc("emp", "stop_scramble", &namespace_5a51aa78ea0b1b9f::stop_scramble);
}

// Namespace namespace_657dc7e018dcfce9/namespace_c3fdc5febda99c60
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb86
// Size: 0x19
function execution_init() {
    registersharedfunc("executions", "is_in_takedown", &namespace_f446f6030ca8cff8::is_in_takedown);
}

// Namespace namespace_657dc7e018dcfce9/namespace_c3fdc5febda99c60
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xba6
// Size: 0x19
function weapons_init() {
    registersharedfunc("weapons", "setMissileMinimapVisible", &function_cee516993ce8a5f4);
}

// Namespace namespace_657dc7e018dcfce9/namespace_c3fdc5febda99c60
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbc6
// Size: 0x3
function damage_init() {
    
}

// Namespace namespace_657dc7e018dcfce9/namespace_c3fdc5febda99c60
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbd0
// Size: 0x19
function sound_init() {
    registersharedfunc("sound", "playSoundToPlayer", &function_6bc1c74e258d55bc);
}

// Namespace namespace_657dc7e018dcfce9/namespace_c3fdc5febda99c60
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbf0
// Size: 0x3
function flares_init() {
    
}

// Namespace namespace_657dc7e018dcfce9/namespace_c3fdc5febda99c60
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbfa
// Size: 0x3
function shellshock_init() {
    
}

// Namespace namespace_657dc7e018dcfce9/namespace_c3fdc5febda99c60
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc04
// Size: 0x2f
function function_cdf500001f909cca() {
    registersharedfunc("fx", "SpawnFXForClient", &function_8795a2cca25c0164);
    registersharedfunc("fx", "SetFXKillDefOnDelete", &function_3fc0d2ad4f715ea4);
}

// Namespace namespace_657dc7e018dcfce9/namespace_c3fdc5febda99c60
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc3a
// Size: 0x43
function ai_init() {
    registersharedfunc("ai", "giveAIWeapon", &function_c77ea258b33422b0);
    registersharedfunc("ai", "onUsedArmorPlate", &function_b535fe740f1cf507);
    registersharedfunc("ai", "getCorpseEntity", &getcorpseentity);
}

// Namespace namespace_657dc7e018dcfce9/namespace_c3fdc5febda99c60
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc84
// Size: 0x3
function bots_init() {
    
}

// Namespace namespace_657dc7e018dcfce9/namespace_c3fdc5febda99c60
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc8e
// Size: 0x3
function function_550bcd278c30275e() {
    
}

// Namespace namespace_657dc7e018dcfce9/namespace_c3fdc5febda99c60
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc98
// Size: 0x3
function outline_init() {
    
}

// Namespace namespace_657dc7e018dcfce9/namespace_c3fdc5febda99c60
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xca2
// Size: 0x3
function game_utility_init() {
    
}

// Namespace namespace_657dc7e018dcfce9/namespace_c3fdc5febda99c60
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcac
// Size: 0x3
function rank_init() {
    
}

// Namespace namespace_657dc7e018dcfce9/namespace_c3fdc5febda99c60
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcb6
// Size: 0x3
function supers_init() {
    
}

// Namespace namespace_657dc7e018dcfce9/namespace_c3fdc5febda99c60
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcc0
// Size: 0x3
function gamescore_init() {
    
}

// Namespace namespace_657dc7e018dcfce9/namespace_c3fdc5febda99c60
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcca
// Size: 0x3
function pers_init() {
    
}

// Namespace namespace_657dc7e018dcfce9/namespace_c3fdc5febda99c60
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcd4
// Size: 0x3
function dlog_init() {
    
}

// Namespace namespace_657dc7e018dcfce9/namespace_c3fdc5febda99c60
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcde
// Size: 0x3
function challenges_init() {
    
}

// Namespace namespace_657dc7e018dcfce9/namespace_c3fdc5febda99c60
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xce8
// Size: 0x3
function function_a92ed2f4c44e5ffa() {
    
}

// Namespace namespace_657dc7e018dcfce9/namespace_c3fdc5febda99c60
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcf2
// Size: 0x3
function function_c1199c7cd79918b3() {
    
}

// Namespace namespace_657dc7e018dcfce9/namespace_c3fdc5febda99c60
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcfc
// Size: 0x2f
function function_1bc257700c3d014e() {
    registersharedfunc("cameras", "GetCameraThirdPerson", &function_d08336d8c0380c5e);
    registersharedfunc("cameras", "GetCameraThirdPersonOrigin", &function_85c5056c9011e1bc);
}

// Namespace namespace_657dc7e018dcfce9/namespace_c3fdc5febda99c60
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd32
// Size: 0x3
function function_a30b248a8fc67a00() {
    
}

// Namespace namespace_657dc7e018dcfce9/namespace_c3fdc5febda99c60
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd3c
// Size: 0x11
function function_d3ac40e24c2653a3() {
    level.var_276311a22caaf5ac = &function_38dd76fb84086a72;
}

// Namespace namespace_657dc7e018dcfce9/namespace_c3fdc5febda99c60
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd54
// Size: 0x2d
function function_38dd76fb84086a72(origin, maxdist) {
    maxdist = function_53c4c53197386572(maxdist, level.var_587de0e7b537210a);
    return function_e3b3f0128f632da5(origin, maxdist);
}

// Namespace namespace_657dc7e018dcfce9/namespace_c3fdc5febda99c60
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd89
// Size: 0x12
function function_f677f2d747d21482() {
    create_func_ref("setsaveddvar", &setdvar);
}

// Namespace namespace_657dc7e018dcfce9/namespace_c3fdc5febda99c60
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xda2
// Size: 0x14
function private function_c7a3d9af98179e8e(set) {
    self forcenetfieldhighlod(set);
}

// Namespace namespace_657dc7e018dcfce9/namespace_c3fdc5febda99c60
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xdbd
// Size: 0x26
function private function_6bc1c74e258d55bc(aliasname, player, var_464ac409f95d9632) {
    self playsoundtoplayer(aliasname, player, var_464ac409f95d9632);
}

// Namespace namespace_657dc7e018dcfce9/namespace_c3fdc5febda99c60
// Params 5, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xdea
// Size: 0x36
function private function_8795a2cca25c0164(fxid, position, player, forward, up) {
    return spawnfxforclient(fxid, position, player, forward, up);
}

// Namespace namespace_657dc7e018dcfce9/namespace_c3fdc5febda99c60
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xe28
// Size: 0xa
function private function_3fc0d2ad4f715ea4() {
    self setfxkilldefondelete();
}

// Namespace namespace_657dc7e018dcfce9/namespace_c3fdc5febda99c60
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xe39
// Size: 0x14
function private function_c77ea258b33422b0(weapname) {
    self giveweapon(weapname);
}

// Namespace namespace_657dc7e018dcfce9/namespace_c3fdc5febda99c60
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xe54
// Size: 0x2f
function private function_3ecab25ce099b78e(animname, notifystring, var_d3a7686bdb2b1c76, var_b78b21364b175024) {
    self scriptmodelplayanimdeltamotion(animname, notifystring, var_d3a7686bdb2b1c76, var_b78b21364b175024);
}

// Namespace namespace_657dc7e018dcfce9/namespace_c3fdc5febda99c60
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xe8a
// Size: 0x14
function private function_cee516993ce8a5f4(set) {
    self setmissileminimapvisible(set);
}

// Namespace namespace_657dc7e018dcfce9/namespace_c3fdc5febda99c60
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xea5
// Size: 0x9
function private function_d08336d8c0380c5e() {
    return self GetCameraThirdPerson();
}

// Namespace namespace_657dc7e018dcfce9/namespace_c3fdc5febda99c60
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xeb6
// Size: 0x9
function private function_85c5056c9011e1bc() {
    return self GetCameraThirdPersonOrigin();
}

