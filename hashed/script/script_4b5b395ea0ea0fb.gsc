// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_3b64eb40368c1450;
#using script_7ab5b649fa408138;
#using scripts\mp\hud_util.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\stats.gsc;
#using scripts\mp\utility\points.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\utility\outline.gsc;
#using scripts\mp\utility\print.gsc;
#using scripts\mp\spawnlogic.gsc;
#using scripts\mp\globallogic.gsc;
#using scripts\mp\gameobjects.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\outofbounds.gsc;
#using scripts\mp\utility\dvars.gsc;
#using scripts\mp\teamrevive.gsc;
#using scripts\mp\gamelogic.gsc;
#using scripts\mp\gametypes\common.gsc;
#using scripts\engine\trace.gsc;
#using scripts\mp\objidpoolmanager.gsc;
#using scripts\mp\flags.gsc;
#using scripts\mp\gametypes\obj_dom.gsc;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using scripts\cp_mp\utility\killstreak_utility.gsc;
#using scripts\mp\utility\script.gsc;
#using scripts\mp\anim.gsc;
#using scripts\common\anim.gsc;
#using scripts\mp\utility\killstreak.gsc;
#using scripts\mp\hud_message.gsc;
#using scripts\mp\utility\dialog.gsc;
#using scripts\mp\utility\weapon.gsc;
#using script_2669878cf5a1b6bc;
#using script_4a6760982b403bad;
#using scripts\mp\persistence.gsc;
#using scripts\mp\codcasterclientmatchdata.gsc;
#using scripts\mp\rank.gsc;
#using scripts\mp\gamescore.gsc;
#using scripts\mp\weapons.gsc;

#namespace rescue;

// Namespace rescue/namespace_6d8fa3f81f071973
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x15e2
// Size: 0x439
function main() {
    if (getdvar(@"hash_687fb8f9b7a23245") == "mp_background") {
        return;
    }
    namespace_77cb23aada5edffd::init();
    namespace_77cb23aada5edffd::setupcallbacks();
    allowed[0] = getgametype();
    namespace_19b4203b51d56488::main(allowed);
    if (isusingmatchrulesdata()) {
        level.initializematchrules = &initializematchrules;
        [[ level.initializematchrules ]]();
        level thread reinitializematchrulesonmigration();
    } else {
        registerroundswitchdvar(getgametype(), 3, 0, 12);
        registertimelimitdvar(getgametype(), 150);
        registerscorelimitdvar(getgametype(), 200);
        registerroundlimitdvar(getgametype(), 0);
        registerwinlimitdvar(getgametype(), 500);
        registernumlivesdvar(getgametype(), 1);
        registerhalftimedvar(getgametype(), 0);
        registerwinbytwoenableddvar(getgametype(), 1);
        registerwinbytwomaxroundsdvar(getgametype(), 4);
        registernumrevivesdvar(getgametype(), 0);
        setdvar(@"hash_e723cc761de7b161", 2);
    }
    updategametypedvars();
    level.objectivebased = 1;
    level.teambased = 1;
    level.nobuddyspawns = 1;
    level.onstartgametype = &onstartgametype;
    level.getspawnpoint = &getspawnpoint;
    level.onnormaldeath = &onnormaldeath;
    level.modeonspawnplayer = &onspawnplayer;
    level.onplayerconnect = &onplayerconnect;
    level.onobjectivecomplete = &onflagcapture;
    level.ondeadevent = &ondeadevent;
    level.ontimelimit = &ontimelimit;
    level.endgame = &function_f6e1c54f449c2c6f;
    level.onteamscore = &function_e462b877cedea7f7;
    level.var_a12ec32a24e1a367 = &function_a12ec32a24e1a367;
    level.onmaprestart = &function_cf8b96b6503d9f31;
    level.gamemodemaydropweapon = &function_824aadc5e0a8e202;
    level.var_ca4e08767cbdae12 = &function_c95d2a5f442a6bfe;
    level.var_91f947790df03886 = getdvarint(@"hash_7798be18e3f3ad91", 0);
    level.var_e181fdcc8e4e5173 = getdvarint(@"hash_71c04cb18cad67cd", 0);
    level.var_f224e09983ef4b2a = getdvarint(@"hash_20103d7a5a56aac8", 20);
    level.var_681eabe436c0029d = getdvarint(@"hash_7e0c25f71d807534", 1);
    function_f21c2225770dca31();
    level.var_4f4f5beac3bccc69 = 1;
    level.flagcapturetime = 0;
    level.var_500370e4f476faa9 = 0;
    level.var_319544f76c37154b["axis"] = 0;
    level.var_319544f76c37154b["allies"] = 0;
    level.var_9a8e3eb5bc672807 = 1;
    level.var_37baab13a0cf00e3 = getdvarint(@"hash_bbbbf0150d760b11", 1);
    level.allowlatecomers = 0;
    game["canScoreOnTie"] = 1;
    if (namespace_36f464722d326bbe::function_b2c4b42f9236924()) {
        game["dialog"]["gametype"] = "iw9_rscu_mode_uktl_rnt1";
    } else {
        game["dialog"]["gametype"] = "iw9_rscu_mode_uktl_name";
    }
    if (!isdefined(game["roundsPlayed"])) {
        var_20ee2c907dd89357 = "iw9_rscu_mode_uktl_bstd";
        var_9016b7d396ffbdbb = "iw9_rscu_mode_uktl_bsta";
    } else {
        var_20ee2c907dd89357 = "iw9_rscu_mode_uktl_bstd";
        var_9016b7d396ffbdbb = "iw9_rscu_mode_uktl_bsta";
    }
    game["dialog"]["offense_obj"] = var_20ee2c907dd89357;
    game["dialog"]["defense_obj"] = var_9016b7d396ffbdbb;
    game["dialog"]["dropped_hostage_defend"] = "iw9_rscu_mode_uktl_rsde";
    game["dialog"]["dropped_hostage_retrieve"] = "iw9_rscu_mode_uktl_rsdh";
    game["dialog"]["hostage_taken_friendly"] = "iw9_rscu_mode_uktl_rseh";
    game["dialog"]["hostage_taken_enemy"] = "iw9_rscu_mode_uktl_rset";
    game["dialog"]["hostage_extraected_friendly"] = "iw9_rscu_mode_uktl_rsex";
    game["dialog"]["hostage_extracted_enemy"] = "iw9_rscu_mode_uktl_rsee";
    game["dialog"]["lead_lost"] = "gamestate_leadlost";
    game["dialog"]["lead_taken"] = "gamestate_leadtaken";
    namespace_d9c77dc2a6fe29c6::registeroobentercallback("rescue", &function_b9962c5a08fd9ab7);
    namespace_d9c77dc2a6fe29c6::registeroobexitcallback("rescue", &function_d50cce29bbb9d457);
    /#
        thread function_e100ac66c6f43c39();
    #/
}

// Namespace rescue/namespace_6d8fa3f81f071973
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a22
// Size: 0x45
function initializematchrules() {
    setcommonrulesfrommatchrulesdata();
    setdynamicdvar(@"hash_c44109000ed1922d", getmatchrulesdata("carryData", "manualDropEnabled"));
    setdynamicdvar(@"hash_b68209d1c9d3b09f", 0);
    registerhalftimedvar("rescue", 0);
}

// Namespace rescue/namespace_6d8fa3f81f071973
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a6e
// Size: 0x142
function function_f21c2225770dca31() {
    switch (level.var_e181fdcc8e4e5173) {
    case 0:
        level.var_c8b917bf9d0b1d1 = 2;
        level.var_385bb8fdab525e2b = 0;
        level.numextractions = 1;
        level.showenemycarrier = 0;
        break;
    case 1:
        level.var_c8b917bf9d0b1d1 = 1;
        level.var_385bb8fdab525e2b = 0;
        level.numextractions = 1;
        level.showenemycarrier = 0;
        break;
    case 2:
        level.var_c8b917bf9d0b1d1 = 1;
        level.var_385bb8fdab525e2b = 1;
        level.numextractions = 2;
        level.showenemycarrier = 0;
        break;
    case 3:
        level.var_c8b917bf9d0b1d1 = 2;
        level.var_385bb8fdab525e2b = 1;
        level.numextractions = 2;
        level.showenemycarrier = 0;
        break;
    case 4:
        level.var_c8b917bf9d0b1d1 = 2;
        level.var_385bb8fdab525e2b = 0;
        level.numextractions = 1;
        level.showenemycarrier = 0;
        break;
    default:
        break;
    }
}

// Namespace rescue/namespace_6d8fa3f81f071973
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1bb7
// Size: 0x298
function onstartgametype() {
    level.var_974e9f26a695cd24 = 200;
    level.var_d2574c87ee723d10 = 100;
    if (level.var_c8b917bf9d0b1d1 == 1) {
        namespace_296c793a004e81b3::setoverridewatchdvar("scorelimit", 100);
        level.scorelimit = 100;
        level.scorelimitoverride = 100;
        level.roundscorelimit = 100 * (game["roundsPlayed"] + 1);
        level.var_974e9f26a695cd24 = 100;
        level.var_d2574c87ee723d10 = 50;
        namespace_296c793a004e81b3::setoverridewatchdvar("winlimit", 250);
        level.winlimit = 250;
    }
    level.winlimit = 500;
    if (!isdefined(game["switchedsides"])) {
        game["switchedsides"] = 0;
    }
    if (game["switchedsides"]) {
        oldattackers = game["attackers"];
        olddefenders = game["defenders"];
        game["attackers"] = olddefenders;
        game["defenders"] = oldattackers;
    }
    setclientnamemode("manual_change");
    setobjectivetext(game["attackers"], "OBJECTIVES/RESCUE_DEFENDERS");
    setobjectivetext(game["defenders"], "OBJECTIVES/RESCUE_ATTACKERS");
    if (level.splitscreen) {
        setobjectivescoretext(game["attackers"], "OBJECTIVES/RESCUE_DEFENDERS");
        setobjectivescoretext(game["defenders"], "OBJECTIVES/RESCUE_ATTACKERS");
    } else {
        setobjectivescoretext(game["attackers"], "OBJECTIVES/RESCUE_SCORE_DEFENDERS");
        setobjectivescoretext(game["defenders"], "OBJECTIVES/RESCUE_SCORE_ATTACKERS");
    }
    setobjectivehinttext(game["attackers"], "OBJECTIVES/RESCUE_SCORE_DEFENDERS");
    setobjectivehinttext(game["defenders"], "OBJECTIVES/RESCUE_SCORE_ATTACKERS");
    initanims();
    seticonnames();
    function_65ddee84a30aca2a();
    function_f8c926cdeb59f116();
    function_b924ba876ae5b152();
    thread function_e94cf520d98ce0e1();
    initspawns();
    level.var_319544f76c37154b["axis"] = 0;
    level.var_319544f76c37154b["allies"] = 0;
    level thread function_189d41172d946149();
    var_1010c350abcc5fec = ter_op(game["defenders"] == "axis", 1, 0);
    foreach (player in level.players) {
        player setclientomnvar("ui_rescue_hostage_active", 0);
    }
    setomnvar("ui_rescue_axis_attacking", var_1010c350abcc5fec);
    namespace_7db13bdf599e41a6::function_5343ecb486b66bf1("rescue", &function_d23f4d7bfe21f9da);
}

// Namespace rescue/namespace_6d8fa3f81f071973
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e56
// Size: 0xb9
function seticonnames() {
    level.iconrecover = "rescue_recover";
    level.iconescort = "rescue_escort";
    level.var_e8891f63e5a412c2 = "rescue_escort_return";
    level.iconextract = "rescue_taking_extract";
    level.icondefendextract = "rescue_defend_extract";
    level.iconcaptureextract = "rescue_capture_extract";
    level.iconlosing = "rescue_defend_extract";
    level.icontaking = "rescue_taking_extract";
    level.iconneutral = "rescue_capture_extract";
    level.iconcapture = "rescue_capture_extract";
    level.icondefending = "rescue_defend_extract";
    level.iconcontested = "rescue_stopping_extract";
    level.icondefend = "rescue_defend_extract";
}

// Namespace rescue/namespace_6d8fa3f81f071973
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f16
// Size: 0x19b
function function_65ddee84a30aca2a() {
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("rescue_recover", 0, "friendly", "MP_INGAME_ONLY/OBJ_RECOVER_CAPS", "icon_waypoint_hostage_captive", 0);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("rescue_escort", 0, "enemy", "MP_INGAME_ONLY/OBJ_RESCUE_CAPS", "icon_waypoint_hostage", 0);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("rescue_escort_return", 0, "friendly", "MP_INGAME_ONLY/OBJ_ESCORT_CAPS", "icon_waypoint_hostage", 0);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_capture_a", 0, "enemy", "MP_INGAME_ONLY/OBJ_RESCUE_CAPS", "icon_waypoint_hostage", 0);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_capture_b", 0, "enemy", "MP_INGAME_ONLY/OBJ_RESCUE_CAPS", "icon_waypoint_hostage", 0);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_capture_c", 0, "enemy", "MP_INGAME_ONLY/OBJ_RESCUE_CAPS", "icon_waypoint_hostage", 0);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_defend_a", 0, "friendly", "MP_INGAME_ONLY/OBJ_DEFEND_CAPS", "icon_waypoint_hostage_captive", 0);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_defend_b", 0, "friendly", "MP_INGAME_ONLY/OBJ_DEFEND_CAPS", "icon_waypoint_hostage_captive", 0);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_defend_c", 0, "friendly", "MP_INGAME_ONLY/OBJ_DEFEND_CAPS", "icon_waypoint_hostage_captive", 0);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_capture_kill", 0, "friendly", "MP_INGAME_ONLY/OBJ_KILL_CAPS", "icon_waypoint_kill", 0);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("rescue_kill_carrier", 0, "enemy", "MP_INGAME_ONLY/OBJ_KILL_CAPS", "icon_waypoint_kill", 0);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("rescue_taking_extract", 1, "friendly", "MP_INGAME_ONLY/OBJ_EXTRACT_CAPS", "ui_map_icon_extraction", 0);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("rescue_defend_extract", 1, "friendly", "MP_INGAME_ONLY/OBJ_DEFEND_CAPS", "ui_map_icon_extraction", 0);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("rescue_capture_extract", 0, "neutral", "MP_INGAME_ONLY/OBJ_NEXT_CAPS", "icon_waypoint_hostage", 0);
}

// Namespace rescue/namespace_6d8fa3f81f071973
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x20b8
// Size: 0x1a
function updategametypedvars() {
    setdvarifuninitialized(@"hash_5ad4b38eb8b556f1", 0);
    namespace_310ba947928891df::updatecommongametypedvars();
}

// Namespace rescue/namespace_6d8fa3f81f071973
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x20d9
// Size: 0x7e7
function initanims() {
    level.scr_animtree["player_pickup_hostage"] = %script_model;
    level.scr_anim["player_pickup_hostage"]["pickup_front_crouch"] = script_model%iw9_mp_hostage_pickup_crouch_8;
    level.scr_eventanim["player_pickup_hostage"]["pickup_front_crouch"] = %"pickup_front_crouch";
    level.scr_anim["player_pickup_hostage"]["pickup_front_stand"] = script_model%iw9_mp_hostage_pickup_stand_8;
    level.scr_eventanim["player_pickup_hostage"]["pickup_front_stand"] = %"pickup_front_stand";
    level.scr_anim["player_pickup_hostage"]["pickup_back_crouch"] = script_model%iw9_mp_hostage_pickup_crouch_2;
    level.scr_eventanim["player_pickup_hostage"]["pickup_back_crouch"] = %"pickup_back_crouch";
    level.scr_anim["player_pickup_hostage"]["pickup_back_stand"] = script_model%iw9_mp_hostage_pickup_stand_2;
    level.scr_eventanim["player_pickup_hostage"]["pickup_back_stand"] = %"pickup_back_stand";
    level.scr_anim["player_pickup_hostage"]["pickup_right_crouch"] = script_model%iw9_mp_hostage_pickup_crouch_6;
    level.scr_eventanim["player_pickup_hostage"]["pickup_right_crouch"] = %"pickup_right_crouch";
    level.scr_anim["player_pickup_hostage"]["pickup_right_stand"] = script_model%iw9_mp_hostage_pickup_stand_6;
    level.scr_eventanim["player_pickup_hostage"]["pickup_right_stand"] = %"pickup_right_stand";
    level.scr_anim["player_pickup_hostage"]["pickup_left_crouch"] = script_model%iw9_mp_hostage_pickup_crouch_4;
    level.scr_eventanim["player_pickup_hostage"]["pickup_left_crouch"] = %"pickup_left_crouch";
    level.scr_anim["player_pickup_hostage"]["pickup_left_stand"] = script_model%iw9_mp_hostage_pickup_stand_4;
    level.scr_eventanim["player_pickup_hostage"]["pickup_left_stand"] = %"pickup_left_stand";
    level.scr_anim["player_pickup_hostage"]["pickup_front_crouch_vm"] = script_model%iw9_mp_hostage_vm_pickup_crouch_8;
    level.scr_eventanim["player_pickup_hostage"]["pickup_front_crouch_vm"] = %"pickup_front_crouch_vm";
    level.scr_anim["player_pickup_hostage"]["pickup_front_stand_vm"] = script_model%iw9_mp_hostage_vm_pickup_stand_8;
    level.scr_eventanim["player_pickup_hostage"]["pickup_front_stand_vm"] = %"pickup_front_stand_vm";
    level.scr_anim["player_pickup_hostage"]["pickup_back_crouch_vm"] = script_model%iw9_mp_hostage_vm_pickup_crouch_2;
    level.scr_eventanim["player_pickup_hostage"]["pickup_back_crouch_vm"] = %"pickup_back_crouch_vm";
    level.scr_anim["player_pickup_hostage"]["pickup_back_stand_vm"] = script_model%iw9_mp_hostage_vm_pickup_stand_2;
    level.scr_eventanim["player_pickup_hostage"]["pickup_back_stand_vm"] = %"pickup_back_stand_vm";
    level.scr_anim["player_pickup_hostage"]["pickup_right_crouch_vm"] = script_model%iw9_mp_hostage_vm_pickup_crouch_6;
    level.scr_eventanim["player_pickup_hostage"]["pickup_right_crouch_vm"] = %"pickup_right_crouch_vm";
    level.scr_anim["player_pickup_hostage"]["pickup_right_stand_vm"] = script_model%iw9_mp_hostage_vm_pickup_stand_6;
    level.scr_eventanim["player_pickup_hostage"]["pickup_right_stand_vm"] = %"pickup_right_stand_vm";
    level.scr_anim["player_pickup_hostage"]["pickup_left_crouch_vm"] = script_model%iw9_mp_hostage_vm_pickup_crouch_4;
    level.scr_eventanim["player_pickup_hostage"]["pickup_left_crouch_vm"] = %"pickup_left_crouch_vm";
    level.scr_anim["player_pickup_hostage"]["pickup_left_stand_vm"] = script_model%iw9_mp_hostage_vm_pickup_stand_4;
    level.scr_eventanim["player_pickup_hostage"]["pickup_left_stand_vm"] = %"pickup_left_stand_vm";
    level.scr_animtree["hostage_pickup"] = %script_model;
    level.scr_anim["hostage_pickup"]["pickup_front_crouch"] = script_model%iw9_mp_hostage_pickedup_crouch_8;
    level.scr_eventanim["hostage_pickup"]["pickup_front_crouch"] = %"hash_67f23cafd452eaf";
    level.scr_anim["hostage_pickup"]["pickup_front_stand"] = script_model%iw9_mp_hostage_pickedup_stand_8;
    level.scr_eventanim["hostage_pickup"]["pickup_front_stand"] = %"hash_76c3c19b5cdc4957";
    level.scr_anim["hostage_pickup"]["pickup_back_crouch"] = script_model%iw9_mp_hostage_pickedup_crouch_2;
    level.scr_eventanim["hostage_pickup"]["pickup_back_crouch"] = %"hash_5b9b71e89b7aff69";
    level.scr_anim["hostage_pickup"]["pickup_back_stand"] = script_model%iw9_mp_hostage_pickedup_stand_2;
    level.scr_eventanim["hostage_pickup"]["pickup_back_stand"] = %"hash_6a3ae844da15c55d";
    level.scr_anim["hostage_pickup"]["pickup_right_crouch"] = script_model%iw9_mp_hostage_pickedup_crouch_6;
    level.scr_eventanim["hostage_pickup"]["pickup_right_crouch"] = %"hash_17c61661c4ba6d68";
    level.scr_anim["hostage_pickup"]["pickup_right_stand"] = script_model%iw9_mp_hostage_pickedup_stand_6;
    level.scr_eventanim["hostage_pickup"]["pickup_right_stand"] = %"hash_2c87d17e444be8d6";
    level.scr_anim["hostage_pickup"]["pickup_left_crouch"] = script_model%iw9_mp_hostage_pickedup_crouch_4;
    level.scr_eventanim["hostage_pickup"]["pickup_left_crouch"] = %"hash_763bf8b46b8f6ff";
    level.scr_anim["hostage_pickup"]["pickup_left_stand"] = script_model%iw9_mp_hostage_pickedup_stand_4;
    level.scr_eventanim["hostage_pickup"]["pickup_left_stand"] = %"hash_3c9d606392a88b87";
    level.scr_anim["hostage_pickup"]["pickup_front_crouch_vm"] = script_model%iw9_mp_hostage_vm_pickedup_crouch_8;
    level.scr_eventanim["hostage_pickup"]["pickup_front_crouch_vm"] = %"hash_2dfeef0aebdfeecd";
    level.scr_anim["hostage_pickup"]["pickup_front_stand_vm"] = script_model%iw9_mp_hostage_vm_pickedup_stand_8;
    level.scr_eventanim["hostage_pickup"]["pickup_front_stand_vm"] = %"hash_7e016dd39eca5fe5";
    level.scr_anim["hostage_pickup"]["pickup_back_crouch_vm"] = script_model%iw9_mp_hostage_vm_pickedup_crouch_2;
    level.scr_eventanim["hostage_pickup"]["pickup_back_crouch_vm"] = %"hash_1a414b9d05f157c3";
    level.scr_anim["hostage_pickup"]["pickup_back_stand_vm"] = script_model%iw9_mp_hostage_vm_pickedup_stand_2;
    level.scr_eventanim["hostage_pickup"]["pickup_back_stand_vm"] = %"hash_242c761811d89107";
    level.scr_anim["hostage_pickup"]["pickup_right_crouch_vm"] = script_model%iw9_mp_hostage_vm_pickedup_crouch_6;
    level.scr_eventanim["hostage_pickup"]["pickup_right_crouch_vm"] = %"hash_716be6cc83bf81c";
    level.scr_anim["hostage_pickup"]["pickup_right_stand_vm"] = script_model%iw9_mp_hostage_vm_pickedup_stand_6;
    level.scr_eventanim["hostage_pickup"]["pickup_right_stand_vm"] = %"hash_4590693be6e310be";
    level.scr_anim["hostage_pickup"]["pickup_left_crouch_vm"] = script_model%iw9_mp_hostage_vm_pickedup_crouch_4;
    level.scr_eventanim["hostage_pickup"]["pickup_left_crouch_vm"] = %"hash_1897e7f4cbc945fd";
    level.scr_anim["hostage_pickup"]["pickup_left_stand_vm"] = script_model%iw9_mp_hostage_vm_pickedup_stand_4;
    level.scr_eventanim["hostage_pickup"]["pickup_left_stand_vm"] = %"hash_39404f4bc2930c35";
}

// Namespace rescue/namespace_6d8fa3f81f071973
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x28c7
// Size: 0xa0
function function_d527fa212314e504() {
    if (isdefined(level.mapname) && getdvarint(@"hash_bf1b18b4b2448e99", 1)) {
        switch (level.mapname) {
        case #"hash_f7a3e0a896bc04b":
        case #"hash_66b7bcbc2686771f":
            return [0:game["attackers"], 1:game["defenders"]];
        default:
            return [0:game["defenders"], 1:game["attackers"]];
            break;
        }
    }
    return [0:game["defenders"], 1:game["attackers"]];
}

// Namespace rescue/namespace_6d8fa3f81f071973
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x296f
// Size: 0x1bd
function initspawns() {
    level.spawnmins = (2.14748e+09, 2.14748e+09, 2.14748e+09);
    level.spawnmaxs = (-2147483647, -2147483647, -2147483647);
    var_57acadc40b2f0a8 = function_d527fa212314e504();
    defend = var_57acadc40b2f0a8[1];
    attack = var_57acadc40b2f0a8[0];
    namespace_b2d5aa2baf2b5701::addstartspawnpoints("mp_rescue_spawn_attacker");
    namespace_b2d5aa2baf2b5701::addstartspawnpoints("mp_rescue_spawn_defender");
    namespace_b2d5aa2baf2b5701::addspawnpoints(attack, "mp_rescue_spawn_attacker");
    namespace_b2d5aa2baf2b5701::addspawnpoints(defend, "mp_rescue_spawn_defender");
    if (level.mapname == "mp_m_speedball" || level.mapname == "mp_m_overunder" || level.mapname == "mp_m_overwinter") {
        attackers = namespace_b2d5aa2baf2b5701::getspawnpointarray("mp_rescue_spawn_defender");
        defenders = namespace_b2d5aa2baf2b5701::getspawnpointarray("mp_rescue_spawn_attacker");
    } else if (level.mapname == "mp_petrograd") {
        attackers = namespace_b2d5aa2baf2b5701::getspawnpointarray("mp_rescue_spawn_attacker");
        defenders = namespace_b2d5aa2baf2b5701::getspawnpointarray("mp_rescue_spawn_defender", 1);
    } else if (istrue(level.var_f1c340dae77ca15d)) {
        attackers = namespace_b2d5aa2baf2b5701::getspawnpointarray("mp_rescue_spawn_attacker", 1);
        defenders = namespace_b2d5aa2baf2b5701::getspawnpointarray("mp_rescue_spawn_defender", 1);
    } else {
        attackers = namespace_b2d5aa2baf2b5701::getspawnpointarray("mp_rescue_spawn_attacker");
        defenders = namespace_b2d5aa2baf2b5701::getspawnpointarray("mp_rescue_spawn_defender");
    }
    namespace_b2d5aa2baf2b5701::registerspawnset("start_attackers", attackers);
    namespace_b2d5aa2baf2b5701::registerspawnset("start_defenders", defenders);
    level.mapcenter = namespace_b2d5aa2baf2b5701::findboxcenter(level.spawnmins, level.spawnmaxs);
    setmapcenter(level.mapcenter);
}

// Namespace rescue/namespace_6d8fa3f81f071973
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b33
// Size: 0xf8
function getspawnpoint() {
    if (function_bff229a11ecd1e34()) {
        namespace_b2d5aa2baf2b5701::setactivespawnlogic(#"start");
    } else {
        namespace_b2d5aa2baf2b5701::setactivespawnlogic("StartSpawn", "Crit_Default");
    }
    spawnteam = self.pers["team"];
    spawnpoint = undefined;
    var_57acbdc40b2f2db = function_d527fa212314e504();
    defend = var_57acbdc40b2f2db[1];
    attack = var_57acbdc40b2f2db[0];
    var_5d57963b098879cf = defend;
    var_997b6614f3b296b7 = attack;
    if (level.var_385bb8fdab525e2b) {
        var_5d57963b098879cf = attack;
        var_997b6614f3b296b7 = defend;
    }
    if (spawnteam == var_997b6614f3b296b7) {
        namespace_b2d5aa2baf2b5701::activatespawnset("start_attackers", 1);
        spawnpoint = namespace_b2d5aa2baf2b5701::getspawnpoint(self, spawnteam, undefined, "start_attackers");
    } else {
        namespace_b2d5aa2baf2b5701::activatespawnset("start_defenders", 1);
        spawnpoint = namespace_b2d5aa2baf2b5701::getspawnpoint(self, spawnteam, undefined, "start_defenders");
    }
    return spawnpoint;
}

// Namespace rescue/namespace_6d8fa3f81f071973
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c33
// Size: 0x31d
function function_45f0bd1189ba467c(mapname) {
    var_a65297a455514e0 = [];
    switch (mapname) {
    case #"hash_81b84d832a53ee33":
        var_a65297a455514e0[0] = (-935, 588, 12);
        var_a65297a455514e0[1] = (664, 840, 8);
        return var_a65297a455514e0;
    case #"hash_7783d431a1b0c821":
        var_a65297a455514e0[0] = (98, -1, 2);
        var_a65297a455514e0[1] = (-1709, 285, 48);
        return var_a65297a455514e0;
    case #"hash_afcbd31dbcac0848":
        var_a65297a455514e0[0] = (-567, 1822, 2);
        var_a65297a455514e0[1] = (1633, 1632, 80);
        return var_a65297a455514e0;
    case #"hash_8b054465d9648555":
        var_a65297a455514e0[0] = (-390, 1992, 546);
        var_a65297a455514e0[1] = (-2089, 1093, 570);
        return var_a65297a455514e0;
    case #"hash_1373c0a36e3cab54":
        var_a65297a455514e0[0] = (28969, -28273, 3174);
        var_a65297a455514e0[1] = (29413, -30139, 3174);
        return var_a65297a455514e0;
    case #"hash_c860b74f2269590c":
        var_a65297a455514e0[0] = (17728, -54048, 1025);
        var_a65297a455514e0[1] = (15968, -53632, 1136);
        return var_a65297a455514e0;
    case #"hash_bfec720c737b7425":
        var_a65297a455514e0[0] = (-9394.5, 7968.5, 304);
        var_a65297a455514e0[1] = (-10280, 8656, 344);
        return var_a65297a455514e0;
    case #"hash_dfa04d97b4cc9b44":
        var_a65297a455514e0[0] = (-9901.26, 43167.5, 234.159);
        var_a65297a455514e0[1] = (-7713.92, 44422.1, 241.991);
        return var_a65297a455514e0;
    case #"hash_3e552e81b4a21fff":
    case #"hash_3e6dceebd27fedec":
    case #"hash_5586b38644ed9b26":
    case #"hash_6210b3e419ba7028":
    case #"hash_62644ed2dea5cf54":
    case #"hash_7709127773d7af61":
    case #"hash_7e7b98f5c7f2b9a0":
    case #"hash_a11e6e81ea219453":
    case #"hash_a9b94844236a7fd8":
    case #"hash_c8b70146f0c8a9cd":
    case #"hash_d707e2cfc340c376":
    case #"hash_decd2e8ff1f996d7":
    case #"hash_ec2ebc1298ef7373":
        if (isdefined(level.var_d27f667e6320d465)) {
            var_807596236eb20c21 = getstruct(level.var_d27f667e6320d465.var_7fdcf3bd51650cf2, "script_noteworthy");
            var_807593236eb20588 = getstruct(level.var_d27f667e6320d465.var_7fdcf2bd51650abf, "script_noteworthy");
        } else {
            var_807596236eb20c21 = getstruct("hostage_a", "script_noteworthy");
            var_807593236eb20588 = getstruct("hostage_b", "script_noteworthy");
        }
        if (isdefined(var_807596236eb20c21) && isdefined(var_807593236eb20588)) {
            return [0:drop_to_ground(var_807596236eb20c21.origin, 10, -10), 1:drop_to_ground(var_807593236eb20588.origin, 10, -10)];
        }
        break;
    default:
        break;
    }
    return undefined;
}

// Namespace rescue/namespace_6d8fa3f81f071973
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f58
// Size: 0x8f3
function function_f8c926cdeb59f116() {
    hostages = getentarray("hostage_group_01", "target");
    var_6085a8df9c0e33eb = [];
    if (hostages.size > 0) {
        var_6085a8df9c0e33eb = hostages;
        if (level.var_c8b917bf9d0b1d1 == 1) {
            var_6085a8df9c0e33eb = array_randomize(var_6085a8df9c0e33eb);
        }
    } else {
        var_6085a8df9c0e33eb = getentarray("hostage_trigger", "targetname");
    }
    level.var_826175089e4669d6 = 0;
    if (var_6085a8df9c0e33eb.size == 0) {
        level.var_826175089e4669d6 = 1;
        level.var_ca4e08767cbdae12 = &function_15a66746e75cc48a;
        var_807596236eb20c21 = getstruct("hostage_a", "script_noteworthy");
        if (isdefined(var_807596236eb20c21)) {
            trigger = spawn("script_model", drop_to_ground(var_807596236eb20c21.origin, 10, -20));
            trigger.angles = var_807596236eb20c21.angles;
            trigger.objectivekey = "_a";
            trigger.iconname = "_a";
            var_6085a8df9c0e33eb[var_6085a8df9c0e33eb.size] = trigger;
        }
        var_807593236eb20588 = getstruct("hostage_b", "script_noteworthy");
        if (isdefined(var_807593236eb20588)) {
            trigger = spawn("script_model", drop_to_ground(var_807593236eb20588.origin, 10, -20));
            trigger.angles = var_807593236eb20588.angles;
            trigger.objectivekey = "_b";
            trigger.iconname = "_b";
            var_6085a8df9c0e33eb[var_6085a8df9c0e33eb.size] = trigger;
        }
    }
    var_a65297a455514e0 = undefined;
    if (getdvarint(@"hash_9f5fa1a2bee6620e", 1) && !istrue(level.var_826175089e4669d6)) {
        var_a65297a455514e0 = function_45f0bd1189ba467c(level.mapname);
    }
    level.planttime = 5;
    var_3800a132040816d1 = 0;
    foreach (trigger in var_6085a8df9c0e33eb) {
        if (var_3800a132040816d1 >= level.var_c8b917bf9d0b1d1) {
            break;
        }
        if (isdefined(var_a65297a455514e0)) {
            trigger.origin = var_a65297a455514e0[var_3800a132040816d1];
        }
        visuals[0] = spawn("script_model", trigger.origin);
        visuals[0] setmodel("body_civ_me_male_1_1");
        visuals[0] setasgametypeobjective();
        head = spawn("script_model", visuals[0].origin);
        if (istrue(level.var_826175089e4669d6)) {
            visuals[0].angles = trigger.angles;
            head.linktoenabledflag = 1;
            head makeusable();
            head.var_2768447445db282 = 1;
            hostage = namespace_19b4203b51d56488::createcarryobject(game["attackers"], head, visuals, (0, 0, 16), undefined, 1);
        } else {
            hostage = namespace_19b4203b51d56488::createcarryobject(game["attackers"], trigger, visuals, (0, 0, 16), undefined, 1);
        }
        head setmodel("head_hostage_hood_01");
        head linkto(visuals[0], "j_neck", (-9, 1, 0), (0, 0, 0));
        hostage.head = head;
        hostage.body = visuals[0];
        hostage.body solid();
        hostage.head solid();
        tracestart = visuals[0].origin + (0, 0, 32);
        traceend = visuals[0].origin + (0, 0, -100);
        contentoverride = namespace_2a184fc4902783dc::create_contents(1, 1, 1, 1, 1, 1, 1);
        ignoreents = [0:visuals[0], 1:trigger];
        trace = namespace_2a184fc4902783dc::ray_trace(tracestart, traceend, ignoreents, contentoverride);
        if (trace["fraction"] < 1) {
            visuals[0].origin = trace["position"] + (0, 0, 2);
        }
        hostage.body scriptmodelplayanimdeltamotion("iw9_mp_hostage_ground_idle");
        hostage namespace_19b4203b51d56488::requestid(1, 1);
        hostage namespace_19b4203b51d56488::allowuse("enemy");
        hostage.cancontestclaim = 0;
        hostage.stalemate = 0;
        hostage.wasstalemate = 1;
        hostage.var_c5c106d22c19bc92 = 0;
        hostage.usetime = 0;
        hostage.userate = 1;
        hostage.id = "care_package";
        hostage.exclusiveuse = 0;
        hostage.skiptouching = 1;
        hostage.skipminimapids = 1;
        hostage.curorigin = hostage.body.origin;
        hostage.offset3d = (0, 0, 30);
        if (istrue(level.var_826175089e4669d6)) {
            head sethintstring("MP/HOLD_TO_ESCORT_HOSTAGE");
            head setusepriority(-1 - 1 - 1 - 1);
        } else {
            hostage.trigger sethintstring("MP/HOLD_TO_ESCORT_HOSTAGE");
            hostage.trigger setusepriority(-1 - 1 - 1 - 1);
        }
        hostage namespace_19b4203b51d56488::setusetime(0);
        hostage namespace_19b4203b51d56488::setwaitweaponchangeonuse(0);
        hostage.allowweapons = 1;
        hostage.onpickup = &function_dc87fdd9e74e945e;
        hostage.ondrop = &function_13db2131b3f0851f;
        hostage.onreset = &function_3cac51c950d63e5d;
        hostage.pickupchecks = [0:&function_6201c84e805ab787, 1:&function_a4beda038141b8f8, 2:&function_fda15d11f6baf729, 3:&function_5c8cf2eee42128c8, 4:&function_ed073d24cd8ed3c5];
        hostage.onpickupfailed = &function_23456bcbf6dd329f;
        hostage.var_4bcc694316c44d94 = &function_5c749561016bc2b2;
        hostage.carryobjectasset = "hostage_rescue";
        if (getdvarint(@"hash_c44109000ed1922d") != 0) {
            hostage namespace_19b4203b51d56488::function_316d9da870e12a03([0:visuals[0], 1:hostage.head], undefined, undefined, 32, 180, undefined, 0);
        }
        if (isdefined(trigger.objectivekey)) {
            hostage.objectivekey = trigger.objectivekey;
        } else {
            hostage.objectivekey = trigger.script_label;
        }
        hostage namespace_19b4203b51d56488::setvisibleteam("none");
        hostage.var_ea5e94e328a4b626.pickupchecks[hostage.var_ea5e94e328a4b626.pickupchecks.size] = &function_adcec6d9047e4e62;
        hostage.objidpingfriendly = 0;
        hostage.objidpingenemy = 0;
        hostage.objpingdelay = 0.05;
        var_220be32c83520117 = namespace_5a22b6f3a56f7e9b::requestobjectiveid(99);
        hostage.var_81121fb99d0a00b = var_220be32c83520117;
        namespace_5a22b6f3a56f7e9b::objective_add_objective(var_220be32c83520117, "done", hostage.origin);
        namespace_5a22b6f3a56f7e9b::objective_set_play_intro(var_220be32c83520117, 0);
        namespace_5a22b6f3a56f7e9b::objective_set_play_outro(var_220be32c83520117, 0);
        hostage namespace_19b4203b51d56488::setvisibleteam("none", var_220be32c83520117);
        objective_setownerteam(var_220be32c83520117, game["defenders"]);
        hostage.objidpingfriendly = 0;
        hostage.objidpingenemy = 0;
        hostage.objpingdelay = 0.05;
        var_220be32c83520117 = namespace_5a22b6f3a56f7e9b::requestobjectiveid(99);
        hostage.var_bd657a84755765de = var_220be32c83520117;
        namespace_5a22b6f3a56f7e9b::objective_add_objective(var_220be32c83520117, "done", hostage.origin);
        namespace_5a22b6f3a56f7e9b::objective_set_play_intro(var_220be32c83520117, 0);
        namespace_5a22b6f3a56f7e9b::objective_set_play_outro(var_220be32c83520117, 0);
        hostage namespace_19b4203b51d56488::setvisibleteam("none", var_220be32c83520117);
        objective_setownerteam(var_220be32c83520117, game["attackers"]);
        hostage thread function_a5b7c34a5c2d56d2();
        if (!isdefined(level.hostages)) {
            level.hostages = [];
        }
        level.hostages[hostage.objidnum] = hostage;
        if (level.var_91f947790df03886) {
            function_7d3dbbb99ee466e0(trigger, hostage);
        }
        var_3800a132040816d1++;
    }
    /#
        if (getdvarint(@"hash_7c946185726fb8b", 1)) {
            level thread function_eed7800933a86a6d();
        }
    #/
}

// Namespace rescue/namespace_6d8fa3f81f071973
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3852
// Size: 0x21
function private function_adcec6d9047e4e62(player) {
    if (!isdefined(player)) {
        return 0;
    }
    if (namespace_d9c77dc2a6fe29c6::isoob(player)) {
        return 0;
    }
    return 1;
}

// Namespace rescue/namespace_6d8fa3f81f071973
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x387b
// Size: 0xbf
function function_5c749561016bc2b2(hostage) {
    if (getgametype() == "wm") {
        var_77321297431091c3 = "waypoint_defend";
        var_795e12b8535425d0 = "waypoint_capture";
    } else {
        var_77321297431091c3 = "waypoint_defend" + hostage.objectivekey;
        var_795e12b8535425d0 = "waypoint_capture" + hostage.objectivekey;
    }
    hostage namespace_19b4203b51d56488::setobjectivestatusicons(var_77321297431091c3, var_795e12b8535425d0);
    hostage namespace_19b4203b51d56488::setvisibleteam("any");
    objective_state(hostage.var_81121fb99d0a00b, "current");
    hostage namespace_19b4203b51d56488::updatecompassicon("enemy", hostage.var_81121fb99d0a00b);
    objective_icon(hostage.var_81121fb99d0a00b, "icon_waypoint_hostage");
}

// Namespace rescue/namespace_6d8fa3f81f071973
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3941
// Size: 0x29c
function function_e94cf520d98ce0e1() {
    level endon("game_ended");
    if (!namespace_4b0406965e556711::gameflag("prematch_done")) {
        level waittill_any_2("prematch_done", "start_mode_setup");
    }
    if (game["switchedsides"]) {
        setomnvar("ui_rescue_swapped_sides", 1);
    } else {
        setomnvar("ui_rescue_swapped_sides", 0);
    }
    foreach (hostage in level.hostages) {
        function_5c749561016bc2b2(hostage);
        hostage namespace_5a22b6f3a56f7e9b::objective_set_play_intro(hostage.objidnum, 0);
        hostage namespace_5a22b6f3a56f7e9b::objective_set_play_outro(hostage.objidnum, 0);
        hostage namespace_5a22b6f3a56f7e9b::objective_set_pulsate(hostage.objidnum, 1);
    }
    if (level.var_385bb8fdab525e2b) {
        foreach (extract in level.var_f57a27b32e66a765) {
            extract namespace_19b4203b51d56488::allowuse("none");
            extract namespace_19b4203b51d56488::setvisibleteam("enemy");
            extract namespace_19b4203b51d56488::setobjectivestatusicons(level.iconextract, level.icondefendextract);
            extract namespace_5a22b6f3a56f7e9b::objective_set_play_intro(extract.objidnum, 0);
            extract namespace_5a22b6f3a56f7e9b::objective_set_play_outro(extract.objidnum, 0);
            extract namespace_5a22b6f3a56f7e9b::objective_set_pulsate(extract.objidnum, 1);
        }
    }
    waittime = ter_op(isdefined(level.prematchperiodend), level.prematchperiodend, 10);
    wait(waittime);
    foreach (hostage in level.hostages) {
        hostage namespace_5a22b6f3a56f7e9b::objective_set_pulsate(hostage.objidnum, 0);
    }
    if (level.var_385bb8fdab525e2b) {
        foreach (extract in level.var_f57a27b32e66a765) {
            extract namespace_5a22b6f3a56f7e9b::objective_set_pulsate(extract.objidnum, 0);
        }
    }
}

// Namespace rescue/namespace_6d8fa3f81f071973
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3be4
// Size: 0x1df
function function_47c4dd8e0c76b446() {
    switch (level.mapname) {
    case #"hash_766ae2ad3c19d974":
        var_f57a35b32e66c62f = spawnstruct();
        var_f57a36b32e66c862 = spawnstruct();
        var_f57a35b32e66c62f.origin = (-10275, 12623, 523);
        var_f57a36b32e66c862.origin = (-6126, 12958, 482);
        return [0:var_f57a35b32e66c62f, 1:var_f57a36b32e66c862];
    case #"hash_63d9283f04bd6309":
        var_f57a35b32e66c62f = spawnstruct();
        var_f57a35b32e66c62f.origin = (-402, 114, 0);
        return [0:var_f57a35b32e66c62f];
    case #"hash_3e552e81b4a21fff":
    case #"hash_3e6dceebd27fedec":
    case #"hash_5586b38644ed9b26":
    case #"hash_6210b3e419ba7028":
    case #"hash_62644ed2dea5cf54":
    case #"hash_7709127773d7af61":
    case #"hash_7e7b98f5c7f2b9a0":
    case #"hash_a11e6e81ea219453":
    case #"hash_a9b94844236a7fd8":
    case #"hash_c8b70146f0c8a9cd":
    case #"hash_d707e2cfc340c376":
    case #"hash_decd2e8ff1f996d7":
    case #"hash_ec2ebc1298ef7373":
        if (isdefined(level.var_d27f667e6320d465)) {
            var_4293650f0c1037d2 = getstruct(level.var_d27f667e6320d465.var_4cb3562e52dd45b8, "script_noteworthy");
        } else {
            var_4293650f0c1037d2 = getstruct("hr_extraction_zone", "script_noteworthy");
        }
        if (isdefined(var_4293650f0c1037d2)) {
            var_f57a35b32e66c62f = spawnstruct();
            var_f57a35b32e66c62f.origin = drop_to_ground(var_4293650f0c1037d2.origin, 10, -20);
            return [0:var_f57a35b32e66c62f];
        }
        break;
    default:
        break;
    }
    return undefined;
}

// Namespace rescue/namespace_6d8fa3f81f071973
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3dcb
// Size: 0xc6
function function_7d7b80b0dab99ae0(mapname) {
    switch (mapname) {
    case #"hash_7783d431a1b0c821":
        extract = spawnstruct();
        extract.origin = (-1178, 3116, 4);
        return [0:extract];
    case #"hash_1373c0a36e3cab54":
        extract = spawnstruct();
        extract.origin = (26840, -30893, 3124);
        return [0:extract];
    case #"hash_dfa04d97b4cc9b44":
        extract = spawnstruct();
        extract.origin = (-6708, 42009, 209);
        return [0:extract];
    default:
        return undefined;
        break;
    }
    return undefined;
}

// Namespace rescue/namespace_6d8fa3f81f071973
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3e99
// Size: 0x371
function function_b924ba876ae5b152() {
    triggers = undefined;
    if (getdvarint(@"hash_9f5fa1a2bee6620e", 1)) {
        triggers = function_7d7b80b0dab99ae0(level.mapname);
    }
    if (getdvarint(@"hash_f41985dc2241f4a", 1) && !isdefined(triggers)) {
        triggers = function_47c4dd8e0c76b446();
    }
    if (!isdefined(triggers)) {
        triggers = getentarray("hostage_extract", "targetname");
    }
    var_dec7f03ee8e5150 = [0:"_a", 1:"_b", 2:"_c"];
    objectivecount = 0;
    foreach (trigger in triggers) {
        var_c8a41ae10dd3b1d2 = game["defenders"];
        visuals[0] = spawn("script_model", trigger.origin);
        exfilgoaltrigger = spawn("trigger_radius", trigger.origin, 0, 120, 60);
        droppoint = exfilgoaltrigger.origin;
        contentoverride = namespace_2a184fc4902783dc::create_contents(0, 1, 1, 0, 0, 1, 1);
        ignoreents = [];
        trace = namespace_2a184fc4902783dc::ray_trace(visuals[0].origin + (0, 0, 20), visuals[0].origin - (0, 0, 4000), ignoreents, contentoverride, 0);
        if (isplayer(trace["entity"])) {
            trace["entity"] = undefined;
        }
        var_2b5a1e993bb88c21 = undefined;
        if (isdefined(trace)) {
            droporigin = trace["position"];
            if (isdefined(self.visualgroundoffset)) {
                droporigin = droporigin + self.visualgroundoffset;
            }
            var_2b5a1e993bb88c21 = spawnscriptable("rescue_extract", droporigin);
            upangles = vectortoangles(trace["normal"]);
            baseeffectforward = anglestoforward(upangles);
            var_2b5a1e993bb88c21.angles = generateaxisanglesfromforwardvector(baseeffectforward, var_2b5a1e993bb88c21.angles);
        }
        exfilgoaltrigger.objectivekey = var_dec7f03ee8e5150[objectivecount];
        level.flagModelHidden = 1;
        extractzone = namespace_98b55913d2326ac8::setupobjective(exfilgoaltrigger, var_c8a41ae10dd3b1d2, 1, 1, 1);
        extractzone namespace_19b4203b51d56488::requestid(1, 1);
        extractzone namespace_19b4203b51d56488::setownerteam(game["defenders"]);
        extractzone namespace_19b4203b51d56488::allowuse("none");
        extractzone.pinobj = 0;
        extractzone.onuse = &extractzone_onuse;
        extractzone.onbeginuse = &extractzone_onusebegin;
        extractzone.usecondition = &function_76ba7e56087a12fd;
        extractzone.var_f56edb5df74ae868 = &function_846b74ec142bdc18;
        if (isdefined(var_2b5a1e993bb88c21)) {
            extractzone.var_2b5a1e993bb88c21 = var_2b5a1e993bb88c21;
        }
        if (!isdefined(level.var_f57a27b32e66a765)) {
            level.var_f57a27b32e66a765 = [];
        }
        level.var_f57a27b32e66a765[level.var_f57a27b32e66a765.size] = extractzone;
        objectivecount++;
        if (objectivecount >= level.var_681eabe436c0029d) {
            break;
        }
    }
}

// Namespace rescue/namespace_6d8fa3f81f071973
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4211
// Size: 0xd8
function function_7d3dbbb99ee466e0(trigger, hostage) {
    var_7ef5d520c8f71475 = spawn("trigger_radius", trigger.origin, 0, 120, 80);
    var_81d9ef9289a3921 = namespace_19b4203b51d56488::createuseobject(game["defenders"], var_7ef5d520c8f71475, [], undefined, undefined, 1);
    var_81d9ef9289a3921.onuse = &function_ccf456cd84b96382;
    var_81d9ef9289a3921.usetime = 0;
    var_81d9ef9289a3921 namespace_19b4203b51d56488::requestid(1, 1);
    var_81d9ef9289a3921 namespace_19b4203b51d56488::setownerteam(game["defenders"]);
    var_81d9ef9289a3921 namespace_19b4203b51d56488::allowuse("none");
    var_81d9ef9289a3921 namespace_19b4203b51d56488::setvisibleteam("none");
    if (!isdefined(level.var_735deff44b2c0f56)) {
        level.var_735deff44b2c0f56 = [];
    }
    level.var_735deff44b2c0f56[hostage.objidnum] = var_81d9ef9289a3921;
}

// Namespace rescue/namespace_6d8fa3f81f071973
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x42f0
// Size: 0x243
function function_8c59ada73fb15ed7(player, var_cfe3c08991268e70) {
    self notify("head_icon_watch");
    self endon("head_icon_watch");
    self endon("hostage_extracted");
    self endon("dropped");
    player endon("death");
    var_d8cb6d243b0c5af4 = 0;
    var_b6b08a6a6f96b5c4 = getdvarfloat(@"hash_4a679c3fea6cccf", 4);
    if (!isalive(player) || isinlaststand(player) || !istrue(player.var_5b3c77e2eafab370)) {
        return;
    }
    self.offset3d = (0, 0, 0);
    self.origin = self.curorigin;
    trackedobject = namespace_19b4203b51d56488::createtrackedobject(player, (0, 0, 100));
    namespace_5a22b6f3a56f7e9b::objective_set_play_intro(trackedobject.objidnum, 0);
    namespace_5a22b6f3a56f7e9b::objective_set_play_outro(trackedobject.objidnum, 0);
    trackedobject.objidpingfriendly = 1;
    trackedobject.objidpingenemy = 0;
    trackedobject.objpingdelay = var_b6b08a6a6f96b5c4;
    trackedobject namespace_19b4203b51d56488::setobjectivestatusicons(level.var_e8891f63e5a412c2);
    trackedobject namespace_19b4203b51d56488::setvisibleteam("friendly");
    self.trackedobject = trackedobject;
    if (level.showenemycarrier) {
        trackedobject.pingobjidnum = namespace_5a22b6f3a56f7e9b::requestobjectiveid(99);
        namespace_5a22b6f3a56f7e9b::objective_add_objective(trackedobject.pingobjidnum, "current", player.origin);
        namespace_5a22b6f3a56f7e9b::objective_set_play_intro(trackedobject.pingobjidnum, 0);
        namespace_5a22b6f3a56f7e9b::objective_set_play_outro(trackedobject.pingobjidnum, 0);
        objective_setownerteam(trackedobject.pingobjidnum, player.team);
        trackedobject namespace_19b4203b51d56488::updatecompassicon("enemy", trackedobject.pingobjidnum);
        objective_icon(trackedobject.pingobjidnum, level.waypointshader["rescue_kill_carrier"]);
        namespace_5a22b6f3a56f7e9b::update_objective_setenemylabel(trackedobject.pingobjidnum, level.waypointstring["rescue_kill_carrier"]);
        objective_state(trackedobject.pingobjidnum, "current");
    }
    thread function_da3da0004950e970(trackedobject, 2);
}

// Namespace rescue/namespace_6d8fa3f81f071973
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x453a
// Size: 0x13b
function function_8277f49f79bff530(animname, spawnpos, var_b7850001037aa074) {
    self.animname = animname;
    if (!isdefined(spawnpos)) {
        spawnpos = (0, 0, 0);
    }
    if (!isdefined(var_b7850001037aa074)) {
        var_b7850001037aa074 = (0, 0, 0);
    }
    if (isplayer(self)) {
        self function_b88c89bb7cd1ab8e(spawnpos);
    }
    var_e3bda5be1db297f = spawn("script_arms", spawnpos, 0, 0, self);
    var_e3bda5be1db297f.angles = var_b7850001037aa074;
    var_e3bda5be1db297f.player = self;
    self.var_e3bda5be1db297f = var_e3bda5be1db297f;
    self.var_e3bda5be1db297f.animname = animname;
    self.var_e3bda5be1db297f useanimtree(%script_model);
    self.var_e3bda5be1db297f.updatedversion = 1;
    self playerlinktoabsolute(self.var_e3bda5be1db297f, "tag_player");
    self notify("rig_created");
    waittill_any_2("remove_rig", "player_free_spot");
    if (istrue(level.gameended)) {
        return;
    }
    if (isdefined(self)) {
        self unlink();
        function_5471a04faad16a00();
        thread namespace_df5cfdbe6e2d3812::function_9897d143c3feee05();
    }
    if (isdefined(var_e3bda5be1db297f)) {
        var_e3bda5be1db297f delete();
    }
}

// Namespace rescue/namespace_6d8fa3f81f071973
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x467c
// Size: 0x14a
function function_a3a4a2cdca554483(animname, spawnpos, var_b7850001037aa074) {
    self.animname = animname;
    if (!isdefined(spawnpos)) {
        spawnpos = (0, 0, 0);
    }
    if (!isdefined(var_b7850001037aa074)) {
        var_b7850001037aa074 = (0, 0, 0);
    }
    if (isplayer(self)) {
        self function_b88c89bb7cd1ab8e(spawnpos);
    }
    var_54d7b76a2a71e284 = spawn("script_arms", spawnpos, 0, 0, self);
    var_54d7b76a2a71e284.angles = var_b7850001037aa074;
    var_54d7b76a2a71e284.player = self;
    self.var_54d7b76a2a71e284 = var_54d7b76a2a71e284;
    self.var_54d7b76a2a71e284.animname = animname;
    self.var_54d7b76a2a71e284 useanimtree(%script_model);
    self.var_54d7b76a2a71e284.updatedversion = 1;
    self playerlinktoblend(self.var_54d7b76a2a71e284, "tag_player", 0.5, 0, 0.25);
    self notify("rig_created");
    waittill_any_2("remove_rig", "player_free_spot");
    if (istrue(level.gameended)) {
        return;
    }
    if (isdefined(self)) {
        self unlink();
        function_5471a04faad16a00();
        thread namespace_df5cfdbe6e2d3812::function_9897d143c3feee05();
    }
    if (isdefined(var_54d7b76a2a71e284)) {
        var_54d7b76a2a71e284 delete();
    }
}

// Namespace rescue/namespace_6d8fa3f81f071973
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x47cd
// Size: 0x140
function function_8f65ac94aafe5d3e(animname, spawnpos, var_b7850001037aa074) {
    self.animname = animname;
    if (!isdefined(spawnpos)) {
        spawnpos = (0, 0, 0);
    }
    if (!isdefined(var_b7850001037aa074)) {
        var_b7850001037aa074 = (0, 0, 0);
    }
    var_fc77a3ee1c3e72b5 = spawn("script_model", spawnpos);
    var_fc77a3ee1c3e72b5.angles = var_b7850001037aa074;
    var_fc77a3ee1c3e72b5 setmodel("body_civ_me_male_1_1");
    self.var_fc77a3ee1c3e72b5 = var_fc77a3ee1c3e72b5;
    self.var_fc77a3ee1c3e72b5.animname = animname;
    self.var_fc77a3ee1c3e72b5 useanimtree(%script_model);
    self.var_fc77a3ee1c3e72b5.updatedversion = 1;
    head = spawn("script_model", spawnpos);
    head setmodel("head_hostage_hood_01");
    self.var_fc77a3ee1c3e72b5.head = head;
    self notify("rig_created");
    waittill_any_2("remove_rig", "player_free_spot");
    if (istrue(level.gameended)) {
        return;
    }
    if (isdefined(head)) {
        head unlink();
        head delete();
    }
    if (isdefined(var_fc77a3ee1c3e72b5)) {
        var_fc77a3ee1c3e72b5 delete();
    }
}

// Namespace rescue/namespace_6d8fa3f81f071973
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4914
// Size: 0x7e2
function function_3b8913dc82881267(player) {
    animlength = 0;
    stance = player getstance();
    if (stance == "prone") {
        player setstance("crouch", 1, 1);
        stance = "crouch";
    }
    player.switchweapon = player getcurrentweapon();
    fists = makeweapon("iw9_gunless_mp");
    player giveweapon(fists);
    player.var_73f4b954751a8643 = fists;
    player namespace_df5cfdbe6e2d3812::domonitoredweaponswitch(fists, 1, 1);
    var_7c4e2c6a50914434 = (self.body.origin[0], self.body.origin[1], player.origin[2]);
    var_cebe2632e00d0e2d = vectornormalize(player.origin - var_7c4e2c6a50914434);
    var_82b4f01ce94ed444 = vectordot(var_cebe2632e00d0e2d, anglestoforward(self.body.angles));
    var_8288e81ce91e5c46 = vectordot(var_cebe2632e00d0e2d, anglestoright(self.body.angles));
    self.body scriptmodelclearanim();
    var_14aea8523fa938ba = (player.origin[0], player.origin[1], self.body.origin[2]);
    var_f514603feaf5c1e2 = player getmovingplatformparent();
    var_8a9148be19028afa = isdefined(var_f514603feaf5c1e2) && namespace_9abe40d2af041eb2::function_63bdc8c411a85475(var_f514603feaf5c1e2);
    if (var_8a9148be19028afa) {
        var_14aea8523fa938ba = (player.origin[0], player.origin[1], player.origin[2]);
    }
    self.body.origin = var_14aea8523fa938ba + anglestoforward(player.angles) * 34.672;
    anime = "pickup_back_stand";
    var_cf13edffb05efcd8 = "pickup_back_stand_vm";
    if (var_82b4f01ce94ed444 >= 0.707) {
        anime = "pickup_front_" + stance;
        var_cf13edffb05efcd8 = "pickup_front_" + stance + "_vm";
        var_636ec99138e1950a = vectornormalize(player.origin - self.body.origin);
        var_318eea579595b65e = namespace_9c840bb9f2ecbf00::vectortoanglessafe(var_636ec99138e1950a, anglestoup(self.body.angles));
        self.body.angles = var_318eea579595b65e;
    } else if (var_82b4f01ce94ed444 <= -0.707) {
        anime = "pickup_back_" + stance;
        var_cf13edffb05efcd8 = "pickup_back_" + stance + "_vm";
        var_81554c014ce7839c = vectornormalize(self.body.origin - player.origin);
        var_318eea579595b65e = namespace_9c840bb9f2ecbf00::vectortoanglessafe(var_81554c014ce7839c, anglestoup(self.body.angles));
        self.body.angles = var_318eea579595b65e;
    } else if (var_8288e81ce91e5c46 >= 0.707) {
        anime = "pickup_right_" + stance;
        var_cf13edffb05efcd8 = "pickup_right_" + stance + "_vm";
        var_81554c014ce7839c = vectorcross(vectornormalize(self.body.origin - player.origin), anglestoup(self.body.angles));
        var_318eea579595b65e = namespace_9c840bb9f2ecbf00::vectortoanglessafe(var_81554c014ce7839c, anglestoup(self.body.angles));
        self.body.angles = var_318eea579595b65e;
    } else if (var_8288e81ce91e5c46 <= -0.707) {
        anime = "pickup_left_" + stance;
        var_cf13edffb05efcd8 = "pickup_left_" + stance + "_vm";
        var_636ec99138e1950a = vectorcross(vectornormalize(player.origin - self.body.origin), anglestoup(self.body.angles));
        var_318eea579595b65e = namespace_9c840bb9f2ecbf00::vectortoanglessafe(var_636ec99138e1950a, anglestoup(self.body.angles));
        self.body.angles = var_318eea579595b65e;
    }
    player thread function_8277f49f79bff530("player_pickup_hostage", player.origin, player.angles);
    player.var_e3bda5be1db297f hide();
    player thread function_a3a4a2cdca554483("player_pickup_hostage", player.origin, player.angles);
    if (player GetCameraThirdPerson()) {
        player.var_54d7b76a2a71e284 hide();
    } else {
        player.var_54d7b76a2a71e284 showonlytoplayer(player);
    }
    thread function_8f65ac94aafe5d3e("hostage_pickup", self.body.origin, self.body.angles);
    self.var_fc77a3ee1c3e72b5 hide();
    self.var_fc77a3ee1c3e72b5 showonlytoplayer(player);
    if (isdefined(self.var_fc77a3ee1c3e72b5.head)) {
        self.var_fc77a3ee1c3e72b5.head hide();
        self.var_fc77a3ee1c3e72b5.head showonlytoplayer(player);
        self.var_fc77a3ee1c3e72b5.head linkto(self.var_fc77a3ee1c3e72b5, "j_neck", (-9, 1, 0), (0, 0, 0));
    }
    self.body.animname = "hostage_pickup";
    self.body useanimtree(level.scr_animtree["hostage_pickup"]);
    self.body.hasanimtree = 1;
    self.body hidefromplayer(player);
    self.head hidefromplayer(player);
    animstruct = spawnstruct();
    animstruct.origin = player.origin;
    animstruct.angles = player.angles;
    if (var_8a9148be19028afa) {
        self.var_fc77a3ee1c3e72b5 linkto(var_f514603feaf5c1e2);
        player.var_54d7b76a2a71e284 linkto(var_f514603feaf5c1e2);
        player playerlinkedoffsetenable();
    }
    animstruct thread namespace_4e680905778c0f0f::anim_player_solo(player, player.var_e3bda5be1db297f, anime);
    animstruct thread namespace_bc4a4b9456315863::anim_single_solo(player.var_54d7b76a2a71e284, var_cf13edffb05efcd8);
    self.body thread namespace_bc4a4b9456315863::anim_single_solo(self.body, anime);
    self.var_fc77a3ee1c3e72b5 thread namespace_bc4a4b9456315863::anim_single_solo(self.var_fc77a3ee1c3e72b5, var_cf13edffb05efcd8);
    wait(getanimlength(level.scr_anim["player_pickup_hostage"][var_cf13edffb05efcd8]));
    if (var_8a9148be19028afa) {
        self.var_fc77a3ee1c3e72b5 unlink();
        player.var_54d7b76a2a71e284 unlink();
        player playerlinkedoffsetdisable();
    }
    player notify("remove_rig");
    self notify("remove_rig");
    self.body stopuseanimtree();
    self.body.hasanimtree = undefined;
    player.var_73f4b954751a8643 = undefined;
    player takeweapon(fists);
}

// Namespace rescue/namespace_6d8fa3f81f071973
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x50fd
// Size: 0x35
function function_dc87fdd9e74e945e(player, var_5760e0f038d1baa3, defused) {
    player.var_c47eba4c148afa86 = 1;
    thread function_d2ee5ef1475dc79b(player, var_5760e0f038d1baa3, defused);
}

// Namespace rescue/namespace_6d8fa3f81f071973
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5139
// Size: 0x7d9
function function_d2ee5ef1475dc79b(player, var_5760e0f038d1baa3, defused) {
    self notify("hostage_pickup");
    player endon("death_or_disconnect");
    level endon("game_ended");
    self endon("death");
    self endon("hostage_pickup");
    player.var_5b3c77e2eafab370 = 1;
    self.carrier = player;
    player setclientomnvar("ui_rescue_carrying_hostage", 1);
    if (!isdefined(level.var_7fcc5417218ad4c8)) {
        level.var_7fcc5417218ad4c8 = [];
    }
    if (level.var_7fcc5417218ad4c8.size == 0) {
        foreach (person in level.players) {
            if (person.team == player.team) {
                person setclientomnvar("ui_rescue_hostage_active", 1);
            } else {
                person setclientomnvar("ui_rescue_hostage_active", 2);
            }
        }
    }
    level.var_7fcc5417218ad4c8[self.objidnum] = self;
    self.body show();
    self.head show();
    player val::function_c9d0b43701bdba00("carry");
    player val::set("carry", "equipment_secondary", 0);
    player val::set("carry", "equipment_primary", 0);
    player val::set("carry", "supers", 0);
    player val::set("carry", "killstreaks", 0);
    player val::set("carry", "melee", 0);
    player val::set("carry", "prone", 0);
    player val::set("carry", "slide", 0);
    player val::set("carry", "supersprint", 0);
    player val::set("carry", "mount_side", 0);
    player val::set("carry", "mount_top", 0);
    player val::set("carry", "mantle", 0);
    player val::set("carry", "swimming_underwater", 0);
    player val::set("carry", "dtp", 0);
    player val::set("carry", "ladder", 0);
    player val::set("carry", "weapon_pickup", 0);
    player val::set("carry", "weapon_switch", 0);
    player val::set("carry", "weapon_switch_clip", 0);
    player val::set("carry", "execution_victim", 0);
    player val::set("carry", "ads", 1);
    self.var_44206360497f15c2 = 1;
    function_3b8913dc82881267(player);
    self.var_44206360497f15c2 = undefined;
    foreach (hostage in level.hostages) {
        if (hostage.objectivekey != self.objectivekey) {
            hostage.trigger disableplayeruse(player);
        }
    }
    self.body scriptmodelclearanim();
    self.body hide();
    self.head hide();
    function_83dfc273b8e7efed(player);
    player setcarryobject(self.carryobjectasset);
    team = player.pers["team"];
    namespace_19b4203b51d56488::allowuse("none");
    namespace_19b4203b51d56488::setvisibleteam("none");
    namespace_19b4203b51d56488::setvisibleteam("none", self.var_81121fb99d0a00b);
    namespace_19b4203b51d56488::setownerteam(player.team);
    var_cfe3c08991268e70 = getdvarint(@"hash_4cb6c41a033baba9", 0);
    thread function_8c59ada73fb15ed7(player, var_cfe3c08991268e70);
    if (isdefined(level.revivetriggers)) {
        foreach (revivetrigger in level.revivetriggers) {
            revivetrigger disablescriptableplayeruse(player);
        }
    }
    if (!player namespace_a2f809133c566621::isjuggernaut()) {
        player.playerstreakspeedscale = -0.15;
        player setmovespeedscale(0.85);
    }
    thread function_7bc240fc69ea5205(player);
    thread namespace_52f6938dd902c7d0::function_7b2653a588f28e29(player, "rescue_player_hostage", "rescue_team_hostage", "rescue_took_hostage");
    if (team == game["defenders"] && level.var_91f947790df03886) {
        level.var_8f21d2090cbc3b2a = 0;
        foreach (extract in level.var_f57a27b32e66a765) {
            if (isdefined(extract.var_53d907bf6d19394e) && isdefined(extract.var_53d907bf6d19394e[self.objidnum])) {
                extract.var_53d907bf6d19394e[self.objidnum] = undefined;
                extract.numtouching[game["attackers"]]--;
                if (extract.var_53d907bf6d19394e.size <= 0) {
                    extract namespace_19b4203b51d56488::allowuse("none");
                    extract namespace_19b4203b51d56488::setvisibleteam("none");
                }
                break;
            }
        }
        level.var_735deff44b2c0f56[self.objidnum] namespace_5a22b6f3a56f7e9b::objective_set_play_intro(level.var_735deff44b2c0f56[self.objidnum].objidnum, 0);
        level.var_735deff44b2c0f56[self.objidnum] namespace_5a22b6f3a56f7e9b::objective_set_play_outro(level.var_735deff44b2c0f56[self.objidnum].objidnum, 0);
        level.var_735deff44b2c0f56[self.objidnum] namespace_19b4203b51d56488::setvisibleteam("friendly");
        level.var_735deff44b2c0f56[self.objidnum] namespace_19b4203b51d56488::allowuse("friendly");
        level.var_735deff44b2c0f56[self.objidnum] namespace_19b4203b51d56488::setobjectivestatusicons(level.var_e8891f63e5a412c2);
        return;
    }
    foreach (extract in level.var_f57a27b32e66a765) {
        if (!istrue(level.var_7f1c1334377daad5)) {
            extract namespace_5a22b6f3a56f7e9b::objective_set_play_intro(extract.objidnum, 1);
            extract namespace_5a22b6f3a56f7e9b::objective_set_play_outro(extract.objidnum, 1);
        } else {
            extract namespace_5a22b6f3a56f7e9b::objective_set_play_intro(extract.objidnum, 0);
            extract namespace_5a22b6f3a56f7e9b::objective_set_play_outro(extract.objidnum, 0);
        }
        extract namespace_19b4203b51d56488::allowuse("friendly");
        extract namespace_19b4203b51d56488::setvisibleteam("any");
        extract namespace_19b4203b51d56488::setobjectivestatusicons(level.iconextract, level.icondefendextract);
        extract.var_2b5a1e993bb88c21 setscriptablepartstate("rescue_extract", "idle");
        thread function_da3da0004950e970(extract, 2);
    }
    level.var_7f1c1334377daad5 = 1;
    if (getdvarint(@"hash_a75075ff09347a5a", 1)) {
        thread function_6d799e269b621800(player);
    }
    player.var_c47eba4c148afa86 = undefined;
}

// Namespace rescue/namespace_6d8fa3f81f071973
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5919
// Size: 0x19
function function_23456bcbf6dd329f(player) {
    player namespace_44abc05161e2e2cb::showerrormessage("MP/DENY_CARRY_OBJECT");
}

// Namespace rescue/namespace_6d8fa3f81f071973
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5939
// Size: 0xcb
function private function_7bc240fc69ea5205(player) {
    self notify("rescue_trigger_pickup_sound");
    self endon("rescue_trigger_pickup_sound");
    self endon("dropped");
    level endon("game_ended");
    if (isdefined(player)) {
        team = player.pers["team"];
        otherteam = namespace_cd0b2d039510b38d::getotherteam(team)[0];
        printandsoundoneveryone(team, otherteam, undefined, undefined, "iw9_mp_prisoner_pickup", "iw9_mp_prisoner_taken", player);
        waittime = getdvarfloat(@"hash_9ae09c23fdc10452", 0.5);
        if (waittime > 0) {
            wait(waittime);
        }
        if (!istrue(level.gameended)) {
            if (isdefined(team)) {
                namespace_944ddf7b8df1b0e3::leaderdialog("hostage_taken_friendly", team);
            }
            if (isdefined(otherteam)) {
                namespace_944ddf7b8df1b0e3::leaderdialog("hostage_taken_enemy", otherteam);
            }
        }
    }
}

// Namespace rescue/namespace_6d8fa3f81f071973
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5a0b
// Size: 0x1d6
function function_6d799e269b621800(var_bfac34a0d9424099) {
    var_bfac34a0d9424099 endon("death_or_disconnect");
    level endon("game_ended");
    self endon("death");
    self endon("hostage_pickup");
    self endon("hostage_extracted");
    var_7ebe382bcacfe466 = getdvarint(@"hash_8c20d20855246445", 2);
    var_460d919302cea625 = getdvarint(@"hash_397db1642965b6ef", 0);
    var_5621f114739b01b9 = getdvarint(@"hash_85dfe5454ef66256", 1);
    if (var_460d919302cea625) {
        foreach (player in level.players) {
            if (player.pers["team"] == var_bfac34a0d9424099.team) {
                player.radarshowenemydirection = 1;
            }
        }
    }
    while (var_7ebe382bcacfe466 > 0 || var_5621f114739b01b9) {
        if (getdvarint(@"hash_f45c0a46b4a12087", 1)) {
            triggerportableradarpingteam(var_bfac34a0d9424099.origin, var_bfac34a0d9424099.team, 1000);
        } else {
            triggerportableradarping(var_bfac34a0d9424099.origin, var_bfac34a0d9424099, 1000);
        }
        var_7ebe382bcacfe466--;
        wait(2);
    }
    if (var_460d919302cea625) {
        foreach (player in level.players) {
            if (player.pers["team"] == var_bfac34a0d9424099.team) {
                player.radarshowenemydirection = 0;
            }
        }
    }
}

// Namespace rescue/namespace_6d8fa3f81f071973
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5be8
// Size: 0x10d
function function_83dfc273b8e7efed(player) {
    var_849c1df4114e0a37 = player getweaponslistprimaries();
    pistol = undefined;
    foreach (weap in var_849c1df4114e0a37) {
        if (namespace_68e641469fde3fa7::getweapongroup(weap) == "weapon_pistol" && !namespace_68e641469fde3fa7::isakimbo(weap)) {
            pistol = weap;
            break;
        }
    }
    if (isdefined(pistol)) {
        player namespace_df5cfdbe6e2d3812::domonitoredweaponswitch(pistol, undefined, 1);
        player.switchweapon = pistol;
    } else {
        if (!player hasweapon("iw9_me_fists_mp")) {
            var_1199fe671d6a5653 = makeweapon("iw9_me_fists_mp");
            player giveweapon(var_1199fe671d6a5653);
            player.var_7ebbb0dc14346eaa = var_1199fe671d6a5653;
        } else {
            var_1199fe671d6a5653 = "iw9_me_fists_mp";
        }
        player namespace_df5cfdbe6e2d3812::domonitoredweaponswitch(var_1199fe671d6a5653, undefined, 1);
        namespace_e0ee43ef2dddadaa::fixupplayerweapons(player, var_1199fe671d6a5653);
    }
}

// Namespace rescue/namespace_6d8fa3f81f071973
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5cfc
// Size: 0x101
function function_524f22fe698eeb0f(player) {
    player endon("death_or_disconnect");
    player val::set("carry", "weapon_switch", 1);
    player forceplaygestureviewmodel("iw9_ges_hostage_pickup_out", undefined, 0, undefined, 1, 1);
    player resetcarryobject();
    while (istrue(player.var_12bfb031c0a0efd8)) {
        waitframe();
    }
    gunless = makeweapon("iw9_gunless_mp");
    player giveweapon(gunless);
    player namespace_df5cfdbe6e2d3812::domonitoredweaponswitch(gunless, undefined, 1);
    if (isdefined(player.var_7ebbb0dc14346eaa)) {
        player takeweapon(player.var_7ebbb0dc14346eaa);
        player.var_7ebbb0dc14346eaa = undefined;
        player namespace_df5cfdbe6e2d3812::domonitoredweaponswitch(player.switchweapon);
    } else {
        player namespace_df5cfdbe6e2d3812::domonitoredweaponswitch(player.switchweapon);
    }
    if (isdefined(player.switchweapon)) {
        player.switchweapon = undefined;
    }
    player namespace_1cd9f6896754adb0::function_c9d0b43701bdba00("carry");
    player takeweapon(gunless);
}

// Namespace rescue/namespace_6d8fa3f81f071973
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5e04
// Size: 0x3b
function function_13db2131b3f0851f(player, var_20034b7333f48b8c, var_c3018adeacdd826) {
    player.var_c47eba4c148afa86 = undefined;
    thread function_3d86750123dc1f90(player, var_20034b7333f48b8c, istrue(self.var_c3018adeacdd826));
}

// Namespace rescue/namespace_6d8fa3f81f071973
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5e46
// Size: 0x7d7
function function_3d86750123dc1f90(player, var_20034b7333f48b8c, var_c3018adeacdd826) {
    self notify("prompt_cleanup");
    player notify("remove_rig");
    self notify("remove_rig");
    self notify("hostage_pickup");
    self endon("death");
    self endon("hostage_extracted");
    level endon("game_ended");
    if (isdefined(player) && !player namespace_a2f809133c566621::isjuggernaut()) {
        player.playerstreakspeedscale = 0;
        player setmovespeedscale(1);
    }
    if (!istrue(var_c3018adeacdd826) && !istrue(var_20034b7333f48b8c)) {
        namespace_944ddf7b8df1b0e3::leaderdialog("dropped_hostage_defend", game["attackers"]);
        namespace_944ddf7b8df1b0e3::leaderdialog("dropped_hostage_retrieve", game["defenders"]);
    }
    namespace_19b4203b51d56488::setownerteam(game["attackers"]);
    namespace_19b4203b51d56488::allowuse("none");
    namespace_19b4203b51d56488::setvisibleteam("none");
    namespace_19b4203b51d56488::setvisibleteam("none", self.var_81121fb99d0a00b);
    if (isdefined(self.trackedobject)) {
        if (isdefined(self.trackedobject.pingobjidnum)) {
            namespace_5a22b6f3a56f7e9b::returnobjectiveid(self.trackedobject.pingobjidnum);
            self.trackedobject.pingobjidnum = undefined;
        }
        self.trackedobject namespace_19b4203b51d56488::deletetrackedobject();
        self.trackedobject = undefined;
    }
    if (isdefined(player)) {
        foreach (hostage in level.hostages) {
            hostage.trigger enableplayeruse(player);
        }
    }
    if (isdefined(player)) {
        if (isreallyalive(player)) {
            thread function_524f22fe698eeb0f(player);
        } else {
            player val::function_c9d0b43701bdba00("carry");
            if (isdefined(player.var_7ebbb0dc14346eaa)) {
                player takeweapon(player.var_7ebbb0dc14346eaa);
                player.var_7ebbb0dc14346eaa = undefined;
            }
            if (isdefined(player.switchweapon)) {
                player.switchweapon = undefined;
            }
            player resetcarryobject();
        }
        player.var_5b3c77e2eafab370 = undefined;
        player setclientomnvar("ui_rescue_carrying_hostage", 0);
        if (isdefined(level.revivetriggers)) {
            foreach (revivetrigger in level.revivetriggers) {
                if (isdefined(revivetrigger.ownerteam) && revivetrigger.ownerteam == player.team) {
                    revivetrigger enablescriptableplayeruse(player);
                }
            }
        }
    }
    if (isdefined(level.var_7fcc5417218ad4c8) && isdefined(level.var_7fcc5417218ad4c8[self.objidnum])) {
        level.var_7fcc5417218ad4c8[self.objidnum] = undefined;
    }
    if (isdefined(level.var_7fcc5417218ad4c8) && level.var_7fcc5417218ad4c8.size <= 0) {
        foreach (person in level.players) {
            person setclientomnvar("ui_rescue_hostage_active", 0);
        }
        foreach (extract in level.var_f57a27b32e66a765) {
            extract namespace_19b4203b51d56488::allowuse("none");
            if (level.var_385bb8fdab525e2b) {
                extract namespace_19b4203b51d56488::setvisibleteam("enemy");
                level thread function_da3da0004950e970(extract, 2);
            } else {
                extract namespace_19b4203b51d56488::setvisibleteam("none");
                extract.var_2b5a1e993bb88c21 setscriptablepartstate("rescue_extract", "off");
            }
        }
    }
    thread function_a5b7c34a5c2d56d2();
    if (istrue(self.var_44206360497f15c2) || !isdefined(player)) {
        self.var_44206360497f15c2 = undefined;
        self.body scriptmodelclearanim();
        namespace_19b4203b51d56488::allowuse("enemy");
        function_5c749561016bc2b2(self);
        if (isdefined(player) && isdefined(player.var_73f4b954751a8643)) {
            player takeweapon(player.var_73f4b954751a8643);
        }
        waitframe();
        if (!istrue(self.var_1d85141d8703f5d4)) {
            self.head show();
            if (istrue(self.body.hasanimtree)) {
                self.body stopuseanimtree();
                self.body.hasanimtree = undefined;
            }
            self.body scriptmodelplayanimdeltamotion("iw9_mp_hostage_ground_idle");
        }
        return;
    }
    animlength = undefined;
    if (!istrue(self.var_1d85141d8703f5d4)) {
        var_a2731e6d9af15254 = player getmovingplatformparent();
        if (isdefined(player) && namespace_9abe40d2af041eb2::function_3c5c5d86ef14420e(var_a2731e6d9af15254)) {
            self.var_90758efde9b783b7 = spawn("script_origin", self.body.origin);
            self.var_90758efde9b783b7 linkto(var_a2731e6d9af15254);
            self.body linkto(self.var_90758efde9b783b7);
            thread function_333f22ba123f0470(player);
        }
        self.body.angles = player.angles;
        self.body.origin = player.origin;
        if (istrue(level.var_826175089e4669d6)) {
            self.head linkto(self.body, "j_neck", (-9, 1, 0), (0, 0, 0));
        }
        self.head show();
        self.body scriptmodelclearanim();
        if (player getstance() == "stand") {
            if (istrue(self.body.hasanimtree)) {
                self.body stopuseanimtree();
                self.body.hasanimtree = undefined;
            }
            self.body scriptmodelplayanimdeltamotion("iw9_mp_hostage_dropped_stand");
            animlength = getanimlength(script_model%iw9_mp_hostage_dropped_stand) - 1;
        } else if (player getstance() == "crouch") {
            if (istrue(self.body.hasanimtree)) {
                self.body stopuseanimtree();
                self.body.hasanimtree = undefined;
            }
            self.body scriptmodelplayanimdeltamotion("iw9_mp_hostage_dropped_crouch");
            animlength = getanimlength(script_model%iw9_mp_hostage_dropped_crouch) - 1;
        }
    }
    if (isdefined(animlength)) {
        wait(animlength);
    }
    self.curorigin = self.body.origin;
    self.offset3d = (0, 0, 30);
    namespace_19b4203b51d56488::allowuse("enemy");
    function_5c749561016bc2b2(self);
    self.head show();
    if (istrue(self.body.hasanimtree)) {
        self.body stopuseanimtree();
        self.body.hasanimtree = undefined;
    }
    self.body scriptmodelplayanimdeltamotion("iw9_mp_hostage_ground_idle");
}

// Namespace rescue/namespace_6d8fa3f81f071973
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6624
// Size: 0x51
function function_333f22ba123f0470(player) {
    self endon("hostage_pickup");
    thread function_a29878fb7affbc16(player);
    while (1) {
        self.trigger.origin = self.var_90758efde9b783b7.origin;
        wait(0.01);
    }
}

// Namespace rescue/namespace_6d8fa3f81f071973
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x667c
// Size: 0x48
function function_a29878fb7affbc16(player) {
    level endon("disconnect");
    self waittill("hostage_pickup");
    self.var_90758efde9b783b7 unlink();
    self.body unlink();
    self.var_90758efde9b783b7 delete();
}

// Namespace rescue/namespace_6d8fa3f81f071973
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x66cb
// Size: 0x7e8
function function_4988b37643f2672f(player) {
    self notify("prompt_cleanup");
    player notify("remove_rig");
    self notify("remove_rig");
    self notify("hostage_pickup");
    isoob = undefined;
    if (isdefined(level.outofboundstriggers)) {
        foreach (trigger in level.outofboundstriggers) {
            if (istrue(self.allowedintrigger)) {
                break;
            }
            if (!self.visuals[0] istouching(trigger)) {
                continue;
            }
            self.body scriptmodelclearanim();
            isoob = 1;
            break;
        }
    }
    foreach (trigger in level.hurttriggers) {
        if (!self.visuals[0] istouching(trigger)) {
            continue;
        }
        isoob = 1;
        break;
    }
    if (isdefined(player) && !player namespace_a2f809133c566621::isjuggernaut()) {
        player.playerstreakspeedscale = 0;
        player setmovespeedscale(1);
    }
    if (istrue(isoob) && getdvarint(@"hash_6e4b1f8aaddcc6f5", 1) == 1) {
        self.head show();
        self.body show();
        neworigin = getclosestpointonnavmesh(self.visuals[0].origin);
        self.body.origin = neworigin;
        self.body.angles = (0, self.body.angles[1], 0);
        self.body scriptmodelclearanim();
        if (istrue(self.body.hasanimtree)) {
            self.body stopuseanimtree();
            self.body.hasanimtree = undefined;
        }
        self.body scriptmodelplayanimdeltamotion("iw9_mp_hostage_ground_idle");
    }
    namespace_19b4203b51d56488::setownerteam(game["attackers"]);
    namespace_19b4203b51d56488::allowuse("none");
    namespace_19b4203b51d56488::setvisibleteam("none");
    namespace_19b4203b51d56488::setvisibleteam("none", self.var_81121fb99d0a00b);
    if (isdefined(self.trackedobject)) {
        if (isdefined(self.trackedobject.pingobjidnum)) {
            namespace_5a22b6f3a56f7e9b::returnobjectiveid(self.trackedobject.pingobjidnum);
            self.trackedobject.pingobjidnum = undefined;
        }
        self.trackedobject namespace_19b4203b51d56488::deletetrackedobject();
        self.trackedobject = undefined;
    }
    if (isdefined(player)) {
        foreach (hostage in level.hostages) {
            hostage.trigger enableplayeruse(player);
        }
    }
    if (isdefined(player)) {
        if (isreallyalive(player)) {
            thread function_524f22fe698eeb0f(player);
        } else {
            player val::function_c9d0b43701bdba00("carry");
            if (isdefined(player.var_7ebbb0dc14346eaa)) {
                player takeweapon(player.var_7ebbb0dc14346eaa);
                player.var_7ebbb0dc14346eaa = undefined;
            }
            if (isdefined(player.switchweapon)) {
                player.switchweapon = undefined;
            }
            player resetcarryobject();
        }
        player.var_5b3c77e2eafab370 = undefined;
        player setclientomnvar("ui_rescue_carrying_hostage", 0);
        if (isdefined(level.revivetriggers)) {
            foreach (revivetrigger in level.revivetriggers) {
                revivetrigger enablescriptableplayeruse(player);
            }
        }
    }
    if (isdefined(level.var_7fcc5417218ad4c8) && isdefined(level.var_7fcc5417218ad4c8[self.objidnum])) {
        level.var_7fcc5417218ad4c8[self.objidnum] = undefined;
    }
    if (isdefined(level.var_7fcc5417218ad4c8) && level.var_7fcc5417218ad4c8.size <= 0) {
        foreach (person in level.players) {
            person setclientomnvar("ui_rescue_hostage_active", 0);
        }
        foreach (extract in level.var_f57a27b32e66a765) {
            extract namespace_19b4203b51d56488::allowuse("none");
            if (level.var_385bb8fdab525e2b) {
                extract namespace_19b4203b51d56488::setvisibleteam("enemy");
                level thread function_da3da0004950e970(extract, 2);
            } else {
                extract namespace_19b4203b51d56488::setvisibleteam("none");
                extract.var_2b5a1e993bb88c21 setscriptablepartstate("rescue_extract", "off");
            }
        }
    }
    thread function_a5b7c34a5c2d56d2();
    if (istrue(self.var_44206360497f15c2) || !isdefined(player)) {
        self.var_44206360497f15c2 = undefined;
        self.body scriptmodelclearanim();
        self.curorigin = self.body.origin;
        self.offset3d = (0, 0, 30);
        namespace_19b4203b51d56488::allowuse("enemy");
        function_5c749561016bc2b2(self);
        if (isdefined(player) && isdefined(player.var_73f4b954751a8643)) {
            player takeweapon(player.var_73f4b954751a8643);
        }
        waitframe();
        if (!istrue(isoob)) {
            self.head show();
            if (istrue(self.body.hasanimtree)) {
                self.body stopuseanimtree();
                self.body.hasanimtree = undefined;
            }
            self.body scriptmodelplayanimdeltamotion("iw9_mp_hostage_ground_idle");
        }
        return;
    }
    var_a2731e6d9af15254 = player getmovingplatformparent();
    if (isdefined(player) && namespace_9abe40d2af041eb2::function_3c5c5d86ef14420e(var_a2731e6d9af15254)) {
        self.var_90758efde9b783b7 = spawn("script_origin", self.body.origin);
        self.var_90758efde9b783b7 linkto(var_a2731e6d9af15254);
        self.body linkto(self.var_90758efde9b783b7);
        thread function_333f22ba123f0470(player);
    }
    self.curorigin = self.body.origin;
    self.offset3d = (0, 0, 30);
    namespace_19b4203b51d56488::allowuse("enemy");
    function_5c749561016bc2b2(self);
    if (!istrue(isoob)) {
        self.head show();
        if (istrue(self.body.hasanimtree)) {
            self.body stopuseanimtree();
            self.body.hasanimtree = undefined;
        }
        self.body scriptmodelplayanimdeltamotion("iw9_mp_hostage_ground_idle");
    }
}

// Namespace rescue/namespace_6d8fa3f81f071973
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x6eba
// Size: 0x20b
function function_c7edff9e8aebcc86(player, var_ea5e94e328a4b626) {
    offsetangle = var_ea5e94e328a4b626.var_5338ab800fa9b63a;
    var_20f30c47c5442258 = var_ea5e94e328a4b626.var_20f30c47c5442258;
    ignoreents = [];
    if (isdefined(var_ea5e94e328a4b626.ignoreents)) {
        ignoreents = var_ea5e94e328a4b626.ignoreents;
    }
    ignoreents[ignoreents.size] = player;
    trace = undefined;
    height = player geteye()[2] - player.origin[2];
    end = player.origin + (0, 0, height / 2);
    forward = anglestoforward(player getplayerangles());
    x = forward[0] * cos(offsetangle) - forward[1] * sin(offsetangle);
    y = forward[0] * sin(offsetangle) + forward[1] * cos(offsetangle);
    newforward = (x, y, 0);
    var_23596220a6c8c97d = var_20f30c47c5442258 * vectornormalize(newforward);
    height = player geteye()[2] - player.origin[2];
    start = player.origin + (0, 0, height / 2);
    end = start + var_23596220a6c8c97d;
    trace = namespace_2a184fc4902783dc::sphere_trace(start, end, height / 2 - 1, ignoreents);
    if (!isdefined(trace)) {
        return 0;
    }
    if (trace["fraction"] < 1) {
        return 0;
    }
    var_9d0d801eab27109a = namespace_2a184fc4902783dc::ray_trace(end, end - (0, 0, height), ignoreents);
    if (isdefined(var_9d0d801eab27109a["position"]) && namespace_d9c77dc2a6fe29c6::ispointinoutofbounds(var_9d0d801eab27109a["position"])) {
        return 0;
    }
    if (vectordot(var_9d0d801eab27109a["normal"], (0, 0, 1)) > 0.8) {
        return 1;
    }
    return 0;
}

// Namespace rescue/namespace_6d8fa3f81f071973
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x70cd
// Size: 0x6e
function function_3cac51c950d63e5d() {
    self.head show();
    self.body show();
    if (istrue(self.body.hasanimtree)) {
        self.body stopuseanimtree();
        self.body.hasanimtree = undefined;
    }
    self.body scriptmodelplayanimdeltamotion("iw9_mp_hostage_ground_idle");
}

// Namespace rescue/namespace_6d8fa3f81f071973
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7142
// Size: 0xed
function function_846b74ec142bdc18() {
    /#
        assert(self.claimteam != "none");
    #/
    team = self.claimteam;
    var_ade7a7f9806809fb = self.claimplayer;
    if (self.touchlist[team].size > 0) {
        players = getarraykeys(self.touchlist[team]);
        for (index = 0; index < players.size; index++) {
            touchdata = self.touchlist[team][players[index]];
            if (isdefined(touchdata.player) && isreallyalive(touchdata.player) && istrue(touchdata.player.var_5b3c77e2eafab370)) {
                return touchdata.player;
            }
        }
    }
    return var_ade7a7f9806809fb;
}

// Namespace rescue/namespace_6d8fa3f81f071973
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7237
// Size: 0x70c
function extractzone_onuse(var_22282e7d48ca3400, team) {
    if (!isdefined(var_22282e7d48ca3400) || !isreallyalive(var_22282e7d48ca3400) || !istrue(var_22282e7d48ca3400.var_5b3c77e2eafab370)) {
        return;
    }
    if (!isdefined(team)) {
        team = var_22282e7d48ca3400.team;
    }
    var_22282e7d48ca3400 notify("manual_drop_cleanup");
    hostage = var_22282e7d48ca3400.carryobject;
    hostage notify("hostage_extracted");
    hostage notify("manual_drop_cleanup");
    thread function_524f22fe698eeb0f(var_22282e7d48ca3400);
    if (isdefined(hostage.trackedobject)) {
        if (isdefined(hostage.trackedobject.pingobjidnum)) {
            namespace_5a22b6f3a56f7e9b::returnobjectiveid(hostage.trackedobject.pingobjidnum);
            hostage.trackedobject.pingobjidnum = undefined;
        }
        hostage.trackedobject namespace_19b4203b51d56488::deletetrackedobject();
        hostage.trackedobject = undefined;
    }
    hostage notify("prompt_cleanup");
    var_22282e7d48ca3400 val::function_c9d0b43701bdba00("carry");
    if (!var_22282e7d48ca3400 namespace_a2f809133c566621::isjuggernaut()) {
        var_22282e7d48ca3400.playerstreakspeedscale = 0;
        var_22282e7d48ca3400 setmovespeedscale(1);
    }
    objective_state(hostage.var_bd657a84755765de, "done");
    objective_state(hostage.var_81121fb99d0a00b, "done");
    var_22282e7d48ca3400.var_5b3c77e2eafab370 = 0;
    level.hostages[hostage.objidnum] = undefined;
    level.var_7fcc5417218ad4c8[hostage.objidnum] = undefined;
    level.var_3cf50bae86b4beae = 1;
    hostage.body delete();
    hostage.head delete();
    hostage namespace_19b4203b51d56488::deletetrackedobject();
    var_22282e7d48ca3400.carryobject = undefined;
    level.var_500370e4f476faa9 = level.var_500370e4f476faa9 + 100;
    level.var_319544f76c37154b[team] = level.var_319544f76c37154b[team] + 100;
    var_22282e7d48ca3400 setclientomnvar("ui_rescue_carrying_hostage", 0);
    if (isdefined(level.var_7fcc5417218ad4c8) && level.var_7fcc5417218ad4c8.size <= 0) {
        foreach (player in level.players) {
            player setclientomnvar("ui_rescue_hostage_active", 0);
        }
    }
    if (isdefined(level.revivetriggers)) {
        foreach (revivetrigger in level.revivetriggers) {
            if (isdefined(revivetrigger.ownerteam) && revivetrigger.ownerteam == var_22282e7d48ca3400.team) {
                revivetrigger enablescriptableplayeruse(var_22282e7d48ca3400);
            }
        }
    }
    var_1fbf6aaa31163feb = var_22282e7d48ca3400.team;
    otherteam = undefined;
    if (team == "allies") {
        otherteam = "axis";
    } else {
        otherteam = "allies";
    }
    var_7e2c53b0bcf117d9 = spawnstruct();
    var_7e2c53b0bcf117d9.player = var_22282e7d48ca3400;
    var_7e2c53b0bcf117d9.eventname = "capture";
    var_7e2c53b0bcf117d9.position = var_22282e7d48ca3400.origin;
    namespace_de6e6777b0937bd7::function_80820d6d364c1836("callback_on_game_event", var_7e2c53b0bcf117d9);
    printandsoundoneveryone(team, otherteam, undefined, undefined, "mp_prisoner_extracted_sfx", "mp_prisoner_lost_sfx", var_22282e7d48ca3400);
    var_22282e7d48ca3400 incpersstat("captures", 1);
    var_22282e7d48ca3400 namespace_2685ec368e022695::statsetchild("round", "captures", var_22282e7d48ca3400.pers["captures"]);
    var_22282e7d48ca3400 namespace_b919c4be206d3c80::function_48544e365f4f5648(15, 1);
    thread namespace_52f6938dd902c7d0::function_7b2653a588f28e29(var_22282e7d48ca3400, "rescue_cap_hostage", "rescue_cap_hostage", "rescue_enemy_cap_hostage");
    var_22282e7d48ca3400 thread namespace_62c556437da28f50::scoreeventpopup(#"hash_32c5f215f3ec3b3");
    var_22282e7d48ca3400 thread namespace_48a08c5037514e04::doScoreEvent(#"hash_2d6568e59815732d");
    if (level.hostages.size <= 0) {
        level.var_4817bac75a8b9eff = "all_hostage_extracted";
    }
    winningteam = function_cbe00caa24da0f0e();
    namespace_e8a49b70d0769b66::giveteamscoreforobjective(team, 100, 0, undefined, 1, winningteam);
    level.var_4817bac75a8b9eff = undefined;
    if (level.hostages.size <= 0) {
        if (!function_808d5c4aafed7f2e(game["defenders"]) && getdvarint(@"hash_5ad4b38eb8b556f1", 0)) {
            level.forceend = 1;
        }
        level.var_500370e4f476faa9 = level.var_974e9f26a695cd24;
        thread namespace_d576b6dc7cef9c62::endgame(team, game["end_reason"]["all_hostage_extracted"]);
        level.var_d0b7dfa3e29555a1 = undefined;
    } else if (game["teamScores"][team] < level.roundscorelimit) {
        namespace_944ddf7b8df1b0e3::leaderdialog("hostage_extraected_friendly", var_1fbf6aaa31163feb);
        namespace_944ddf7b8df1b0e3::leaderdialog("hostage_extraected_enemy", otherteam);
        level thread function_52cbcdf9241fd4bf();
    }
    if (level.var_7fcc5417218ad4c8.size > 0) {
        foreach (hostage in level.var_7fcc5417218ad4c8) {
            if (hostage.carrier.team != game["attackers"]) {
                foreach (extract in level.var_f57a27b32e66a765) {
                    extract namespace_19b4203b51d56488::allowuse("friendly");
                    extract namespace_19b4203b51d56488::setvisibleteam("any");
                    extract.var_2b5a1e993bb88c21 setscriptablepartstate("rescue_extract", "idle");
                }
                return;
            }
        }
    }
    foreach (extract in level.var_f57a27b32e66a765) {
        extract namespace_19b4203b51d56488::allowuse("none");
        extract namespace_19b4203b51d56488::setvisibleteam("none");
        extract.var_2b5a1e993bb88c21 setscriptablepartstate("rescue_extract", "off");
    }
    foreach (hostage in level.hostages) {
        hostage.trigger enableplayeruse(var_22282e7d48ca3400);
    }
}

// Namespace rescue/namespace_6d8fa3f81f071973
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x794a
// Size: 0xc9
function function_52cbcdf9241fd4bf() {
    level endon("game_ended");
    if (!isdefined(level.var_d0b7dfa3e29555a1)) {
        wait(2);
        foreach (player in level.players) {
            if (isdefined(player.var_acfbb9caed7125f9) && player.var_acfbb9caed7125f9 == 1) {
                prisoner_carry_music = function_17ee301cf0b5ba85("prisoner_carry_music_classic");
                player setplayermusicstate(prisoner_carry_music);
            } else {
                prisoner_carry_music = function_17ee301cf0b5ba85("prisoner_carry_music");
                player setplayermusicstate(prisoner_carry_music);
            }
        }
        level.var_d0b7dfa3e29555a1 = 1;
    }
}

// Namespace rescue/namespace_6d8fa3f81f071973
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7a1a
// Size: 0x2c0
function extractzone_onusebegin(player) {
    if (!istrue(player.var_5b3c77e2eafab370)) {
        return;
    }
    if (level.flagcapturetime <= 0) {
        return;
    }
    if (!isdefined(self.var_53d907bf6d19394e)) {
        self.var_53d907bf6d19394e = [];
    }
    hostage = player.carryobject;
    self.var_53d907bf6d19394e[hostage.objidnum] = hostage;
    self.numtouching[player.team]++;
    player.var_5b3c77e2eafab370 = 0;
    self.carrier = undefined;
    level.var_7fcc5417218ad4c8[hostage.objidnum] = undefined;
    ownerteam = namespace_19b4203b51d56488::getownerteam();
    if (ownerteam == player.team) {
        var_24c76fc549f7fd9 = 1;
    } else {
        var_24c76fc549f7fd9 = 0;
    }
    if (isplayer(player)) {
        player setclientomnvar("ui_objective_pinned_text_param", var_24c76fc549f7fd9);
    }
    if (!isdefined(self.statusnotifytime)) {
        self.statusnotifytime = gettime();
    }
    if (self.statusnotifytime > self.statusnotifytime + 5000) {
        self.didstatusnotify = 0;
        self.statusnotifytime = gettime();
    }
    usetime = level.flagcapturetime;
    if (usetime > 0) {
        namespace_19b4203b51d56488::setobjectivestatusicons(level.icontaking, level.icontaking);
    }
    hostage.safeorigin = self.trigger.origin;
    hostage thread namespace_19b4203b51d56488::setdropped(0);
    hostage.head show();
    if (istrue(hostage.body.hasanimtree)) {
        hostage.body stopuseanimtree();
        hostage.body.hasanimtree = undefined;
    }
    hostage.body scriptmodelplayanimdeltamotion("iw9_mp_hostage_ground_idle");
    hostage namespace_19b4203b51d56488::setownerteam(player.team);
    hostage namespace_19b4203b51d56488::allowuse("enemy");
    hostage namespace_19b4203b51d56488::setvisibleteam("enemy");
    foreach (hostage in level.hostages) {
        hostage.trigger enableplayeruse(player);
    }
    player val::function_c9d0b43701bdba00("carry");
    if (!player namespace_a2f809133c566621::isjuggernaut()) {
        player.playerstreakspeedscale = 0;
        player setmovespeedscale(1);
    }
}

// Namespace rescue/namespace_6d8fa3f81f071973
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7ce1
// Size: 0x46
function function_76ba7e56087a12fd(player) {
    if (player.team == game["attackers"]) {
        return 0;
    }
    if (!isdefined(level.var_7fcc5417218ad4c8)) {
        return 0;
    }
    if (level.var_7fcc5417218ad4c8.size <= 0) {
        return 0;
    }
    return 1;
}

// Namespace rescue/namespace_6d8fa3f81f071973
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7d2f
// Size: 0xd6
function function_ccf456cd84b96382(player, team) {
    if (!istrue(level.var_8f21d2090cbc3b2a) && isdefined(player.carryobject)) {
        level.var_8f21d2090cbc3b2a = 1;
        hostage = player.carryobject;
        level.var_735deff44b2c0f56[hostage.objidnum] namespace_19b4203b51d56488::setvisibleteam("none");
        level.var_735deff44b2c0f56[hostage.objidnum] namespace_19b4203b51d56488::allowuse("none");
        hostage = player.carryobject;
        hostage.safeorigin = self.trigger.origin;
        hostage thread namespace_19b4203b51d56488::setdropped(0);
        hostage function_13db2131b3f0851f(player, 1);
    }
}

// Namespace rescue/namespace_6d8fa3f81f071973
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7e0c
// Size: 0x23
function function_6201c84e805ab787(player) {
    if (player isthrowingbackgrenade() || player isthrowinggrenade()) {
        return 0;
    }
    return 1;
}

// Namespace rescue/namespace_6d8fa3f81f071973
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7e37
// Size: 0x1f
function function_a4beda038141b8f8(player) {
    if (istrue(player.var_12bfb031c0a0efd8)) {
        return 0;
    }
    return 1;
}

// Namespace rescue/namespace_6d8fa3f81f071973
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7e5e
// Size: 0x2b
function function_fda15d11f6baf729(player) {
    var_1afed0877937f203 = player getcurrentweapon();
    if (!namespace_68e641469fde3fa7::isprimaryweapon(var_1afed0877937f203)) {
        return 0;
    }
    return 1;
}

// Namespace rescue/namespace_6d8fa3f81f071973
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7e91
// Size: 0x13
function function_5c8cf2eee42128c8(player) {
    return !player isreloading();
}

// Namespace rescue/namespace_6d8fa3f81f071973
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7eac
// Size: 0x10e
function function_ed073d24cd8ed3c5(player) {
    if (self.body islinked()) {
        return (abs(player.origin[2] - self.var_90758efde9b783b7.origin[2]) < level.var_f224e09983ef4b2a);
    }
    var_52cb5824a2c14eeb = abs(player.origin[2] - self.body.origin[2]);
    var_e98d5d032aa3785d = level.var_f224e09983ef4b2a;
    var_9d113850fd61075d = abs(player.origin[2] - self.body.origin[2]) < level.var_f224e09983ef4b2a;
    return abs(player.origin[2] - self.body.origin[2]) < level.var_f224e09983ef4b2a;
}

// Namespace rescue/namespace_6d8fa3f81f071973
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7fc2
// Size: 0x107
function onspawnplayer(var_9156b53bcf7ce573) {
    if (istrue(self.var_f44aa740d81a25da)) {
        self notify("last_stand_finished");
    }
    if (level.var_826175089e4669d6 && isdefined(self.team)) {
        if (self.team == game["attackers"]) {
            foreach (hostage in level.hostages) {
                hostage.trigger disableplayeruse(self);
            }
        } else {
            foreach (hostage in level.hostages) {
                hostage.trigger enableplayeruse(self);
            }
        }
    }
}

// Namespace rescue/namespace_6d8fa3f81f071973
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x80d0
// Size: 0x1f
function private onplayerconnect(player) {
    if (!isdefined(player)) {
        return;
    }
    namespace_d9c77dc2a6fe29c6::registerentforoob(player, "rescue");
}

// Namespace rescue/namespace_6d8fa3f81f071973
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x80f6
// Size: 0x35
function private function_b9962c5a08fd9ab7(var_44e306d53285e1f8, var_93f5db7e81311353, triggertype) {
    if (!isdefined(self)) {
        return;
    }
    self.var_1d85141d8703f5d4 = 1;
    self notify("force_manual_drop");
}

// Namespace rescue/namespace_6d8fa3f81f071973
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x8132
// Size: 0x2c
function private function_d50cce29bbb9d457(var_fcef8d217a441961, var_704294f906fad67e, var_93f5db7e81311353) {
    if (!isdefined(self)) {
        return;
    }
    self.var_1d85141d8703f5d4 = undefined;
}

// Namespace rescue/namespace_6d8fa3f81f071973
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8165
// Size: 0x5d
function function_a12ec32a24e1a367(victim) {
    if (!istrue(victim.var_5b3c77e2eafab370)) {
        return;
    }
    if (!isdefined(victim.var_7ebbb0dc14346eaa)) {
        return;
    }
    victim takeweapon(victim.var_7ebbb0dc14346eaa);
    self.lastcacweaponobj = victim.switchweapon;
    victim.var_7ebbb0dc14346eaa = undefined;
}

// Namespace rescue/namespace_6d8fa3f81f071973
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x81c9
// Size: 0x7e
function function_824aadc5e0a8e202(objweapon) {
    if (isdefined(level.hostages)) {
        foreach (hostage in level.hostages) {
            if (self istouching(hostage.trigger)) {
                return 0;
            }
        }
    }
    return 1;
}

// Namespace rescue/namespace_6d8fa3f81f071973
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x824f
// Size: 0x9f
function function_c95d2a5f442a6bfe(point) {
    if (isdefined(level.hostages)) {
        foreach (hostage in level.hostages) {
            if (isdefined(point)) {
                if (ispointinsidecircle(point, hostage.curorigin, 40)) {
                    return 0;
                }
            } else if (self istouching(hostage.trigger)) {
                return 0;
            }
        }
    }
    return 1;
}

// Namespace rescue/namespace_6d8fa3f81f071973
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x82f6
// Size: 0xa0
function function_15a66746e75cc48a(point) {
    if (isdefined(level.hostages)) {
        foreach (hostage in level.hostages) {
            distsqrd = distancesquared(hostage.trigger.origin, self.origin);
            if (3600 >= distsqrd) {
                return 0;
            }
        }
    }
    return 1;
}

// Namespace rescue/namespace_6d8fa3f81f071973
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x839e
// Size: 0xc1
function function_189d41172d946149() {
    level endon("game_ended");
    if (!getdvarint(@"hash_38c9581a2665c1aa", 1)) {
        return;
    }
    while (1) {
        validplayers = [];
        foreach (player in level.players) {
            if (isdefined(player.team) && player.team == game["defenders"]) {
                validplayers[validplayers.size] = player;
            }
        }
        level.var_fcbb998d4a3f2da = function_21a6a1c613b50a28(validplayers, 700);
        wait(1);
    }
}

// Namespace rescue/namespace_6d8fa3f81f071973
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8466
// Size: 0x368
function function_a5b7c34a5c2d56d2() {
    self notify("watch_mines");
    self endon("death");
    self endon("watch_mines");
    self endon("hostage_pickup");
    if (!getdvarint(@"hash_38c9581a2665c1aa", 1)) {
        return;
    }
    while (1) {
        /#
            if (getdvarint(@"hash_df9beaaeade3f5bf", 0)) {
                thread draw_circle(self.curorigin, 400, (1, 0, 0), 1, 0, 1);
                thread draw_circle(self.curorigin, 700, (0, 0, 1), 1, 0, 1);
            }
        #/
        if (!isdefined(level.var_fcbb998d4a3f2da)) {
            waitframe();
            continue;
        }
        var_83451e7f85547ee0 = [];
        foreach (var_bab0d10e51188531 in level.var_fcbb998d4a3f2da function_df633f460888a47(self.curorigin)) {
            foreach (player in var_bab0d10e51188531) {
                if (!isalive(player)) {
                    continue;
                }
                var_83451e7f85547ee0[var_83451e7f85547ee0.size] = player;
            }
        }
        if (var_83451e7f85547ee0.size == 0) {
            waitframe();
            continue;
        }
        namespace_36f464722d326bbe::function_f5e8b13acc5b4e24();
        foreach (targetarray in level.var_715aa7f8de54c394 function_df633f460888a47(self.curorigin)) {
            foreach (target in targetarray) {
                if (!isdefined(target)) {
                    continue;
                }
                if (!isdefined(target.team)) {
                    continue;
                }
                if (target.team == game["defenders"] && !getdvarint(@"hash_8d4d3e5a116ea626", 0)) {
                    continue;
                }
                if (!function_391d759d20be6374(target.equipmentref)) {
                    continue;
                }
                if (namespace_3bbb5a98b932c46f::isplantedequipment(target) && distance2dsquared(target.origin, self.curorigin) < 160000) {
                    voice = 1;
                    if (self.objectivekey == "_b") {
                        voice = 2;
                    }
                    var_90e6bc3a37537c77 = "dx_mp_rscu_mode_cvm" + voice + "_rhda";
                    foreach (player in var_83451e7f85547ee0) {
                        self.head playsoundtoplayer(var_90e6bc3a37537c77, player, self.head);
                    }
                    var_40cdbacda5cca105 = lookupsoundlength(var_90e6bc3a37537c77, 1);
                    wait(var_40cdbacda5cca105 / 1000 + 25);
                }
            }
        }
        waitframe();
    }
}

// Namespace rescue/namespace_6d8fa3f81f071973
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x87d5
// Size: 0x30
function function_391d759d20be6374(var_fbaf0295a16d4c79) {
    if (!isdefined(var_fbaf0295a16d4c79)) {
        return 0;
    }
    return var_fbaf0295a16d4c79 == "equip_at_mine" || var_fbaf0295a16d4c79 == "equip_c4" || var_fbaf0295a16d4c79 == "equip_claymore";
}

// Namespace rescue/namespace_6d8fa3f81f071973
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x880d
// Size: 0x29c
function onnormaldeath(victim, attacker, lifeid, meansofdeath, objweapon, iskillstreakweapon) {
    namespace_310ba947928891df::oncommonnormaldeath(victim, attacker, lifeid, meansofdeath, objweapon, iskillstreakweapon);
    score = namespace_62c556437da28f50::getscoreinfovalue(#"kill");
    /#
        assert(isdefined(score));
    #/
    if (isdefined(attacker.laststanding) && attacker.laststanding) {
        attacker thread function_e3e3e81453fd788b(#"hash_4bc4aed7d23221b3");
    }
    if (istrue(victim.var_5b3c77e2eafab370)) {
        attacker incpersstat("defends", 1);
        attacker namespace_b919c4be206d3c80::function_48544e365f4f5648(15, 1);
        attacker namespace_2685ec368e022695::statsetchild("round", "defends", attacker.pers["defends"]);
        attacker thread namespace_62c556437da28f50::scoreeventpopup(#"defend");
        attacker thread namespace_48a08c5037514e04::doScoreEvent(#"hash_2d96ced878338cd2");
    }
    if (isdefined(level.var_7fcc5417218ad4c8) && level.var_7fcc5417218ad4c8.size > 0) {
        if (isdefined(attacker) && isplayer(attacker) && attacker.pers["team"] != victim.pers["team"]) {
            foreach (hostage in level.var_7fcc5417218ad4c8) {
                if (attacker.pers["team"] == hostage.carrier.team && attacker != hostage.carrier) {
                    var_db36f135f40e7940 = distancesquared(hostage.carrier.origin, attacker.origin);
                    if (var_db36f135f40e7940 < 105625) {
                        attacker thread namespace_62c556437da28f50::scoreeventpopup(#"defend");
                        attacker thread namespace_48a08c5037514e04::doScoreEvent(#"hash_2d96ced878338cd2");
                        attacker incpersstat("defends", 1);
                        attacker namespace_2685ec368e022695::statsetchild("round", "defends", attacker.pers["defends"]);
                        thread utility::trycall(level.matchdata_logvictimkillevent, lifeid, "defending");
                    }
                }
            }
        }
    }
}

// Namespace rescue/namespace_6d8fa3f81f071973
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8ab0
// Size: 0x6f
function function_d23f4d7bfe21f9da() {
    if (isdefined(level.var_7fcc5417218ad4c8)) {
        foreach (hostage in level.var_7fcc5417218ad4c8) {
            self disablescriptableplayeruse(hostage.carrier);
        }
    }
}

// Namespace rescue/namespace_6d8fa3f81f071973
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8b26
// Size: 0x34
function onflagcapture(objectivetype, label, var_22282e7d48ca3400, team, oldteam, var_579da7b2997dec60) {
    
}

// Namespace rescue/namespace_6d8fa3f81f071973
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8b61
// Size: 0x80
function function_5f4409e5a953c368(var_3fb18bf245471d0b, var_8adefcc4f43864ff) {
    var_adbdcd3370cc708d = game["roundsWon"][game["attackers"]] + var_3fb18bf245471d0b;
    var_e92034aef3a4b991 = game["roundsWon"][game["defenders"]] + var_8adefcc4f43864ff;
    if (var_adbdcd3370cc708d < level.winlimit) {
        return 0;
    }
    if (var_e92034aef3a4b991 < level.winlimit) {
        return 0;
    }
    if (var_adbdcd3370cc708d != var_e92034aef3a4b991) {
        if (var_adbdcd3370cc708d > var_e92034aef3a4b991) {
            return 1;
        }
        return 2;
    }
    return 3;
}

// Namespace rescue/namespace_6d8fa3f81f071973
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8be9
// Size: 0x1f7
function ontimelimit() {
    winningteam = "tie";
    var_8adefcc4f43864ff = 0;
    var_7fcc5417218ad4c8 = 0;
    if (isdefined(level.var_7fcc5417218ad4c8)) {
        var_7fcc5417218ad4c8 = level.var_7fcc5417218ad4c8.size;
        var_8adefcc4f43864ff = 100 * var_7fcc5417218ad4c8;
        level.var_319544f76c37154b[game["defenders"]] = level.var_319544f76c37154b[game["defenders"]] + 100 * var_7fcc5417218ad4c8;
    }
    var_ddd6e7cac66011ba = 50 * (level.hostages.size - var_7fcc5417218ad4c8);
    level.var_319544f76c37154b[game["attackers"]] = level.var_319544f76c37154b[game["attackers"]] + 50 * (level.hostages.size - var_7fcc5417218ad4c8);
    level.var_fb257bafbf772e21 = [];
    level.var_fb257bafbf772e21[game["attackers"]] = var_ddd6e7cac66011ba;
    level.var_fb257bafbf772e21[game["defenders"]] = var_8adefcc4f43864ff;
    result = function_5f4409e5a953c368(var_ddd6e7cac66011ba, var_8adefcc4f43864ff);
    if (result == 1) {
        winningteam = game["attackers"];
        namespace_e8a49b70d0769b66::giveteamscoreforobjective(game["attackers"], var_ddd6e7cac66011ba, 1, undefined, 1, winningteam);
        namespace_e8a49b70d0769b66::giveteamscoreforobjective(game["defenders"], var_8adefcc4f43864ff, 1, undefined, 1, winningteam);
    } else if (result == 2) {
        winningteam = game["defenders"];
        namespace_e8a49b70d0769b66::giveteamscoreforobjective(game["defenders"], var_8adefcc4f43864ff, 1, undefined, 1, winningteam);
        namespace_e8a49b70d0769b66::giveteamscoreforobjective(game["attackers"], var_ddd6e7cac66011ba, 1, undefined, 1, winningteam);
    } else if (result == 3) {
        winningteam = "tie";
        namespace_e8a49b70d0769b66::giveteamscoreforobjective(game["defenders"], var_8adefcc4f43864ff, 1, undefined, 1, winningteam);
        namespace_e8a49b70d0769b66::giveteamscoreforobjective(game["attackers"], var_ddd6e7cac66011ba, 1, undefined, 1, winningteam);
    } else {
        namespace_e8a49b70d0769b66::giveteamscoreforobjective(game["defenders"], var_8adefcc4f43864ff, 1, undefined, 1, winningteam);
        namespace_e8a49b70d0769b66::giveteamscoreforobjective(game["attackers"], var_ddd6e7cac66011ba, 1, undefined, 1, winningteam);
    }
    thread namespace_d576b6dc7cef9c62::endgame(winningteam, game["end_reason"]["time_limit_reached"]);
}

// Namespace rescue/namespace_6d8fa3f81f071973
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8de7
// Size: 0x2d3
function ondeadevent(team) {
    if (team == "all") {
        winningteam = "tie";
        if (!function_808d5c4aafed7f2e(game["attackers"]) && getdvarint(@"hash_5ad4b38eb8b556f1", 0)) {
            level.forcedend = 1;
            winningteam = game["defenders"];
        }
        if (!function_808d5c4aafed7f2e(game["defenders"]) && getdvarint(@"hash_5ad4b38eb8b556f1", 0)) {
            level.forcedend = 1;
            winningteam = game["attackers"];
        }
        level.var_500370e4f476faa9 = 0;
        winningteam = function_cbe00caa24da0f0e();
        level thread namespace_d576b6dc7cef9c62::endgame(winningteam, game["end_reason"]["tie"]);
    } else if (team == game["attackers"]) {
        score = 50;
        if (isdefined(level.var_7fcc5417218ad4c8) && level.var_7fcc5417218ad4c8.size > 0) {
            var_c538365ee9199f8c = level.var_7fcc5417218ad4c8.size * 100;
            score = int(clamp(var_c538365ee9199f8c + 50, 50, level.var_974e9f26a695cd24));
        }
        if (score + level.var_319544f76c37154b[game["defenders"]] >= level.var_974e9f26a695cd24) {
            score = level.var_974e9f26a695cd24 - level.var_319544f76c37154b[game["defenders"]];
        }
        level.var_500370e4f476faa9 = score;
        level.var_319544f76c37154b[game["defenders"]] = level.var_319544f76c37154b[game["defenders"]] + score;
        winningteam = function_cbe00caa24da0f0e();
        namespace_e8a49b70d0769b66::giveteamscoreforobjective(game["defenders"], score, 0, undefined, 1, winningteam);
        if (!function_808d5c4aafed7f2e(game["attackers"]) && getdvarint(@"hash_5ad4b38eb8b556f1", 0)) {
            level.forcedend = 1;
        }
        level thread namespace_d576b6dc7cef9c62::endgame(winningteam, game["end_reason"][tolower(game[game["attackers"]]) + "_eliminated"]);
    } else if (team == game["defenders"]) {
        level.var_500370e4f476faa9 = 50 * level.hostages.size;
        level.var_319544f76c37154b[game["attackers"]] = level.var_319544f76c37154b[game["attackers"]] + level.var_500370e4f476faa9;
        winningteam = function_cbe00caa24da0f0e();
        namespace_e8a49b70d0769b66::giveteamscoreforobjective(game["attackers"], level.var_500370e4f476faa9, 0, undefined, 1, winningteam);
        if (!function_808d5c4aafed7f2e(game["defenders"]) && getdvarint(@"hash_5ad4b38eb8b556f1", 0)) {
            level.forcedend = 1;
        }
        level thread namespace_d576b6dc7cef9c62::endgame(winningteam, game["end_reason"][tolower(game[game["defenders"]]) + "_eliminated"]);
    }
}

// Namespace rescue/namespace_6d8fa3f81f071973
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x90c1
// Size: 0x57
function function_f6e1c54f449c2c6f(winner, endreasontext, nukedetonated) {
    var_fb257bafbf772e21 = undefined;
    if (isdefined(level.var_fb257bafbf772e21)) {
        var_fb257bafbf772e21 = level.var_fb257bafbf772e21;
    }
    level thread namespace_d576b6dc7cef9c62::endgame_regularmp(winner, endreasontext, undefined, nukedetonated, level.var_500370e4f476faa9, var_fb257bafbf772e21);
}

// Namespace rescue/namespace_6d8fa3f81f071973
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x911f
// Size: 0x4a
function function_e462b877cedea7f7(team, score, scoreevent) {
    if (score >= level.winlimit) {
        level.forcedend = 1;
        function_f6e1c54f449c2c6f(team, game["end_reason"]["score_limit_reached"]);
    }
}

// Namespace rescue/namespace_6d8fa3f81f071973
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9170
// Size: 0x80
function function_cbe00caa24da0f0e() {
    if (level.var_319544f76c37154b["axis"] == level.var_319544f76c37154b["allies"]) {
        /#
            function_da77f11798432783("gamestate_leadtaken");
        #/
        return "tie";
    }
    winningteam = ter_op(level.var_319544f76c37154b["axis"] > level.var_319544f76c37154b["allies"], "axis", "allies");
    /#
        function_da77f11798432783(winningteam);
    #/
    return winningteam;
}

// Namespace rescue/namespace_6d8fa3f81f071973
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x91f8
// Size: 0x162
function function_808d5c4aafed7f2e(team) {
    if (!isdefined(game["roundsPlayed"])) {
        return 1;
    }
    if (game["roundsPlayed"] == level.roundlimit - 1) {
        return 1;
    }
    if (level.roundlimit == 0) {
        return 1;
    }
    var_79652af780655345 = level.roundlimit - game["roundsPlayed"] + 1;
    var_2f4d10673c0d5578 = floor(float(var_79652af780655345) / 2);
    if (var_79652af780655345 % 2 != 0) {
        if (team == game["attackers"]) {
            maxscore = level.var_d2574c87ee723d10 * (1 + var_2f4d10673c0d5578) + level.var_974e9f26a695cd24 * var_2f4d10673c0d5578;
            if (maxscore < game["teamScores"][game["defenders"]]) {
                return 0;
            }
            return 1;
        }
        maxscore = level.var_974e9f26a695cd24 * (1 + var_2f4d10673c0d5578) + level.var_d2574c87ee723d10 * var_2f4d10673c0d5578;
        if (maxscore < game["teamScores"][game["attackers"]]) {
            return 0;
        }
        return 1;
    } else {
        maxscore = level.var_d2574c87ee723d10 * var_2f4d10673c0d5578 + level.var_974e9f26a695cd24 * var_2f4d10673c0d5578;
        if (team == game["attackers"]) {
            if (maxscore < game["teamScores"][game["defenders"]]) {
                return 0;
            }
            return 1;
        }
        if (maxscore < game["teamScores"][game["attackers"]]) {
            return 0;
        }
        return 1;
    }
}

// Namespace rescue/namespace_6d8fa3f81f071973
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9361
// Size: 0x63
function function_da3da0004950e970(objective, time) {
    objective notify("pulsing");
    objective endon("pulsing");
    objective endon("death");
    objective endon("gameobject_deleted");
    level endon("game_ended");
    objective namespace_5a22b6f3a56f7e9b::objective_set_pulsate(objective.objidnum, 1);
    wait(time);
    objective namespace_5a22b6f3a56f7e9b::objective_set_pulsate(objective.objidnum, 0);
}

// Namespace rescue/namespace_6d8fa3f81f071973
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x93cb
// Size: 0x24
function function_e100ac66c6f43c39() {
    /#
        level endon("carryData");
        while (1) {
            function_8e671b51737c992e();
            function_f6cca697a2bbc4bf();
            waitframe();
        }
    #/
}

// Namespace rescue/namespace_6d8fa3f81f071973
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x93f6
// Size: 0xcf
function function_8e671b51737c992e() {
    /#
        score = getdvarint(@"hash_f214714304d21d8c", 0);
        if (score) {
            setdvar(@"hash_f214714304d21d8c", 0);
            if (isdefined(level.players) && isdefined(level.players[0])) {
                level.var_500370e4f476faa9 = score;
                level.var_319544f76c37154b[level.players[0].team] = level.var_319544f76c37154b[level.players[0].team] + score;
                winningteam = function_cbe00caa24da0f0e();
                namespace_e8a49b70d0769b66::giveteamscoreforobjective(level.players[0].team, score, 0, undefined, 1, winningteam);
            }
        }
    #/
}

// Namespace rescue/namespace_6d8fa3f81f071973
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x94cc
// Size: 0x127
function function_f6cca697a2bbc4bf() {
    /#
        result = getdvarint(@"hash_3419845bbfd82e24", 0);
        if (result) {
            setdvar(@"hash_3419845bbfd82e24", 0);
            if (!isdefined(level.players) || !isdefined(level.players[0])) {
                return;
            }
            switch (result) {
            case 1:
                level thread namespace_d576b6dc7cef9c62::endgame(level.players[0].team, game["ui_rescue_hostage_active"]["friendly"]);
                break;
            case 2:
                team = undefined;
                if (level.players[0].team == game["MP_INGAME_ONLY/OBJ_NEXT_CAPS"]) {
                    team = game["pickup_left_stand"];
                } else {
                    team = game["MP_INGAME_ONLY/OBJ_NEXT_CAPS"];
                }
                level thread namespace_d576b6dc7cef9c62::endgame(team, game["ui_rescue_hostage_active"]["friendly"]);
                break;
            case 3:
                level thread namespace_d576b6dc7cef9c62::endgame("gamestate_leadtaken", game["ui_rescue_hostage_active"]["friendly"]);
                break;
            }
        }
    #/
}

// Namespace rescue/namespace_6d8fa3f81f071973
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x95fa
// Size: 0x1c
function function_da77f11798432783(team) {
    /#
        println("mp_rescue_spawn_attacker" + team);
    #/
}

// Namespace rescue/namespace_6d8fa3f81f071973
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x961d
// Size: 0x184
function function_eed7800933a86a6d() {
    /#
        level endon("carryData");
        var_345653ec713a050e = getentarray("none", "normal");
        var_345652ec713a02db = getentarray("rig_created", "normal");
        var_345651ec713a00a8 = getentarray("killstreaks", "normal");
        while (1) {
            foreach (trigger in var_345653ec713a050e) {
                sphere(trigger.origin, 60, (1, 0, 0));
            }
            foreach (trigger in var_345652ec713a02db) {
                sphere(trigger.origin, 60, (0, 1, 0));
            }
            foreach (trigger in var_345651ec713a00a8) {
                sphere(trigger.origin, 60, (0, 0, 1));
            }
            waitframe();
        }
    #/
}

// Namespace rescue/namespace_6d8fa3f81f071973
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x97a8
// Size: 0xa
function function_cf8b96b6503d9f31() {
    namespace_b919c4be206d3c80::function_edba1ee7c2375a5();
}

