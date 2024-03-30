// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_7118a63f6a493ea8;
#using scripts\mp\utility\game.gsc;
#using script_53da3333b83b3527;
#using scripts\mp\poi.gsc;
#using script_1407e72346815bc3;
#using script_15c7dc779b327c9b;
#using script_5b3343e89efb05b6;
#using scripts\mp\anim.gsc;
#using scripts\mp\hud_message.gsc;
#using scripts\mp\hud_util.gsc;
#using scripts\mp\killstreaks\init_mp.gsc;
#using scripts\mp\utility\killstreak.gsc;
#using scripts\mp\matchdata.gsc;
#using scripts\mp\killstreaks\killstreaks.gsc;
#using script_439fa02b5251fa5b;
#using script_2669878cf5a1b6bc;
#using scripts\mp\killstreaks\mapselect.gsc;
#using scripts\mp\events.gsc;
#using scripts\mp\gametypes\br_killstreaks.gsc;
#using scripts\mp\killstreaks\target_marker.gsc;
#using scripts\mp\gametypes\br_pickups.gsc;
#using scripts\mp\killstreaks\manual_turret_mp.gsc;
#using scripts\mp\equipment\throwing_knife_mp.gsc;
#using scripts\mp\equipment.gsc;
#using scripts\mp\weapons.gsc;
#using scripts\mp\utility\entity.gsc;
#using scripts\mp\utility\script.gsc;
#using scripts\mp\utility\perk.gsc;
#using scripts\mp\perks\perkpackage.gsc;
#using scripts\mp\perks\perkfunctions.gsc;
#using scripts\mp\supers.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\print.gsc;
#using scripts\mp\utility\points.gsc;
#using scripts\mp\class.gsc;
#using scripts\mp\teams.gsc;
#using scripts\mp\gametypes\br_maphints.gsc;
#using scripts\mp\playerhealth.gsc;
#using scripts\mp\outofbounds.gsc;
#using scripts\mp\gametypes\br_weapons.gsc;
#using scripts\mp\gametypes\br_public.gsc;
#using script_2d9d24f7c63ac143;
#using scripts\mp\gametypes\br_plunder.gsc;
#using scripts\mp\gametypes\br.gsc;
#using scripts\mp\gametypes\br_gulag.gsc;
#using script_5bab271917698dc4;
#using script_74b851b7aa1ef32d;
#using scripts\mp\gameobjects.gsc;
#using scripts\cp_mp\utility\shellshock_utility.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\playerlogic.gsc;
#using script_5bc60484d17fa95c;
#using scripts\mp\hostmigration.gsc;
#using scripts\mp\vehicles\vehicle_mp.gsc;
#using scripts\cp_mp\vehicles\vehicle_tracking.gsc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\mp\objidpoolmanager.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\movers.gsc;
#using scripts\mp\utility\spawn_event_aggregator.gsc;
#using scripts\mp\utility\player_frame_update_aggregator.gsc;
#using scripts\mp\battlechatter_mp.gsc;
#using scripts\mp\gamelogic.gsc;
#using scripts\mp\flags.gsc;
#using scripts\mp\utility\trigger.gsc;
#using scripts\mp\sentientpoolmanager.gsc;
#using scripts\mp\gametypes\br_gametypes.gsc;
#using script_64acb6ce534155b7;
#using scripts\mp\gametypes\br_analytics.gsc;
#using scripts\mp\gametypes\br_publicevents.gsc;
#using scripts\mp\gametypes\br_gametype_dmz.gsc;
#using scripts\mp\utility\lui_game_event_aggregator.gsc;
#using scripts\mp\menus.gsc;
#using scripts\mp\gametypes\br_circle.gsc;
#using scripts\mp\gametypes\br_spectate.gsc;
#using scripts\mp\utility\damage.gsc;
#using scripts\mp\rank.gsc;
#using scripts\mp\spawnlogic.gsc;
#using scripts\mp\emp_debuff_mp.gsc;
#using scripts\cp_mp\emp_debuff.gsc;
#using scripts\mp\execution_mp.gsc;
#using scripts\mp\equipment\gas_grenade.gsc;
#using scripts\cp_mp\utility\weapon_utility.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\mp\damage.gsc;
#using script_5762ac2f22202ba2;
#using scripts\mp\utility\sound.gsc;
#using scripts\mp\killstreaks\flares.gsc;
#using scripts\mp\shellshock.gsc;
#using scripts\mp\bots\bots_killstreaks_remote_vehicle.gsc;
#using script_22c948a23ad2fbdf;
#using scripts\mp\agents\agent_utility.gsc;
#using scripts\mp\mp_agent.gsc;
#using scripts\mp\utility\outline.gsc;
#using scripts\mp\utility\game_utility_mp.gsc;
#using scripts\mp\utility\dvars.gsc;
#using script_4bef961309209288;
#using scripts\mp\gamescore.gsc;
#using scripts\mp\utility\stats.gsc;
#using scripts\mp\analyticslog.gsc;
#using scripts\cp_mp\challenges.gsc;
#using scripts\mp\utility\join_team_aggregator.gsc;
#using script_51f5154861435b1e;
#using scripts\mp\gametypes\obj_dom.gsc;
#using scripts\mp\vehicles\damage.gsc;
#using scripts\mp\equipment\nvg.gsc;
#using script_3c9f0944a991edb0;
#using scripts\mp\perks\perks.gsc;

#namespace namespace_657dc7e018dcfce9;

// Namespace namespace_657dc7e018dcfce9 / namespace_1bb1b009684a30dc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f06
// Size: 0x17d
function init() {
    namespace_c3fdc5febda99c60::init();
    anim_init();
    hud_init();
    if (!istrue(game["isLaunchChunk"])) {
        killstreak_init();
    }
    equipment_init();
    perk_init();
    player_init();
    loadout_init();
    if (!istrue(game["isLaunchChunk"])) {
        vehicle_init();
    }
    game_init();
    spawn_init();
    objective_init();
    if (!istrue(game["isLaunchChunk"])) {
        emp_init();
    }
    execution_init();
    entity_init();
    weapons_init();
    damage_init();
    sound_init();
    flares_init();
    shellshock_init();
    bots_init();
    function_550bcd278c30275e();
    outline_init();
    game_utility_init();
    function_b9e6cdc26386e536();
    rank_init();
    stats_init();
    supers_init();
    gamescore_init();
    pers_init();
    dlog_init();
    challenges_init();
    function_a92ed2f4c44e5ffa();
    stealth_init();
    gameskill_init();
    poi_init();
    function_c1199c7cd79918b3();
    vehicle_damage_init();
    function_1bc257700c3d014e();
    function_a30b248a8fc67a00();
    battlechatter_init();
    host_migration_init();
    function_f677f2d747d21482();
    utility::registersharedfunc("game", "runLeanThreadMode", &game_utility::runleanthreadmode);
    utility::registersharedfunc("game", "lpcFeatureGated", &game_utility::lpcfeaturegated);
}

// Namespace namespace_657dc7e018dcfce9 / namespace_1bb1b009684a30dc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x208a
// Size: 0x19
function gameskill_init() {
    utility::registersharedfunc("gameskill", "updatePlayerAttackerAccuracy", &namespace_3dfa6eb6c5741630::update_player_attacker_accuracy);
}

// Namespace namespace_657dc7e018dcfce9 / namespace_1bb1b009684a30dc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x20aa
// Size: 0x5b
function poi_init() {
    utility::registersharedfunc("poi", "isSystemActive", &poi::function_47d356083884f913);
    utility::registersharedfunc("poi", "isInActivePOI", &poi::function_9c93e67f90980177);
    utility::registersharedfunc("poi", "findPOIOriginIsIn", &poi::function_6cc445c02b5effac);
    utility::registersharedfunc("poi", "try_TranslatePOI", &poi::function_150af7f3a2874667);
}

// Namespace namespace_657dc7e018dcfce9 / namespace_1bb1b009684a30dc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x210c
// Size: 0x71
function stealth_init() {
    utility::registersharedfunc("stealth", "init", &manager_mp::init);
    utility::registersharedfunc("stealth_music", "init", &namespace_17ca84825c926284::init);
    utility::registersharedfunc("stealth_enemy", "init", &enemy_mp::init);
    utility::registersharedfunc("stealth", "revertAiAccuracy", &manager_mp::revertaiaccuracy);
    utility::registersharedfunc("stealth", "dropAiAccuracy", &manager_mp::dropaiaccuracy);
}

// Namespace namespace_657dc7e018dcfce9 / namespace_1bb1b009684a30dc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2184
// Size: 0x19
function anim_init() {
    utility::registersharedfunc("anim", "player_solo", &anim_mp::anim_player_solo);
}

// Namespace namespace_657dc7e018dcfce9 / namespace_1bb1b009684a30dc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x21a4
// Size: 0x87
function hud_init() {
    utility::registersharedfunc("hud", "showSplash", &hud_message::showsplash);
    utility::registersharedfunc("hud", "teamPlayerCardSplash", &hud_util::teamplayercardsplash);
    utility::registersharedfunc("hud", "showErrorMessage", &hud_message::showerrormessage);
    utility::registersharedfunc("hud", "createHudElem", &hud_util::createhudelem);
    utility::registersharedfunc("hud", "showElem", &hud_util::showelem);
    utility::registersharedfunc("hud", "hideElem", &hud_util::hideelem);
}

// Namespace namespace_657dc7e018dcfce9 / namespace_1bb1b009684a30dc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2232
// Size: 0x2d9
function killstreak_init() {
    utility::registersharedfunc("killstreak", "init", &init_mp::init);
    utility::registersharedfunc("killstreak", "addToActiveKillstreakList", &killstreak::addtoactivekillstreaklist);
    utility::registersharedfunc("killstreak", "logKillstreakEvent", &matchdata::logkillstreakevent);
    utility::registersharedfunc("killstreak", "giveKillstreak", &killstreaks::givekillstreak);
    utility::registersharedfunc("killstreak", "killstreakMakeVehicle", &killstreak::killstreak_make_vehicle);
    utility::registersharedfunc("killstreak", "killstreakSetPreModDamageCallback", &killstreak::killstreak_set_pre_mod_damage_callback);
    utility::registersharedfunc("killstreak", "killstreakSetPostModDamageCallback", &killstreak::killstreak_set_post_mod_damage_callback);
    utility::registersharedfunc("killstreak", "killstreakSetDeathCallback", &killstreak::killstreak_set_death_callback);
    utility::registersharedfunc("killstreak", "maxVehiclesAllowed", &killstreak::maxvehiclesallowed);
    utility::registersharedfunc("killstreak", "currentActiveVehicleCount", &killstreak::currentactivevehiclecount);
    utility::registersharedfunc("killstreak", "allowRideKillstreakPlayerExit", &killstreaks::allowridekillstreakplayerexit);
    utility::registersharedfunc("killstreak", "killstreakHit", &killstreaks::killstreakhit);
    utility::registersharedfunc("killstreak", "getModifiedDamageUsingDamageTuning", &damage_tuning::getmodifieddamageusingdamagetuning);
    utility::registersharedfunc("killstreak", "getModifiedAntiKillstreakDamage", &killstreak::getmodifiedantikillstreakdamage);
    utility::registersharedfunc("killstreak", "isKillstreakWeapon", &weapon::iskillstreakweapon);
    utility::registersharedfunc("killstreak", "doDamageToKillstreak", &killstreak::dodamagetokillstreak);
    utility::registersharedfunc("killstreak", "removeFromActiveKillstreakList", &killstreak::removefromactivekillstreaklist);
    utility::registersharedfunc("killstreak", "awardKillstreakFromStruct", &killstreaks::awardkillstreakfromstruct);
    utility::registersharedfunc("killstreak", "getSelectMapPoint", &mapselect::function_a5839924b6723eac);
    utility::registersharedfunc("killstreak", "startMapSelectSequence", &mapselect::function_90f093ca8576232f);
    utility::registersharedfunc("killstreak", "setKillstreakControlPriority", &killstreak::setkillstreakcontrolpriority);
    utility::registersharedfunc("killstreak", "updateScrapAssistDataForceCredit", &killstreaks::updatescrapassistdataforcecredit);
    utility::registersharedfunc("killstreak", "updateScrapAssistData", &killstreaks::updatescrapassistdata);
    utility::registersharedfunc("killstreak", "processScrapAssist", &events::processscrapassist);
    utility::registersharedfunc("killstreak", "dangerNotifyPlayer", &br_killstreaks::dangernotifyplayer);
    utility::registersharedfunc("killstreak", "getTargetMarker", &target_marker::gettargetmarker);
    utility::registersharedfunc("killstreak", "forceGiveKillstreak", &br_pickups::forcegivekillstreak);
    utility::registersharedfunc("killstreak", "waittill_confirm_or_cancel", &mapselect::waittill_confirm_or_cancel);
    utility::registersharedfunc("killstreak", "forceUseKillstreak", &br_pickups::forceusekillstreak);
    utility::registersharedfunc("killstreak", "awardKillstreak", &killstreaks::awardkillstreak);
    utility::registersharedfunc("killstreak", "registerKillstreak", &killstreaks::registerkillstreak);
    utility::registersharedfunc("killstreak", "registerKillstreakDamageDealingWeapon", &killstreaks::registerKillstreakDamageDealingWeapon);
    utility::registersharedfunc("killstreak", "handleMovingPlatform", &manual_turret_mp::manual_turret_handlemovingplatform);
}

// Namespace namespace_657dc7e018dcfce9 / namespace_1bb1b009684a30dc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2512
// Size: 0x137
function equipment_init() {
    utility::registersharedfunc("throwing_knife", "init", &namespace_70a9c767ad1878e5::throwing_knife_mp_init);
    utility::registersharedfunc("equipment", "takeEquipment", &equipment::takeequipment);
    utility::registersharedfunc("equipment", "giveEquipment", &equipment::giveequipment);
    utility::registersharedfunc("equipment", "hasEquipment", &equipment::hasequipment);
    utility::registersharedfunc("equipment", "findEquipmentSlot", &equipment::findequipmentslot);
    utility::registersharedfunc("equipment", "getEquipmentAmmo", &equipment::getequipmentammo);
    utility::registersharedfunc("equipment", "setEquipmentAmmo", &equipment::setequipmentammo);
    utility::registersharedfunc("equipment", "getEquipmentTableInfo", &equipment::getequipmenttableinfo);
    utility::registersharedfunc("equipment", "getEquipmentRefFromWeapon", &equipment::getequipmentreffromweapon);
    utility::registersharedfunc("equipment", "hackEquipment", &equipment::hackequipment);
    utility::registersharedfunc("equipment", "isPlantedEquipment", &scripts/mp/weapons::isplantedequipment);
    utility::registersharedfunc("equipment", "deleteExplosive", &scripts/mp/weapons::deleteexplosive);
    utility::registersharedfunc("equipment", "areNVGTogglableForPlayer", &nvg::function_258c5e445c8b7f80);
    utility::registersharedfunc("oxygenmask", "init", &namespace_1919d42246c620fa::init);
}

// Namespace namespace_657dc7e018dcfce9 / namespace_1bb1b009684a30dc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2650
// Size: 0x45
function entity_init() {
    utility::registersharedfunc("entity", "touchingBadTrigger", &entity::touchingbadtrigger);
    utility::registersharedfunc("entity", "delayEntDelete", &script::delayentdelete);
    utility::registersharedfunc("entity", "isTouchingBoundsTrigger", &entity::istouchingboundstrigger);
}

// Namespace namespace_657dc7e018dcfce9 / namespace_1bb1b009684a30dc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x269c
// Size: 0xb3
function perk_init() {
    utility::registersharedfunc("perk", "hasPerk", &perk::_hasperk);
    utility::registersharedfunc("perk", "removePerk", &perk::removeperk);
    utility::registersharedfunc("perk", "givePerk", &perk::giveperk);
    utility::registersharedfunc("perk", "activatePerk", &scripts/mp/perks/perks::activatePerk);
    utility::registersharedfunc("perk", "block", &perk::blockperkfunction);
    utility::registersharedfunc("perk", "unblock", &perk::unblockperkfunction);
    utility::registersharedfunc("perk", "perkpackage_giveOverrideFieldUpgrades", &perkpackage::perkpackage_giveoverridefieldupgrades);
    utility::registersharedfunc("perk", "applyStunResistence", &perkfunctions::applystunresistence);
}

// Namespace namespace_657dc7e018dcfce9 / namespace_1bb1b009684a30dc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2756
// Size: 0x5d7
function player_init() {
    utility::registersharedfunc("player", "setUsingRemote", &player::setusingremote);
    utility::registersharedfunc("player", "clearUsingRemote", &player::clearusingremote);
    utility::registersharedfunc("player", "freezeControls", &player::_freezecontrols);
    utility::registersharedfunc("player", "freezeControlsDebug", &player::function_8213d31f7a3c32e2);
    utility::registersharedfunc("player", "freezeLookControls", &player::_freezelookcontrols);
    utility::registersharedfunc("player", "printGameAction", &print::printgameaction);
    utility::registersharedfunc("player", "isPlayerADS", &player::isplayerads);
    utility::registersharedfunc("player", "doScoreEvent", &points::doScoreEvent);
    utility::registersharedfunc("player", "setThirdPersonDOF", &player::setthirdpersondof);
    utility::registersharedfunc("player", "hideMiniMap", &player::hideminimap);
    utility::registersharedfunc("player", "showMiniMap", &player::showminimap);
    utility::registersharedfunc("player", "getPlayersInRadius", &player::getplayersinradius);
    utility::registersharedfunc("player", "isFriendly", &player_utility::isfriendly);
    utility::registersharedfunc("player", "isReallyAlive", &player::isreallyalive);
    utility::registersharedfunc("player", "getStanceCenter", &player::getstancecenter);
    utility::registersharedfunc("player", "getStanceTop", &player::getstancetop);
    utility::registersharedfunc("player", "loadout_finalizeWeapons", &class::loadout_finalizeweapons);
    utility::registersharedfunc("player", "lookupCurrentOperator", &teams::lookupcurrentoperator);
    utility::registersharedfunc("player", "lookupOtherOperator", &teams::lookupotheroperator);
    utility::registersharedfunc("player", "isInLastStand", &player::isinlaststand);
    utility::registersharedfunc("player", "disableClassSwapAllowed", &class::disableclassswapallowed);
    utility::registersharedfunc("player", "isPlayerOnIntelChallenge", &br_maphints::isplayeronintelchallenge);
    utility::registersharedfunc("player", "getGametypeHealthPerFrame", &playerhealth::getGametypeHealthPerFrame);
    utility::registersharedfunc("player", "onFullHealth", &playerhealth::onfullhealth);
    utility::registersharedfunc("player", "isOOB", &outofbounds::isoob);
    utility::registersharedfunc("player", "hasKillstreak", &br_pickups::haskillstreak);
    utility::registersharedfunc("player", "isSuperInUse", &supers::issuperinuse);
    utility::registersharedfunc("player", "getCurrentSuper", &supers::getcurrentsuper);
    utility::registersharedfunc("player", "getCurrentSuperRef", &supers::getcurrentsuperref);
    utility::registersharedfunc("player", "br_ammo_player_is_maxed_out", &br_weapons::br_ammo_player_is_maxed_out);
    utility::registersharedfunc("player", "hasSelfReviveToken", &br_public::hasselfrevivetoken);
    utility::registersharedfunc("player", "takeWeaponPickup", &br_weapons::takeweaponpickup);
    utility::registersharedfunc("player", "forceGiveSuper", &br_pickups::forcegivesuper);
    utility::registersharedfunc("player", "resetSuper", &br_pickups::resetsuper);
    utility::registersharedfunc("player", "br_ammo_player_max_out", &br_weapons::br_ammo_player_max_out);
    utility::registersharedfunc("player", "addRespawnToken", &br_pickups::addrespawntoken);
    utility::registersharedfunc("player", "addSelfReviveToken", &br_pickups::addselfrevivetoken);
    utility::registersharedfunc("player", "isJuggernaut", &killstreak::isjuggernaut);
    utility::registersharedfunc("player", "getAvailableDMZBackpackIndex", &namespace_e50e624d9af51c8c::getAvailableDMZBackpackIndex);
    utility::registersharedfunc("player", "playerPlunderKioskPurchase", &br_plunder::playerplunderkioskpurchase);
    utility::registersharedfunc("player", "preloadAndQueueClass", &class::preloadandqueueclass);
    utility::registersharedfunc("player", "br_giveSelectedClass", &br::br_giveselectedclass);
    utility::registersharedfunc("player", "isEligibleForTeamRevive", &br_public::iseligibleforteamrevive);
    utility::registersharedfunc("player", "isRespawningFromToken", &br_public::isrespawningfromtoken);
    utility::registersharedfunc("player", "playerGulagAutoWin", &br_gulag::playergulagautowin);
    utility::registersharedfunc("player", "playerPrestreamRespawnOrigin", &namespace_6e6b980bec22af5b::playerprestreamrespawnorigin);
    utility::registersharedfunc("player", "gulagFadeToBlack", &namespace_6e6b980bec22af5b::function_334a8fe67e88bbe7);
    utility::registersharedfunc("player", "gulagStreamExit", &namespace_6e6b980bec22af5b::function_961b4afc4c695b94);
    utility::registersharedfunc("player", "playerTeleportGulag", &namespace_6e6b980bec22af5b::function_ab31cf673d70f72d);
    utility::registersharedfunc("player", "playerCleanupEntOnDisconnect", &namespace_6e6b980bec22af5b::playercleanupentondisconnect);
    utility::registersharedfunc("player", "playerWaittillStreamHintComplete", &br_public::playerwaittillstreamhintcomplete);
    utility::registersharedfunc("player", "playerClearStreamHintOrigin", &br_public::playerclearstreamhintorigin);
    utility::registersharedfunc("player", "resetPlayerMoveSpeedScale", &namespace_6e6b980bec22af5b::resetplayermovespeedscale);
    utility::registersharedfunc("player", "gulagFadeFromBlack", &namespace_6e6b980bec22af5b::function_e68e4bb4f65f5fe4);
    utility::registersharedfunc("player", "doOnActionScoreEvent", &namespace_40cd4a4db2010f22::doonactionscoreevent);
    utility::registersharedfunc("player", "gulagTrackPlayerBulletHitAI", &function_e1e9831c1bcd6f59);
    utility::registersharedfunc("player", "isInGulagCheck", &br_public::isplayerinorgoingtogulag);
    utility::registersharedfunc("player", "getUniqueId", &player::getuniqueid);
    utility::registersharedfunc("player", "initPlayerGameobjects", &gameobjects::init_player_gameobjects);
    utility::registersharedfunc("player", "shellShock", &shellshock_utility::_shellshock);
    utility::registersharedfunc("player", "stopShellShock", &shellshock_utility::_stopshellshock);
    utility::registersharedfunc("player", "fadeToBlackForPlayer", &game_utility::fadetoblackforplayer);
    utility::registersharedfunc("player", "playerHasMoved", &playerlogic::playerhasmoved);
    utility::registersharedfunc("player", "checkHit", &scripts/mp/weapons::checkhit);
    utility::registersharedfunc("player", "setDOF_cruiseFirst", undefined);
    utility::registersharedfunc("player", "addExtraMoveSpeed", &weapons::addextramovespeed);
    utility::registersharedfunc("player", "removeExtraMoveSpeed", &weapons::removeextramovespeed);
    utility::registersharedfunc("player", "updateMoveSpeed", &weapons::updatemovespeedscale);
}

// Namespace namespace_657dc7e018dcfce9 / namespace_1bb1b009684a30dc
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d34
// Size: 0x30
function function_e1e9831c1bcd6f59(eattacker, idamage) {
    if (namespace_d36e6800233f4f97::function_cfe304859f30e747("gulagTrackPlayerBulletHitAI")) {
        namespace_d36e6800233f4f97::function_3cceb052d780fef1("gulagTrackPlayerBulletHitAI", eattacker, idamage);
    }
}

// Namespace namespace_657dc7e018dcfce9 / namespace_1bb1b009684a30dc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d6b
// Size: 0x2f
function host_migration_init() {
    utility::registersharedfunc("hostmigration", "waitLongDurationWithPause", &hostmigration::waitlongdurationwithhostmigrationpause);
    utility::registersharedfunc("hostmigration", "waittillNotifyOrTimeoutPause", &hostmigration::waittill_notify_or_timeout_hostmigration_pause);
}

// Namespace namespace_657dc7e018dcfce9 / namespace_1bb1b009684a30dc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2da1
// Size: 0xdf
function vehicle_init() {
    utility::registersharedfunc("vehicle", "init", &vehicle_mp::vehicle_mp_init);
    utility::registersharedfunc("vehicle", "incrementFauxVehicleCount", &killstreak::incrementfauxvehiclecount);
    utility::registersharedfunc("vehicle", "decrementFauxVehicleCount", &killstreak::decrementfauxvehiclecount);
    utility::registersharedfunc("vehicle", "reserveVehicle", &vehicle_tracking::reservevehicle);
    utility::registersharedfunc("vehicle", "clearVehicleReservation", &vehicle_tracking::clearvehiclereservation);
    utility::registersharedfunc("vehicle", "spawnVehicle", &vehicle_tracking::_spawnvehicle);
    utility::registersharedfunc("vehicle", "deleteVehicle", &vehicle_tracking::_deletevehicle);
    utility::registersharedfunc("vehicle", "registerInstance", &vehicle_tracking::vehicle_tracking_registerinstance);
    utility::registersharedfunc("vehicle", "deregisterInstance", &vehicle_tracking::vehicle_tracking_deregisterinstance);
    utility::registersharedfunc("vehicle", "isVehicleWeapon", &weapon::isvehicleweapon);
}

// Namespace namespace_657dc7e018dcfce9 / namespace_1bb1b009684a30dc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e87
// Size: 0x725
function game_init() {
    utility::registersharedfunc("game", "isAnyMLGMatch", &game_utility::isanymlgmatch);
    utility::registersharedfunc("game", "isKillStreakDenied", &game_utility::iskillstreakdenied);
    utility::registersharedfunc("game", "lpcFeatureGated", &game_utility::lpcfeaturegated);
    utility::registersharedfunc("game", "objectiveUnPinPlayer", &namespace_6c8a837ec98fe0b8::objective_unpin_player);
    utility::registersharedfunc("game", "isMLGMatch", &game_utility::ismlgmatch);
    utility::registersharedfunc("game", "getGameType", &game_utility::getgametype);
    utility::registersharedfunc("game", "getEnemyTeams", &teams::getenemyteams);
    utility::registersharedfunc("game", "getOtherTeam", &game_utility::getotherteam);
    utility::registersharedfunc("game", "getTeamData", &teams::getteamdata);
    utility::registersharedfunc("game", "createObjective", &namespace_6c8a837ec98fe0b8::createobjective);
    utility::registersharedfunc("game", "createObjectiveEngineer", &namespace_6c8a837ec98fe0b8::createobjective_engineer);
    utility::registersharedfunc("game", "createObjectiveHidden", &namespace_6c8a837ec98fe0b8::function_c1a18d4076f420a5);
    utility::registersharedfunc("game", "requestObjectiveID", &namespace_6c8a837ec98fe0b8::requestobjectiveid);
    utility::registersharedfunc("game", "returnObjectiveID", &namespace_6c8a837ec98fe0b8::returnobjectiveid);
    utility::registersharedfunc("game", "handlemovingplatforms", &movers::handle_moving_platforms);
    utility::registersharedfunc("game", "registerEntForOOB", &outofbounds::registerentforoob);
    utility::registersharedfunc("game", "clearOOB", &outofbounds::clearoob);
    utility::registersharedfunc("game", "onEnterOOBTrigger", &outofbounds::onenteroobtrigger);
    utility::registersharedfunc("game", "onExitOOBTrigger", &outofbounds::onexitoobtrigger);
    utility::registersharedfunc("game", "checkInvalidOOBTriggers", &outofbounds::checkinvalidoobtriggers);
    utility::registersharedfunc("game", "isGameplayTeam", &teams::isgameplayteam);
    utility::registersharedfunc("game", "getGametypeNumLives", &game_utility::getgametypenumlives);
    utility::registersharedfunc("game", "getFriendlyPlayers", &teams::getfriendlyplayers);
    utility::registersharedfunc("game", "getSquadmates", &teams::getsquadmates);
    utility::registersharedfunc("game", "registerOnPlayerSpawnCallback", &namespace_b8f8e2f86acf53ed::registeronplayerspawncallback);
    utility::registersharedfunc("game", "registerPlayerFrameUpdateCallback", &namespace_5340b948743deeca::registerplayerframeupdatecallback);
    utility::registersharedfunc("game", "trySayLocalSound", &battlechatter_mp::trysaylocalsound);
    utility::registersharedfunc("game", "tutorialPrint", &print::tutorialprint);
    utility::registersharedfunc("game", "setOverTimeLimitDvar", &game_utility::setovertimelimitdvar);
    utility::registersharedfunc("game", "getHostPlayer", &gamelogic::gethostplayer);
    utility::registersharedfunc("game", "brGetOperatorTeam", &br_public::brgetoperatorteam);
    utility::registersharedfunc("game", "gameFlag", &flags::gameflag);
    utility::registersharedfunc("game", "makeEnterExitTrigger", &trigger::makeenterexittrigger);
    utility::registersharedfunc("game", "registerSentient", &namespace_26be03d9c56f9498::registersentient);
    utility::registersharedfunc("game", "unregisterSentient", &namespace_26be03d9c56f9498::unregistersentient);
    utility::registersharedfunc("game", "gameflagSet", &flags::gameflagset);
    utility::registersharedfunc("game", "gameflagClear", &flags::gameflagclear);
    utility::registersharedfunc("game", "isFeatureDisabled", &br_gametypes::isfeaturedisabled);
    utility::registersharedfunc("game", "checkForActiveObjIcon", &namespace_c133516bfc1d803c::checkforactiveobjicon);
    utility::registersharedfunc("game", "deleteQuestObjIcon", &namespace_c133516bfc1d803c::deletequestobjicon);
    utility::registersharedfunc("game", "spawnPickup", &br_pickups::spawnpickup);
    utility::registersharedfunc("game", "getItemDropOriginAndAngles", &br_pickups::getitemdroporiginandangles);
    utility::registersharedfunc("game", "br_forceGiveCustomPickupItem", &br_pickups::br_forcegivecustompickupitem);
    utility::registersharedfunc("game", "brAnalytics_kiosk_purchaseItem", &br_analytics::branalytics_kiosk_purchaseitem);
    utility::registersharedfunc("game", "runBrGametypeFunc", &br_gametypes::runbrgametypefunc);
    utility::registersharedfunc("game", "isKiosk", &br_public::isKiosk);
    utility::registersharedfunc("game", "canTakePickup", &br_pickups::cantakepickup);
    utility::registersharedfunc("game", "brAnalytics_kiosk_menu_event", &br_analytics::branalytics_kiosk_menu_event);
    utility::registersharedfunc("game", "createQuestObjIcon", &namespace_c133516bfc1d803c::createquestobjicon);
    utility::registersharedfunc("game", "showQuestObjIconToPlayer", &namespace_c133516bfc1d803c::showquestobjicontoplayer);
    utility::registersharedfunc("game", "hideQuestObjIconFromPlayer", &namespace_c133516bfc1d803c::hidequestobjiconfromplayer);
    utility::registersharedfunc("game", "isPublicEventOfTypeActive", &br_publicevents::ispubliceventoftypeactive);
    utility::registersharedfunc("game", "isBrPracticeMode", &br_public::isBrPracticeMode);
    utility::registersharedfunc("game", "respawnTokenDisabled", &br_pickups::respawntokendisabled);
    utility::registersharedfunc("game", "traceSelectedMapLocation", &br::traceselectedmaplocation);
    utility::registersharedfunc("game", "getDefaultWeaponAmmo", &br_gametype_dmz::getDefaultWeaponAmmo);
    utility::registersharedfunc("game", "getTeamData", &teams::getteamdata);
    utility::registersharedfunc("game", "isBackpackInventoryEnabled", &namespace_e50e624d9af51c8c::isbackpackinventoryenabled);
    utility::registersharedfunc("game", "calculatePurchaseXp", &br::calculatepurchasexp);
    utility::registersharedfunc("game", "isAnyTutorialOrBotPracticeMatch", &br_public::isanytutorialorbotpracticematch);
    utility::registersharedfunc("game", "registerOnLuiEventCallback", &namespace_95a52c4860eaf4dd::registeronluieventcallback);
    utility::registersharedfunc("game", "isLoadoutIndexDefault", &menus::isloadoutindexdefault);
    utility::registersharedfunc("game", "getClassChoice", &menus::getclasschoice);
    utility::registersharedfunc("game", "isBrGametypeFuncDefined", &br_gametypes::isbrgametypefuncdefined);
    utility::registersharedfunc("game", "utilFlare_shootFlare", &namespace_c133516bfc1d803c::utilflare_shootflare);
    utility::registersharedfunc("game", "isValidPointInBounds", &br_circle::isvalidpointinbounds);
    utility::registersharedfunc("game", "initCirclePostStartToCircleIndex", &br_circle::initcirclepoststarttocircleindex);
    utility::registersharedfunc("game", "isFeatureEnabled", &br_gametypes::isfeatureenabled);
    utility::registersharedfunc("game", "spectate_init", &br_spectate::spectate_init);
    utility::registersharedfunc("game", "createHintObject", &gameobjects::createhintobject);
    utility::registersharedfunc("game", "processTouchEnt", &gameobjects::processTouchEnt);
    utility::registersharedfunc("game", "isBRStyleGameType", &game_utility::isbrstylegametype);
    utility::registersharedfunc("game", "non_player_add_ignore_damage_signature", &damage::non_player_add_ignore_damage_signature);
    utility::registersharedfunc("game", "non_player_remove_ignore_damage_signature", &damage::non_player_remove_ignore_damage_signature);
    utility::registersharedfunc("game", "registerScoreInfo", &rank::registerscoreinfo);
    utility::registersharedfunc("game", "addSpawnViewer", &spawnlogic::addspawnviewer);
    utility::registersharedfunc("game", "removeSpawnViewer", &spawnlogic::removespawnviewer);
    utility::registersharedfunc("game", "getEntitiesInRadius", &entity::getentitiesinradius);
    utility::registersharedfunc("game", "isPointInOutOfBounds", &outofbounds::ispointinoutofbounds);
    utility::registersharedfunc("game", "findboxcenter", &spawnlogic::findboxcenter);
    utility::registersharedfunc("game", "isTeamReviveEnabled", &game_utility::isteamreviveenabled);
    utility::registersharedfunc("game", "clearSpawnProtection", &game_utility::clearSpawnProtection);
    utility::registersharedfunc("game", "isLifeLimited", &game_utility::islifelimited);
}

// Namespace namespace_657dc7e018dcfce9 / namespace_1bb1b009684a30dc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x35b3
// Size: 0x5b
function spawn_init() {
    utility::registersharedfunc("spawn", "addSpawnDangerZone", &spawnlogic::addspawndangerzone);
    utility::registersharedfunc("spawn", "removeSpawnDangerZone", &spawnlogic::removespawndangerzone);
    utility::registersharedfunc("spawn", "isSpawnDangerZoneAlive", &spawnlogic::isspawndangerzonealive);
    utility::registersharedfunc("spawn", "getCodeHandleFromScriptHandle", &spawnlogic::influencepoint_getcodehandlefromscripthandle);
}

// Namespace namespace_657dc7e018dcfce9 / namespace_1bb1b009684a30dc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3615
// Size: 0x7b
function objective_init() {
    utility::registersharedfunc(#"objective", #"showtoplayer", &namespace_6c8a837ec98fe0b8::objective_playermask_addshowplayer);
    utility::registersharedfunc(#"objective", #"hidefromplayer", &namespace_6c8a837ec98fe0b8::objective_playermask_hidefrom);
    utility::registersharedfunc(#"objective", #"hidefromall", &namespace_6c8a837ec98fe0b8::objective_playermask_hidefromall);
    utility::registersharedfunc(#"objective", #"hash_8114455fc014da35", &namespace_6c8a837ec98fe0b8::function_fa3c420e27b5d08b);
}

// Namespace namespace_657dc7e018dcfce9 / namespace_1bb1b009684a30dc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3697
// Size: 0x5d
function emp_init() {
    utility::registersharedfunc(#"emp", #"init", &emp_debuff_mp::emp_debuff_init);
    utility::registersharedfunc(#"emp", #"hash_a865e3770eb96298", &emp_debuff::function_ecb3af104f3ab0f4);
    utility::registersharedfunc(#"emp", #"emp_debuff_deregister", &emp_debuff::emp_debuff_deregister);
}

// Namespace namespace_657dc7e018dcfce9 / namespace_1bb1b009684a30dc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x36fb
// Size: 0x19
function execution_init() {
    utility::registersharedfunc("execution", "init", &execution_mp::execution_mp_init);
}

// Namespace namespace_657dc7e018dcfce9 / namespace_1bb1b009684a30dc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x371b
// Size: 0x1a5
function weapons_init() {
    utility::registersharedfunc("weapons", "enableBurnFX", &weapons::enableburnfx);
    utility::registersharedfunc("weapons", "disableBurnFX", &weapons::disableburnfx);
    utility::registersharedfunc("weapons", "_launchGrenade", &weapon::_launchgrenade);
    utility::registersharedfunc("weapons", "mapWeapon", &weapon::mapweapon);
    utility::registersharedfunc("weapons", "gas_createTrigger", &gas_grenade::gas_createtrigger);
    utility::registersharedfunc("weapons", "getDefaultWeaponBaseName", &weapon::getdefaultweaponbasename);
    utility::registersharedfunc("weapons", "isCACPrimaryOrSecondary", &weapon::iscacprimaryorsecondary);
    utility::registersharedfunc("weapons", "attachmentIsSelectable", &weapon::attachmentisselectable);
    utility::registersharedfunc("weapons", "saveToggleScopeStates", &weapons::savetogglescopestates);
    utility::registersharedfunc("weapons", "saveAltStates", &weapons::savealtstates);
    utility::registersharedfunc("weapons", "updateSavedAltState", &weapons::updatesavedaltstate);
    utility::registersharedfunc("weapons", "updateToggleScopeState", &weapons::updatetogglescopestate);
    utility::registersharedfunc("weapons", "onEquipmentPlanted", &scripts/mp/weapons::onequipmentplanted);
    utility::registersharedfunc("weapons", "removeEquip", &scripts/mp/weapons::removeequip);
    utility::registersharedfunc("weapons", "magicBullet", &weapon_utility::_magicbullet);
    utility::registersharedfunc("weapons", "watchForPlacementFireState", &target_marker::watchForPlacementFireState);
    utility::registersharedfunc("weapons", "dropWeaponForDeath", &weapons::dropweaponfordeath);
    utility::registersharedfunc("weapons", "getWeaponGroup", &scripts/mp/utility/weapon::getweapongroup);
    utility::registersharedfunc("weapons", "isSuperWeapon", &scripts/mp/utility/weapon::issuperweapon);
}

// Namespace namespace_657dc7e018dcfce9 / namespace_1bb1b009684a30dc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x38c7
// Size: 0x137
function damage_init() {
    utility::registersharedfunc("damage", "enqueueCorpsetableFunc", &damage::enqueuecorpsetablefunc);
    utility::registersharedfunc("damage", "dequeueCorpsetableFunc", &damage::dequeuecorpsetablefunc);
    utility::registersharedfunc("damage", "updateDamageFeedback", &damagefeedback::updatedamagefeedback);
    utility::registersharedfunc("damage", "onKillstreakKilled", &damage::onkillstreakkilled);
    utility::registersharedfunc("damage", "logAttackerKillstreak", &damage::logattackerkillstreak);
    utility::registersharedfunc("damage", "handleDamageFeedback", &damage::handledamagefeedback);
    utility::registersharedfunc("damage", "_suicide", &damage::_suicide);
    utility::registersharedfunc("damage", "hudIconType", &damagefeedback::hudicontype);
    utility::registersharedfunc("damage", "handleAPDamage", &damage::handleapdamage);
    utility::registersharedfunc("damage", "monitorDamage", &damage::monitordamage);
    utility::registersharedfunc("damage", "isFMJDamage", &damage::isfmjdamage);
    utility::registersharedfunc("damage", "handleAPAmmoDamage", &damage::handleapammodamage);
    utility::registersharedfunc("damage", "handleAkimboDamage", &damage::handleakimbodamage);
    utility::registersharedfunc("damage", "monitorDamage", &damage::monitordamage);
}

// Namespace namespace_657dc7e018dcfce9 / namespace_1bb1b009684a30dc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a05
// Size: 0x5b
function sound_init() {
    utility::registersharedfunc("sound", "trySayLocalSound", &battlechatter_mp::trysaylocalsound);
    utility::registersharedfunc("sound", "playKillstreakDeployDialog", &battlechatter_mp::playkillstreakdeploydialog);
    utility::registersharedfunc("sound", "playSoundOnTag", &sound::play_sound_on_tag);
    utility::registersharedfunc("sound", "CodcasterSetPlayerStatusEffect", &player::codcastersetplayerstatuseffect);
}

// Namespace namespace_657dc7e018dcfce9 / namespace_1bb1b009684a30dc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a67
// Size: 0x5b
function flares_init() {
    utility::registersharedfunc("flares", "handleIncomingStinger", &flares::flares_handleincomingstinger);
    utility::registersharedfunc("flares", "reduceReserves", &flares::flares_reducereserves);
    utility::registersharedfunc("flares", "deploy", &flares::flares_deploy);
    utility::registersharedfunc("flares", "playFx", &flares::flares_playfx);
}

// Namespace namespace_657dc7e018dcfce9 / namespace_1bb1b009684a30dc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3ac9
// Size: 0x2f
function shellshock_init() {
    utility::registersharedfunc("shellshock", "artillery_earthQuake", &shellshock::artillery_earthquake);
    utility::registersharedfunc("shellshock", "grenade_earthQuakeAtPosition", &shellshock::grenade_earthquakeatposition);
}

// Namespace namespace_657dc7e018dcfce9 / namespace_1bb1b009684a30dc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3aff
// Size: 0x2f
function bots_init() {
    utility::registersharedfunc("bots", "get_random_outside_target", &namespace_cc7250329787f909::get_random_outside_target);
    utility::registersharedfunc("bots", "bot_body_is_dead", &namespace_cc7250329787f909::bot_body_is_dead);
}

// Namespace namespace_657dc7e018dcfce9 / namespace_1bb1b009684a30dc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3b35
// Size: 0x36
function function_550bcd278c30275e() {
    namespace_84c887a505a8f661::function_ce55987060167d4a();
    utility::registersharedfunc("agents", "deactivateAgent", &agent_utility::deactivateagent);
    utility::registersharedfunc("agents", "spawnNewAgentAiType", &mp_agent::spawnnewagentaitype);
}

// Namespace namespace_657dc7e018dcfce9 / namespace_1bb1b009684a30dc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3b72
// Size: 0x71
function outline_init() {
    utility::registersharedfunc("outline", "outlineDisable", &outline::outlinedisable);
    utility::registersharedfunc("outline", "outlineEnableForPlayer", &outline::outlineenableforplayer);
    utility::registersharedfunc("outline", "outlineEnableForTeam", &outline::outlineenableforteam);
    utility::registersharedfunc("outline", "hudOutlineViewmodelEnable", &outline::_hudoutlineviewmodelenable);
    utility::registersharedfunc("outline", "hudOutlineViewmodelDisable", &outline::_hudoutlineviewmodeldisable);
}

// Namespace namespace_657dc7e018dcfce9 / namespace_1bb1b009684a30dc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3bea
// Size: 0x19
function game_utility_init() {
    utility::registersharedfunc("game_utility", "init", &game_utility_mp::game_utility_mp_init);
}

// Namespace namespace_657dc7e018dcfce9 / namespace_1bb1b009684a30dc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3c0a
// Size: 0x19
function function_b9e6cdc26386e536() {
    utility::registersharedfunc("dvar_utility", "getFloatProperty", &dvars::getfloatproperty);
}

// Namespace namespace_657dc7e018dcfce9 / namespace_1bb1b009684a30dc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3c2a
// Size: 0x87
function rank_init() {
    utility::registersharedfunc("rank", "getScoreInfoValue", &rank::getscoreinfovalue);
    utility::registersharedfunc("rank", "getScoreInfoXP", &rank::getscoreinfoxp);
    utility::registersharedfunc("rank", "giveRankXP", &rank::giverankxp);
    utility::registersharedfunc("rank", "scoreEventPopup", &rank::scoreeventpopup);
    utility::registersharedfunc("rank", "displayScoreEventPoints", &points::displayscoreeventpoints);
    utility::registersharedfunc("rank", "killEventTextPopup", &events::killeventtextpopup);
}

// Namespace namespace_657dc7e018dcfce9 / namespace_1bb1b009684a30dc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3cb8
// Size: 0x19
function stats_init() {
    registersharedfunc("stats", "getPersStat", &scripts/mp/utility/stats::getpersstat);
}

// Namespace namespace_657dc7e018dcfce9 / namespace_1bb1b009684a30dc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3cd8
// Size: 0x163
function supers_init() {
    utility::registersharedfunc("supers", "giveSuper", &supers::givesuper);
    utility::registersharedfunc("supers", "giveSuperPoints", &supers::givesuperpoints);
    utility::registersharedfunc("supers", "superUseFinished", &supers::superusefinished);
    utility::registersharedfunc("supers", "getSuperPointsNeeded", &supers::getsuperpointsneeded);
    utility::registersharedfunc("supers", "combatRecordSuperMisc", &supers::combatrecordsupermisc);
    utility::registersharedfunc("supers", "hasAPRRounds", &super_suppression_rounds::function_1da49fb6441f8ab2);
    utility::registersharedfunc("supers", "setSuperBasePoints", &supers::setsuperbasepoints);
    utility::registersharedfunc("supers", "refundSuper", &supers::refundsuper);
    utility::registersharedfunc("supers", "setSuperIsInUse", &supers::setsuperisinuse);
    utility::registersharedfunc("supers", "setSuperIsActive", &supers::setSuperIsActive);
    utility::registersharedfunc("supers", "getCurrentSuper", &supers::getcurrentsuper);
    utility::registersharedfunc("supers", "tryGiveUseWeapon", &supers::trygiveuseweapon);
    utility::registersharedfunc("supers", "isSuperInUse", &supers::issuperinuse);
    utility::registersharedfunc("supers", "getSuperRefForSuperOffhand", &supers::getsuperrefforsuperoffhand);
    utility::registersharedfunc("supers", "updateSuperUIProgress", &supers::updatesuperuiprogress);
    utility::registersharedfunc("supers", "updateSuperUIState", &supers::updatesuperuistate);
}

// Namespace namespace_657dc7e018dcfce9 / namespace_1bb1b009684a30dc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3e42
// Size: 0x2f
function gamescore_init() {
    utility::registersharedfunc("gamescore", "trackDebuffAssist", &gamescore::trackdebuffassist);
    utility::registersharedfunc("gamescore", "untrackDebuffAssist", &gamescore::untrackdebuffassist);
}

// Namespace namespace_657dc7e018dcfce9 / namespace_1bb1b009684a30dc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3e78
// Size: 0x19
function pers_init() {
    utility::registersharedfunc("pers", "incPersStat", &stats::incpersstat);
}

// Namespace namespace_657dc7e018dcfce9 / namespace_1bb1b009684a30dc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3e98
// Size: 0x5b
function dlog_init() {
    utility::registersharedfunc("dlog", "fieldUpgradeExpired", &analyticslog::logevent_fieldupgradeexpired);
    utility::registersharedfunc("dlog", "killStreakExpired", &analyticslog::logevent_killstreakexpired);
    utility::registersharedfunc("dlog", "brAnalytics_inventory_snapshot", &br_analytics::branalytics_inventory_snapshot);
    utility::registersharedfunc("dlog", "brAnalytics_kiosk_purchaseLoadout", &br_analytics::branalytics_kiosk_purchaseloadout);
}

// Namespace namespace_657dc7e018dcfce9 / namespace_1bb1b009684a30dc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3efa
// Size: 0x9d
function challenges_init() {
    utility::registersharedfunc("challenges", "onVehicleKilled", &challenges::vehiclekilled);
    utility::registersharedfunc("challenges", "onFieldUpgradeEnd", &challenges::function_bd59aa7e8cece1ab);
    utility::registersharedfunc("challenges", "onKillStreakEnd", &challenges::function_597bc208d923a465);
    utility::registersharedfunc("challenges", "resetChallengeTimer", &challenges::resetchallengetimer);
    utility::registersharedfunc("challenges", "startChallengeTimer", &challenges::startchallengetimer);
    utility::registersharedfunc("challenges", "stopChallengeTimer", &challenges::stopchallengetimer);
    utility::registersharedfunc("challenges", "onPing", &challenges::onping);
}

// Namespace namespace_657dc7e018dcfce9 / namespace_1bb1b009684a30dc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3f9e
// Size: 0x2f
function function_a92ed2f4c44e5ffa() {
    utility::registersharedfunc("team_utility", "init", &teams::function_f6728366ba30005c);
    utility::registersharedfunc("team_utility", "joinTeamAggregator", &namespace_f7eae0a211807471::registeronplayerjointeamcallback);
}

// Namespace namespace_657dc7e018dcfce9 / namespace_1bb1b009684a30dc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3fd4
// Size: 0x2f
function function_c1199c7cd79918b3() {
    utility::registersharedfunc("aggregator", "registerOnPlayerSpawnCallback", &namespace_b8f8e2f86acf53ed::registeronplayerspawncallback);
    utility::registersharedfunc("aggregator", "registerOnLuiEventCallback", &namespace_95a52c4860eaf4dd::registeronluieventcallback);
}

// Namespace namespace_657dc7e018dcfce9 / namespace_1bb1b009684a30dc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x400a
// Size: 0x45
function vehicle_damage_init() {
    utility::registersharedfunc("vehicle", "get_weapon_hit_damage_data", &damage::get_weapon_hit_damage_data);
    utility::registersharedfunc("vehicle", "get_vehicle_hit_damage_data", &damage::get_vehicle_hit_damage_data);
    utility::registersharedfunc("vehicle", "set_vehicle_hit_damage_data_for_weapon", &damage::set_vehicle_hit_damage_data_for_weapon);
}

// Namespace namespace_657dc7e018dcfce9 / namespace_1bb1b009684a30dc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4056
// Size: 0x19
function function_1bc257700c3d014e() {
    utility::registersharedfunc("cameras", "tacticalCamera_Hack", &tactical_camera::tacticalCamera_Hack);
}

// Namespace namespace_657dc7e018dcfce9 / namespace_1bb1b009684a30dc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4076
// Size: 0x19
function function_a30b248a8fc67a00() {
    utility::registersharedfunc("objdom", "distSquaredCheck", &obj_dom::distsquaredcheck);
}

// Namespace namespace_657dc7e018dcfce9 / namespace_1bb1b009684a30dc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4096
// Size: 0x2f
function battlechatter_init() {
    utility::registersharedfunc("battlechatter", "equipmentDestroyed", &battlechatter_mp::equipmentdestroyed);
    utility::registersharedfunc("battlechatter", "onFieldUpgradeDestroy", &battlechatter_mp::onfieldupgradedestroy);
}

// Namespace namespace_657dc7e018dcfce9 / namespace_1bb1b009684a30dc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x40cc
// Size: 0x9d
function loadout_init() {
    utility::registersharedfunc("loadout", "cac_getFlcExtraEquipmentPrimary", &class::cac_getFlcExtraEquipmentPrimary);
    utility::registersharedfunc("loadout", "cac_getFlcExtraEquipmentSecondary", &class::cac_getFlcExtraEquipmentSecondary);
    utility::registersharedfunc("loadout", "table_getFlcExtraEquipmentPrimary", &class::table_getFlcExtraEquipmentPrimary);
    utility::registersharedfunc("loadout", "table_getFlcExtraEquipmentSecondary", &class::table_getFlcExtraEquipmentSecondary);
    utility::registersharedfunc("loadout", "loadout_getClassType", &class::loadout_getclasstype);
    utility::registersharedfunc("loadout", "getExtraEquipmentPrimary", &class::cac_getextraequipmentprimary);
    utility::registersharedfunc("loadout", "getExtraEquipmentSecondary", &class::cac_getextraequipmentsecondary);
}

// Namespace namespace_657dc7e018dcfce9 / namespace_1bb1b009684a30dc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4170
// Size: 0x3
function function_f677f2d747d21482() {
    
}

