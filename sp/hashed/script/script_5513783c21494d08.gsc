#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\cp\utility.gsc;
#using scripts\cp_mp\utility\shellshock_utility.gsc;
#using script_7118a63f6a493ea8;
#using script_6e09a830fab9468f;
#using scripts\cp\perks\cp_perks.gsc;
#using scripts\cp\cp_gameskill.gsc;
#using script_be30eb214e1af7b;
#using script_2709f0932dd1e5a7;
#using script_68fa6b4ee60216ae;
#using scripts\cp\cp_anim.gsc;
#using scripts\cp\cp_hud_message.gsc;
#using scripts\cp\cp_hud_util.gsc;
#using scripts\cp\killstreaks\init_cp.gsc;
#using scripts\cp\cp_mapselect.gsc;
#using script_5e5507d57bbbb709;
#using script_25845aca699d038d;
#using scripts\cp\inventory\cp_target_marker.gsc;
#using script_21873023c0473044;
#using scripts\cp\killstreaks\cruise_predator_cp.gsc;
#using scripts\cp\killstreaks\chopper_gunner_cp.gsc;
#using script_644c18834356d9dc;
#using scripts\cp\equipment\throwing_knife_cp.gsc;
#using script_7ef95bba57dc4b82;
#using script_1db8d0e02a99c5e2;
#using script_74502a9e0ef1f19c;
#using script_5b3c060b476939a8;
#using scripts\cp\utility\player_utility_cp.gsc;
#using scripts\cp\utility\player.gsc;
#using script_41ae4f5ca24216cb;
#using script_56ef8d52fe1b48a1;
#using script_531cb1be084314f7;
#using script_afb7e332aee4bf2;
#using script_66122a002aff5d57;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\cp\vehicles\vehicle_cp.gsc;
#using scripts\cp_mp\vehicles\vehicle_tracking.gsc;
#using scripts\cp\cp_hostmigration.gsc;
#using scripts\cp\cp_player_battlechatter.gsc;
#using scripts\cp\cp_outofbounds.gsc;
#using scripts\mp\utility\trigger.gsc;
#using scripts\cp\cp_objectives.gsc;
#using scripts\cp\cp_outline_utility.gsc;
#using scripts\cp\utility\lui_game_event_aggregator.gsc;
#using script_3a8f9ace195c9da9;
#using scripts\cp\emp_debuff_cp.gsc;
#using scripts\cp_mp\emp_debuff.gsc;
#using scripts\cp\equipment\cp_gas_grenade.gsc;
#using scripts\cp_mp\utility\weapon_utility.gsc;
#using scripts\cp\cp_weapons.gsc;
#using script_5762ac2f22202ba2;
#using script_6f1e07ce9ff97d5f;
#using scripts\cp\cp_flares.gsc;
#using script_6853191397ec0259;
#using scripts\cp\utility\game_utility_cp.gsc;
#using script_187a04151c40fb72;
#using script_293bc33bd79cabd1;
#using script_1ed1214969b5eba7;
#using scripts\cp\utility\spawn_event_aggregator.gsc;
#using scripts\cp_mp\execution.gsc;
#using scripts\cp\cp_relics.gsc;
#using scripts\cp\challenges_cp.gsc;
#using scripts\cp_mp\challenges.gsc;

#namespace namespace_657dc7e018dcfce9;

// Namespace namespace_657dc7e018dcfce9 / namespace_c4892e65895918e2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xfb9
// Size: 0xcd
function init() {
    namespace_c3fdc5febda99c60::init();
    perk_init();
    anim_init();
    hud_init();
    killstreak_init();
    equipment_init();
    player_init();
    vehicle_init();
    host_migration_init();
    game_init();
    emp_init();
    weapons_init();
    damage_init();
    entity_init();
    sound_init();
    flares_init();
    shellshock_init();
    outline_init();
    game_utility_init();
    rank_init();
    supers_init();
    gamescore_init();
    stealth_init();
    gameskill_init();
    function_c1199c7cd79918b3();
    function_1e223bbe18efd769();
    challenges_init();
    function_bbe0803dcadd7d18();
    function_f677f2d747d21482();
}

// Namespace namespace_657dc7e018dcfce9 / namespace_c4892e65895918e2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x108e
// Size: 0x5a
function perk_init() {
    registersharedfunc("perk", "hasPerk", &scripts\cp\utility::_hasperk);
    registersharedfunc("perk", "givePerk", &scripts\cp\utility::giveperk);
    registersharedfunc("perk", "removePerk", &namespace_c4cab616edf9b2b9::removeperk);
    registersharedfunc("perk", "activatePerk", &scripts\cp\perks\cp_perks::activatePerk);
}

// Namespace namespace_657dc7e018dcfce9 / namespace_c4892e65895918e2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x10f0
// Size: 0x18
function gameskill_init() {
    registersharedfunc("gameskill", "updatePlayerAttackerAccuracy", &scripts\cp\cp_gameskill::update_player_attacker_accuracy);
}

// Namespace namespace_657dc7e018dcfce9 / namespace_c4892e65895918e2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1110
// Size: 0x9c
function stealth_init() {
    registersharedfunc("stealth", "init", &namespace_dbc09aedfbfae91f::init);
    registersharedfunc("stealth", "revertAiAccuracy", &namespace_dbc09aedfbfae91f::revertaiaccuracy);
    registersharedfunc("stealth", "dropAiAccuracy", &namespace_dbc09aedfbfae91f::dropaiaccuracy);
    registersharedfunc("stealth", "spotted_event_handler", &namespace_dbc09aedfbfae91f::function_5af9997f0eefb9a2);
    registersharedfunc("stealth_music", "init", &namespace_7421af812c81d88b::init);
    registersharedfunc("stealth_enemy", "init", &namespace_f07a91c6c17492be::init);
    registersharedfunc("stealth_player", "init", &namespace_dbc09aedfbfae91f::init_player);
}

// Namespace namespace_657dc7e018dcfce9 / namespace_c4892e65895918e2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x11b4
// Size: 0x18
function anim_init() {
    registersharedfunc("anim", "player_solo", &scripts\cp\cp_anim::anim_player_solo);
}

// Namespace namespace_657dc7e018dcfce9 / namespace_c4892e65895918e2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x11d4
// Size: 0x44
function hud_init() {
    registersharedfunc("hud", "showErrorMessage", &scripts\cp\cp_hud_message::showerrormessage);
    registersharedfunc("hud", "teamPlayerCardSplash", &scripts\cp\cp_hud_util::teamplayercardsplash);
    registersharedfunc("hud", "showSplash", &scripts\cp\cp_hud_message::showsplash);
}

// Namespace namespace_657dc7e018dcfce9 / namespace_c4892e65895918e2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1220
// Size: 0x1d0
function killstreak_init() {
    registersharedfunc("killstreak", "init", &scripts\cp\killstreaks\init_cp::init);
    registersharedfunc("killstreak", "addToActiveKillstreakList", &scripts\cp\utility::addtoactivekillstreaklist);
    registersharedfunc("killstreak", "allowRideKillstreakPlayerExit", &scripts\cp\utility::allowridekillstreakplayerexit);
    registersharedfunc("killstreak", "getSelectMapPoint", &scripts\cp\cp_mapselect::getselectmappoint);
    registersharedfunc("killstreak", "startMapSelectSequence", &scripts\cp\cp_mapselect::startmapselectsequence);
    registersharedfunc("killstreak", "killstreakMakeVehicle", &scripts\cp\utility::killstreak_make_vehicle);
    registersharedfunc("killstreak", "killstreakSetPreModDamageCallback", &scripts\cp\utility::killstreak_set_pre_mod_damage_callback);
    registersharedfunc("killstreak", "killstreakSetPostModDamageCallback", &scripts\cp\utility::killstreak_set_post_mod_damage_callback);
    registersharedfunc("killstreak", "killstreakSetDeathCallback", &scripts\cp\utility::killstreak_set_death_callback);
    registersharedfunc("killstreak", "killstreakHit", &scripts\cp\utility::killstreakhit);
    registersharedfunc("killstreak", "createCustomStreakData", &scripts\cp\killstreaks\init_cp::init_killstreak_data_for_challenges);
    registersharedfunc("killstreak", "setKillstreakControlPriority", &scripts\cp\utility::setkillstreakcontrolpriority);
    registersharedfunc("killstreak", "killstreakUse", &namespace_1f50a6a7107e9381::function_76634baec9299866);
    registersharedfunc("killstreak", "getModifiedAntiKillstreakDamage", &namespace_1b51be0488919ce5::getmodifiedantikillstreakdamage);
    registersharedfunc("killstreak", "waittill_confirm_or_cancel", &scripts\cp\cp_mapselect::waittill_confirm_or_cancel);
    registersharedfunc("killstreak", "getTargetMarker", &scripts\cp\inventory\cp_target_marker::gettargetmarker);
    registersharedfunc("killstreak", "refundKillstreak", &namespace_1f50a6a7107e9381::function_4a1fd54affdaa367);
    registersharedfunc("killstreak", "makePlayerVulnerableOnAssaultDroneDetonate", &namespace_cd93521d79292cf4::function_28fc7edb00dd6601);
    registersharedfunc("killstreak", "makePlayerVulnerableOnCruisePredatorDetonate", &scripts\cp\killstreaks\cruise_predator_cp::function_8a023375b0197bdc);
    registersharedfunc("killstreak", "makeChopperGunnerTargetableByAI", &scripts\cp\killstreaks\chopper_gunner_cp::function_6a41bef845f5c144);
    registersharedfunc("killstreak", "doDamageToKillstreak", &namespace_94359011b63230a6::function_8c2b940cf1550e4d);
}

// Namespace namespace_657dc7e018dcfce9 / namespace_c4892e65895918e2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x13f8
// Size: 0xde
function equipment_init() {
    registersharedfunc("throwing_knife", "init", &scripts\cp\equipment\throwing_knife_cp::throwing_knife_cp_init);
    registersharedfunc("equipment", "getEquipmentRefFromWeapon", &namespace_4fb9dddfb8c1a67a::getequipmentreffromweapon);
    registersharedfunc("equipment", "equipment_init", &namespace_47366e00aa4211f4::equipment_init);
    registersharedfunc("weapons", "attachmentIsSelectable", &namespace_a0628d6954815ef8::attachmentisselectable);
    registersharedfunc("equipment", "getEquipmentTableInfo", &namespace_47366e00aa4211f4::getequipmenttableinfo);
    registersharedfunc("equipment", "hackEquipment", &namespace_47366e00aa4211f4::function_e0ef70f764b4a4c7);
    registersharedfunc("equipment", "autorefillequipmentammo", &namespace_47366e00aa4211f4::autorefillequipmentammo);
    registersharedfunc("equipment", "isPlantedEquipment", &namespace_a0628d6954815ef8::isplantedequipment);
    registersharedfunc("equipment", "deleteExplosive", &namespace_a0628d6954815ef8::deleteexplosive);
    registersharedfunc("oxygenmask", "init", &namespace_4bb5eda89afac572::function_234851f94416f178);
}

// Namespace namespace_657dc7e018dcfce9 / namespace_c4892e65895918e2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x14de
// Size: 0x2d4
function player_init() {
    registersharedfunc("player", "_isAlive", &scripts\cp\utility\player_utility_cp::_isalive);
    registersharedfunc("player", "setUsingRemote", &scripts\cp\utility\player::setusingremote);
    registersharedfunc("player", "clearUsingRemote", &scripts\cp\utility\player::clearusingremote);
    registersharedfunc("player", "freezeControls", &scripts\cp\utility::_freezecontrols);
    registersharedfunc("player", "freezeLookControls", &scripts\cp\utility::_freezelookcontrols);
    registersharedfunc("player", "printGameAction", &printgameaction);
    registersharedfunc("player", "isPlayerADS", &isplayerads);
    registersharedfunc("player", "doScoreEvent", &namespace_6099285b4066f63b::doScoreEvent);
    registersharedfunc("player", "setThirdPersonDOF", &scripts\cp\utility::setthirdpersondof);
    registersharedfunc("player", "hideMiniMap", &scripts\cp\utility\player::hideminimap);
    registersharedfunc("player", "showMiniMap", &scripts\cp\utility\player::showminimap);
    registersharedfunc("player", "getPlayersInRadius", &scripts\cp\utility::getplayersinradius);
    registersharedfunc("player", "isFriendly", &scripts\cp\utility\player::isfriendly);
    registersharedfunc("player", "isReallyAlive", &scripts\cp\utility\player::isreallyalive);
    registersharedfunc("player", "getStanceCenter", &scripts\cp\utility\player::getstancecenter);
    registersharedfunc("player", "getStanceTop", &scripts\cp\utility\player::getstancetop);
    registersharedfunc("player", "surfaceFunc", &scripts\cp\utility\player::function_8196ea3bc8d5538a);
    registersharedfunc("player", "isSuperInUse", &namespace_44edfb3e2b433c17::issuperinuse);
    registersharedfunc("player", "getCurrentSuperRef", &namespace_44edfb3e2b433c17::getcurrentsuperref);
    registersharedfunc("player", "br_ammo_player_is_maxed_out", &namespace_bc7b29dcc022d887::br_ammo_player_is_maxed_out);
    registersharedfunc("player", "hasSelfReviveToken", &namespace_d4aab8c9cb8ecb14::hasselfrevivetoken);
    registersharedfunc("player", "takeWeaponPickup", &namespace_6250b14b3f614101::takeweaponpickup);
    registersharedfunc("player", "br_ammo_player_max_out", &namespace_bc7b29dcc022d887::br_ammo_player_max_out);
    registersharedfunc("player", "addRespawnToken", &namespace_bc7b29dcc022d887::addrespawntoken);
    registersharedfunc("player", "addSelfReviveToken", &namespace_6250b14b3f614101::addselfrevivetoken);
    registersharedfunc("player", "getAvailableDMZBackpackIndex", &namespace_6250b14b3f614101::getAvailableDMZBackpackIndex);
    registersharedfunc("player", "playerPlunderKioskPurchase", &namespace_bc7b29dcc022d887::playerplunderkioskpurchase);
    registersharedfunc("player", "addItemToBackpack", &namespace_6250b14b3f614101::addItemToBackpack);
    registersharedfunc("player", "shellShock", &scripts\cp_mp\utility\shellshock_utility::_shellshock);
    registersharedfunc("player", "stopShellShock", &scripts\cp_mp\utility\shellshock_utility::_stopshellshock);
    registersharedfunc("player", "fadeToBlackForPlayer", &scripts\cp_mp\utility\game_utility::fadetoblackforplayer);
    registersharedfunc("player", "setDOF_cruiseFirst", undefined);
    registersharedfunc("player", "disable_backpack_inventory", &scripts\cp\utility::disable_backpack_inventory);
}

// Namespace namespace_657dc7e018dcfce9 / namespace_c4892e65895918e2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x17ba
// Size: 0xb2
function vehicle_init() {
    registersharedfunc("vehicle", "init", &scripts\cp\vehicles\vehicle_cp::vehicle_cp_init);
    registersharedfunc("vehicle", "reserveVehicle", &scripts\cp_mp\vehicles\vehicle_tracking::reservevehicle);
    registersharedfunc("vehicle", "clearVehicleReservation", &scripts\cp_mp\vehicles\vehicle_tracking::clearvehiclereservation);
    registersharedfunc("vehicle", "spawnVehicle", &scripts\cp_mp\vehicles\vehicle_tracking::_spawnvehicle);
    registersharedfunc("vehicle", "deleteVehicle", &scripts\cp_mp\vehicles\vehicle_tracking::_deletevehicle);
    registersharedfunc("vehicle", "registerInstance", &scripts\cp_mp\vehicles\vehicle_tracking::vehicle_tracking_registerinstance);
    registersharedfunc("vehicle", "deregisterInstance", &scripts\cp_mp\vehicles\vehicle_tracking::vehicle_tracking_deregisterinstance);
    registersharedfunc("vehicle", "isVehicleWeapon", &namespace_a0628d6954815ef8::isvehicleweapon);
}

// Namespace namespace_657dc7e018dcfce9 / namespace_c4892e65895918e2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1874
// Size: 0x2e
function host_migration_init() {
    registersharedfunc("hostmigration", "waitLongDurationWithPause", &scripts\cp\cp_hostmigration::waitlongdurationwithhostmigrationpause);
    registersharedfunc("hostmigration", "waittillNotifyOrTimeoutPause", &scripts\cp\cp_hostmigration::waittill_notify_or_timeout_hostmigration_pause);
}

// Namespace namespace_657dc7e018dcfce9 / namespace_c4892e65895918e2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x18aa
// Size: 0x35b
function game_init() {
    registersharedfunc("game", "isKillStreakDenied", &isairdenied);
    registersharedfunc("game", "getEnemyTeams", &scripts\cp\utility::getenemyteams);
    registersharedfunc("game", "getGameType", &scripts\cp\utility::getgametype);
    registersharedfunc("game", "getOtherTeam", &scripts\cp\utility::getotherteam);
    registersharedfunc("game", "createObjectiveEngineer", &scripts\cp\utility::killstreak_createobjective_engineer);
    registersharedfunc("game", "createObjective", &scripts\cp\utility::killstreak_createobjective);
    registersharedfunc("game", "requestObjectiveID", &scripts\cp\utility::nonobjective_requestobjectiveid);
    registersharedfunc("game", "returnObjectiveID", &scripts\cp\utility::nonobjective_returnobjectiveid);
    registersharedfunc("game", "getFriendlyPlayers", &scripts\cp\cp_player_battlechatter::getfriendlyplayers);
    registersharedfunc("game", "getSquadmates", &scripts\cp\cp_player_battlechatter::getsquadmates);
    registersharedfunc("game", "trySayLocalSound", &scripts\cp\cp_player_battlechatter::trysaylocalsound);
    registersharedfunc("game", "tutorialPrint", &scripts\cp\cp_hud_message::tutorialprint);
    registersharedfunc("game", "onEnterOOBTrigger", &scripts\cp\cp_outofbounds::onenteroobtrigger);
    registersharedfunc("game", "onExitOOBTrigger", &scripts\cp\cp_outofbounds::onexitoobtrigger);
    registersharedfunc("game", "makeEnterExitTrigger", &scripts\mp\utility\trigger::makeenterexittrigger);
    registersharedfunc("game", "checkForActiveObjIcon", &scripts\cp\cp_objectives::checkforactiveobjicon);
    registersharedfunc("game", "deleteQuestObjIcon", &scripts\cp\cp_objectives::deletequestobjicon);
    registersharedfunc("game", "spawnPickup", &namespace_6250b14b3f614101::spawnpickup);
    registersharedfunc("game", "getItemDropOriginAndAngles", &namespace_6250b14b3f614101::getitemdroporiginandangles);
    registersharedfunc("game", "br_forceGiveCustomPickupItem", &namespace_bc7b29dcc022d887::br_forcegivecustompickupitem);
    registersharedfunc("game", "isKiosk", &namespace_bc7b29dcc022d887::isKiosk);
    registersharedfunc("game", "canTakePickup", &namespace_6250b14b3f614101::cantakepickup);
    registersharedfunc("game", "createQuestObjIcon", &scripts\cp\cp_objectives::createquestobjicon);
    registersharedfunc("game", "showQuestObjIconToPlayer", &scripts\cp\cp_objectives::showquestobjicontoplayer);
    registersharedfunc("game", "hideQuestObjIconFromPlayer", &scripts\cp\cp_objectives::hidequestobjiconfromplayer);
    registersharedfunc("game", "traceSelectedMapLocation", &namespace_bc7b29dcc022d887::traceselectedmaplocation);
    registersharedfunc("game", "getDefaultWeaponAmmo", &namespace_6250b14b3f614101::getDefaultWeaponAmmo);
    registersharedfunc("game", "getTeamData", &scripts\cp\cp_outline_utility::getteamdata);
    registersharedfunc("game", "registerOnLuiEventCallback", &scripts\cp\utility\lui_game_event_aggregator::registeronluieventcallback);
    registersharedfunc("game", "isBRStyleGameType", &scripts\cp_mp\utility\game_utility::isbrstylegametype);
    registersharedfunc("game", "createHintObject", &scripts\cp\utility::createhintobject);
    registersharedfunc("game", "isBackpackInventoryEnabled", &namespace_6250b14b3f614101::isbackpackinventoryenabled);
    registersharedfunc("inventory", "isBackpackInventoryEnabled", &namespace_6250b14b3f614101::isbackpackinventoryenabled);
    registersharedfunc("game", "disable_backpack_inventory", &scripts\cp\utility::disable_backpack_inventory);
    registersharedfunc("game", "registerEntForOOB", &scripts\cp\cp_outofbounds::registerentforoob);
    registersharedfunc("game", "clearOOB", &scripts\cp\cp_outofbounds::clearoob);
    registersharedfunc("game", "convertsbmissionnametoddl", &namespace_1170726b2799ea65::function_ce720be6f935d1d4);
    if (getdvarint(@"hash_ce58329537cb88ed", 1) > 0) {
        registersharedfunc("backpack", "removeSmallestItemStackBackpack", &namespace_6250b14b3f614101::removeSmallestItemStackBackpack);
    }
}

// Namespace namespace_657dc7e018dcfce9 / namespace_c4892e65895918e2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1c0d
// Size: 0x2e
function emp_init() {
    registersharedfunc("emp", "init", &scripts\cp\emp_debuff_cp::emp_debuff_init);
    registersharedfunc("emp", "set_apply_emp_callback", &scripts\cp_mp\emp_debuff::set_apply_emp_callback);
}

// Namespace namespace_657dc7e018dcfce9 / namespace_c4892e65895918e2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1c43
// Size: 0x18
function entity_init() {
    registersharedfunc("entity", "delayEntDelete", &scripts\cp\utility::delayentdelete);
}

// Namespace namespace_657dc7e018dcfce9 / namespace_c4892e65895918e2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1c63
// Size: 0xde
function weapons_init() {
    registersharedfunc("weapons", "_launchGrenade", &scripts\cp\utility::_launchgrenade);
    registersharedfunc("weapons", "gas_createTrigger", &scripts\cp\equipment\cp_gas_grenade::gas_createtrigger);
    registersharedfunc("weapons", "getDefaultWeaponBaseName", &scripts\cp\utility::getdefaultweaponbasename);
    registersharedfunc("weapons", "isCACPrimaryOrSecondary", &namespace_a0628d6954815ef8::iscacprimaryorsecondary);
    registersharedfunc("weapons", "attachmentIsSelectable", &namespace_a0628d6954815ef8::attachmentisselectable);
    registersharedfunc("weapons", "magicBullet", &scripts\cp_mp\utility\weapon_utility::_magicbullet);
    registersharedfunc("weapons", "watchForPlacementFireState", &scripts\cp\inventory\cp_target_marker::watchForPlacementFireState);
    registersharedfunc("weapons", "isThrowingKnife", &scripts\cp\cp_weapons::isthrowingknife);
    registersharedfunc("weapons", "getWeaponGroup", &namespace_a0628d6954815ef8::getweapongroup);
    registersharedfunc("weapons", "isSuperWeapon", &scripts\cp\utility::issuperweapon);
}

// Namespace namespace_657dc7e018dcfce9 / namespace_c4892e65895918e2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1d49
// Size: 0x9c
function damage_init() {
    registersharedfunc("damage", "updateDamageFeedback", &namespace_e072c8407b2a861c::updatedamagefeedback);
    registersharedfunc("damage", "onKillstreakKilled", &scripts\cp\utility::onkillstreakkilled);
    registersharedfunc("damage", "hudIconType", &namespace_e072c8407b2a861c::hudicontype);
    registersharedfunc("damage", "process_events_and_challenges_on_death", &namespace_dba31853823d1b3::process_events_and_challenges_on_death);
    registersharedfunc("damage", "monitorDamage", &namespace_a0628d6954815ef8::monitordamage);
    registersharedfunc("damage", "handleAPDamage", &namespace_1b51be0488919ce5::handleapdamage);
    registersharedfunc("damage", "fx_stun_damage", &namespace_a0628d6954815ef8::fx_stun_damage);
}

// Namespace namespace_657dc7e018dcfce9 / namespace_c4892e65895918e2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1ded
// Size: 0x4a
function sound_init() {
    level.fnplaysoundonentity = &scripts\cp\utility::play_sound_on_entity;
    level.fnplaysoundontag = &scripts\cp\utility::play_sound_on_tag;
    registersharedfunc("sound", "trySayLocalSound", &scripts\cp\cp_player_battlechatter::trysaylocalsound);
    registersharedfunc("sound", "playKillstreakDeployDialog", &scripts\cp\cp_player_battlechatter::playkillstreakdeploydialog);
}

// Namespace namespace_657dc7e018dcfce9 / namespace_c4892e65895918e2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1e3f
// Size: 0x5a
function flares_init() {
    registersharedfunc("flares", "handleIncomingStinger", &scripts\cp\cp_flares::flares_handleincomingstinger);
    registersharedfunc("flares", "reduceReserves", &scripts\cp\cp_flares::flares_reducereserves);
    registersharedfunc("flares", "deploy", &scripts\cp\cp_flares::flares_deploy);
    registersharedfunc("flares", "playFx", &scripts\cp\cp_flares::flares_playfx);
}

// Namespace namespace_657dc7e018dcfce9 / namespace_c4892e65895918e2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1ea1
// Size: 0x44
function shellshock_init() {
    registersharedfunc("shellshock", "artillery_earthQuake", &scripts\cp_mp\utility\shellshock_utility::shellshock_artilleryearthquake);
    registersharedfunc("shellshock", "flashInterruptDelayFunc", &namespace_1ce798d596a27341::shellshock_nointerruptdelayfunc);
    registersharedfunc("shellshock", "concussionInterruptDelayFunc", &namespace_1ce798d596a27341::shellshock_nointerruptdelayfunc);
}

// Namespace namespace_657dc7e018dcfce9 / namespace_c4892e65895918e2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1eed
// Size: 0x2
function bots_init() {
    
}

// Namespace namespace_657dc7e018dcfce9 / namespace_c4892e65895918e2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1ef7
// Size: 0x44
function outline_init() {
    registersharedfunc("outline", "outlineDisable", &scripts\cp\cp_outline_utility::outlinedisable);
    registersharedfunc("outline", "outlineEnableForPlayer", &scripts\cp\cp_outline_utility::outlineenableforplayer);
    registersharedfunc("outline", "outlineEnableForTeam", &scripts\cp\cp_outline_utility::outlineenableforteam);
}

// Namespace namespace_657dc7e018dcfce9 / namespace_c4892e65895918e2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1f43
// Size: 0x18
function game_utility_init() {
    registersharedfunc("game_utility", "init", &scripts\cp\utility\game_utility_cp::game_utility_cp_init);
}

// Namespace namespace_657dc7e018dcfce9 / namespace_c4892e65895918e2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1f63
// Size: 0x86
function rank_init() {
    registersharedfunc("rank", "getScoreInfoValue", &namespace_5aac85eab99c40a::getscoreinfovalue);
    registersharedfunc("rank", "getScoreInfoXP", &namespace_5aac85eab99c40a::getscoreinfoxp);
    registersharedfunc("rank", "giveRankXP", &namespace_5aac85eab99c40a::giverankxp);
    registersharedfunc("rank", "doScoreEvent", &namespace_6099285b4066f63b::doScoreEvent);
    registersharedfunc("rank", "displayScoreEventPoints", &namespace_6099285b4066f63b::displayscoreeventpoints);
    registersharedfunc("rank", "killEventTextPopup", &namespace_22a50d845d3deb2d::killeventtextpopup);
}

// Namespace namespace_657dc7e018dcfce9 / namespace_c4892e65895918e2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1ff1
// Size: 0x44
function supers_init() {
    registersharedfunc("supers", "setSuperIsInUse", &namespace_44edfb3e2b433c17::setsuperisinuse);
    registersharedfunc("supers", "setSuperIsActive", &namespace_44edfb3e2b433c17::setSuperIsActive);
    registersharedfunc("supers", "getSuperID", &namespace_4a3033eafa6fd07::getsuperid);
}

// Namespace namespace_657dc7e018dcfce9 / namespace_c4892e65895918e2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x203d
// Size: 0x2
function gamescore_init() {
    
}

// Namespace namespace_657dc7e018dcfce9 / namespace_c4892e65895918e2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2047
// Size: 0x18
function function_c1199c7cd79918b3() {
    registersharedfunc("aggregator", "registerOnPlayerSpawnCallback", &scripts\cp\utility\spawn_event_aggregator::registeronplayerspawncallback);
}

// Namespace namespace_657dc7e018dcfce9 / namespace_c4892e65895918e2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2067
// Size: 0x18
function function_1e223bbe18efd769() {
    registersharedfunc("takedowns", "is_in_takedown", &scripts\cp_mp\execution::is_in_takedown);
}

// Namespace namespace_657dc7e018dcfce9 / namespace_c4892e65895918e2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2087
// Size: 0x18
function function_bbe0803dcadd7d18() {
    registersharedfunc("relics", "modify_agent_damage", &scripts\cp\cp_relics::function_ca2cb402bf88a284);
}

// Namespace namespace_657dc7e018dcfce9 / namespace_c4892e65895918e2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x20a7
// Size: 0x5a
function challenges_init() {
    registersharedfunc("challenges", "destroySamSiteNoPlant", &scripts\cp\challenges_cp::destroySamSiteNoPlant);
    registersharedfunc("challenges", "onPing", &scripts\cp_mp\challenges::onping);
    registersharedfunc("challenges", "onFieldUpgradeEnd", &scripts\cp_mp\challenges::function_bd59aa7e8cece1ab);
    registersharedfunc("challenges", "onKillStreakEnd", &scripts\cp_mp\challenges::function_597bc208d923a465);
}

// Namespace namespace_657dc7e018dcfce9 / namespace_c4892e65895918e2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2109
// Size: 0x2
function function_f677f2d747d21482() {
    
}

