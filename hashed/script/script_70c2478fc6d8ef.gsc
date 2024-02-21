// mwiii decomp prototype
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\flags.gsc;
#using scripts\mp\class.gsc;
#using script_639bf783929acf9b;
#using script_2583ee5680cf4736;
#using script_7d3e27aa82b5d70b;
#using script_398835140857d740;
#using script_22c948a23ad2fbdf;
#using script_7b2517368c79e5bc;
#using script_cbdac3b4a48bb8f;
#using script_485622d93fa7e4cf;
#using script_7ab5b649fa408138;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using script_422801cfe4074e05;
#using script_3a4480ba1c5664d0;
#using script_76cc264b397db9cb;
#using script_9880b9dc28bc25e;
#using scripts\common\ai.gsc;
#using script_4c770a9a4ad7659c;
#using scripts\engine\utility.gsc;
#using script_3214e6fcdce468a7;
#using scripts\engine\math.gsc;
#using scripts\common\utility.gsc;
#using script_6617e2f2bb62b52b;
#using script_24f248b33b79e48d;
#using script_5a498c5fd8511723;
#using script_41387eecc35b88bf;
#using script_7e41e37180e554f;
#using scripts\mp\playerstats_interface.gsc;
#using script_5a4a5d9ba343ff8f;
#using script_3b64eb40368c1450;
#using script_72ef6b9f0cf1f55a;
#using script_6d3eb7a3bb982cc6;
#using script_530b83caa7d7c86a;
#using script_71721925888affd9;
#using script_3e34d236a84cfd96;
#using script_6184f61a5e93133a;
#using script_2c937b3e8ba10a4d;
#using script_4b4fdf35b71fc158;
#using script_272e4f4980b32088;
#using scripts\mp\globallogic.gsc;
#using scripts\mp\gameobjects.gsc;
#using scripts\common\create_script_utility.gsc;
#using script_638d701d263ee1ed;
#using script_177d90aeaf3d64fc;
#using script_2f4532221a7f8015;
#using script_53da3333b83b3527;
#using scripts\mp\gametypes\common.gsc;
#using script_120270bd0a747a35;
#using scripts\common\ui.gsc;
#using script_32dd4b86977d430c;
#using scripts\cp_mp\utility\game_utility.gsc;
#using script_6bffae1b97f70547;
#using script_2fdc6c28b1f8f3f3;
#using script_4c688cf7f824cb29;
#using script_64f7df26b62826a1;
#using script_6dd25b90102b45dc;
#using script_8bd2edc2507a7fb;
#using scripts\engine\scriptable.gsc;
#using script_2590b7a7de3dfc79;
#using script_38db8bccc9eb301f;
#using scripts\cp_mp\parachute.gsc;
#using script_2f11ea014b8bb8eb;
#using script_3c30ef2503c2a953;
#using script_22856b83897eaad8;
#using script_5c863beb71432b7;
#using script_6534471140f9f21;
#using script_543159483e6c902b;
#using script_21862d4e3ad68db8;
#using script_63d03bd53d001217;
#using script_2cd303a32758e76c;
#using scripts\mp\events.gsc;
#using script_46c7c73b1a7e4773;
#using script_362ab6076736a373;
#using script_5200937492b52afd;
#using script_1ab2908e20c08e1d;
#using script_7534b1d3ac3ea47a;
#using script_22f1701e151b9d12;
#using script_6c6a46b757ce4c71;
#using script_860bfdfe82326e3;
#using script_2d400da2610fe542;
#using script_669760f0500e4358;
#using script_7e70a941450dfd06;
#using script_1cf7605e6d68c130;
#using script_64316dc775e91122;
#using script_7c1f11bc5588635c;
#using script_7bc3299a21cd5f3a;
#using script_6d937ec0242866d1;
#using script_7c875a4a27280806;
#using script_50baf2ef084cce5b;
#using script_20524a06ea1231f6;
#using script_10e910b749a22d35;
#using script_45e61c7efec047;
#using script_5d32c8d28306fe7b;
#using script_51365e31e30efcb1;
#using script_39faae597e351db7;
#using script_6b8effb6f9655f83;
#using script_645acc6422636f9f;
#using script_2f5972e002650f;
#using script_4e6e58ab5d96c2b0;
#using script_482376d10f69832c;
#using script_2aa897a6ab0a9fe6;
#using script_6f65366f542f6627;
#using script_3ce4651e69c721db;
#using scripts\cp_mp\calloutmarkerping.gsc;
#using script_5f501fbedf0953f;
#using script_24df7ce3375db729;
#using script_c6b9e8fb3a7de37;
#using script_54c3321e7395f82f;
#using script_3e025e773ba9a0a7;
#using script_5d02d8723d456015;
#using script_118c3165d7948d8b;
#using script_793f5fa29ca62c00;
#using script_2142c4021a1e1486;
#using script_73a206089fde730d;
#using script_6198aa46028a5c9c;
#using script_59771c07c41e0fc0;
#using script_5def7af2a9f04234;
#using scripts\mp\hud_message.gsc;
#using scripts\mp\equipment.gsc;
#using script_3e2f8cc477d57433;
#using scripts\mp\perks\perkpackage.gsc;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using script_249b0a9054ceb230;
#using script_2669878cf5a1b6bc;
#using scripts\mp\gamelogic.gsc;
#using scripts\mp\playerlogic.gsc;
#using scripts\mp\scoreboard.gsc;
#using script_7c40fa80892a721;
#using script_6f2a5bc59c2669eb;
#using script_38eb8f4be20d54f4;
#using script_5762ac2f22202ba2;
#using scripts\mp\equipment\support_box.gsc;
#using scripts\mp\spawnlogic.gsc;
#using script_58be75c518bf0d40;
#using script_3d91fbc054526de1;
#using script_3ff084f114b7f6c9;
#using script_14d3930854cb398c;
#using scripts\mp\gametypes\br_gametype_dmz.gsc;
#using scripts\mp\gametypes\bradley_spawner.gsc;
#using script_6a8ec730b2bfa844;
#using scripts\stealth\event.gsc;
#using script_600b944a95c3a7bf;
#using script_443d99fe707f1d9f;
#using script_1fb4294da3259ab0;
#using script_1c6562e198ffa6d3;
#using scripts\engine\trace.gsc;
#using script_247745a526421ba7;
#using script_5a3744a37c39ee3b;
#using script_4965f0ceafad5587;
#using script_3f8a85870dafbcb7;
#using script_7989767905e8a3ec;
#using script_27bcf242f91a8cef;
#using script_42982ffd0134f28e;
#using scripts\mp\utility\spawn_event_aggregator.gsc;
#using script_609bade7747b106d;
#using script_72af5a878a9d3397;
#using script_27fdece778e999d8;
#using scripts\mp\weapons.gsc;
#using scripts\mp\equipment\snapshot_grenade.gsc;
#using scripts\mp\damage.gsc;
#using scripts\mp\equipment\decoy_grenade.gsc;
#using scripts\mp\dev.gsc;
#using scripts\common\vehicle.gsc;
#using scripts\mp\battlechatter_mp.gsc;
#using script_208955cb4d2c8fb3;
#using script_58682e6578ce0515;
#using scripts\cp_mp\vehicles\vehicle_occupancy.gsc;
#using scripts\cp_mp\utility\damage_utility.gsc;
#using scripts\cp_mp\emp_debuff.gsc;
#using scripts\mp\utility\perk.gsc;
#using scripts\mp\rank.gsc;
#using script_edb8e725d068ac9;

#namespace ob;

// Namespace ob/namespace_d1df78f2235ca173
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2361
// Size: 0x6b9
function main() {
    /#
        adddebugcommand("getZoneDefForOrigin");
    #/
    setdvarifuninitialized(@"hash_663785f69f5eebc2", 1);
    setdvarifuninitialized(@"hash_c2eb94ce7d7bc097", 1);
    globallogic::init();
    globallogic::setupcallbacks();
    allowed[0] = game_utility::getgametype();
    gameobjects::main(allowed);
    level.var_f257b1e13dcc1bad = 1;
    level.var_bb9f7907bbbb6221 = level.callbackplayerdamage;
    level.callbackplayerdamage = &callback_playerdamage;
    level.var_a12c755dc79cd6f3 = 1;
    level.bypassclasschoicefunc = &function_84008acb762a7ef1;
    level.var_8b5c3bda53460402 = &function_e16bbbc22561da38;
    level.var_5ae6eccb437278eb = &function_ca2f5eb96023632a;
    level.modeallowmeleevehicledamage = &modeallowmeleevehicledamage;
    level.var_46901be2468e1d90 = getdvarint(@"hash_8bb2a144372e07d4", 0);
    level.challengesallowed = level.playerxpenabled || getdvarint(@"hash_37acf332efd205cc");
    level.ondeadevent = &function_2e9a4609882eac19;
    level.updategameevents = &function_60945959dc72c726;
    level.var_436bef26c1525d89 = &function_cb2ac649cb6d62d0;
    level.onarmorboxusedbyplayer = &function_18cd28e7d4d24969;
    level.onplayerconnect = &onplayerconnect;
    level.onplayerdisconnect = &onplayerdisconnect;
    level.onsquadeliminated = &onsquadeliminated;
    level.var_72e0f43095476f99 = &function_bd3a035ddab0dcc9;
    level.dangerzoneskipequipment = 1;
    level.var_85f0faee1e7958bb = [0:"team_two_hundred"];
    level.blockweapondrops = 1;
    level.var_e97d3de5b99775a6 = 1;
    level.var_d040719163e20394 = 1;
    level.var_a7393a6994b4363e = "outbreak_data";
    level.var_15f48d5838e26ba0 = namespace_8aa4fb1371a5bc58::register();
    level.var_8444639c35405cca = ZMDialogueSpeaker::register();
    level.var_e5bcf78298395b30 = &function_7598488920e622ae;
    level.var_14a0183a6880d101 = &function_aa61408fb72dc08b;
    level.var_9b6d08310d681466 = &function_8cc97b15dad450c8;
    level.var_e06bf06822c7531f = &function_b248e38dd5a77fcd;
    level.var_237eaf521a80c304 = &function_99e3cf8371ae68c1;
    level.var_673320093d434d55 = &function_48e2b2093f89a4e8;
    level.var_74e0aae435a09a51 = &function_ee31102c771626f4;
    level.var_7f1d1c7c6153a9bf = &function_db2c28c97a3d712a;
    level.var_6beff7b631ab7e18 = &function_6beff7b631ab7e18;
    level.var_738bfbedf3eeea26 = &function_ed4cea9c4a149621;
    level.var_34fbfd58680be323 = &function_eac26a775e47b260;
    level.var_c08515cf7167fb94 = 1;
    level.var_c3934394c0f5cb03 = "deaths_door_ob";
    level.endgameontimelimit = 0;
    level.var_2690bfebdead0396 = 1;
    level.var_d3b5b44c28ca2aa1 = &function_7a39eeb69af299e0;
    level.modeplayerskipdialog = &modeplayerskipdialog;
    level.var_e1e56c150c2dbc72 = 1;
    level.var_6fbd98e2b09d3c26 = throttle::function_e4c99b0f178ffb98("dist_tracking", getdvarint(@"hash_a5863203bd890f51", 1));
    level.var_493c039ada7d082e = throttle::function_e4c99b0f178ffb98("log_starting_loadout", getdvarint(@"hash_7753e675e77cb21f", 1));
    level.var_b24b5841e002edae = throttle::function_e4c99b0f178ffb98("inc_rank_xp", getdvarint(@"hash_4261bac4ca06ff45", 1));
    level.var_e028ca551ecc95a3 = getdvarint(@"hash_38c2fc8b2e1387e8", 1);
    level.var_c24e4f076c66bfb4 = 1;
    level.var_93d3de5b393a5e89 = 1;
    utility::init_struct_class();
    namespace_1eca03131f47ef0e::initialize_create_script();
    oobtriggers = getentarray("OutOfBounds_ob", "targetname");
    if (oobtriggers.size > 0) {
        level.outofboundstriggers = oobtriggers;
    } else {
        level.outofboundstriggers = getentarray("OutOfBounds", "targetname");
    }
    level.var_2ceb2474be1c597e = &function_33b2acf105701c4d;
    namespace_f721fc7d0d2d0f47::function_5ea39cb95dd79f58();
    level.var_fac39a693f085779 = &namespace_f721fc7d0d2d0f47::function_4d8bb2d866771a10;
    level callback::add("region_difficulties_registered", &function_343b3930a1386979);
    namespace_da7f866501613d61::main();
    namespace_3dfa6eb6c5741630::init_gameskill();
    level._effect["vfx_gameplay_tier2_helmet_pop"] = loadfx("vfx/iw9/gameplay/mp/vfx_gameplay_tier2_helmet_pop.vfx");
    level._effect["vfx_gameplay_tier3_helmet_pop"] = loadfx("vfx/iw9/gameplay/mp/vfx_gameplay_tier3_helmet_pop.vfx");
    level.getspawnpoint = &function_396d5dfdb965e73;
    level.var_796ae5bb031f323d = &function_396d5dfdb965e73;
    level.onstartgametype = &function_afdf639b450a4c19;
    level.ongrenadeused = &ongrenadeused;
    level.var_dc475334f61b89d = &function_d767ce1c0752ce44;
    level.var_5a8e1ccd3a0fee5b = &function_c2adff26c86b4203;
    level.assists_disabled = 1;
    if (isusingmatchrulesdata()) {
        level.initializematchrules = &initializematchrules;
        [[ level.initializematchrules ]]();
        level thread game_utility::reinitializematchrulesonmigration();
    } else {
        game_utility::registertimelimitdvar(game_utility::getgametype(), 600);
        game_utility::registerscorelimitdvar(game_utility::getgametype(), 75);
        game_utility::registerroundlimitdvar(game_utility::getgametype(), 1);
        game_utility::registerwinlimitdvar(game_utility::getgametype(), 1);
        game_utility::registernumlivesdvar(game_utility::getgametype(), 0);
    }
    common::updatecommongametypedvars();
    setdefaultjiprules();
    level.var_9d28d5b70aa9f5e4 = &namespace_7a13d4762231d63e::function_9d28d5b70aa9f5e4;
    level thread function_fcc474b48416cd3c();
    callback::add("player_item_pickup", &on_item_pickup);
    callback::add("player_item_drop", &on_item_drop);
    callback::add("on_annihilated", &on_annihilated);
    callback::add("player_region_difficulty_change", &function_7df27b82b515cd2b);
    level callback::add("smokeGrenade_playerGiveBlindeye", &function_1b3eb5a063e1f355);
    level callback::add("smokeGrenade_playerRemoveBlindeye", &function_53603305ca469286);
    level callback::add("smoke_grenade_explode", &function_505b67932ed47333);
    level ui::lui_registercallback("toggle_camera_view", &function_4a39c5c1f9ea026f);
    function_45a63bc9c79a2b09();
    namespace_9571f642f38c8169::function_9c1a92865568b559();
    utility::registersharedfunc("instanceInventory", "preExtractItems", &function_49a36aa578018249);
    utility::registersharedfunc("instanceInventory", "postExtractItems", &function_85412e591c67b11f);
    utility::registersharedfunc("instanceInventory", "isMapToMapInfil", &function_baf75ba94ab12e1d);
    utility::registersharedfunc("sentry_gun", "monitorDamage", &namespace_8ef157d888576350::sentryturret_monitordamage);
    namespace_71eef510d7f364cf::registeronplayerspawncallback(&function_288e19381da612c4);
    utility::registersharedfunc("game", "getZoneDefForOrigin", &function_85644bb2a5b463d0);
    level thread function_3dc34d5302ed1876();
    level thread namespace_946ba58a8d1e7bfd::init();
    if (namespace_36f464722d326bbe::function_6493ec89ae923684()) {
        namespace_92443376a63aa4bd::initialize();
        level thread namespace_da125b44c190d236::function_c38398385afc10fc(1);
    }
    namespace_3bbb5a98b932c46f::function_1bacc798ac81809a("decoy_grenade", &function_e69695ef0a64f686);
    callback::add("onEnterVehicle", &function_9facdf4afd2a8414);
    level callback::callback("ob_season_main");
    namespace_3c37cb17ade254d::registersharedfunc("snapshot", "override_show_to", &namespace_ce72036f17f28af2::function_6fd4060b24c5926c);
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 16, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a21
// Size: 0x194
function function_33b2acf105701c4d(einflictor, eattacker, victim, idamage, idflags, smeansofdeath, var_d7bc24cd73dfc712, objweapon, vpoint, vdir, shitloc, psoffsettime, modelindex, partname, var_b0fc59ff15058522, var_be4285b26ed99ab1) {
    if (isdefined(smeansofdeath) && isdefined(einflictor) && isdefined(level.var_58e42ba69dd6c534) && smeansofdeath == "MOD_TRIGGER_HURT" && getdvarint(@"hash_7090570cbcf5e057", 1) && (is_equal(einflictor.dmg, 10000) || is_equal(einflictor.script_noteworthy, "trigger_hurt_below_map"))) {
        s_spawn = get_array_of_closest(self.origin, level.var_58e42ba69dd6c534)[0];
        if (isdefined(s_spawn)) {
            if (self isskydiving()) {
                self skydive_interrupt();
            }
            game_utility::fadetoblackforplayer(self, 1, 0);
            val::set("ob_kill_trigger_below_map_warp", "damage", 0);
            self setorigin(s_spawn.origin);
            level thread game_utility::fadetoblackforplayer(self, 0, 1);
            function_f9a207358d70923c(1, "disconnect", &val::reset, "ob_kill_trigger_below_map_warp", "damage");
            namespace_3e725f3cc58bddd3::function_403e958ecd04f255(victim, "Player fell through ground to kill trigger, warping to nearest spawn point instead");
            return 1;
        }
    }
    return 0;
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2bbd
// Size: 0x6c
function function_e69695ef0a64f686(grenade) {
    grenade endon("death");
    thread namespace_85b18538a4f2be70::decoy_used(grenade);
    grenade waittill("decoy_activated");
    grenade.attractor = function_c7a50ec2829c70b3(grenade, 1, grenade.var_8bf83d28be4c2d4f.bundle.var_3b8cd7cf44335571, 0, undefined, &function_79b2d283ccebd40d, 0, undefined, 1);
    grenade thread function_79cbe6d4fa8dc740();
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c30
// Size: 0x28
function function_79cbe6d4fa8dc740() {
    self waittill("death");
    if (isdefined(self.attractor)) {
        function_349b67890a05c376(self.attractor);
    }
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c5f
// Size: 0x2a
function function_79b2d283ccebd40d(attractor, ai) {
    return is_equal(ai.aicategory, "normal");
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2c91
// Size: 0xcb
function private function_3dc34d5302ed1876() {
    level endon("game_ended");
    while (1) {
        while (!isdefined(level.players) || level.players.size == 0) {
            waitframe();
        }
        while (1) {
            if (getdvarint(@"hash_3e28e5148669b319", 0) == 1) {
                break;
            }
            waitframe();
        }
        host = namespace_e6eafa63d63ab54d::devfindhost();
        while (1) {
            if (isdefined(host)) {
                host.radarmode = "fast_radar";
                host.radarshowenemydirection = 1;
                host.hasradar = 1;
                triggeroneoffradarsweep(host);
            } else {
                break;
            }
            if (getdvarint(@"hash_3e28e5148669b319", 0) == 0) {
                break;
            }
            wait(0.2);
        }
        waitframe();
    }
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2d63
// Size: 0x46
function private function_ed4cea9c4a149621(instances) {
    var_e6c053e28858ae8b = instances;
    if (isdefined(level.var_c383b967aa7e551b)) {
        var_e6c053e28858ae8b = [[ level.var_c383b967aa7e551b ]]("kiosk", instances, &namespace_59a9ea269513a828::function_51f6eab92b227b84);
        namespace_59a9ea269513a828::setspawninstances(var_e6c053e28858ae8b);
    }
    return var_e6c053e28858ae8b;
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2db1
// Size: 0x2d
function private function_eac26a775e47b260(instances) {
    if (isdefined(level.var_c383b967aa7e551b)) {
        instances = [[ level.var_c383b967aa7e551b ]]("ammo_restock", instances);
    }
    return instances;
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2de6
// Size: 0xfb
function private function_7598488920e622ae(var_8c55111e0c85f768, deathworm) {
    s_bundle = getscriptbundle("bosshealthbar:" + var_8c55111e0c85f768);
    if (isdefined(s_bundle)) {
        level.var_cae1a9afa788d36 = utility::function_53c4c53197386572(s_bundle.var_57f17703d0c54bd5, 500);
        level.var_cae1a9afa788d36 = int(level.var_cae1a9afa788d36);
        if (!level.var_15f48d5838e26ba0 namespace_8aa4fb1371a5bc58::is_open(self)) {
            level.var_15f48d5838e26ba0 namespace_8aa4fb1371a5bc58::open(self);
        }
        if (isdefined(s_bundle.icon)) {
            level.var_15f48d5838e26ba0 namespace_8aa4fb1371a5bc58::function_c4b608fac8636725(self, s_bundle.icon);
        }
        if (isdefined(s_bundle.var_47bde44b1acec603)) {
            level.var_15f48d5838e26ba0 namespace_8aa4fb1371a5bc58::function_fa61dfb76d14641f(self, s_bundle.var_47bde44b1acec603);
        }
        function_8cc97b15dad450c8(deathworm.health, deathworm.maxhealth);
    }
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2ee8
// Size: 0x27
function private function_aa61408fb72dc08b() {
    if (level.var_15f48d5838e26ba0 namespace_8aa4fb1371a5bc58::is_open(self)) {
        level.var_15f48d5838e26ba0 namespace_8aa4fb1371a5bc58::close(self);
    }
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2f16
// Size: 0xa4
function private function_8cc97b15dad450c8(health, maxhealth) {
    if (!isdefined(health)) {
        health = 0;
    }
    if (!isdefined(maxhealth)) {
        maxhealth = 1;
    }
    if (level.var_15f48d5838e26ba0 namespace_8aa4fb1371a5bc58::is_open(self)) {
        maxwidth = 500;
        if (isdefined(level.var_cae1a9afa788d36)) {
            maxwidth = level.var_cae1a9afa788d36;
        }
        var_1b60b445e73cfb77 = health / maxhealth;
        if (health <= 0 || maxhealth == 1) {
            var_1b60b445e73cfb77 = 0;
        }
        var_f2dfc5643b7c0d56 = int(maxwidth * var_1b60b445e73cfb77);
        level.var_15f48d5838e26ba0 namespace_8aa4fb1371a5bc58::function_4032c55b1a2de180(self, var_f2dfc5643b7c0d56);
    }
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2fc1
// Size: 0x64
function private function_b248e38dd5a77fcd(health) {
    if (!isdefined(health)) {
        health = 0;
    }
    if (level.var_15f48d5838e26ba0 namespace_8aa4fb1371a5bc58::is_open(self)) {
        if (isdefined(self.var_1d9b646d4823feea) && health < self.var_1d9b646d4823feea) {
            level.var_15f48d5838e26ba0 namespace_8aa4fb1371a5bc58::function_7996b90ec9893e23(self, gettime());
        }
        self.var_1d9b646d4823feea = health;
    }
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x302c
// Size: 0x147
function private function_99e3cf8371ae68c1(var_cf8b5ceaf91df155) {
    if (!(isdefined(level.var_8444639c35405cca.menuname) && isdefined(level.var_8444639c35405cca) && isdefined(level.var_8444639c35405cca.var_ac8a9214e8d6e5ec))) {
        /#
            assertmsg("Trying to show the zmdialoguespeaker widget, but the lui elem wasn't registered and defined correctly!");
        #/
        return;
    }
    if (!isplayer(self)) {
        /#
            assertmsg("Trying to show the zmdialoguespeaker widget on an invalid player!");
        #/
        return;
    }
    if (!isdefined(var_cf8b5ceaf91df155)) {
        /#
            assertmsg("Trying to show the zmdialoguespeaker widget without a defined dialoguespeaker bundle name");
        #/
        return;
    }
    s_bundle = getscriptbundle("dialoguespeaker:" + var_cf8b5ceaf91df155);
    if (isdefined(s_bundle)) {
        if (!level.var_8444639c35405cca ZMDialogueSpeaker::is_open(self)) {
            level.var_8444639c35405cca ZMDialogueSpeaker::open(self);
        }
        if (isdefined(s_bundle.var_eee68c7035b2d0ae)) {
            level.var_8444639c35405cca ZMDialogueSpeaker::function_3ca4dc52553bad2f(self, s_bundle.var_eee68c7035b2d0ae);
        }
        if (isdefined(s_bundle.displayname)) {
            level.var_8444639c35405cca ZMDialogueSpeaker::function_8648e60d64e52121(self, s_bundle.displayname);
        }
        level.var_8444639c35405cca ZMDialogueSpeaker::function_5afa8b0a91952746(self, isdefined(s_bundle.isenemy) ? 0 : s_bundle.isenemy);
    }
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x317a
// Size: 0x89
function private function_48e2b2093f89a4e8() {
    if (!(isdefined(level.var_8444639c35405cca.menuname) && isdefined(level.var_8444639c35405cca) && isdefined(level.var_8444639c35405cca.var_ac8a9214e8d6e5ec))) {
        /#
            assertmsg("Trying to hide the zmdialoguespeaker widget, but the lui elem wasn't registered and defined!");
        #/
        return;
    }
    if (!isplayer(self)) {
        /#
            assertmsg("Trying to hide the zmdialoguespeaker widget on an invalid player!");
        #/
        return;
    }
    if (level.var_8444639c35405cca ZMDialogueSpeaker::is_open(self)) {
        level.var_8444639c35405cca ZMDialogueSpeaker::close(self);
    }
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x320a
// Size: 0x32
function on_item_pickup(params) {
    if (isdefined(params.item.var_f016f62ad7a79d67)) {
        level utility::flag_set("act1_keycard");
    }
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3243
// Size: 0xc
function on_item_drop(params) {
    
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3256
// Size: 0x58
function on_annihilated(params) {
    if (istrue(self.nuked) || istrue(self.var_7e4b076a06c6df27) || istrue(self.var_c23519e9c077ebc)) {
        return;
    }
    if (utility::function_51d76700600cebe3(20)) {
        namespace_49e179ec476603d6::function_cd45408bd44fab07("ob_jup_items_zombie_gibbed_droplist", 1, self.origin);
    }
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x32b5
// Size: 0x3b
function modeplayerskipdialog(dialog) {
    if (dialog == "offense_obj" || dialog == "mission_draw" || dialog == "mission_success" || dialog == "mission_failure") {
        return 1;
    }
    return 0;
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x32f8
// Size: 0x74
function function_7a39eeb69af299e0() {
    level.var_5f9eb8185e287adc = &function_1cb9f6a2397a8029;
    level.var_6bb18d8a44b66427 = &function_e4f409bebdee4fed;
    callback::add("on_zombie_ai_killed", &function_8f03fce85cb043d5);
    callback::add("player_item_pickup", &function_45279ed0cd9297f7);
    callback::add("magicbox_purchase", &function_a586c61edc5b2d51);
    callback::add("on_exfil_start", &function_bb3d7c57073c4aa8);
    callback::add("player_vehicle_enter", &function_d13bd3464dfaf89a);
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3373
// Size: 0x77
function function_d13bd3464dfaf89a(params) {
    if (is_equal(params.seatid, "driver")) {
        if (params.vehicle namespace_dbbb37eb352edf96::ishelicopter() || params.vehicle namespace_1f188a13f7e79610::vehiclecanfly()) {
            level thread namespace_25c5a6f43bb97b43::trysaylocalsound(self, #"hash_7f9cb44aa4541be7");
        } else {
            level thread namespace_25c5a6f43bb97b43::trysaylocalsound(self, #"hash_6cf4b973d23bd8ba");
        }
    }
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x33f1
// Size: 0x3c
function function_bb3d7c57073c4aa8(params) {
    if (isplayer(params.var_985e82f034f67960)) {
        level thread namespace_25c5a6f43bb97b43::trysaylocalsound(params.var_985e82f034f67960, #"hash_b39b603ba5e4e6ef");
    }
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3434
// Size: 0x5f
function function_a586c61edc5b2d51(params) {
    if ((utility::cointoss() || getdvarint(@"hash_554f88d64e501ed2", 0)) && is_equal(params.itembundle.type, "killstreak")) {
        level thread namespace_25c5a6f43bb97b43::trysaylocalsound(self, #"hash_a30a3abc55466355");
    }
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x349a
// Size: 0x5f
function function_45279ed0cd9297f7(params) {
    if ((utility::cointoss() || getdvarint(@"hash_554f88d64e501ed2", 0)) && is_equal(params.itembundle.type, "killstreak")) {
        level thread namespace_25c5a6f43bb97b43::trysaylocalsound(self, #"hash_a30a3abc55466355");
    }
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3500
// Size: 0x65d
function function_1cb9f6a2397a8029(var_c1074ab6cac2169f, pingType, var_394466c2ddb208cb) {
    if (isdefined(var_c1074ab6cac2169f)) {
        var_441ca18938f023ef = isdefined(var_c1074ab6cac2169f.type) ? var_c1074ab6cac2169f.model : var_c1074ab6cac2169f.type;
    }
    if (namespace_a655003e419fc731::function_c648f0fd527e089a(pingType)) {
        /#
            iprintln("ammo_restock");
        #/
        var_fbe755f0978c0369 = namespace_49e179ec476603d6::function_2cdc55ba39d97d70(var_441ca18938f023ef);
        if (isdefined(var_fbe755f0978c0369)) {
            itembundle = getscriptbundle("itemspawnentry:" + var_fbe755f0978c0369);
            if (isdefined(itembundle.var_317afc5dabc1c012)) {
                return itembundle.var_317afc5dabc1c012;
            }
        }
        var_bb224cee75d433a2 = self function_a7e757d42b550a6(var_394466c2ddb208cb);
        var_418ea881b6484748 = self function_31f315111c6a03c2(var_bb224cee75d433a2);
        if (isdefined(var_418ea881b6484748) && var_418ea881b6484748 != "") {
            return var_418ea881b6484748;
        }
        if (var_c1074ab6cac2169f.type == "dmz_secret_stash") {
            return #"hash_9b1c153f9b3277ef";
        }
        if (issubstr(var_441ca18938f023ef, "exfil")) {
            return #"hash_c78fbe4067075afd";
        } else if (issubstr(var_441ca18938f023ef, "loot_crystal")) {
            return #"hash_c4245f93518dbd73";
        } else if (isdefined(var_c1074ab6cac2169f.var_a2738a1d42906829)) {
            return #"hash_c8eec66ea8257c2e";
        } else if (issubstr(var_441ca18938f023ef, "wallbuy") || issubstr(var_441ca18938f023ef, "chalk")) {
            return #"hash_f1a6082d11c9008b";
        } else if (issubstr(var_441ca18938f023ef, "activity_starter")) {
            return #"hash_f2a9ff4e59bb1f21";
        } else if (issubstr(var_441ca18938f023ef, "stronghold_center_objective_marker")) {
            return #"hash_aa0b34e2e32d1de8";
        } else if (issubstr(var_441ca18938f023ef, "jup_ob_objective_marker_warlord")) {
            return #"hash_3aa159a106af653d";
        } else if (issubstr(var_441ca18938f023ef, "fortress")) {
            return #"hash_a468b6bbf3ba3b66";
        } else if (issubstr(var_441ca18938f023ef, "redeploy_drone")) {
            return #"hash_ff0ba9fee164bf08";
        } else if (issubstr(var_441ca18938f023ef, "radio_intel")) {
            return #"hash_b1d7574a7b10b691";
        } else if (issubstr(var_441ca18938f023ef, "intel")) {
            return #"hash_2dd6d8e505e44f82";
        } else if (is_equal(var_441ca18938f023ef, "ks_sentry_turret_mp") && isdefined(var_c1074ab6cac2169f.entity) && is_equal(var_c1074ab6cac2169f.entity.team, "team_hundred_ninety")) {
            return #"hash_2fc2274289b135cf";
        } else {
            switch (var_441ca18938f023ef) {
            case #"hash_a5a46576f54f77c8":
                return #"hash_154a8d9b8c8bdf";
            case #"hash_debe4d6797ce42ca":
                return #"hash_8a891dba3da6d08d";
            case #"hash_8e4eed35719de7f":
                return #"hash_c8eec66ea8257c2e";
            case #"hash_f1b7e128d54c7c3e":
                return #"hash_2b9fcc982b5a4fbf";
            case #"hash_5cd51a3ed5e7a8a7":
            case #"hash_d6837f50b1564421":
                return #"hash_a468b6bbf3ba3b66";
            case #"hash_9345a268cf04e0e4":
            case #"hash_d6b5e1486d1ce81d":
                return #"hash_950a284047c4c938";
            case #"hash_7a9b70fe784edb0b":
            case #"hash_c4e1cdfcbfebe45e":
                return #"hash_eaa53bfce6bb4ae1";
                break;
            }
        }
    } else if (pingType == 23) {
        /#
            iprintln("OB CalloutMarkerPing: Invalid type when trying to play audio for creating a callout marker ping.");
        #/
    } else if (function_d3789a9a4be5df2e(pingType) && (pingType != 6 || function_cb9269a1545ad6e4(var_c1074ab6cac2169f)) && pingType != 18 && pingType != 17) {
        /#
            iprintln("ob_zombie_encounter_");
        #/
        if (isagent(var_c1074ab6cac2169f) && !is_equal(var_c1074ab6cac2169f.team, self.team)) {
            if (isdefined(var_c1074ab6cac2169f.subclass) && issubstr(var_c1074ab6cac2169f.subclass, "warlord")) {
                switch (var_c1074ab6cac2169f.subclass) {
                case #"hash_d646bb7570717551":
                    return #"hash_b5bf64ea3b7fd57a";
                case #"hash_8c92249632740ac":
                    return #"hash_55b23610aca1b661";
                case #"hash_12daa0cbf50f6442":
                    return #"hash_4d7a96200323c60f";
                case #"hash_dde105a699b160b3":
                    return #"hash_737f4d71377a633e";
                default:
                    return #"hash_3aa159a106af653d";
                    break;
                }
            } else if (utility::is_equal(var_c1074ab6cac2169f.subclass, "zombie_hellhound")) {
                return #"hash_5981595ea973f4f1";
            } else if (isdefined(var_c1074ab6cac2169f.aicategory)) {
                switch (var_c1074ab6cac2169f.aicategory) {
                case #"hash_84fcf5e68d7230b2":
                    return #"hash_92665c161fc68e36";
                case #"hash_8c089e813083e510":
                    return #"hash_e418c8c513e65349";
                case #"hash_7b0e2f2ed84f34":
                    return #"hash_e418c8c513e65349";
                case #"hash_7e8a002ed096276c":
                    return #"hash_5290c24b34095a36";
                    break;
                }
            }
        } else if (isdefined(var_441ca18938f023ef) && issubstr(var_441ca18938f023ef, "power_up")) {
            return #"hash_74becbb39994d5b0";
        }
    } else if (function_74ec310d8f99b6e2(pingType)) {
        /#
            iprintln("Outbreak Round Number Difficulty requires an origin passed in");
        #/
    } else if (function_87df78670540e9b2(pingType)) {
        /#
            iprintln("setIgnoredByMercs");
        #/
    } else {
        switch (pingType) {
        case 17:
            /#
                iprintln("shotsFired");
            #/
        case 18:
            /#
                iprintln("poisVisited");
            #/
        case 2:
            /#
                iprintln(", member index of: ");
            #/
            break;
        case 6:
            /#
                iprintln("mpProgression");
            #/
            if (utility::is_equal(var_c1074ab6cac2169f.vehiclename, "veh9_motorcycle_blood_burner")) {
                return #"hash_8edd32c4be918070";
            }
            break;
        case 4:
            /#
                iprintln("<unknown string>");
            #/
            break;
        default:
            /#
                assertmsg("OB CalloutMarkerPing: Invalid type when trying to play audio for creating a callout marker ping.");
            #/
            break;
        }
    }
    return undefined;
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3b65
// Size: 0x90
function function_e4f409bebdee4fed(lootid) {
    var_39f686831584c7e6 = getscriptbundle(%"hash_4074433960d5a78c");
    /#
        assert(isdefined(var_39f686831584c7e6));
    #/
    var_60ce74182e7c83a7 = function_3475769c002400f7(lootid);
    var_db96936d84ec563b = "calloutmarkerpingitem:" + var_60ce74182e7c83a7.var_cb325ddb4a764623;
    calloutmarkerpingitem = getscriptbundle(var_db96936d84ec563b);
    if (isdefined(calloutmarkerpingitem) && isdefined(calloutmarkerpingitem.var_c4e1d2ee105cfd3b)) {
        return calloutmarkerpingitem.var_c4e1d2ee105cfd3b;
    }
    return undefined;
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3bfd
// Size: 0x127
function function_8f03fce85cb043d5(params) {
    var_3b5afcfeed8fb9cf = params.eattacker;
    if (isdefined(var_3b5afcfeed8fb9cf) && !isplayer(var_3b5afcfeed8fb9cf) && isplayer(var_3b5afcfeed8fb9cf.owner)) {
        var_3b5afcfeed8fb9cf = var_3b5afcfeed8fb9cf.owner;
    }
    if (isplayer(var_3b5afcfeed8fb9cf)) {
        if (isdefined(self.aicategory)) {
            switch (self.aicategory) {
            case #"hash_7b0e2f2ed84f34":
            case #"hash_8c089e813083e510":
                if (utility::function_51d76700600cebe3(25) || getdvarint(@"hash_554f88d64e501ed2", 0)) {
                    level thread namespace_20260f65229aa888::trysaylocalsound(var_3b5afcfeed8fb9cf, #"hash_f32d3ee94cbf425d");
                }
                break;
            case #"hash_7e8a002ed096276c":
                level thread namespace_20260f65229aa888::trysaylocalsound(var_3b5afcfeed8fb9cf, #"hash_f32d3ee94cbf425d");
                break;
            default:
                if (utility::function_51d76700600cebe3(5) || getdvarint(@"hash_554f88d64e501ed2", 0)) {
                    level thread namespace_20260f65229aa888::trysaylocalsound(var_3b5afcfeed8fb9cf, #"hash_68440e05ab6dbbdf");
                }
                break;
            }
        }
    }
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3d2b
// Size: 0xf3
function function_46de22e10ed21cd0() {
    var_74063b398a2f879b = [0:"default"];
    var_18d19628e8dc9f1a = [0:"mp_jup_bigmap", 1:"mp_jup_st_a", 2:"mp_jup_st_b", 3:"mp_jup_st_c", 4:"mp_jup_st_d", 5:"mp_jup_st_e", 6:"mp_jup_st_f", 7:"mp_jup_st_g", 8:"mp_jup_st_h", 9:"mp_jup_st_i", 10:"mp_jup_resort_gw", 11:"mp_jup_gw_fallout", 12:"mp_jup_st_c_gw"];
    mapname = game_utility::getmapname();
    var_c51d521d350684ce = utility::array_contains(var_18d19628e8dc9f1a, mapname);
    if (istrue(var_c51d521d350684ce)) {
        var_74063b398a2f879b = [0:"none", 1:"default", 2:"exterior", 3:"partcover", 4:"dyn_interior"];
    }
    return var_74063b398a2f879b;
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3e26
// Size: 0x93
function function_274e4192b9067e40() {
    namespace_f86ba2003950072a::function_f1aed36ab4598ea("mp_jup_st_e_OB");
    wait(1);
    setglobalsoundcontext("gametype", "outbreak");
    var_74063b398a2f879b = function_46de22e10ed21cd0();
    foreach (state_id in var_74063b398a2f879b) {
        if (state_id != "none") {
            setaudiotriggerstate(state_id, "outbreak", 0.1);
        }
    }
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3ec0
// Size: 0x11b
function function_7df27b82b515cd2b(params) {
    if (isdefined(params) && isdefined(params.player)) {
        if (isdefined(params.var_4225006ce1ae149b)) {
            switch (params.var_4225006ce1ae149b) {
            case #"hash_5343b465e56ec9a4":
            case #"hash_651f76c0ad6741ec":
                state = "outbreak_red";
                break;
            case #"hash_7bb2cd766703d463":
            case #"hash_af83e47edfa8900a":
            default:
                state = "outbreak";
                break;
            }
        } else {
            state = "outbreak";
        }
        var_74063b398a2f879b = function_46de22e10ed21cd0();
        foreach (state_id in var_74063b398a2f879b) {
            if (state_id != "none") {
                setaudiotriggerstate(state_id, state, 2, params.player);
            }
        }
    }
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3fe2
// Size: 0x294
function function_fcc474b48416cd3c() {
    /#
        level thread function_d148aaa8f95a4fff();
    #/
    level.var_b9c6856f5ab5f70f = 1;
    level thread namespace_7045c8949b4275bb::function_af225185d1ae2dee();
    level thread function_274e4192b9067e40();
    level.var_bfa98c9dd6edb929 = 1;
    namespace_2e04133215e83a48::function_9623157b28098d1();
    level thread brainrot::function_dc7d8af03fc44b91();
    level thread deadwire::function_f0091083ed1767b();
    level thread napalmburst::function_c1459cd4ebd856d();
    level thread cryofreeze::function_859b069af3e87322();
    level thread shatterblast::function_17e4e24746f8c9ed();
    scriptable::scriptable_addusedcallback(&function_61df948774b422f4);
    currency::function_cca1bcebd7aa11cf("essence", &points::function_b86115649d705017, &points::function_5fb17ad4d286b0d5, &points::function_b5b4f530f1c579aa, &points::function_e04a2325dbe8153c, "ui_zm_core_purchase_success", "ui_zm_core_purchase_deny");
    currency::function_73faeac34c359ddb();
    points::init();
    namespace_7bf99ef58659a6f1::init();
    field_upgrades::init();
    namespace_ec6836c9475c9d18::init();
    parachute::initparachutedvars();
    namespace_22b8ba12655bf3f2::function_40eca5c2157229bc(3);
    namespace_d491530661d3e380::function_eb4aeba58080eb81();
    ob_laststand::function_77d7e4f0ae4fa9be();
    namespace_fd7d952a8a7decb8::function_84c0e1e271bafa7b();
    level.armoronweaponswitchlongpress = 1;
    ob_armor::function_876c219bf2b0fbd7();
    ammopouch::function_ef91a8aa458ff9fd();
    namespace_96c4059aa2eabfb8::function_5108bb8dbe090131();
    namespace_313fdf6399ae3408::function_bf1fbf65d3f8b503();
    namespace_bfa7544d6e21dd10::function_d3124a8270438a63();
    namespace_3ffbdf8bac74c31e::function_58adef5faf094375();
    namespace_41d841f881f9d22e::main();
    events::function_4a4d0d400fd59760();
    ob_dog_whistle::function_d18f1e707dc52a0d();
    ob_golden_ammo::function_93c0f40d62257166();
    namespace_9dcaa84266dc73e2::function_ea5d8dfcc9a28411();
    namespace_5c6deef041b03f11::function_d3befda2a868e1ac();
    function_3d14cacc473cb79();
    function_ffe061106577a7fb();
    function_71e0f441c3360430();
    status_effects::function_e82e8aa41de42513();
    init_vehicles();
    monkey_bomb::function_9cb7762eeb57f57c();
    inhibitor::function_3670f4d8dcce3aec();
    utility::registersharedfunc("ai", "gasGrenade_onGasTrigger", &function_b66c2c1b9c04631b);
    function_36474fc103a73cce();
    namespace_166fd5d99fbeb429::function_75d03a2a8cb2b64();
    analytics::init();
    ob_achievements::init();
    if (!isdefined(level.var_a9e2544b9283299b) && !function_db2c28c97a3d712a()) {
        namespace_fdfa10f30c513cd7::init();
    }
    /#
        namespace_58d533f0698acd6e::init();
    #/
    callback::add("player_connect", &on_connect);
    callback::add("player_spawned", &on_player_spawned);
    callback::add("player_disconnect", &on_disconnect);
    level.onplayerkilled = &on_player_killed;
    utility::registersharedfunc("game", "roundNumberDifficulty", &function_bc2c336bb063d22b);
    utility::registersharedfunc("ping", "calloutMarkerPing_markerAdded", &function_82b91b5e6174a654);
    utility::registersharedfunc("game", "getTimePassed", &game_utility::gettimepassed);
    if (getdvarint(@"hash_6ebe0f78818af7e2", 1)) {
        utility::registersharedfunc("entity", "trackEntityLimit", &function_19b0c4d24e6a74cb);
    }
    utility::flag_set("ob_systems_init_complete");
    waitframe();
    function_57e7e438cb3b5e4f();
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x427d
// Size: 0x1f9
function function_57e7e438cb3b5e4f() {
    namespace_1c689dd3986a841c::function_daa39d0822248e1c();
    namespace_1c689dd3986a841c::function_9711795c6c786e25("ob_zombie_biome_", "ob_zombie_encounter_");
    function_b3b7fbaf621805a7();
    thread namespace_46b675bc0fc6663b::function_45657962a8ad47e();
    thread namespace_7d237edd1e605b4c::function_fb9de2c84b81e225();
    namespace_4e16584f2211900a::function_3e419ffd7ff0650d();
    thread namespace_9e69d66f68c38a10::init();
    flags::gameflaginit("br_ready_to_jump", 0);
    wallbuy::function_c540b0eec3efbd34();
    magicbox::init_magicbox();
    pack_a_punch::init_pap();
    level.var_780248e36eabf6ef = &function_e38bf93f560abe62;
    if (isdefined(level.var_b51ebd08f0b6ca86)) {
        [[ level.var_b51ebd08f0b6ca86 ]]();
    }
    level.vending_machines_powered_on_at_start = 1;
    zombie_perks::function_fafc515c560fe4a5();
    perk_deadshot::function_d87a1d30e15f1c8b(currency::function_bc4d94fa05ac7078("specialty_deadshot"), currency::get_perk_machine_cost("specialty_deadshot"));
    perk_death_perception::function_3898a008fcd449e9(currency::function_bc4d94fa05ac7078("specialty_death_perception"), currency::get_perk_machine_cost("specialty_death_perception"));
    perk_elemental_pop::function_1c48a1ed54087b1a(currency::function_bc4d94fa05ac7078("specialty_elemental_pop"), currency::get_perk_machine_cost("specialty_elemental_pop"));
    namespace_6b5a8728ab049d92::function_1ddcb2ee8addbf81(currency::function_bc4d94fa05ac7078("specialty_juggernog"), currency::get_perk_machine_cost("specialty_juggernog"));
    perk_quick_revive::function_5282518f868ab7b6(currency::function_bc4d94fa05ac7078("specialty_quickrevive"), currency::get_perk_machine_cost("specialty_quickrevive"));
    namespace_2e3ee09106b36548::function_15b91450d5e5b2e3(currency::function_bc4d94fa05ac7078("specialty_speedcola"), currency::get_perk_machine_cost("specialty_speedcola"));
    perk_staminup::function_e7866458a76d3194(currency::function_bc4d94fa05ac7078("specialty_staminup"), currency::get_perk_machine_cost("specialty_staminup"));
    perk_tombstone::function_ce82f1d47d2e5a58(currency::function_bc4d94fa05ac7078("specialty_tombstone"), currency::get_perk_machine_cost("specialty_tombstone"));
    perk_phd_flopper::function_ae33e22bc25c3920(currency::function_bc4d94fa05ac7078("specialty_phd_flopper"), currency::get_perk_machine_cost("specialty_phd_flopper"));
    perk_machines::function_c349718d60cc262b();
    level.var_50e605b4f0a0152b = &ammopouch::function_3af8e1abc2693305;
    level.var_27475bb0d1b06044 = &namespace_c8f50c27f5dd5ed8::function_b60c68caa2f279ab;
    namespace_49e179ec476603d6::function_c7c12eafa3215cfe();
    level thread namespace_abf9477bf4a0e36e::function_ef875512a592bbc1();
    namespace_6f5afea353b0d311::function_251cd47c5242ae4f();
    namespace_848c7a35c6f1e038::function_4c10c992dc615a41();
    loot_crystal::function_f009d47735dc7adb();
    namespace_bfa7544d6e21dd10::function_a1a83a29e4afe4f1();
    level thread function_a3bdf4d8d5e826c3();
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x447d
// Size: 0xb4
function function_625e25d24c7174e5(var_164d9f47cd7fa3ba) {
    if (utility::flag_exist("mp_jup_st_" + var_164d9f47cd7fa3ba + "_ob_wallbuys_cs")) {
        utility::flag_wait("mp_jup_st_" + var_164d9f47cd7fa3ba + "_ob_wallbuys_cs_completed");
    }
    if (utility::flag_exist("mp_jup_st_" + var_164d9f47cd7fa3ba + "_ob_essence_cs")) {
        utility::flag_wait("mp_jup_st_" + var_164d9f47cd7fa3ba + "_ob_essence_cs_completed");
    }
    if (utility::flag_exist("mp_jup_st_" + var_164d9f47cd7fa3ba + "_ob_crystals_cs")) {
        utility::flag_wait("mp_jup_st_" + var_164d9f47cd7fa3ba + "_ob_crystals_cs_completed");
    }
    if (utility::flag_exist("mp_jup_st_" + var_164d9f47cd7fa3ba + "_ob_machines_cs")) {
        utility::flag_wait("mp_jup_st_" + var_164d9f47cd7fa3ba + "_ob_machines_cs_completed");
    }
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4538
// Size: 0xb7
function function_a3bdf4d8d5e826c3() {
    level endon("game_ended");
    waitframe();
    tiles = [8:"i", 7:"h", 6:"g", 5:"f", 4:"e", 3:"d", 2:"c", 1:"b", 0:"a"];
    foreach (var_4557a9f6c57d2fbd in tiles) {
        function_625e25d24c7174e5(var_4557a9f6c57d2fbd);
    }
    callback::callback("ob_content_process_create_script");
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x45f6
// Size: 0x99
function function_343b3930a1386979(params) {
    namespace_cbce72e68c388ef8::function_b4bf8c9d70e9be33();
    function_e6d0e960a0b97e21();
    namespace_b21ca9bc612fd35e::function_4b13a4ad54f972d();
    namespace_27d2b4ad2e567ea4::function_59637079f05a9d7d();
    namespace_24722a171904c83b::init();
    level.var_61a5fdd9ce50aa4a = &namespace_24722a171904c83b::function_4318321c0172ec43;
    namespace_d33f59adf1371d04::function_e3728e23c67c0893();
    function_e8fd71c7bb0267ff();
    if (istrue(level.var_5a66999895b55b96)) {
        namespace_ad1f398af6f48cb1::function_ca19e36a62160d1b();
    }
    utility::flag_wait("content_manager_initialized");
    function_fc8c1362ca8c5f5();
    namespace_41bcc2f40ffd0e7f::function_3afebc739584a9a();
    thread function_c5e1b4bc550bbad6();
    thread perk_machines::function_c224859356dbfd3d();
    level thread function_ba935ae14946095d();
    ob_intel::function_d84b63f3cd2befe();
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4696
// Size: 0x4a
function function_36474fc103a73cce() {
    level.var_b63a9d517e0e0769 = [];
    level.var_b63a9d517e0e0769[0] = 50;
    level.var_b63a9d517e0e0769[1] = 100;
    level.var_b63a9d517e0e0769[2] = 400;
    level.var_b63a9d517e0e0769[3] = 800;
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x46e7
// Size: 0x255
function function_b66c2c1b9c04631b(gas_trigger) {
    self endon("death");
    if (!isagent(self)) {
        return;
    }
    var_7ad31e3b5afe6770 = 0;
    var_d54a458af0ade7cb = 1;
    if (is_equal(self.type, "zombie")) {
        if (isdefined(self.aicategory)) {
            switch (self.aicategory) {
            case #"hash_8c089e813083e510":
                var_7ad31e3b5afe6770 = 0.05;
                var_d54a458af0ade7cb = 0.5;
                break;
            case #"hash_7b0e2f2ed84f34":
                var_7ad31e3b5afe6770 = 0.025;
                var_d54a458af0ade7cb = 0.5;
                break;
            case #"hash_7e8a002ed096276c":
                var_7ad31e3b5afe6770 = 0.001;
                break;
            default:
                var_7ad31e3b5afe6770 = 0.05;
                var_d54a458af0ade7cb = 0.5;
                break;
            }
        }
    } else if (ai::function_74368588170b0497()) {
        var_7ad31e3b5afe6770 = 0.025;
    } else if (is_equal(self.type, "human")) {
        var_d54a458af0ade7cb = 0.5;
        switch (self.subclass) {
        case #"hash_91cd18ea8bf6d95":
            var_7ad31e3b5afe6770 = 0.05;
            break;
        case #"hash_3c0ffb3dab1a9835":
            var_7ad31e3b5afe6770 = 0.025;
            break;
        default:
            var_7ad31e3b5afe6770 = 0.05;
            break;
        }
    }
    current_time = gettime();
    if (var_7ad31e3b5afe6770 > 0 && (!isdefined(self.var_45483f8609f54440) || self.var_45483f8609f54440 + 1000 <= current_time)) {
        if (istrue(gas_trigger.var_10be75cd2cd034e5)) {
            var_644363c75207158d = function_53c4c53197386572(gas_trigger.var_644363c75207158d, 0);
            var_2e59da2fb9ec32ac = level.var_b63a9d517e0e0769[var_644363c75207158d];
        } else {
            if (!isdefined(self.maxhealth)) {
                self.maxhealth = self.health;
            }
            var_2e59da2fb9ec32ac = self.maxhealth * var_7ad31e3b5afe6770;
        }
        self dodamage(var_2e59da2fb9ec32ac, self.origin, gas_trigger.owner, gas_trigger, "MOD_ELEMENTAL_TOXIC");
        self.var_45483f8609f54440 = current_time;
    }
    if (var_d54a458af0ade7cb < 1) {
        namespace_5e5b12854e72824d::slow("gasgrenade", var_d54a458af0ade7cb, 1, gas_trigger.owner);
    }
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4943
// Size: 0x41
function function_bc2c336bb063d22b(v_origin) {
    /#
        assertex(isdefined(v_origin), "Outbreak Round Number Difficulty requires an origin passed in");
    #/
    str_difficulty = namespace_f721fc7d0d2d0f47::function_4d8bb2d866771a10(v_origin);
    n_round = namespace_f721fc7d0d2d0f47::function_300a6f8c556edf34(str_difficulty);
    return n_round;
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x498c
// Size: 0x71
function function_82b91b5e6174a654(var_93a0836a10e99c34, var_394466c2ddb208cb) {
    target = namespace_a655003e419fc731::function_b6cb97b6f81f0fd2(var_93a0836a10e99c34, var_394466c2ddb208cb);
    params = spawnstruct();
    params.player = var_93a0836a10e99c34;
    params.var_394466c2ddb208cb = var_394466c2ddb208cb;
    params.obj = target;
    if (isdefined(target)) {
        target callback::callback("on_ping", params);
    }
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4a04
// Size: 0x19
function init_vehicles() {
    /#
        namespace_acac8960cc6d8d64::function_e6f128a1e529f457();
    #/
    namespace_1f188a13f7e79610::function_66ab4fb2175555e1("veh9_palfa");
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4a24
// Size: 0x62
function function_c735896a3f18c3c5(var_a1b7634debab1582, params) {
    /#
        assert(isarray(params));
    #/
    params[0] thread function_32f1e01090bacb5c(var_a1b7634debab1582, params[1], params[2], params[3], params[4], params[5], params[6], params[7]);
    if (isdefined(params[8])) {
        params[0] thread [[ params[8] ]](params[6]);
    }
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4a8d
// Size: 0x5a
function function_2a0fbd3637f6341(var_a1b7634debab1582, params) {
    /#
        assert(isarray(params));
    #/
    params[0] thread function_d94d6fd84e5f7cda(var_a1b7634debab1582, params[1], params[2], params[3], params[4], params[5], params[6], params[7]);
    params[0] thread [[ params[8] ]](params[6]);
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4aee
// Size: 0xd6
function function_e6d0e960a0b97e21() {
    namespace_609d2ee77dae3d8c::function_f54ee3a0c5799ddb();
    namespace_4faa6169000e657c::function_8e0a16f0ca8e45e9("REV_OB_ZOMBIE_CONTROL", &namespace_9009ac93da54a15e::function_7105d76c89d3fea3);
    namespace_4faa6169000e657c::function_8e0a16f0ca8e45e9("REV_OB_OUTLAST", &namespace_72155ae72c1c70a8::function_42696fef39309a29);
    namespace_4faa6169000e657c::function_8e0a16f0ca8e45e9("REV_OB_ARMORED_CONVOY", &namespace_57a329915670ffdc::function_729f6e368df801f4);
    namespace_4faa6169000e657c::function_8e0a16f0ca8e45e9("REV_OB_MERC_CAMP", &namespace_200c114c5956154::function_2a30840abb2a500c);
    namespace_4faa6169000e657c::function_8e0a16f0ca8e45e9("REV_OB_BIGBOUNTY", &namespace_39f971ea9ca4fb9e::function_d745018e64b6b902);
    namespace_4faa6169000e657c::function_8e0a16f0ca8e45e9("REV_OB_AETHERTEAR", &namespace_6babc541ac0484f4::function_483ef1bf0c76bedc);
    namespace_4faa6169000e657c::function_8e0a16f0ca8e45e9("REV_OB_DOGHOUSE", &namespace_84e2a73178a22f53::function_58fb23fc08762d69);
    namespace_4faa6169000e657c::function_8e0a16f0ca8e45e9("REV_OB_SEISMIC_REFRACTOR", &namespace_c8a807248ca3f47d::function_31e28d0e057c0d07);
    namespace_4faa6169000e657c::function_8e0a16f0ca8e45e9("REV_OB_SAFECRACK", &namespace_62da3d9355108eea::function_97386f131cccf1e6);
    namespace_4faa6169000e657c::function_8e0a16f0ca8e45e9("REV_OB_VEHICLE_DRIVE", &namespace_7b4c61760c2a90db::function_89a7a8b0101530ec);
    namespace_4faa6169000e657c::function_8e0a16f0ca8e45e9("REV_OB_MERC_STRONGHOLD", &namespace_5a6420d2880ffe83::function_557cb9d43dd5e520);
    namespace_4faa6169000e657c::function_8b5b2a3392fc7e2a("ActivityEnd", &function_a9759a5bd3767f9a);
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4bcb
// Size: 0x2a
function function_fc8c1362ca8c5f5() {
    level callback::callback("register_activities");
    level callback::callback("register_objectives");
    level callback::callback("register_features");
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4bfc
// Size: 0x76
function private function_a9759a5bd3767f9a(var_b381b0883bcd4847) {
    foreach (player in var_b381b0883bcd4847.playerlist) {
        if (isplayer(player) && !isalive(player)) {
            player notify("force_spawn");
        }
    }
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4c79
// Size: 0x7c
function function_e8fd71c7bb0267ff() {
    namespace_945eaec008a2a2b0::function_70b0f5c75f974eff();
    namespace_945eaec008a2a2b0::function_f18abd71e34586a2("TitleSplash", &function_e66dfe22d08c0db5);
    namespace_945eaec008a2a2b0::function_f18abd71e34586a2("StringReference", &namespace_3de30dc9c2f4b908::function_b128dd1bd8150fb3);
    namespace_945eaec008a2a2b0::function_f18abd71e34586a2("Music", &namespace_3de30dc9c2f4b908::function_ef5f9ace0e2bad4e);
    namespace_945eaec008a2a2b0::function_f18abd71e34586a2("Overlord", &namespace_3de30dc9c2f4b908::function_7a518dd08fe0d34e);
    namespace_945eaec008a2a2b0::function_f18abd71e34586a2("Omnvar", &namespace_3de30dc9c2f4b908::function_174054d9a5f63554);
    utility::registersharedfunc("hud", "showDMZSplash", &function_8b236f47ab2c78d7);
    namespace_20c011482c0cdeb0::function_157ef4a3b9c1af16();
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4cfc
// Size: 0x79
function function_e66dfe22d08c0db5(players, var_8b000f9816c87eae, var_283e7af20911133a) {
    var_d9772a53958eabc6 = var_8b000f9816c87eae namespace_945eaec008a2a2b0::function_7437a8d48556e45e();
    if (var_d9772a53958eabc6.size == 0 || var_8b000f9816c87eae namespace_945eaec008a2a2b0::function_54ad2295d6995862() != "TitleSplash") {
        return;
    }
    for (var_e544eba5148ba75e = 0; var_e544eba5148ba75e < var_d9772a53958eabc6.size; var_e544eba5148ba75e++) {
        var_479a4f2240611b51 = var_d9772a53958eabc6[var_e544eba5148ba75e];
        namespace_3de30dc9c2f4b908::function_c235ffb8f79c155a(players, var_8b000f9816c87eae, var_479a4f2240611b51, var_283e7af20911133a);
    }
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4d7c
// Size: 0xac
function function_8b236f47ab2c78d7(splash, players, var_f96e9372bf4d85eb, var_118e50a941775f63, var_f88ea18d6edabcda) {
    var_e995bb533046188d = poi::function_80cdaea4bd3ecf70(var_f96e9372bf4d85eb);
    foreach (player in players) {
        if (isplayer(player)) {
            player setclientomnvar("ui_dmz_poi_name", var_e995bb533046188d);
            player thread hud_message::showsplash(splash, var_118e50a941775f63, var_f88ea18d6edabcda, undefined, 1);
            waitframe();
        }
    }
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4e2f
// Size: 0x164
function function_b3b7fbaf621805a7() {
    level.var_86eb4c5ff792f6e9 = [0:"team_two_hundred", 1:"civilian", 2:"team_hundred_ninety", 3:"allies", 4:"team_players", 5:"ignored_by_zombies", 6:"rushing_omega_agents", 7:"ignored_by_mercs"];
    foreach (var_25c7faedfb701e00 in level.var_86eb4c5ff792f6e9) {
        if (!threatbiasgroupexists(var_25c7faedfb701e00)) {
            createthreatbiasgroup(var_25c7faedfb701e00);
        }
    }
    level callback::add("player_spawned", &function_e3e1a0db0b7932e5);
    level callback::add("on_agent_spawned", &function_10943b3fd5b5311e);
    level callback::add("on_agent_spawned", &function_7ef180ee70f1ad5e);
    level callback::add("on_agent_spawned", &function_3b92de171730cc02);
    setignoremegroup("ignored_by_zombies", "team_two_hundred");
    utility::registersharedfunc("player", "setIgnoredByZombies", &function_6109bfd0330e0b8f);
    setignoremegroup("ignored_by_mercs", "team_hundred_ninety");
    utility::registersharedfunc("player", "setIgnoredByMercs", &function_23cab8b5fab57b3e);
    level.var_6a36f59e08b56ed7 = &function_e12570bda0ae63f0;
    setignoremegroup("team_two_hundred", "rushing_omega_agents");
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4f9a
// Size: 0x19
function function_e12570bda0ae63f0(var_181d0f1fbfc61deb) {
    function_6109bfd0330e0b8f("aether_shroud", var_181d0f1fbfc61deb);
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4fba
// Size: 0x8b
function function_6109bfd0330e0b8f(source, var_4016328c43254ce8) {
    /#
        assert(isplayer(self));
    #/
    /#
        assert(isstring(source));
    #/
    self.var_5e8b911d93f8f0b3 = function_53c4c53197386572(self.var_5e8b911d93f8f0b3, []);
    self.var_5e8b911d93f8f0b3[source] = var_4016328c43254ce8 ? 1 : undefined;
    if (self.var_5e8b911d93f8f0b3.size > 0) {
        self setthreatbiasgroup("ignored_by_zombies");
    } else {
        self setthreatbiasgroup("team_players");
    }
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x504c
// Size: 0x8b
function function_23cab8b5fab57b3e(source, var_4016328c43254ce8) {
    /#
        assert(isplayer(self));
    #/
    /#
        assert(isstring(source));
    #/
    self.var_cf10597537f925da = function_53c4c53197386572(self.var_cf10597537f925da, []);
    self.var_cf10597537f925da[source] = var_4016328c43254ce8 ? 1 : undefined;
    if (self.var_cf10597537f925da.size > 0) {
        self setthreatbiasgroup("ignored_by_mercs");
    } else {
        self setthreatbiasgroup("team_players");
    }
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x50de
// Size: 0x64
function function_e83e24c88a9a762c(enable) {
    if (self.team != "team_hundred_ninety") {
        /#
            assertmsg("The rushing threatbias group should only be used by AI of team omega!");
        #/
        return;
    }
    if (enable) {
        /#
            assert(utility::array_contains(level.var_86eb4c5ff792f6e9, "rushing_omega_agents"));
        #/
        self setthreatbiasgroup("rushing_omega_agents");
    } else {
        function_10943b3fd5b5311e();
    }
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5149
// Size: 0x18
function function_e3e1a0db0b7932e5(params) {
    self setthreatbiasgroup("team_players");
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5168
// Size: 0x45
function function_10943b3fd5b5311e(params) {
    if (isdefined(self.team) && utility::array_contains(level.var_86eb4c5ff792f6e9, self.team)) {
        self setthreatbiasgroup(self.team);
    }
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x51b4
// Size: 0x118
function function_7ef180ee70f1ad5e(params) {
    if (isdefined(level.var_8241e0d86017df29)) {
        difficulty = [[ level.var_8241e0d86017df29 ]](self.origin);
    } else {
        difficulty = "difficulty_easy";
    }
    if (self.type == "zombie") {
        switch (difficulty) {
        case #"hash_7bb2cd766703d463":
            self.attackeraccuracy = getdvarfloat(@"hash_de6dc5f654aea557", 5);
            break;
        case #"hash_af83e47edfa8900a":
            self.attackeraccuracy = getdvarfloat(@"hash_fa7ecf4ab69de0b4", 4);
            break;
        case #"hash_5343b465e56ec9a4":
            self.attackeraccuracy = getdvarfloat(@"hash_f80c5b3399cc105a", 1);
            break;
        case #"hash_651f76c0ad6741ec":
            self.attackeraccuracy = getdvarfloat(@"hash_bab34333b64588f3", 1);
            break;
        default:
            break;
        }
    }
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x52d3
// Size: 0xc1
function function_3b92de171730cc02(params) {
    if (self.unittype == "soldier" && isdefined(self.subclass)) {
        switch (self.subclass) {
        case #"hash_91cd18ea8bf6d95":
        case #"hash_284b2545dbaa82f7":
            self.var_e19fa4ee85718283 = 0;
            self.var_40fd29f57b22065a = 1;
            break;
        case #"hash_e907579ab7e94379":
            self.var_e19fa4ee85718283 = 0;
            self.var_40fd29f57b22065a = 2;
            break;
        default:
            self.var_e19fa4ee85718283 = 0;
            self.var_40fd29f57b22065a = 3;
            break;
        }
    }
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x539b
// Size: 0x54
function function_3d14cacc473cb79() {
    utility::registersharedfunc("squad_utility", "getSquadMembers", &function_b33a073b0de77d0a);
    callback::add("squad_created", &function_6d402ea224e021c2);
    callback::add(#"hash_cc06eb1d45f33a0c", &function_5b696bb30d753873);
    callback::add(#"hash_cef9136f9b434dc1", &function_f629d46279a25c95);
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x53f6
// Size: 0x3d
function private function_6d402ea224e021c2(params) {
    /#
        println("<unknown string>" + params.index);
    #/
    logstring("==OB SQUAD CREATED INDEX: " + params.index);
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x543a
// Size: 0x9a
function private function_5b696bb30d753873(params) {
    name = isdefined(self.name) ? "unknown" : self.name;
    /#
        println("<unknown string>" + name + "<unknown string>" + params.index + "<unknown string>" + params.memberindex);
    #/
    logstring("==OB SQUAD JOIN: " + name + " squad ID " + params.index + " member index " + params.memberindex);
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x54db
// Size: 0x9a
function private function_f629d46279a25c95(params) {
    name = isdefined(self.name) ? "unknown" : self.name;
    /#
        println("<unknown string>" + name + "<unknown string>" + params.index + "<unknown string>" + params.memberindex);
    #/
    logstring("==OB SQUAD LEAVE: " + name + " squad ID " + params.index + " member index " + params.memberindex);
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x557c
// Size: 0x27e
function function_b33a073b0de77d0a(var_68bb1f110ec06a58, var_7102f45d5f0b5834) {
    var_c9b69aecc5c631ed = [];
    team = utility::function_53c4c53197386572(var_68bb1f110ec06a58, self.team);
    if (!isdefined(self)) {
        /#
            assertmsg("==OB SQUAD GET SQUAD MEMBERS: self is undefined! Player disconnected?");
        #/
        return var_c9b69aecc5c631ed;
    }
    name = isdefined(self.name) ? "unknown" : self.name;
    if (!isdefined(team)) {
        logstring("==OB SQUAD GET SQUAD MEMBERS: " + name + " entnum " + self getentitynumber() + " doesn't have a defined team");
    }
    if (!isdefined(self.var_ff97225579de16a)) {
        logstring("==OB SQUAD GET SQUAD MEMBERS: " + name + " entnum " + self getentitynumber() + " doesn't have a defined sessionsquadid");
    }
    if (!isdefined(self.var_3f78c6a0862f9e25)) {
        logstring("==OB SQUAD GET SQUAD MEMBERS: " + name + " entnum " + self getentitynumber() + " doesn't have a defined sessionuimemberindex");
    }
    if (isdefined(team) && isdefined(self.var_ff97225579de16a) && isdefined(level.squaddata[team]) && isdefined(level.squaddata[team][self.var_ff97225579de16a]) && isarray(level.squaddata[team][self.var_ff97225579de16a].players)) {
        foreach (player in level.squaddata[team][self.var_ff97225579de16a].players) {
            if (!istrue(var_7102f45d5f0b5834) || var_7102f45d5f0b5834 && isalive(player) && player.sessionstate == "playing") {
                var_c9b69aecc5c631ed[var_c9b69aecc5c631ed.size] = player;
            }
        }
    }
    if (!var_c9b69aecc5c631ed.size && isplayer(self)) {
        if (isdefined(team) && isdefined(self.team) && team == self.team && (!istrue(var_7102f45d5f0b5834) || istrue(var_7102f45d5f0b5834) && isalive(self) && self.sessionstate == "playing")) {
            var_c9b69aecc5c631ed[var_c9b69aecc5c631ed.size] = self;
            logstring("==OB SQUAD GET SQUAD MEMBERS: Returning " + self.name + " entnum " + self getentitynumber() + " instead of empty squad. Squad ID somehow undefined?");
        }
    }
    return var_c9b69aecc5c631ed;
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5802
// Size: 0x14
function function_ffe061106577a7fb() {
    callback::add("player_spawned", &function_6e205740c6efbc70);
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x581d
// Size: 0x1d
function function_71e0f441c3360430() {
    setdvar(@"hash_e54438e2751cac0d", 5000);
    thread function_c9df5c5a772438cf();
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5841
// Size: 0xfe
function function_c9df5c5a772438cf() {
    utility::flag_wait("ai_spawn_director_initialized");
    if (getdvarint(@"hash_3fe2867542a8b2ac", 1) == 1) {
        function_9b8829ab4092a7d7("ob_limit_zombie_abom", 1);
    }
    if (getdvarint(@"hash_7c2f0b8c0e4a7449", 0) == 1) {
        function_9b8829ab4092a7d7("ob_disable_zombie_base", 1);
    }
    if (getdvarint(@"hash_d6d33dd6b10231d3", 0) == 1) {
        function_9b8829ab4092a7d7("ob_disable_zombie_disciple", 1);
    }
    if (getdvarint(@"hash_f71f988fc6b17a8f", 0) == 1) {
        function_9b8829ab4092a7d7("ob_disable_zombie_hellhound", 1);
    }
    if (getdvarint(@"hash_b2ae20a7511461b0", 0) == 1) {
        function_9b8829ab4092a7d7("ob_disable_zombie_mangler", 1);
    }
    if (getdvarint(@"hash_842853c6126d1779", 0) == 1) {
        function_9b8829ab4092a7d7("ob_disable_zombie_mimic", 1);
    }
    if (getdvarint(@"hash_65e27e77334ae047", 0) == 1) {
        function_9b8829ab4092a7d7("ob_disable_zombie_abom", 1);
    }
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5946
// Size: 0x1a
function setdefaultjiprules() {
    setnojipscore(0);
    setnojiptime(0);
    level thread function_3ad468d47d0221c4();
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5967
// Size: 0x3d
function private function_3ad468d47d0221c4() {
    level endon("game_ended");
    level waittill("matchStartTimer_done");
    timeout = getdvarint(@"hash_67e537056ee477e0", -1);
    if (timeout >= 0) {
        wait(timeout);
        setnojiptime(1);
    }
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x59ab
// Size: 0x90
function function_6e205740c6efbc70(params) {
    if (!istrue(self.var_81bfb34ed943e119)) {
        self.var_81bfb34ed943e119 = 1;
        weapons = self getweaponslistprimaries();
        foreach (weapon in weapons) {
            self givemaxammo(weapon);
            self setweaponammoclip(weapon, weaponclipsize(weapon));
        }
    }
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5a42
// Size: 0xab
function function_285963c471f5cd63() {
    self endon("death_or_disconnect");
    val::set("spawn_wait_ignore", "ignoreme", 1);
    var_56497232c9996f40 = gettime();
    while (gettime() - var_56497232c9996f40 < 180000) {
        if (isdefined(self.pers["totalDistTraveled"]) && self.pers["totalDistTraveled"] > 0) {
            break;
        } else if (isdefined(self.pers["shotsFired"]) && self.pers["shotsFired"] > 0) {
            break;
        }
        wait(1);
    }
    val::function_c9d0b43701bdba00("spawn_wait_ignore");
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5af4
// Size: 0x25b
function on_player_spawned(params) {
    self endon("disconnect");
    var_ef6fda805e84c4b7 = getdvarint(@"hash_66d046d1cfe3ecc9", 0);
    if (utility::is_equal(var_ef6fda805e84c4b7, 1)) {
        currency::function_3036cef61495210f("essence", 400, #"infil_essence");
    } else if (var_ef6fda805e84c4b7 > 0) {
        currency::function_3036cef61495210f("essence", var_ef6fda805e84c4b7, #"infil_essence");
    }
    self setsoundsubmix("jup_global_ob", 0.05);
    lethal = equipment::getcurrentequipment("primary");
    tactical = equipment::getcurrentequipment("secondary");
    fieldupgrade = equipment::getcurrentequipment("super");
    params = spawnstruct();
    params.player = self;
    callback::callback("infilled_with_super", params);
    if (istrue(self.var_9fbf17f89c877f8)) {
        if (!game_utility::isteamreviveenabled()) {
            namespace_fe9526a81c458d8f::function_dbd1a6ad7182a0da();
        } else if (isdefined(self.var_9632a7ee2ddfb1ed)) {
            perkpackage::perkpackage_giveimmediate(self.var_9632a7ee2ddfb1ed, undefined, undefined, undefined, level.var_c24e4f076c66bfb4);
            self.var_9632a7ee2ddfb1ed = undefined;
        }
        self.var_9fbf17f89c877f8 = undefined;
    } else if (!namespace_9571f642f38c8169::function_a6172e49f7313fd8()) {
        namespace_fe9526a81c458d8f::function_389d4cd85d174957();
        namespace_fe9526a81c458d8f::function_32c79be2384f10fb(namespace_fe9526a81c458d8f::function_286713f0349afb22());
        function_dfa410598e52bdf4();
    }
    var_98163cad54eb5b48 = getdvar(@"hash_1c51b6e011fc2b75", "none");
    if (var_98163cad54eb5b48 != "none") {
        var_98163cad54eb5b48 = strtok(var_98163cad54eb5b48, ",");
        foreach (var_60b440e623c8d536 in var_98163cad54eb5b48) {
            item = namespace_49e179ec476603d6::function_119bf86e1d774c3(var_60b440e623c8d536, self.origin);
            namespace_49e179ec476603d6::function_576728d3d4486bd6(item, 0, 1);
        }
    }
    thread function_44635a34b0826a60();
    function_ea1d30130273f294();
    thread function_285963c471f5cd63();
    var_deac6530b2088fc3 = getdvarint(@"hash_89f5285b9abcc3b2", -1);
    if (var_deac6530b2088fc3 != -1) {
        namespace_946ba58a8d1e7bfd::function_1208466b550e2cdd(self, var_deac6530b2088fc3, 10);
    }
    thread function_66bc1b52ee336c6c();
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5d56
// Size: 0x2e
function function_9facdf4afd2a8414(params) {
    if (isdefined(params.player)) {
        params.player thread function_c36231b22deebd49();
    }
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5d8b
// Size: 0x394
function function_c36231b22deebd49() {
    self endon("death");
    self endon("disconnect");
    self endon("exit_vehicle");
    /#
        println("<unknown string>");
    #/
    objweapon = makeweapon("emp_pulse_mp");
    if (!isdefined(level.var_6344a543d8afdb4c)) {
        level.var_6344a543d8afdb4c = function_e4c99b0f178ffb98("ddos", 1, level.framedurationseconds);
    }
    while (1) {
        if (namespace_1fbd40990ee60ede::vehicle_occupancy_occupantisvehicledriver(self)) {
            function_f632348cbb773537(level.var_6344a543d8afdb4c, self);
            if (isdefined(self.vehicle)) {
                if (getdvarint(@"hash_b808e932765b36b6", 1) == 0) {
                    var_8b46f59f3b68959b = 0;
                    zombies = getaiarrayinradius(self.origin, getdvarint(@"hash_71eb35d288cf5376", 1300));
                    contents = create_contents(0, 1, 1, 0, 0, 1, 0);
                    var_fa4a71604b2b6f12 = 0;
                    specials = 0;
                    foreach (zombie in zombies) {
                        if (function_72dd9cb4df68fc79(zombie)) {
                            specials++;
                            if (!istrue(self.vehicle.var_d547bf7eec5d2fc3)) {
                                /#
                                    if (getdvarint(@"hash_cedfd894822951d7", 0) == 1) {
                                        println("<unknown string>" + zombie.aicategory);
                                        println("<unknown string>" + zombie.origin);
                                        println("<unknown string>" + self.vehicle.origin);
                                        println("<unknown string>" + distancesquared(zombie.origin, self.vehicle.origin));
                                    }
                                #/
                                info = physics_raycast(zombie.origin, self.vehicle.origin + self.vehicle vehicle_getvelocity() * 0.75, contents, [0:zombie, 1:self.vehicle], 0, "physicsquery_closest");
                                if (!info.size || !isdefined(info[0]["hittype"])) {
                                    if (!var_8b46f59f3b68959b) {
                                        playsoundatpos(self.origin, "iw9_emp_blast");
                                        var_8b46f59f3b68959b = 1;
                                    }
                                    self.vehicle thread function_2e1415758b8efacf(getdvarint(@"hash_d9b247c13aab9329", 10), zombie);
                                    data = namespace_169cd7a8fbc76ee5::packdamagedata(self, self.vehicle, 1, objweapon, "MOD_EXPLOSIVE", zombie, zombie.origin);
                                    namespace_5a51aa78ea0b1b9f::function_662905d3b9455612(data, getdvarint(@"hash_d9b247c13aab9329", 10), 0);
                                    self.vehicle.var_a30e564b6cab8b51 = zombie;
                                }
                            }
                        }
                    }
                    if (zombies.size == 0 || specials == 0) {
                        self.vehicle namespace_5a51aa78ea0b1b9f::clear_emp();
                        self.vehicle function_65aa053c077c003a(0);
                        self.vehicle.var_a30e564b6cab8b51 = undefined;
                        self.vehicle.var_d547bf7eec5d2fc3 = 0;
                    }
                } else {
                    return;
                }
            }
        } else {
            /#
                println("<unknown string>");
            #/
        }
        wait(0.1);
    }
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x6126
// Size: 0xa1
function private function_72dd9cb4df68fc79(ai) {
    if (!isalive(ai)) {
        return 0;
    }
    if (isdefined(ai.type) && ai.type != "zombie") {
        return 0;
    }
    if (issubstr(ai.subclass, "zombie_disciple")) {
        return 0;
    }
    if (isdefined(ai.aicategory)) {
        switch (ai.aicategory) {
        case #"hash_7b0e2f2ed84f34":
        case #"hash_7e8a002ed096276c":
        case #"hash_8c089e813083e510":
            return 1;
            break;
        }
    }
    return 0;
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x61cf
// Size: 0x98
function function_2e1415758b8efacf(duration, target) {
    self endon("death");
    target endon("death");
    self.var_d547bf7eec5d2fc3 = 1;
    while (duration > 0) {
        duration = duration - 0.1;
        dist = getdvarint(@"hash_81fa3ca40de5904c", 150);
        if (distancesquared(self.origin, target.origin) < dist * dist) {
            self function_65aa053c077c003a(1);
            wait(duration);
            break;
        }
        wait(0.1);
    }
    self.var_d547bf7eec5d2fc3 = 0;
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x626e
// Size: 0x6d
function function_8c5062f666b9bf73(duration, attacker) {
    self endon("death");
    objweapon = makeweapon("emp_pulse_mp");
    thread function_2e1415758b8efacf(duration, self);
    data = namespace_169cd7a8fbc76ee5::packdamagedata(attacker, self, 1, objweapon, "MOD_EXPLOSIVE", attacker, attacker.origin);
    namespace_5a51aa78ea0b1b9f::function_662905d3b9455612(data, duration, 0);
    wait(duration);
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x62e2
// Size: 0x6d
function function_66bc1b52ee336c6c() {
    self notify("endon_player_tac_map_open_watcher");
    self endon("endon_player_tac_map_open_watcher");
    self endon("disconnect");
    if (!isbot(self)) {
        self notifyonplayercommand("tac_map_toggle", "togglemap");
    }
    while (1) {
        self waittill("tac_map_toggle");
        params = spawnstruct();
        params.player = self;
        callback::callback("player_tac_map_toggled", params);
    }
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6356
// Size: 0x78
function function_1b3eb5a063e1f355(params) {
    if (params.time_left > 0) {
        var_7f109cad38f90498 = gettime() + utility::function_a5b14435e3229bed(params.time_left);
        if (!isdefined(self.var_7f109cad38f90498)) {
            self.var_7f109cad38f90498 = var_7f109cad38f90498;
            thread function_6e10d687459b4f35();
        } else {
            self.var_7f109cad38f90498 = max(self.var_7f109cad38f90498, var_7f109cad38f90498);
        }
    }
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x63d5
// Size: 0xf1
function private function_6e10d687459b4f35() {
    self endon("death");
    while (isdefined(self.var_7f109cad38f90498) && gettime() < self.var_7f109cad38f90498) {
        var_15d5106746811361 = 1;
        ai_array = getaiarrayinradius(self.origin, 60);
        foreach (ai in ai_array) {
            if (isdefined(ai.team) && ai.team != self.team) {
                var_15d5106746811361 = 0;
                break;
            }
        }
        val::set("smokegrenade", "ignoreme", var_15d5106746811361);
        waitframe();
    }
    val::function_c9d0b43701bdba00("smokegrenade");
    self.var_7f109cad38f90498 = undefined;
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x64cd
// Size: 0x24
function function_53603305ca469286(params) {
    if (!namespace_82dcd1d5ae30ff7::_hasperk("specialty_blindeye")) {
        self.var_7f109cad38f90498 = undefined;
    }
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x64f8
// Size: 0xe4
function function_505b67932ed47333(params) {
    level endon("game_ended");
    if (!isdefined(params) || !isdefined(params.endtime)) {
        return;
    }
    while (gettime() < params.endtime) {
        if (isdefined(params.position) && isdefined(params.smokeradius)) {
            var_e3294d754e89740c = getaiarrayinradius(params.position, params.smokeradius);
            foreach (agent in var_e3294d754e89740c) {
                if (isdefined(agent)) {
                    agent.var_4a9b1a3e622f082 = gettime();
                }
            }
        }
        wait(1);
    }
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x65e3
// Size: 0x54
function function_ea1d30130273f294() {
    difficulty = namespace_f721fc7d0d2d0f47::function_4d8bb2d866771a10(self.origin);
    if (isdefined(difficulty)) {
        var_f8bc4db18d63fe71 = level.var_f721fc7d0d2d0f47.var_6ee86f7730b38593[difficulty];
        if (isdefined(var_f8bc4db18d63fe71)) {
            self setclientomnvar("ui_region_difficulty", var_f8bc4db18d63fe71);
        }
    }
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x663e
// Size: 0xdb
function function_dfa410598e52bdf4() {
    var_6c5994d41bd00dd8 = function_f04fad7e0ad2f553();
    if (!isdefined(var_6c5994d41bd00dd8)) {
        return;
    }
    var_fbe755f0978c0369 = namespace_49e179ec476603d6::function_2cdc55ba39d97d70(var_6c5994d41bd00dd8);
    itembundle = getscriptbundle("itemspawnentry:" + var_fbe755f0978c0369);
    if (itembundle.type == "weapon") {
        var_636981592f381ebf = spawnstruct();
        var_636981592f381ebf.type = var_6c5994d41bd00dd8;
        var_636981592f381ebf.count = itembundle.spawncount;
        namespace_49e179ec476603d6::function_7f6f62ba8dfd0da0(itembundle, var_636981592f381ebf);
        thread function_6514dcc70f8d75a0();
        return;
    }
    var_3b19a3ab9b78a516 = spawnstruct();
    var_3b19a3ab9b78a516.count = 1;
    var_3b19a3ab9b78a516.type = var_6c5994d41bd00dd8;
    namespace_fe9526a81c458d8f::function_4b5b6b5953138fe7(itembundle, var_3b19a3ab9b78a516.count);
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6720
// Size: 0x48
function function_6514dcc70f8d75a0() {
    self endon("death");
    self endon("disconnect");
    flags::gameflagwait("prematch_done");
    if (self.primaryweapons.size > 2 && self hasweapon("iw9_me_fists_mp")) {
        self takeweapon("iw9_me_fists_mp");
    }
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x676f
// Size: 0xc3
function function_f04fad7e0ad2f553() {
    var_6527198400e84395 = self getplayerdata(level.var_a7393a6994b4363e, "rankedMatchData", "squadMembers", "equippedAcquisitionSetup", 0, "lootID");
    if (!isdefined(var_6527198400e84395) || !var_6527198400e84395) {
        return undefined;
    }
    for (i = 0; i < 10; i++) {
        var_1a840f4ee4f227f7 = self getplayerdata(level.var_a7393a6994b4363e, "rankedMatchData", "squadMembers", "ownedAcquisitionSetup", i, "lootID");
        if (isdefined(var_1a840f4ee4f227f7) && var_1a840f4ee4f227f7 == var_6527198400e84395) {
            self setplayerdata(level.var_a7393a6994b4363e, "rankedMatchData", "squadMembers", "ownedAcquisitionSetup", i, "lootID", 0);
            break;
        }
    }
    return namespace_49e179ec476603d6::function_2f759e70c6189ff0(var_6527198400e84395);
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 10, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x683a
// Size: 0x9c
function on_player_killed(einflictor, attacker, idamage, smeansofdeath, objweapon, vdir, shitloc, psoffsettime, deathanimduration, var_61b5d0250b328f00) {
    namespace_fe9526a81c458d8f::function_a342582cc42f28cb();
    self.var_9fbf17f89c877f8 = 1;
    if (game_utility::isteamreviveenabled()) {
        self.var_9632a7ee2ddfb1ed = self.perkpackagedata.super;
        if (namespace_aca170e0fe882d77::function_4db915a9ce0e903a()) {
            namespace_aca170e0fe882d77::callForHelp(objweapon);
        }
    }
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x68dd
// Size: 0x6f
function callback_playerconnect() {
    self waittill("begin");
    if (!isdefined(level.player)) {
        spawnpoints = getentarray("mp_global_intermission", "classname");
        self spawn(spawnpoints[0].origin, spawnpoints[0].angles);
        self.maxhealth = 10000000;
        self.health = 10000000;
    }
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 15, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6953
// Size: 0x1ac
function callback_playerdamage(einflictor, eattacker, idamage, idflags, smeansofdeath, var_d7bc24cd73dfc712, objweapon, vpoint, vdir, shitloc, timeoffset, modelindex, partname, var_b0fc59ff15058522, var_be4285b26ed99ab1) {
    if (isdefined(eattacker) && eattacker vehicle::isvehicle()) {
        if (isdefined(eattacker.occupants) && eattacker.occupants.size == 0 && !isdefined(eattacker.driver) && !istrue(eattacker.var_fd91112a53ea4fea)) {
            return;
        } else if (isdefined(eattacker.veh_speed) && eattacker.veh_speed < 25 && smeansofdeath == "MOD_IMPACT") {
            return;
        }
    }
    if (utility::is_equal(self.var_cac91eb6521df629, eattacker)) {
        return;
    }
    if (namespace_a5c2977d842bbf87::function_4e53c739bf22ff46(eattacker)) {
        return;
    }
    if (getdvarint(@"hash_5cda27c8ebf5bfd2", 0) && isplayer(eattacker) && isplayer(self) && eattacker != self) {
        return;
    }
    if (isdefined(eattacker) && isai(eattacker) && isdefined(eattacker.var_306ac6ff52911f55)) {
        idamage = [[ eattacker.var_306ac6ff52911f55 ]](idamage, eattacker, objweapon);
    }
    [[ level.var_bb9f7907bbbb6221 ]](einflictor, eattacker, idamage, idflags, smeansofdeath, var_d7bc24cd73dfc712, objweapon, vpoint, vdir, shitloc, timeoffset, modelindex, partname, var_b0fc59ff15058522, var_be4285b26ed99ab1);
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6b06
// Size: 0x34
function on_connect(params) {
    self.gameskill = namespace_3dfa6eb6c5741630::get_gameskill();
    namespace_3dfa6eb6c5741630::apply_difficulty_settings(1);
    thread function_d6d378c8b68bc20b();
    thread function_3e582a8452f90572();
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6b41
// Size: 0xc
function on_disconnect(params) {
    
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6b54
// Size: 0x1e
function function_84008acb762a7ef1() {
    if (level.rankedmatch) {
        return "custom1";
    } else {
        return "class0";
    }
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6b79
// Size: 0xd
function function_e16bbbc22561da38(struct) {
    return struct;
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x6b8e
// Size: 0xe
function private modeallowmeleevehicledamage(data) {
    return 1;
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x6ba4
// Size: 0x4a
function private function_ba8b0d4972d0dd37(player) {
    if (isdefined(player) && isdefined(player.pers) && isdefined(player.pers["lives"])) {
        return player.pers["lives"];
    }
    return 0;
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x6bf6
// Size: 0x157
function private function_60945959dc72c726() {
    totalplayers = 0;
    level.teamswithplayers = [];
    var_8384b09f64a00c69 = [];
    foreach (team in level.teamnamelist) {
        if (team == "team_two_hundred") {
            continue;
        }
        var_8384b09f64a00c69[var_8384b09f64a00c69.size] = team;
    }
    foreach (team in var_8384b09f64a00c69) {
        teamcount = teams::getteamdata(team, "teamCount");
        totalplayers = totalplayers + teamcount;
        if (teamcount) {
            level.teamswithplayers[level.teamswithplayers.size] = team;
        }
    }
    if (game_utility::matchmakinggame() && !flags::gameflag("prematch_done")) {
        return;
    }
    if (level.teamswithplayers.size == 1 && istrue(level.var_bc7c79144ec83753)) {
        return;
    }
    if (!game_utility::gamehasstarted()) {
        return;
    }
    if (level.ingraceperiod && !isdefined(level.overrideingraceperiod)) {
        return;
    }
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x6d54
// Size: 0xb8
function private function_cb2ac649cb6d62d0(weaponobj) {
    str_weapon_name = weapon::getweaponrootname(weaponobj);
    if (isdefined(level.var_96c4059aa2eabfb8) && isdefined(level.var_96c4059aa2eabfb8[str_weapon_name])) {
        var_be53b174c615d624 = level.var_96c4059aa2eabfb8[str_weapon_name].var_60cd7d2641a6671b;
        var_c2d75e1eaa5db67a = level.var_96c4059aa2eabfb8[str_weapon_name].var_9e1e9ec0fd561685;
        if (isdefined(var_be53b174c615d624) && weaponobj hasattachment(var_be53b174c615d624) || isdefined(var_c2d75e1eaa5db67a) && weaponobj hasattachment(var_c2d75e1eaa5db67a)) {
            return weaponobj;
        }
        if (isdefined(var_be53b174c615d624) && weaponobj canuseattachment(var_be53b174c615d624)) {
            weaponobj = weaponobj withattachment(var_be53b174c615d624);
        }
    }
    return weaponobj;
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x6e14
// Size: 0x154
function private function_e38bf93f560abe62(v_pos) {
    if (isdefined(level.var_fac39a693f085779)) {
        str_difficulty = [[ level.var_fac39a693f085779 ]](v_pos);
        switch (str_difficulty) {
        case #"hash_7bb2cd766703d463":
        default:
            var_2fcb35d230365682 = namespace_7bf99ef58659a6f1::function_cfd0e1fb13d7e080(#"hash_7daee53a80439762");
            if (isdefined(var_2fcb35d230365682)) {
                var_2fcb35d230365682.var_6c3d26c5e933dcfd = "green";
            }
            break;
        case #"hash_af83e47edfa8900a":
            var_2fcb35d230365682 = namespace_7bf99ef58659a6f1::function_cfd0e1fb13d7e080(#"hash_401f509591a1da77");
            if (isdefined(var_2fcb35d230365682)) {
                var_2fcb35d230365682.var_6c3d26c5e933dcfd = "yellow";
            }
            break;
        case #"hash_5343b465e56ec9a4":
            var_2fcb35d230365682 = namespace_7bf99ef58659a6f1::function_cfd0e1fb13d7e080(#"hash_f86c6183dc63d11");
            if (isdefined(var_2fcb35d230365682)) {
                var_2fcb35d230365682.var_6c3d26c5e933dcfd = "orange";
            }
            break;
        case #"hash_651f76c0ad6741ec":
            var_2fcb35d230365682 = namespace_7bf99ef58659a6f1::function_cfd0e1fb13d7e080(#"hash_f86c6183dc63d11");
            if (isdefined(var_2fcb35d230365682)) {
                var_2fcb35d230365682.var_6c3d26c5e933dcfd = "red";
            }
            break;
        }
    }
    if (!isdefined(var_2fcb35d230365682) || getdvarint(@"hash_cd5d0cefda37432f", 0)) {
        var_2fcb35d230365682 = namespace_7bf99ef58659a6f1::function_cfd0e1fb13d7e080(#"hash_f86c6183dc63d11");
    }
    return var_2fcb35d230365682;
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x6f70
// Size: 0x14
function private function_5110348e6cabe751() {
    level endon("game_ended");
    wait(10);
    gamelogic::forceend();
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6f8b
// Size: 0x888
function function_865b1a5a62c49d7(var_4125230730e19144, var_d1396c7667a91857, var_3f0f4f53be6a5123) {
    if (!isdefined(self) || isdefined(self.disconnecting)) {
        return;
    }
    if (istrue(self.var_3716375613ca89fd) && isdefined(var_d1396c7667a91857) && !var_d1396c7667a91857) {
        return;
    }
    poisVisited = undefined;
    if (namespace_8361bad7391de074::function_cff2f4f168b29b81()) {
        poisVisited = namespace_9bb409deb69fb31d::function_2026e82470c5c89f(self.team, self.var_ff97225579de16a, "poisVisited");
    }
    if (isdefined(poisVisited)) {
        poisVisited = poisVisited.size;
    } else {
        poisVisited = 0;
    }
    var_f99935d061cf899b = self.pers["telemetry"];
    explorationXP = poisVisited * (isdefined(namespace_62c556437da28f50::getscoreinfoxp(#"hash_3b0b5b72c38e1a56")) ? 0 : namespace_62c556437da28f50::getscoreinfoxp(#"hash_3b0b5b72c38e1a56"));
    var_d961222798f5d01a = isdefined(var_f99935d061cf899b.looted_containers) ? 0 : var_f99935d061cf899b.looted_containers;
    lootingXP = var_d961222798f5d01a * (isdefined(namespace_62c556437da28f50::getscoreinfoxp(#"hash_f0bd5f0d32453556")) ? 0 : namespace_62c556437da28f50::getscoreinfoxp(#"hash_f0bd5f0d32453556"));
    var_b3a234477420dccd = isdefined(var_f99935d061cf899b.contracts_completed) ? 0 : var_f99935d061cf899b.contracts_completed;
    contractxp = isdefined(var_f99935d061cf899b.var_f1f0e54434cdf293) ? 0 : var_f99935d061cf899b.var_f1f0e54434cdf293;
    var_4245d658e9ae8a3d = isdefined(var_f99935d061cf899b.activities_completed) ? 0 : var_f99935d061cf899b.activities_completed;
    var_346cc01daf93fb2c = isdefined(var_f99935d061cf899b.var_355ce2c63476b983) ? 0 : var_f99935d061cf899b.var_355ce2c63476b983;
    var_72052c14ff62f1d0 = isdefined(var_f99935d061cf899b.zombie_kills) ? 0 : var_f99935d061cf899b.zombie_kills;
    var_4f10889753faa363 = isdefined(var_f99935d061cf899b.var_5a383b47b09076a6) ? 0 : var_f99935d061cf899b.var_5a383b47b09076a6;
    var_51bd432d74753cd4 = isdefined(var_f99935d061cf899b.soldier_kills) ? 0 : var_f99935d061cf899b.soldier_kills;
    var_fb4ace22bd056acf = isdefined(var_f99935d061cf899b.var_af3f574708e215b8) ? 0 : var_f99935d061cf899b.var_af3f574708e215b8;
    var_2471ab96d89bf325 = isdefined(var_f99935d061cf899b.boss_kills) ? 0 : var_f99935d061cf899b.boss_kills;
    var_9ac95c7516d1884c = isdefined(var_f99935d061cf899b.var_b0def0662a1a3bdb) ? 0 : var_f99935d061cf899b.var_b0def0662a1a3bdb;
    var_37d3a1efd95d39c9 = isdefined(var_f99935d061cf899b.var_943eae82c17be7a) ? 0 : var_f99935d061cf899b.var_943eae82c17be7a;
    var_6dc34a92a4ec1029 = isdefined(var_f99935d061cf899b.var_1e793bda8b84600f) ? 0 : var_f99935d061cf899b.var_1e793bda8b84600f;
    var_8a97e143ee82daab = var_4125230730e19144 ? isdefined(namespace_62c556437da28f50::getscoreinfoxp(#"hash_a664e407eb3e39d4")) ? 0 : namespace_62c556437da28f50::getscoreinfoxp(#"hash_a664e407eb3e39d4") : 0;
    revives = isdefined(var_f99935d061cf899b.teammates_revived) ? 0 : var_f99935d061cf899b.teammates_revived;
    otherxp = revives * (isdefined(namespace_62c556437da28f50::getscoreinfoxp(#"reviver")) ? 0 : namespace_62c556437da28f50::getscoreinfoxp(#"reviver"));
    var_520e914889cda77e = isdefined(self.var_520e914889cda77e) ? 0 : self.var_520e914889cda77e;
    var_e7faf08f327b0fb5 = isdefined(self.var_e7faf08f327b0fb5) ? 0 : self.var_e7faf08f327b0fb5;
    if (istrue(var_3f0f4f53be6a5123)) {
        poisVisited = poisVisited + self getplayerdata(level.var_a7393a6994b4363e, "rankedMatchData", "DMZaarValue", 0);
        explorationXP = explorationXP + self getplayerdata(level.var_a7393a6994b4363e, "rankedMatchData", "DMZaarValue", 1);
        var_d961222798f5d01a = var_d961222798f5d01a + self getplayerdata(level.var_a7393a6994b4363e, "rankedMatchData", "DMZaarValue", 2);
        lootingXP = lootingXP + self getplayerdata(level.var_a7393a6994b4363e, "rankedMatchData", "DMZaarValue", 3);
        var_b3a234477420dccd = var_b3a234477420dccd + self getplayerdata(level.var_a7393a6994b4363e, "rankedMatchData", "DMZaarValue", 4);
        contractxp = contractxp + self getplayerdata(level.var_a7393a6994b4363e, "rankedMatchData", "DMZaarValue", 5);
        var_4245d658e9ae8a3d = var_4245d658e9ae8a3d + self getplayerdata(level.var_a7393a6994b4363e, "rankedMatchData", "DMZaarValue", 6);
        var_346cc01daf93fb2c = var_346cc01daf93fb2c + self getplayerdata(level.var_a7393a6994b4363e, "rankedMatchData", "DMZaarValue", 7);
        var_72052c14ff62f1d0 = var_72052c14ff62f1d0 + self getplayerdata(level.var_a7393a6994b4363e, "rankedMatchData", "DMZaarValue", 8);
        var_4f10889753faa363 = var_4f10889753faa363 + self getplayerdata(level.var_a7393a6994b4363e, "rankedMatchData", "DMZaarValue", 9);
        var_51bd432d74753cd4 = var_51bd432d74753cd4 + self getplayerdata(level.var_a7393a6994b4363e, "rankedMatchData", "DMZaarValue", 10);
        var_fb4ace22bd056acf = var_fb4ace22bd056acf + self getplayerdata(level.var_a7393a6994b4363e, "rankedMatchData", "DMZaarValue", 11);
        var_2471ab96d89bf325 = var_2471ab96d89bf325 + self getplayerdata(level.var_a7393a6994b4363e, "rankedMatchData", "DMZaarValue", 12);
        var_9ac95c7516d1884c = var_9ac95c7516d1884c + self getplayerdata(level.var_a7393a6994b4363e, "rankedMatchData", "DMZaarValue", 13);
        var_37d3a1efd95d39c9 = var_37d3a1efd95d39c9 + self getplayerdata(level.var_a7393a6994b4363e, "rankedMatchData", "DMZaarValue", 14);
        var_6dc34a92a4ec1029 = var_6dc34a92a4ec1029 + self getplayerdata(level.var_a7393a6994b4363e, "rankedMatchData", "DMZaarValue", 15);
        otherxp = otherxp + self getplayerdata(level.var_a7393a6994b4363e, "rankedMatchData", "DMZaarValue", 17);
    }
    self setplayerdata(level.var_a7393a6994b4363e, "rankedMatchData", "DMZaarValue", 0, poisVisited);
    self setplayerdata(level.var_a7393a6994b4363e, "rankedMatchData", "DMZaarValue", 1, explorationXP);
    self setplayerdata(level.var_a7393a6994b4363e, "rankedMatchData", "DMZaarValue", 2, var_d961222798f5d01a);
    self setplayerdata(level.var_a7393a6994b4363e, "rankedMatchData", "DMZaarValue", 3, lootingXP);
    self setplayerdata(level.var_a7393a6994b4363e, "rankedMatchData", "DMZaarValue", 4, var_b3a234477420dccd);
    self setplayerdata(level.var_a7393a6994b4363e, "rankedMatchData", "DMZaarValue", 5, contractxp);
    self setplayerdata(level.var_a7393a6994b4363e, "rankedMatchData", "DMZaarValue", 6, var_4245d658e9ae8a3d);
    self setplayerdata(level.var_a7393a6994b4363e, "rankedMatchData", "DMZaarValue", 7, var_346cc01daf93fb2c);
    self setplayerdata(level.var_a7393a6994b4363e, "rankedMatchData", "DMZaarValue", 8, var_72052c14ff62f1d0);
    self setplayerdata(level.var_a7393a6994b4363e, "rankedMatchData", "DMZaarValue", 9, var_4f10889753faa363);
    self setplayerdata(level.var_a7393a6994b4363e, "rankedMatchData", "DMZaarValue", 10, var_51bd432d74753cd4);
    self setplayerdata(level.var_a7393a6994b4363e, "rankedMatchData", "DMZaarValue", 11, var_fb4ace22bd056acf);
    self setplayerdata(level.var_a7393a6994b4363e, "rankedMatchData", "DMZaarValue", 12, var_2471ab96d89bf325);
    self setplayerdata(level.var_a7393a6994b4363e, "rankedMatchData", "DMZaarValue", 13, var_9ac95c7516d1884c);
    self setplayerdata(level.var_a7393a6994b4363e, "rankedMatchData", "DMZaarValue", 14, var_37d3a1efd95d39c9);
    self setplayerdata(level.var_a7393a6994b4363e, "rankedMatchData", "DMZaarValue", 15, var_6dc34a92a4ec1029);
    self setplayerdata(level.var_a7393a6994b4363e, "rankedMatchData", "DMZaarValue", 16, var_8a97e143ee82daab);
    self setplayerdata(level.var_a7393a6994b4363e, "rankedMatchData", "DMZaarValue", 17, otherxp);
    self setplayerdata(level.var_a7393a6994b4363e, "rankedMatchData", "DMZaarValue", 18, var_520e914889cda77e);
    self setplayerdata(level.var_a7393a6994b4363e, "rankedMatchData", "DMZaarValue", 19, var_e7faf08f327b0fb5);
    self.var_3716375613ca89fd = 1;
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x781a
// Size: 0x18f
function function_922c3629c545df86() {
    player = self;
    player endon("disconnnect");
    if (istrue(player.defeated)) {
        return;
    }
    player.defeated = 1;
    player callback::callback(#"player_eliminated");
    function_4ce64226f67749c4(player);
    if (!istrue(player.var_f52eb40ba99ffa4c) && !istrue(player.var_59e5ea44ba5aff1)) {
        player thread namespace_b3f32c8cb80b8124::function_5751d00ce46557da(0);
    }
    player function_865b1a5a62c49d7(0);
    level thread game_utility::fadetoblackforplayer(player, 1, 0.25);
    wait(0.25);
    if (isalive(player) && player.sessionstate == "playing") {
        player namespace_66c176d3c67cc0c2::removefromalivecount(1);
        teams::validatealivecount("disconnect", player.team, player);
    }
    gamelogic::processlobbydataforclient(player);
    scoreboard::processcommonplayerdataforplayer(player);
    namespace_41bcc2f40ffd0e7f::processlobbydata();
    level thread game_utility::fadetoblackforplayer(player, 0, 1);
    if (!istrue(player.var_f52eb40ba99ffa4c)) {
        player setclientomnvar("ui_dmz_extract_successful", 0);
    }
    player setclientomnvar("ui_br_squad_eliminated_active", 1);
    player setclientomnvar("ui_round_end_title", game["round_end"]["defeat"]);
    player setclientomnvar("ui_round_end_reason", game["end_reason"]["objective_failed"]);
    if (isdefined(player.matchbonus)) {
        player setclientomnvar("ui_round_end_match_bonus", player.matchbonus);
    }
    player setclientdvar(@"hash_cbb22e2fb1a57873", 1);
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x79b0
// Size: 0xc1
function onplayerconnect(player) {
    /#
        assertex(isplayer(player), "ob onPlayerConnect: unexpected player");
    #/
    while (!namespace_f86ba2003950072a::function_1186ca4e2e51afea("mp_jup_st_e_OB")) {
        waitframe();
    }
    waittillframeend();
    var_74063b398a2f879b = function_46de22e10ed21cd0();
    foreach (state_id in var_74063b398a2f879b) {
        setaudiotriggerstate(state_id, "outbreak", 0.1, player);
    }
    setglobalsoundcontext("gametype", "outbreak");
    player setentitysoundcontext("gametype", "outbreak", 0.1);
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7a78
// Size: 0x85
function onplayerdisconnect(player) {
    function_4ce64226f67749c4(player);
    if (istrue(level.laststand) && !istrue(player.defeated) && !istrue(player.var_f52eb40ba99ffa4c)) {
        player thread ob_laststand::function_144b0ea22640fc8e(0);
    } else {
        if (issharedfuncdefined("seasonalevents", "getFieldRepEventActive")) {
            if (function_f3bb4f4911a1beb2("seasonalevents", "getFieldRepEventActive")) {
                function_3f2ab7272697e5b8(player);
            }
        }
        level thread function_4dcd3a8d7424475a();
    }
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x7b04
// Size: 0x3e
function private function_4dcd3a8d7424475a() {
    level endon("game_ended");
    level endon("game_ended_aether_storm");
    wait(25);
    if (level.players.size == 0) {
        level thread gamelogic::endgame("none", game["end_reason"]["usmc_eliminated"]);
    }
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7b49
// Size: 0x10f
function function_ee31102c771626f4(player) {
    level endon("game_ended_aether_storm");
    if (!isdefined(player) || istrue(player.var_f52eb40ba99ffa4c)) {
        return;
    }
    player thread function_922c3629c545df86();
    if (issharedfuncdefined("seasonalevents", "getFieldRepEventActive")) {
        if (function_f3bb4f4911a1beb2("seasonalevents", "getFieldRepEventActive")) {
            function_3f2ab7272697e5b8(player);
        }
    }
    if (isalive(player) && player.sessionstate == "playing") {
        player kill();
    }
    player.var_8a45d9adef248987 = 1;
    squadmembers = player squad_utility::getSquadMembers();
    foreach (member in squadmembers) {
        if (!istrue(member.var_8a45d9adef248987)) {
            return;
        }
    }
    thread function_855d30a0c15693dc(player.team, player);
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7c5f
// Size: 0xb4
function function_855d30a0c15693dc(team, player) {
    var_192c781ad2c7d253 = 0;
    foreach (player in level.players) {
        if (ob_laststand::function_f3645fa4bfb45a97(player)) {
            var_192c781ad2c7d253 = 1;
            break;
        }
    }
    if (!istrue(var_192c781ad2c7d253) && !istrue(level.gameended)) {
        if (!isdefined(level.var_a9e2544b9283299b)) {
            wait(25);
        }
        level thread gamelogic::endgame("none", game["end_reason"]["usmc_eliminated"]);
    }
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7d1a
// Size: 0x15d
function onsquadeliminated(var_eb5a9091076e21e8, var_192c781ad2c7d253) {
    level endon("game_ended_aether_storm");
    var_bfdfd3c9ba0cc7cb = namespace_aca170e0fe882d77::function_6d3365e999c489ac(var_eb5a9091076e21e8);
    if (isdefined(level.var_a9e2544b9283299b)) {
        var_bfdfd3c9ba0cc7cb = 0;
    }
    if (!istrue(var_192c781ad2c7d253)) {
        var_bfdfd3c9ba0cc7cb = 0;
    }
    if (var_bfdfd3c9ba0cc7cb) {
        return;
    }
    foreach (player in var_eb5a9091076e21e8) {
        if (isdefined(player) && !istrue(player.var_f52eb40ba99ffa4c)) {
            if (issharedfuncdefined("seasonalevents", "getFieldRepEventActive")) {
                if (function_f3bb4f4911a1beb2("seasonalevents", "getFieldRepEventActive")) {
                    function_3f2ab7272697e5b8(player);
                }
            }
            player thread function_922c3629c545df86();
            if (isalive(player) && player.sessionstate == "playing") {
                player kill();
            }
        }
    }
    if (isdefined(level.var_a9e2544b9283299b)) {
        level thread gamelogic::endgame("none", game["end_reason"]["usmc_eliminated"]);
    } else if (!istrue(var_192c781ad2c7d253) && !istrue(level.gameended)) {
        wait(25);
        level thread gamelogic::endgame("none", game["end_reason"]["usmc_eliminated"]);
    }
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x7e7e
// Size: 0x79
function private function_2e9a4609882eac19(team) {
    var_b2e199b24ee09a53 = teams::getteamdata(team, "alivePlayers");
    if (istrue(level.laststand) && isdefined(var_b2e199b24ee09a53) && var_b2e199b24ee09a53.size > 0) {
        var_b2e199b24ee09a53[0] thread ob_laststand::function_144b0ea22640fc8e(0);
    } else if (isdefined(team) && team != "all") {
        thread onsquadeliminated(teams::getteamdata(team, "players"));
        gamelogic::default_ondeadevent(team);
    }
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7efe
// Size: 0x12a
function function_4ce64226f67749c4(player) {
    if (!isplayer(player)) {
        return;
    }
    winner = "eliminated";
    gamelength = game_utility::gettimepassed() / 1000;
    if (istrue(player.var_f52eb40ba99ffa4c)) {
        winner = player.pers["team"];
        if (!isdefined(player.matchbonus)) {
            playerscore = player gamelogic::calculatematchbonus(#"win", gamelength);
            player gamelogic::givematchbonus("win", playerscore);
            player.matchbonus = playerscore;
        }
    } else if (!istrue(player.pers["hasDoneAnyCombat"]) && !istrue(player.pers["participation"])) {
        winner = "";
    } else if (!isdefined(player.matchbonus)) {
        playerscore = player gamelogic::calculatematchbonus(#"loss", gamelength);
        player gamelogic::givematchbonus("loss", playerscore);
        player.matchbonus = playerscore;
    }
    player game_utility::stopkeyearning(winner);
    namespace_d576b6dc7cef9c62::_setplayerteamrank(player);
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x802f
// Size: 0x4b
function function_db2c28c97a3d712a() {
    return getdvarint(@"hash_7661484c77058395", 0) || getdvarint(@"hash_596076b5ab54d511", 0) || getdvarint(@"hash_c385fef4df4638cb", 0) || getdvarint(@"hash_3a4e983e54a9ae7e", 0);
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8082
// Size: 0xa
function initializematchrules() {
    game_utility::setcommonrulesfrommatchrulesdata();
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8093
// Size: 0xc5
function function_62228d03b970ab26() {
    /#
        setdevdvarifuninitialized(@"hash_2ca79cccbf7ca293", 0);
        while (1) {
            if (int(getdvar(@"hash_2ca79cccbf7ca293", 0)) == 1) {
                enemies = getaiarray();
                if (isdefined(enemies) && enemies.size > 0) {
                    foreach (enemy in enemies) {
                        print3d(enemy.origin + (0, 0, 60), enemy.team);
                    }
                }
            }
            waitframe();
        }
    #/
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x815f
// Size: 0xc5
function function_52bc0d7da2e88b96() {
    /#
        setdevdvarifuninitialized(@"hash_f228754ff84bd8d", 0);
        while (1) {
            if (int(getdvar(@"hash_f228754ff84bd8d", 0)) == 1) {
                enemies = getaiarray();
                if (isdefined(enemies) && enemies.size > 0) {
                    foreach (enemy in enemies) {
                        print3d(enemy.origin + (0, 0, 60), enemy.agent_type);
                    }
                }
            }
            waitframe();
        }
    #/
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x822b
// Size: 0x16e
function function_e75f507eac44c9ca() {
    /#
        setdevdvarifuninitialized(@"hash_a7493d6bda4d686b", 0);
        while (1) {
            if (int(getdvar(@"hash_a7493d6bda4d686b", 0)) == 1) {
                enemies = getaiarray();
                if (isdefined(enemies) && enemies.size > 0) {
                    foreach (enemy in enemies) {
                        maxarmor = function_53c4c53197386572(enemy.var_8790c077c95db752, 0);
                        var_8ae553f22f3bccd0 = function_53c4c53197386572(enemy.var_cfc69e5588a5bed6, 0);
                        var_815f2cee6f7f75cd = function_53c4c53197386572(enemy.armorhealth, 0);
                        var_9eae1acd45c9d63 = function_53c4c53197386572(enemy.helmethealth, 0);
                        print3d(enemy.origin + (0, 0, 60), "<unknown string>" + var_9eae1acd45c9d63 + "<unknown string>" + var_8ae553f22f3bccd0);
                        print3d(enemy.origin + (0, 0, 80), "<unknown string>" + var_815f2cee6f7f75cd + "<unknown string>" + maxarmor);
                    }
                }
            }
            waitframe();
        }
    #/
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x83a0
// Size: 0x85
function function_bfd214941fe81721(params) {
    /#
        ammomod = params[0];
        foreach (player in level.players) {
            currentweapon = player getcurrentweapon();
            player namespace_2e04133215e83a48::function_6c40f58b29a952a9(currentweapon, ammomod);
        }
    #/
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x842c
// Size: 0x5d
function function_548326adbe72c4c3() {
    /#
        foreach (player in level.players) {
            player armor::function_9c6e9a6643b6c9a6(1);
        }
    #/
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8490
// Size: 0x64
function function_4dbb22600ebb3c58() {
    /#
        foreach (player in level.players) {
            player armor::setArmorHealth(self.var_8790c077c95db752);
        }
    #/
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x84fb
// Size: 0x920
function function_ce34466b3cece887(params) {
    /#
        var_c3cdffc23f23de67 = params[0];
        give_weapon = params[1];
        weapon_rarity = params[2];
        var_1b3072262db80fc1 = [0:"<unknown string>", 1:"<unknown string>", 2:"<unknown string>", 3:"<unknown string>", 4:"<unknown string>"];
        perks = [0:"<unknown string>", 1:"<unknown string>", 2:"<unknown string>", 3:"<unknown string>", 4:"<unknown string>", 5:"<unknown string>", 6:"<unknown string>", 7:"<unknown string>"];
        supers = [0:"<unknown string>", 1:"<unknown string>", 2:"<unknown string>", 3:"<unknown string>", 4:"<unknown string>", 5:"<unknown string>"];
        var_fdc95ac9085ddc04 = "<unknown string>";
        var_7a072bf64e5a9686 = "<unknown string>";
        var_c7c6de07e094477d = [];
        var_c7c6de07e094477d["<unknown string>"] = [];
        var_c7c6de07e094477d["<unknown string>"]["<unknown string>"] = "<unknown string>";
        var_c7c6de07e094477d["<unknown string>"]["<unknown string>"] = "<unknown string>";
        var_c7c6de07e094477d["<unknown string>"]["<unknown string>"] = "<unknown string>";
        var_c7c6de07e094477d["<unknown string>"]["<unknown string>"] = "<unknown string>";
        var_c7c6de07e094477d["<unknown string>"]["<unknown string>"] = "<unknown string>";
        var_c7c6de07e094477d["<unknown string>"] = [];
        var_c7c6de07e094477d["<unknown string>"]["<unknown string>"] = "<unknown string>";
        var_c7c6de07e094477d["<unknown string>"]["<unknown string>"] = "<unknown string>";
        var_c7c6de07e094477d["<unknown string>"]["<unknown string>"] = "<unknown string>";
        var_c7c6de07e094477d["<unknown string>"]["<unknown string>"] = "<unknown string>";
        var_c7c6de07e094477d["<unknown string>"]["<unknown string>"] = "<unknown string>";
        var_6394349c9a0bfa7e = 0;
        switch (var_c3cdffc23f23de67) {
        case #"hash_bd22c9933c8ead48":
            var_6394349c9a0bfa7e = 1;
            break;
        case #"hash_f484b092d351500e":
            var_6394349c9a0bfa7e = 2;
            break;
        case #"hash_b76c1b30b726b92c":
            var_6394349c9a0bfa7e = 3;
            break;
        case #"hash_40f74392d7695be8":
            var_6394349c9a0bfa7e = 3;
            break;
        default:
            var_6394349c9a0bfa7e = 0;
            break;
        }
        foreach (player in level.players) {
            name = isdefined(player.name) ? "<unknown string>" : player.name;
            zombie_perks::function_33e402afcb6d2c04([0:name]);
            waitframe();
            if (!utility::is_equal(var_c3cdffc23f23de67, "<unknown string>")) {
                player armor::setArmorHealth(self.var_8790c077c95db752);
                waitframe();
                player armor::function_9c6e9a6643b6c9a6(1);
                waitframe();
                var_e1d199da4592fc05 = randomint(supers.size);
                player perkpackage::perkpackage_givedebug(supers[var_e1d199da4592fc05]);
                waitframe();
                player currency::function_3036cef61495210f("<unknown string>", 10000);
                waitframe();
            }
            if (utility::is_equal(give_weapon, "<unknown string>") && !utility::is_equal("<unknown string>")) {
                weapon_name = var_c7c6de07e094477d["<unknown string>"]["<unknown string>"];
                if (isdefined(weapon_rarity)) {
                    weapon_name = var_c7c6de07e094477d["<unknown string>"][weapon_rarity];
                }
                var_636981592f381ebf = spawnstruct();
                var_d7732d0238eae9ff = 180;
                var_84255b4b28279219 = weapon_name;
                var_c1c3ecdd33dec5b7 = getscriptbundle("<unknown string>" + var_84255b4b28279219);
                var_bf2d5e2704ee3910 = var_c1c3ecdd33dec5b7.scriptable;
                var_636981592f381ebf.count = namespace_49e179ec476603d6::function_7209c8cd4b2e3afd(var_d7732d0238eae9ff);
                player namespace_49e179ec476603d6::function_7f6f62ba8dfd0da0(var_c1c3ecdd33dec5b7, var_636981592f381ebf);
                wait(2);
                currentweapon = player getcurrentweapon();
                player pack_a_punch::pap_weapon(currentweapon, int(max(var_6394349c9a0bfa7e - 1, 0)));
                if (var_6394349c9a0bfa7e > 0) {
                    waitframe();
                    var_4bc27b790622bd85 = randomint(var_1b3072262db80fc1.size);
                    player namespace_2e04133215e83a48::function_6c40f58b29a952a9(currentweapon, var_1b3072262db80fc1[var_4bc27b790622bd85]);
                    waitframe();
                }
                wait(1.5);
                player namespace_df5cfdbe6e2d3812::_switchtoweaponimmediate(player.primaryweapons[0]);
                wait(1.5);
                weapon_name = var_c7c6de07e094477d["<unknown string>"]["<unknown string>"];
                if (isdefined(weapon_rarity)) {
                    weapon_name = var_c7c6de07e094477d["<unknown string>"][weapon_rarity];
                }
                var_636981592f381ebf = spawnstruct();
                var_d7732d0238eae9ff = 180;
                var_84255b4b28279219 = weapon_name;
                var_c1c3ecdd33dec5b7 = getscriptbundle("<unknown string>" + var_84255b4b28279219);
                var_bf2d5e2704ee3910 = var_c1c3ecdd33dec5b7.scriptable;
                var_636981592f381ebf.count = namespace_49e179ec476603d6::function_7209c8cd4b2e3afd(var_d7732d0238eae9ff);
                player namespace_49e179ec476603d6::function_7f6f62ba8dfd0da0(var_c1c3ecdd33dec5b7, var_636981592f381ebf);
                wait(2);
                currentweapon = player getcurrentweapon();
                player pack_a_punch::pap_weapon(currentweapon, int(max(var_6394349c9a0bfa7e - 1, 0)));
                wait(1.5);
                if (var_6394349c9a0bfa7e > 0) {
                    waitframe();
                    var_4bc27b790622bd85 = randomint(var_1b3072262db80fc1.size);
                    player namespace_2e04133215e83a48::function_6c40f58b29a952a9(currentweapon, var_1b3072262db80fc1[var_4bc27b790622bd85]);
                    waitframe();
                }
            }
            wait(0.5);
            switch (var_c3cdffc23f23de67) {
            case #"hash_bd22c9933c8ead48":
                player zombie_perks::give_perk(perks[0], 0);
                wait(0.25);
                player zombie_perks::give_perk(perks[1], 0);
                break;
            case #"hash_f484b092d351500e":
                player zombie_perks::give_perk(perks[0], 0);
                wait(0.25);
                player zombie_perks::give_perk(perks[1], 0);
                wait(0.25);
                player zombie_perks::give_perk(perks[2], 0);
                wait(0.25);
                player zombie_perks::give_perk(perks[3], 0);
                wait(0.25);
                player zombie_perks::give_perk(perks[4], 0);
                waitframe();
                break;
            case #"hash_b76c1b30b726b92c":
                player zombie_perks::give_perk(perks[0], 0);
                wait(0.25);
                player zombie_perks::give_perk(perks[1], 0);
                wait(0.25);
                player zombie_perks::give_perk(perks[2], 0);
                wait(0.25);
                player zombie_perks::give_perk(perks[3], 0);
                wait(0.25);
                player zombie_perks::give_perk(perks[4], 0);
                wait(0.25);
                player zombie_perks::give_perk(perks[5], 0);
                wait(0.25);
                player zombie_perks::give_perk(perks[6], 0);
                wait(0.25);
                player zombie_perks::give_perk(perks[7], 0);
                break;
            case #"hash_40f74392d7695be8":
                if (utility::is_equal(give_weapon, "<unknown string>")) {
                    var_636981592f381ebf = spawnstruct();
                    var_d7732d0238eae9ff = weaponmaxammo(var_fdc95ac9085ddc04);
                    var_c1c3ecdd33dec5b7 = getscriptbundle("<unknown string>" + var_7a072bf64e5a9686);
                    var_bf2d5e2704ee3910 = var_c1c3ecdd33dec5b7.scriptable;
                    var_636981592f381ebf.count = namespace_49e179ec476603d6::function_7209c8cd4b2e3afd(var_d7732d0238eae9ff);
                    player namespace_49e179ec476603d6::function_7f6f62ba8dfd0da0(var_c1c3ecdd33dec5b7, var_636981592f381ebf);
                    wait(0.25);
                    currentweapon = player getcurrentweapon();
                    player pack_a_punch::pap_weapon(currentweapon, int(max(var_6394349c9a0bfa7e - 1, 0)));
                    if (var_6394349c9a0bfa7e > 0) {
                        waitframe();
                        var_4bc27b790622bd85 = randomint(var_1b3072262db80fc1.size);
                        player namespace_2e04133215e83a48::function_6c40f58b29a952a9(currentweapon, var_1b3072262db80fc1[var_4bc27b790622bd85]);
                        waitframe();
                    }
                    wait(0.25);
                    weapon_name = var_c7c6de07e094477d["<unknown string>"]["<unknown string>"];
                    if (isdefined(weapon_rarity)) {
                        weapon_name = var_c7c6de07e094477d["<unknown string>"][weapon_rarity];
                    }
                    var_636981592f381ebf = spawnstruct();
                    var_d7732d0238eae9ff = 180;
                    var_84255b4b28279219 = weapon_name;
                    var_c1c3ecdd33dec5b7 = getscriptbundle("<unknown string>" + var_84255b4b28279219);
                    var_bf2d5e2704ee3910 = var_c1c3ecdd33dec5b7.scriptable;
                    var_636981592f381ebf.count = namespace_49e179ec476603d6::function_7209c8cd4b2e3afd(var_d7732d0238eae9ff);
                    player namespace_49e179ec476603d6::function_7f6f62ba8dfd0da0(var_c1c3ecdd33dec5b7, var_636981592f381ebf);
                    wait(0.25);
                    currentweapon = player getcurrentweapon();
                    player pack_a_punch::pap_weapon(currentweapon, int(max(var_6394349c9a0bfa7e - 1, 0)));
                    if (var_6394349c9a0bfa7e > 0) {
                        waitframe();
                        var_4bc27b790622bd85 = randomint(var_1b3072262db80fc1.size);
                        player namespace_2e04133215e83a48::function_6c40f58b29a952a9(currentweapon, var_1b3072262db80fc1[var_4bc27b790622bd85]);
                        waitframe();
                    }
                }
                wait(0.5);
                player zombie_perks::give_perk(perks[0], 0);
                wait(0.25);
                player zombie_perks::give_perk(perks[1], 0);
                wait(0.25);
                player zombie_perks::give_perk(perks[2], 0);
                wait(0.25);
                player zombie_perks::give_perk(perks[3], 0);
                wait(0.25);
                player zombie_perks::give_perk(perks[4], 0);
                wait(0.25);
                player zombie_perks::give_perk(perks[5], 0);
                wait(0.25);
                player zombie_perks::give_perk(perks[6], 0);
                wait(0.25);
                player zombie_perks::give_perk(perks[7], 0);
                break;
            default:
                if (utility::is_equal(give_weapon, "<unknown string>")) {
                    var_636981592f381ebf = spawnstruct();
                    var_d7732d0238eae9ff = 180;
                    var_84255b4b28279219 = "<unknown string>";
                    var_c1c3ecdd33dec5b7 = getscriptbundle("<unknown string>" + var_84255b4b28279219);
                    var_bf2d5e2704ee3910 = var_c1c3ecdd33dec5b7.scriptable;
                    var_636981592f381ebf.count = namespace_49e179ec476603d6::function_7209c8cd4b2e3afd(var_d7732d0238eae9ff);
                    player namespace_49e179ec476603d6::function_7f6f62ba8dfd0da0(var_c1c3ecdd33dec5b7, var_636981592f381ebf);
                }
                waitframe();
                break;
            }
        }
    #/
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8e22
// Size: 0x9d
function function_85bb0f2f9de2f140(params) {
    /#
        var_b10d66ed4bd40ddf = int(params[0]);
        foreach (player in level.players) {
            player utility::hidehudenable();
            player function_865b1a5a62c49d7(var_b10d66ed4bd40ddf, 1);
            player setclientomnvar("<unknown string>", var_b10d66ed4bd40ddf);
            player setclientomnvar("<unknown string>", 1);
        }
    #/
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8ec6
// Size: 0x75
function function_69cc0ae8201249ac() {
    /#
        foreach (player in level.players) {
            player utility::hidehuddisable();
            player setclientomnvar("<unknown string>", 0);
            player setclientomnvar("<unknown string>", 0);
        }
    #/
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8f42
// Size: 0xc8e
function function_d148aaa8f95a4fff() {
    /#
        level thread function_62228d03b970ab26();
        level thread function_52bc0d7da2e88b96();
        level thread function_e75f507eac44c9ca();
        level thread namespace_e5049f73842ac360::function_1f7bc5dd1e86ee1f();
        waitframe();
        devgui::function_6e7290c8ee4f558b("<unknown string>");
        devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_bfd214941fe81721, 0);
        devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_bfd214941fe81721, 0);
        devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_bfd214941fe81721, 0);
        devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_bfd214941fe81721, 0);
        devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_bfd214941fe81721, 0);
        devgui::function_fe953f000498048f();
        waitframe();
        devgui::function_6e7290c8ee4f558b("<unknown string>");
        devgui::function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_4dbb22600ebb3c58, 0);
        devgui::function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_548326adbe72c4c3, 0);
        devgui::function_fe953f000498048f();
        waitframe();
        devgui::function_6e7290c8ee4f558b("<unknown string>");
        devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_ce34466b3cece887, 0);
        devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_ce34466b3cece887, 0);
        devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_ce34466b3cece887, 0);
        devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_ce34466b3cece887, 0);
        devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_ce34466b3cece887, 0);
        devgui::function_fe953f000498048f();
        devgui::function_6e7290c8ee4f558b("<unknown string>");
        devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_ce34466b3cece887, 0);
        devgui::function_fe953f000498048f();
        devgui::function_6e7290c8ee4f558b("<unknown string>");
        devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_ce34466b3cece887, 0);
        devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_ce34466b3cece887, 0);
        devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_ce34466b3cece887, 0);
        devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_ce34466b3cece887, 0);
        devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_ce34466b3cece887, 0);
        devgui::function_fe953f000498048f();
        devgui::function_6e7290c8ee4f558b("<unknown string>");
        devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_ce34466b3cece887, 0);
        devgui::function_fe953f000498048f();
        devgui::function_6e7290c8ee4f558b("<unknown string>");
        devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_ce34466b3cece887, 0);
        devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_ce34466b3cece887, 0);
        devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_ce34466b3cece887, 0);
        devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_ce34466b3cece887, 0);
        devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_ce34466b3cece887, 0);
        devgui::function_fe953f000498048f();
        devgui::function_6e7290c8ee4f558b("<unknown string>");
        devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_ce34466b3cece887, 0);
        devgui::function_fe953f000498048f();
        devgui::function_6e7290c8ee4f558b("<unknown string>");
        devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_ce34466b3cece887, 0);
        devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_ce34466b3cece887, 0);
        devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_ce34466b3cece887, 0);
        devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_ce34466b3cece887, 0);
        devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_ce34466b3cece887, 0);
        devgui::function_fe953f000498048f();
        devgui::function_6e7290c8ee4f558b("<unknown string>");
        devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_ce34466b3cece887, 0);
        devgui::function_fe953f000498048f();
        devgui::function_6e7290c8ee4f558b("<unknown string>");
        devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_ce34466b3cece887, 0);
        devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_ce34466b3cece887, 0);
        devgui::function_fe953f000498048f();
        waitframe();
        if (getdvarint(@"hash_10f0811105fc2f93", 0)) {
            devgui::function_6e7290c8ee4f558b("<unknown string>");
            devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &namespace_49e179ec476603d6::function_f8162124bbb6ece3);
            devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &namespace_49e179ec476603d6::function_f8162124bbb6ece3);
            devgui::function_fe953f000498048f();
            devgui::function_6e7290c8ee4f558b("<unknown string>");
            devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &namespace_49e179ec476603d6::function_f8162124bbb6ece3);
            devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &namespace_49e179ec476603d6::function_f8162124bbb6ece3);
            devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &namespace_49e179ec476603d6::function_f8162124bbb6ece3);
            devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &namespace_49e179ec476603d6::function_f8162124bbb6ece3);
            devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &namespace_49e179ec476603d6::function_f8162124bbb6ece3);
            devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &namespace_49e179ec476603d6::function_f8162124bbb6ece3);
            devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &namespace_49e179ec476603d6::function_f8162124bbb6ece3);
            devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &namespace_49e179ec476603d6::function_f8162124bbb6ece3);
            devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &namespace_49e179ec476603d6::function_f8162124bbb6ece3);
            devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &namespace_49e179ec476603d6::function_f8162124bbb6ece3);
            devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &namespace_49e179ec476603d6::function_f8162124bbb6ece3);
            devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &namespace_49e179ec476603d6::function_f8162124bbb6ece3);
            devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &namespace_49e179ec476603d6::function_f8162124bbb6ece3);
            devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &namespace_49e179ec476603d6::function_f8162124bbb6ece3);
            devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &namespace_49e179ec476603d6::function_f8162124bbb6ece3);
            devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &namespace_49e179ec476603d6::function_f8162124bbb6ece3);
            devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &namespace_49e179ec476603d6::function_f8162124bbb6ece3);
            devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &namespace_49e179ec476603d6::function_f8162124bbb6ece3);
            devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &namespace_49e179ec476603d6::function_f8162124bbb6ece3);
            devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &namespace_49e179ec476603d6::function_f8162124bbb6ece3);
            devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &namespace_49e179ec476603d6::function_f8162124bbb6ece3);
            devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &namespace_49e179ec476603d6::function_f8162124bbb6ece3);
            devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &namespace_49e179ec476603d6::function_f8162124bbb6ece3);
            devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &namespace_49e179ec476603d6::function_f8162124bbb6ece3);
            devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &namespace_49e179ec476603d6::function_f8162124bbb6ece3);
            devgui::function_fe953f000498048f();
            devgui::function_6e7290c8ee4f558b("<unknown string>");
            devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &namespace_49e179ec476603d6::function_f8162124bbb6ece3);
            devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &namespace_49e179ec476603d6::function_f8162124bbb6ece3);
            devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &namespace_49e179ec476603d6::function_f8162124bbb6ece3);
            devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &namespace_49e179ec476603d6::function_f8162124bbb6ece3);
            devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &namespace_49e179ec476603d6::function_f8162124bbb6ece3);
            devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &namespace_49e179ec476603d6::function_f8162124bbb6ece3);
            devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &namespace_49e179ec476603d6::function_f8162124bbb6ece3);
            devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &namespace_49e179ec476603d6::function_f8162124bbb6ece3);
            devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &namespace_49e179ec476603d6::function_f8162124bbb6ece3);
            devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &namespace_49e179ec476603d6::function_f8162124bbb6ece3);
            devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &namespace_49e179ec476603d6::function_f8162124bbb6ece3);
            devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &namespace_49e179ec476603d6::function_f8162124bbb6ece3);
            devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &namespace_49e179ec476603d6::function_f8162124bbb6ece3);
            devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &namespace_49e179ec476603d6::function_f8162124bbb6ece3);
            devgui::function_fe953f000498048f();
            devgui::function_6e7290c8ee4f558b("<unknown string>");
            devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &namespace_49e179ec476603d6::function_f8162124bbb6ece3);
            devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &namespace_49e179ec476603d6::function_f8162124bbb6ece3);
            devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &namespace_49e179ec476603d6::function_f8162124bbb6ece3);
            devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &namespace_49e179ec476603d6::function_f8162124bbb6ece3);
            devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &namespace_49e179ec476603d6::function_f8162124bbb6ece3);
            devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &namespace_49e179ec476603d6::function_f8162124bbb6ece3);
            devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &namespace_49e179ec476603d6::function_f8162124bbb6ece3);
            devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &namespace_49e179ec476603d6::function_f8162124bbb6ece3);
            devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &namespace_49e179ec476603d6::function_f8162124bbb6ece3);
            devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &namespace_49e179ec476603d6::function_f8162124bbb6ece3);
            devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &namespace_49e179ec476603d6::function_f8162124bbb6ece3);
            devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &namespace_49e179ec476603d6::function_f8162124bbb6ece3);
            devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &namespace_49e179ec476603d6::function_f8162124bbb6ece3);
            devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &namespace_49e179ec476603d6::function_f8162124bbb6ece3);
            devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &namespace_49e179ec476603d6::function_f8162124bbb6ece3);
            devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &namespace_49e179ec476603d6::function_f8162124bbb6ece3);
            devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &namespace_49e179ec476603d6::function_f8162124bbb6ece3);
            devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &namespace_49e179ec476603d6::function_f8162124bbb6ece3);
            devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &namespace_49e179ec476603d6::function_f8162124bbb6ece3);
            devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &namespace_49e179ec476603d6::function_f8162124bbb6ece3);
            devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &namespace_49e179ec476603d6::function_f8162124bbb6ece3);
            devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &namespace_49e179ec476603d6::function_f8162124bbb6ece3);
            devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &namespace_49e179ec476603d6::function_f8162124bbb6ece3);
            devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &namespace_49e179ec476603d6::function_f8162124bbb6ece3);
            devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &namespace_49e179ec476603d6::function_f8162124bbb6ece3);
            devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &namespace_49e179ec476603d6::function_f8162124bbb6ece3);
            devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &namespace_49e179ec476603d6::function_f8162124bbb6ece3);
            devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &namespace_49e179ec476603d6::function_f8162124bbb6ece3);
            devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &namespace_49e179ec476603d6::function_f8162124bbb6ece3);
            devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &namespace_49e179ec476603d6::function_f8162124bbb6ece3);
            devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &namespace_49e179ec476603d6::function_f8162124bbb6ece3);
            devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &namespace_49e179ec476603d6::function_f8162124bbb6ece3);
            devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &namespace_49e179ec476603d6::function_f8162124bbb6ece3);
            devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &namespace_49e179ec476603d6::function_f8162124bbb6ece3);
            devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &namespace_49e179ec476603d6::function_f8162124bbb6ece3);
            devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &namespace_49e179ec476603d6::function_f8162124bbb6ece3);
            devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &namespace_49e179ec476603d6::function_f8162124bbb6ece3);
            devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &namespace_49e179ec476603d6::function_f8162124bbb6ece3);
            devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &namespace_49e179ec476603d6::function_f8162124bbb6ece3);
            devgui::function_fe953f000498048f();
            devgui::function_6e7290c8ee4f558b("<unknown string>");
            var_590e41714d712137 = getscriptbundle("<unknown string>" + "<unknown string>");
            if (isdefined(var_590e41714d712137)) {
                foreach (var_74ddc601a0fcaaa2 in var_590e41714d712137.var_9fdd81c7fdbb8ed2) {
                    if (!isdefined(var_74ddc601a0fcaaa2) || !isdefined(var_74ddc601a0fcaaa2.itemspawnentry)) {
                        continue;
                    }
                    devgui::function_b23a59dfb4ca49a1(var_74ddc601a0fcaaa2.itemspawnentry, "<unknown string>" + var_74ddc601a0fcaaa2.itemspawnentry, &namespace_49e179ec476603d6::function_f8162124bbb6ece3);
                }
            }
            devgui::function_fe953f000498048f();
            devgui::function_6e7290c8ee4f558b("<unknown string>");
            devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &namespace_49e179ec476603d6::function_f8162124bbb6ece3);
            devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &namespace_49e179ec476603d6::function_f8162124bbb6ece3);
            devgui::function_fe953f000498048f();
        }
        devgui::function_6e7290c8ee4f558b("<unknown string>");
        devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_85bb0f2f9de2f140, 0);
        devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_85bb0f2f9de2f140, 0);
        devgui::function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_69cc0ae8201249ac, 0);
        devgui::function_fe953f000498048f();
    #/
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9bd7
// Size: 0x56
function function_d6d378c8b68bc20b() {
    self endon("disconnect");
    if (getdvarint(@"hash_93e3f35514583760", 0) < 1 || getdvarint(@"hash_93e3f35514583760", 0) > 3) {
        return;
    }
    waitframe();
    currency::function_3036cef61495210f("essence", 100000);
    /#
        adddebugcommand("<unknown string>");
    #/
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 8, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9c34
// Size: 0xc6
function function_d94d6fd84e5f7cda(var_a1b7634debab1582, var_36c965a9dc6f734, var_eee16bdb2c11a95a, var_b9645fea7b9a29bd, var_313193e6fa1b6837, var_728270c1fda20ce8, var_af0662d6485d5d58, var_626b45032e1892da) {
    utility::flag_init(var_eee16bdb2c11a95a);
    utility::flag_clear(var_eee16bdb2c11a95a);
    thread function_c1da615597f3f09(var_36c965a9dc6f734, var_eee16bdb2c11a95a);
    self setscriptablepartstate("cursor_hint", "usable");
    self waittill("trigger");
    if (!utility::flag(var_eee16bdb2c11a95a)) {
        utility::flag_set(var_eee16bdb2c11a95a);
    }
    var_e6013eac45290cab = namespace_609d2ee77dae3d8c::function_e757a367525dc6ff(var_af0662d6485d5d58, var_626b45032e1892da, var_a1b7634debab1582);
    var_e6013eac45290cab thread function_f7fe9caaf2629606(var_728270c1fda20ce8, var_af0662d6485d5d58, var_626b45032e1892da);
    if (isdefined(var_313193e6fa1b6837)) {
        var_e6013eac45290cab [[ var_313193e6fa1b6837 ]]();
    }
    if (isdefined(var_b9645fea7b9a29bd)) {
        iprintln(var_b9645fea7b9a29bd);
    }
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 8, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9d01
// Size: 0xb4
function function_32f1e01090bacb5c(var_a1b7634debab1582, var_36c965a9dc6f734, var_eee16bdb2c11a95a, var_b9645fea7b9a29bd, var_313193e6fa1b6837, var_728270c1fda20ce8, var_af0662d6485d5d58, var_626b45032e1892da) {
    utility::flag_init(var_eee16bdb2c11a95a);
    utility::flag_set(var_eee16bdb2c11a95a);
    if (!(self == level) && self getscriptablehaspart("cursor_hint")) {
        self setscriptablepartstate("cursor_hint", "used");
    }
    var_e6013eac45290cab = namespace_609d2ee77dae3d8c::function_e757a367525dc6ff(var_af0662d6485d5d58, var_626b45032e1892da, var_a1b7634debab1582);
    var_e6013eac45290cab thread function_f7fe9caaf2629606(var_728270c1fda20ce8, var_af0662d6485d5d58, var_626b45032e1892da);
    if (isdefined(var_313193e6fa1b6837)) {
        var_e6013eac45290cab [[ var_313193e6fa1b6837 ]]();
    }
    if (isdefined(var_b9645fea7b9a29bd)) {
        iprintln(var_b9645fea7b9a29bd);
    }
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9dbc
// Size: 0x2e
function function_f7fe9caaf2629606(var_728270c1fda20ce8, var_af0662d6485d5d58, var_626b45032e1892da) {
    self waittill("instance_destroyed");
    namespace_cbce72e68c388ef8::function_ef92878cd2be9387(var_728270c1fda20ce8, var_af0662d6485d5d58, var_626b45032e1892da);
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9df1
// Size: 0x95
function function_c1da615597f3f09(var_dec33a5dfdcd663d, var_bab2d71dccda7436) {
    level endon("game_ended");
    level endon(var_bab2d71dccda7436);
    var_93cc6f8818f620be = 200;
    while (!utility::flag(var_bab2d71dccda7436)) {
        players = getentarrayinradius("player", "classname", self.origin, var_93cc6f8818f620be);
        if (isdefined(players) && players.size > 0) {
            /#
                print3d(self.origin, var_dec33a5dfdcd663d, (1, 1, 1), 1, 0.2, 1, 1);
            #/
        }
        waitframe();
    }
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9e8d
// Size: 0x88
function function_61df948774b422f4(instance, part, state, player, var_a5b2c541413aa895, var_cc38472e36be1b61) {
    if (!isdefined(instance) || !issubstr(instance.type, "fr_cursorhint")) {
        return;
    }
    if (instance getscriptablehaspart("cursor_hint")) {
        instance setscriptablepartstate("cursor_hint", "used");
        instance.user = player;
        instance notify("trigger");
    }
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9f1c
// Size: 0x67
function function_18cd28e7d4d24969(player) {
    var_4970ac49ea82ab16 = player armor::function_600f6cf462e983f();
    var_c916fe6ea244527 = player armor::function_47320a25b8ee003();
    var_9ecb8dace344e93 = var_c916fe6ea244527 - var_4970ac49ea82ab16;
    player armor::function_9c6e9a6643b6c9a6(var_9ecb8dace344e93);
    player damagefeedback::hudicontype("br_armor");
    namespace_1ceda47cf370258e::supportbox_playusesound(player);
    player thread namespace_1ceda47cf370258e::supportbox_onplayeruseanim();
    return 1;
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x9f8b
// Size: 0xa6
function private function_25e87761f87375c9() {
    var_5c7582e0bf457fda = spawnlogic::getspawnpointarray("mp_tdm_spawn_allies_start");
    if (var_5c7582e0bf457fda.size == 0) {
        return;
    }
    spawnlogic::setactivespawnlogic("Default", "Crit_Frontline");
    spawnlogic::addstartspawnpoints("mp_tdm_spawn_allies_start");
    spawnlogic::addspawnpoints("allies", "mp_tdm_spawn_allies_start");
    attackers = spawnlogic::getspawnpointarray("mp_tdm_spawn_allies_start");
    spawnlogic::registerspawnset("start_attackers", attackers);
    spawnlogic::addspawnpoints("allies", "mp_tdm_spawn");
    spawns = spawnlogic::getspawnpointarray("mp_tdm_spawn");
    spawnlogic::registerspawnset("normal", spawns);
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xa038
// Size: 0x12
function private function_a275bf1666c6a7eb() {
    return level.mapname == "mp_jup_bigmap";
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xa052
// Size: 0x1c7
function private function_6d3ebe9af4963f4b(player) {
    if (!isdefined(level.var_2d11adbe6ee5eabf)) {
        function_4127f38d2738d8cc();
    }
    if (!isdefined(player) || !isdefined(player.var_ff97225579de16a)) {
        return undefined;
    }
    if (isdefined(player.var_87a91b2a8231f4f8)) {
        return player.var_87a91b2a8231f4f8;
    }
    scriptnoteworthy = level.var_2d11adbe6ee5eabf[player.var_ff97225579de16a];
    spawngroup = level.var_c75729d65885a2ec[scriptnoteworthy];
    indextoremove = undefined;
    spawnpoint = undefined;
    foreach (index, point in spawngroup) {
        indextoremove = index;
        spawnpoint = point;
        break;
    }
    if (!isdefined(spawnpoint) || !isdefined(indextoremove)) {
        return undefined;
    }
    player.var_87a91b2a8231f4f8 = spawnpoint;
    level.var_c75729d65885a2ec[scriptnoteworthy][indextoremove] = undefined;
    name = isdefined(player.name) ? "unknown" : player.name;
    var_f5787e4135523795 = "==OB [PRESTREAM SPAWNS]" + name + " picked spawn point at: " + spawnpoint.origin;
    var_f5787b41355230fc = "==OB [PRESTREAM SPAWNS]" + name + " has sessionsquadid of: " + player.var_ff97225579de16a + ", member index of: " + player.var_3f78c6a0862f9e25;
    /#
        println(var_f5787e4135523795);
        println(var_f5787b41355230fc);
    #/
    logstring(var_f5787e4135523795);
    logstring(var_f5787b41355230fc);
    return spawnpoint;
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xa221
// Size: 0x267
function private function_4127f38d2738d8cc() {
    if (!function_a275bf1666c6a7eb()) {
        return undefined;
    }
    var_b451fef96a140fb4 = getdvar(@"hash_fbf20cf3ae039362", "");
    var_611bab205d53658 = strtok(var_b451fef96a140fb4, ",");
    var_ae05dc693da6219b = getdvar(@"hash_81ecb9cb95ca6315", "");
    var_8f62e3ed4e85ae6f = strtok(var_ae05dc693da6219b, ",");
    var_701a116fe9041dc2 = ter_op(istrue(level.var_529deb371b5eeb12), level.var_126fea15d159e0ca, "mp/ob_spawnpoints.csv");
    rownum = tablelookupgetnumrows(var_701a116fe9041dc2);
    spawnpoints = [];
    for (rowindex = 0; rowindex < rownum; rowindex++) {
        scriptnoteworthy = tablelookupbyrow(var_701a116fe9041dc2, rowindex, 2);
        if (!isdefined(scriptnoteworthy) || scriptnoteworthy == "") {
            continue;
        }
        if (var_611bab205d53658.size && function_fc64178f71375137(var_611bab205d53658, scriptnoteworthy)) {
            continue;
        }
        if (var_8f62e3ed4e85ae6f.size && !function_fc64178f71375137(var_8f62e3ed4e85ae6f, scriptnoteworthy)) {
            continue;
        }
        spawnpoints[spawnpoints.size] = int(scriptnoteworthy);
    }
    level.var_2d11adbe6ee5eabf = utility::function_1bb9ae4b5f3e2ab(spawnpoints, function_47fd8fcdf90b0e() & 65535, undefined, undefined, 65535);
    var_1a6ebd3fdf4d3348 = ter_op(isdefined(level.var_49839a7ef42e68d8), level.var_49839a7ef42e68d8, getspawnarray("mp_ob_spawn_start"));
    spawngroups = [];
    foreach (spawnpoint in var_1a6ebd3fdf4d3348) {
        if (!isdefined(spawnpoint.script_noteworthy)) {
            continue;
        }
        if (var_611bab205d53658.size && function_fc64178f71375137(var_611bab205d53658, spawnpoint.script_noteworthy)) {
            continue;
        }
        if (var_8f62e3ed4e85ae6f.size && !function_fc64178f71375137(var_8f62e3ed4e85ae6f, spawnpoint.script_noteworthy)) {
            continue;
        }
        index = int(spawnpoint.script_noteworthy);
        if (!isdefined(spawngroups[index])) {
            spawngroups[index] = [];
        }
        spawngroups[index][spawngroups[index].size] = spawnpoint;
    }
    level.var_c75729d65885a2ec = spawngroups;
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xa48f
// Size: 0x3e4
function private initspawns() {
    level.spawnmins = (2.14748e+09, 2.14748e+09, 2.14748e+09);
    level.spawnmaxs = (-2147483647, -2147483647, -2147483647);
    level.var_7a8e039103b51e0f = [];
    var_b451fef96a140fb4 = getdvar(@"hash_fbf20cf3ae039362", "");
    var_611bab205d53658 = strtok(var_b451fef96a140fb4, ",");
    var_ae05dc693da6219b = getdvar(@"hash_81ecb9cb95ca6315", "");
    var_8f62e3ed4e85ae6f = strtok(var_ae05dc693da6219b, ",");
    var_1a6ebd3fdf4d3348 = ter_op(isdefined(level.var_49839a7ef42e68d8), level.var_49839a7ef42e68d8, getspawnarray("mp_ob_spawn_start"));
    var_8ef757412d5dd1a8 = max(var_1a6ebd3fdf4d3348.size, 32);
    for (i = 0; i < var_8ef757412d5dd1a8; i++) {
        var_92744429a7aefa37 = [];
        foreach (spawnpoint in var_1a6ebd3fdf4d3348) {
            if (var_611bab205d53658.size && array_contains(var_611bab205d53658, spawnpoint.script_noteworthy)) {
                continue;
            }
            if (var_8f62e3ed4e85ae6f.size && !array_contains(var_8f62e3ed4e85ae6f, spawnpoint.script_noteworthy)) {
                continue;
            }
            if (!istrue(level.var_529deb371b5eeb12)) {
                v_ground = getgroundposition(spawnpoint.origin, 32, 100, 1000);
                if (isdefined(v_ground) && spawnpoint.origin[2] < v_ground[2]) {
                    spawnpoint.var_ff2200522d8d9528 = spawnpoint.origin;
                    spawnpoint.origin = v_ground;
                    goto LOC_00000240;
                }
                jumpiffalse(!isdefined(v_ground) || isdefined(v_ground) && spawnpoint.origin[2] > v_ground[2] && spawnpoint.origin[2] - v_ground[2] >= 1000) LOC_00000240;
            } else if (int(spawnpoint.script_noteworthy) == i) {
                level.spawnmins = spawnlogic::expandmins(level.spawnmins, spawnpoint.origin);
                level.spawnmaxs = spawnlogic::expandmaxs(level.spawnmaxs, spawnpoint.origin);
                var_92744429a7aefa37[var_92744429a7aefa37.size] = spawnpoint;
            }
        }
        if (var_92744429a7aefa37.size > 0) {
            /#
                assertex(var_92744429a7aefa37.size >= level.maxsquadsize, "Found mp_ob_spawn_start spawner with the wrong number of structs (expected: " + level.maxsquadsize + ", found: " + var_92744429a7aefa37.size + ")");
            #/
            level.var_7a8e039103b51e0f[level.var_7a8e039103b51e0f.size] = var_92744429a7aefa37;
        }
    }
    if (isdefined(level.var_7a8e039103b51e0f) && level.var_7a8e039103b51e0f.size) {
        n_index = randomint(level.var_7a8e039103b51e0f.size);
        var_1c1199e2866d3c19 = [];
        for (i = 0; i < level.var_7a8e039103b51e0f.size; i++) {
            var_1c1199e2866d3c19[i] = level.var_7a8e039103b51e0f[n_index];
            n_index++;
            if (n_index > level.var_7a8e039103b51e0f.size - 1) {
                n_index = n_index - level.var_7a8e039103b51e0f.size;
            }
        }
        level.var_7a8e039103b51e0f = var_1c1199e2866d3c19;
    }
    level.var_58e42ba69dd6c534 = var_1a6ebd3fdf4d3348;
    if (level.var_46901be2468e1d90) {
        function_25e87761f87375c9();
    }
    level.mapcenter = spawnlogic::findboxcenter(level.spawnmins, level.spawnmaxs);
    setmapcenter(level.mapcenter);
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xa87a
// Size: 0x129
function private function_49a1650a628f0fe2(player) {
    if (isdefined(player.var_87a91b2a8231f4f8)) {
        return player.var_87a91b2a8231f4f8;
    }
    spawnpoint = undefined;
    if (player.var_ff97225579de16a < level.var_7a8e039103b51e0f.size) {
        var_92744429a7aefa37 = level.var_7a8e039103b51e0f[player.var_ff97225579de16a];
        spawnpoint = var_92744429a7aefa37[player.var_3f78c6a0862f9e25];
    }
    if (!isdefined(spawnpoint) && level.var_7a8e039103b51e0f.size) {
        var_92744429a7aefa37 = level.var_7a8e039103b51e0f[0];
        spawnpoint = var_92744429a7aefa37[player.var_3f78c6a0862f9e25];
        if (!isdefined(spawnpoint)) {
            spawnpoint = var_92744429a7aefa37[0];
        }
        if (isdefined(spawnpoint)) {
            /#
                println("<unknown string>" + player.var_ff97225579de16a + "<unknown string>" + player.var_3f78c6a0862f9e25 + "<unknown string>");
            #/
            logstring("==OB SPAWN Not enough spawn points in array found for Squad ID: " + player.var_ff97225579de16a + ", Member Index: " + player.var_3f78c6a0862f9e25 + " so using index 0 in spawn array as a fallback");
        }
    }
    player.var_87a91b2a8231f4f8 = spawnpoint;
    return spawnpoint;
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xa9ab
// Size: 0xb2
function private function_781ce82d9ee85375(player) {
    var_eb5a9091076e21e8 = player squad_utility::getSquadMembers(undefined, 1);
    a_alive_players = teams::getteamdata(player.team, "alivePlayers");
    var_ca6cb795c6157047 = utility::function_53c4c53197386572(function_2de08d8b512d4c30(var_eb5a9091076e21e8), function_2de08d8b512d4c30(a_alive_players));
    if (isdefined(var_ca6cb795c6157047)) {
        return var_ca6cb795c6157047;
    }
    if (level.var_58e42ba69dd6c534.size > 0) {
        return level.var_58e42ba69dd6c534[randomint(level.var_58e42ba69dd6c534.size)];
    }
    /#
        iprintlnbold("<unknown string>" + player.var_ff97225579de16a + "<unknown string>");
    #/
    return undefined;
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xaa65
// Size: 0x133
function private function_2de08d8b512d4c30(a_players) {
    a_players = utility::array_remove(a_players, self);
    a_players = utility::array_randomize(a_players);
    var_ca6cb795c6157047 = spawnstruct();
    min = 75;
    max = 100;
    foreach (other_player in a_players) {
        var_bcfec646853a95c1 = randomintrange(min, max) * utility::ter_op(utility::cointoss(), 1, -1);
        var_bcfec546853a938e = randomintrange(min, max) * utility::ter_op(utility::cointoss(), 1, -1);
        var_ca6cb795c6157047.origin = getclosestpointonnavmesh(other_player.origin + (var_bcfec646853a95c1, var_bcfec546853a938e, 0));
        if (!isdefined(var_ca6cb795c6157047.origin)) {
            continue;
        }
        var_ca6cb795c6157047.angles = other_player.angles;
        var_ca6cb795c6157047.index = 0;
        return var_ca6cb795c6157047;
    }
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xab9f
// Size: 0xdd
function private function_afdf639b450a4c19() {
    if (namespace_36f464722d326bbe::function_6493ec89ae923684()) {
        namespace_92443376a63aa4bd::start();
    }
    setclientnamemode("auto_change");
    namespace_e47f1f0e697a80a::function_e85a33353200a325();
    game_utility::setobjectivetext("allies", "OBJECTIVES/OB");
    game_utility::setobjectivescoretext("allies", "OBJECTIVES/OB_SCORE");
    game_utility::setobjectivehinttext("allies", "OBJECTIVES/OB_HINT");
    initspawns();
    if (namespace_6bf5a85a2b78b77a::function_6934349b7823d888()) {
        level.var_42b1e877ab187c6 = "splash_list_jup_ob";
        namespace_6bf5a85a2b78b77a::init();
        utility::registersharedfunc("hud", "showBrDMZSplash", &namespace_9a3cc734bcf13a48::showDMZSplash);
        if (namespace_aca170e0fe882d77::function_4db915a9ce0e903a()) {
            namespace_aca170e0fe882d77::init();
            if (getdvarint(@"hash_231e75b4e3b83cb0", 0)) {
                namespace_aca170e0fe882d77::function_31097cf0c8f08654();
            }
        }
    }
    namespace_e4691dd72735bbc5::inittankspawns();
    if (pmc_missions::function_cff2f4f168b29b81()) {
        pmc_missions::function_5a9c4bf10785ce1e();
    } else {
        pmc_missions::cleanup();
    }
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xac83
// Size: 0x12e
function private function_396d5dfdb965e73() {
    spawnpoint = undefined;
    if (function_a275bf1666c6a7eb() && getdvarint(@"hash_ea2511831ad6764e", 1)) {
        spawnpoint = function_6d3ebe9af4963f4b(self);
        if (!isdefined(spawnpoint)) {
            spawnpoint = function_49a1650a628f0fe2(self);
        }
        if (!isdefined(spawnpoint) && level.var_46901be2468e1d90) {
            spawnlogic::activatespawnset("start_attackers", 1);
            spawnpoint = spawnlogic::getspawnpoint(self, "allies", undefined, "start_attackers");
        }
    } else if (spawnlogic::shoulduseteamstartspawn()) {
        spawnpoint = function_49a1650a628f0fe2(self);
        if (!isdefined(spawnpoint) && level.var_46901be2468e1d90) {
            spawnlogic::activatespawnset("start_attackers", 1);
            spawnpoint = spawnlogic::getspawnpoint(self, "allies", undefined, "start_attackers");
        }
    } else {
        spawnpoint = function_781ce82d9ee85375(self);
        if (!isdefined(spawnpoint) && level.var_46901be2468e1d90) {
            spawnlogic::activatespawnset("normal", 1);
            spawnpoint = spawnlogic::getspawnpoint(self, "allies", undefined, "normal");
        }
    }
    /#
        assertex(isdefined(spawnpoint), "No Spawn point found for Squad ID: " + self.var_ff97225579de16a + " index: " + self.var_3f78c6a0862f9e25);
    #/
    return spawnpoint;
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xadb9
// Size: 0x1d9
function private function_ba935ae14946095d() {
    level endon("game_ended");
    utility::flag_wait("wallbuy_ready");
    if (isdefined(level.var_9018e49e6fa42f08)) {
        var_68ce6e0e58bd3de1 = [];
        foreach (wallbuy in level.var_9018e49e6fa42f08) {
            if (isdefined(wallbuy.var_2dda78d4f81fa52f)) {
                region = namespace_f721fc7d0d2d0f47::function_688103a7b4041bf8(wallbuy.origin);
                if (isdefined(region)) {
                    if (!isdefined(var_68ce6e0e58bd3de1[region])) {
                        var_68ce6e0e58bd3de1[region] = [];
                        var_68ce6e0e58bd3de1[region]["white"] = 0;
                        var_68ce6e0e58bd3de1[region]["green"] = 0;
                        var_68ce6e0e58bd3de1[region]["blue"] = 0;
                        var_68ce6e0e58bd3de1[region]["purple"] = 0;
                        var_68ce6e0e58bd3de1[region]["orange"] = 0;
                        var_68ce6e0e58bd3de1[region]["total"] = 1;
                    } else {
                        var_68ce6e0e58bd3de1[region]["total"]++;
                    }
                }
            }
        }
        var_52ca42e37fa3fdd2 = arraycopy(level.var_9018e49e6fa42f08);
        var_52ca42e37fa3fdd2 = utility::array_randomize_objects(var_52ca42e37fa3fdd2);
        foreach (wallbuy in var_52ca42e37fa3fdd2) {
            if (isdefined(wallbuy.var_2dda78d4f81fa52f)) {
                region = namespace_f721fc7d0d2d0f47::function_688103a7b4041bf8(wallbuy.origin);
                if (isdefined(region)) {
                    difficulty = namespace_f721fc7d0d2d0f47::function_4d8bb2d866771a10(wallbuy.origin);
                    var_57a00eab7e9d8871 = function_b80dc154025d11df(var_68ce6e0e58bd3de1, region, difficulty);
                    var_68ce6e0e58bd3de1[region][var_57a00eab7e9d8871]++;
                } else {
                    var_57a00eab7e9d8871 = "green";
                }
                wallbuy::function_e898734a6a951c57(wallbuy, var_57a00eab7e9d8871);
                waitframe();
            }
        }
    }
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xaf99
// Size: 0x22c
function function_b80dc154025d11df(var_68ce6e0e58bd3de1, region, difficulty) {
    var_4a4a0bdb3d754927 = var_68ce6e0e58bd3de1[region]["white"];
    var_79f1c929b1448604 = var_68ce6e0e58bd3de1[region]["green"];
    var_1c0a4ce5574ba58e = var_68ce6e0e58bd3de1[region]["blue"];
    var_2a0ab144dad21d0f = var_68ce6e0e58bd3de1[region]["purple"];
    var_6efdef3234d67603 = var_68ce6e0e58bd3de1[region]["orange"];
    n_total = var_68ce6e0e58bd3de1[region]["total"];
    var_57a00eab7e9d8871 = "white";
    switch (difficulty) {
    case #"hash_7bb2cd766703d463":
    case #"hash_a1e09f51896088fb":
        var_57a00eab7e9d8871 = "green";
        if (var_4a4a0bdb3d754927 < n_total * 0) {
            var_57a00eab7e9d8871 = "white";
        } else if (var_79f1c929b1448604 < n_total * 0.7) {
            var_57a00eab7e9d8871 = "green";
        } else if (var_1c0a4ce5574ba58e < n_total * 0.2) {
            var_57a00eab7e9d8871 = "blue";
        } else if (var_2a0ab144dad21d0f < n_total * 0.1) {
            var_57a00eab7e9d8871 = "purple";
        }
        break;
    case #"hash_af83e47edfa8900a":
        var_57a00eab7e9d8871 = "blue";
        if (var_79f1c929b1448604 < n_total * 0.2) {
            var_57a00eab7e9d8871 = "green";
        } else if (var_1c0a4ce5574ba58e < n_total * 0.55) {
            var_57a00eab7e9d8871 = "blue";
        } else if (var_2a0ab144dad21d0f < n_total * 0.25) {
            var_57a00eab7e9d8871 = "purple";
        } else if (var_6efdef3234d67603 < n_total * 0) {
            var_57a00eab7e9d8871 = "orange";
        }
        break;
    case #"hash_5343b465e56ec9a4":
        var_57a00eab7e9d8871 = "purple";
        if (var_1c0a4ce5574ba58e < n_total * 0) {
            var_57a00eab7e9d8871 = "blue";
        } else if (var_2a0ab144dad21d0f < n_total * 0.4) {
            var_57a00eab7e9d8871 = "purple";
        } else if (var_6efdef3234d67603 < n_total * 0.6) {
            var_57a00eab7e9d8871 = "orange";
        }
        break;
    case #"hash_651f76c0ad6741ec":
        var_57a00eab7e9d8871 = "orange";
        if (var_2a0ab144dad21d0f < n_total * 0.4) {
            var_57a00eab7e9d8871 = "purple";
        } else if (var_6efdef3234d67603 < n_total * 0.6) {
            var_57a00eab7e9d8871 = "orange";
        }
        break;
    }
    return var_57a00eab7e9d8871;
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb1cd
// Size: 0x7e
function ongrenadeused(weaponname, grenade) {
    switch (weaponname) {
    case #"hash_e69f44ae97e8fc97":
        thread monkey_bomb::function_f72973904792660f(grenade);
        break;
    case #"hash_1a97a0c7029a2037":
        thread inhibitor::function_427def4c56968d9f(grenade);
        break;
    case #"hash_2e1bd7477a3d005b":
        thread utility::function_f3bb4f4911a1beb2("aether_blade", "on_grenade_used", grenade);
        break;
    default:
        break;
    }
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb252
// Size: 0x1a
function function_c2adff26c86b4203(sweapon) {
    if (namespace_a5c2977d842bbf87::function_4e53c739bf22ff46(sweapon)) {
        return 1;
    }
    return 0;
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb274
// Size: 0x6d
function function_45a63bc9c79a2b09() {
    if (getdvarint(@"hash_e21e718cfe10e8c2", 1) == 0) {
        return;
    }
    level.var_cb78b9c3bc5211e9 = 20;
    level.var_503460970f6e03c1 = utility::function_a5b14435e3229bed(120);
    callback::add("car_alarm_on", &car_alarm_on);
    callback::add("car_alarm_off", &car_alarm_off);
    namespace_3c37cb17ade254d::registersharedfunc("tripwire", "tripwire_override", &function_3706f97e70f707f3);
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb2e8
// Size: 0x40
function function_4af0f5cc23887feb(attractor, zombie) {
    if (utility::is_equal(zombie.aicategory, "normal")) {
        return (zombie.team == "team_two_hundred");
    }
    return 0;
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb330
// Size: 0xd9
function car_alarm_on(params) {
    if (!isent(params.vehicle)) {
        return;
    }
    params.vehicle thread function_42117a75c66498f6();
    level namespace_d491530661d3e380::function_c0d3ba0eab1acba0(params.vehicle, undefined, 512, 1, &function_42370e15241d19c9, &function_4af0f5cc23887feb, undefined);
    params.vehicle endon("car_alarm_complete");
    teams = [0:"team_two_hundred", 1:"team_hundred_ninety", 2:"axis"];
    while (isdefined(params.vehicle)) {
        event::event_broadcast_generic("decoy_grenade", getclosestpointonnavmesh(params.vehicle.origin), 1500, params.vehicle, teams);
        wait(1);
    }
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb410
// Size: 0x23
function function_42117a75c66498f6() {
    self notify("car_alarm_complete");
    self endon("car_alarm_complete");
    self waittill("death");
    level namespace_d491530661d3e380::function_6e660434fe00b495(self);
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb43a
// Size: 0x45
function car_alarm_off(params) {
    params.vehicle notify("car_alarm_complete");
    if (!isent(params.vehicle)) {
        return;
    }
    level namespace_d491530661d3e380::function_6e660434fe00b495(params.vehicle);
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb486
// Size: 0x70
function function_42370e15241d19c9(attractor, zombie) {
    obb = level namespace_d491530661d3e380::function_490c3f1f3e5b6abe(attractor);
    var_6d85b80f57609a0d = math::function_6c1e6433c5e5cf79(zombie.origin, obb.origin, obb.half_size * 0.25, obb.angles);
    return getclosestpointonnavmesh(var_6d85b80f57609a0d);
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb4fe
// Size: 0x65
function function_3e582a8452f90572() {
    if (getdvarint(@"hash_f7947a00aaa8897f", 1) == 0) {
        return;
    }
    thread function_288e19381da612c4();
    if (!isbot(self)) {
        self notifyonplayercommand("ob_down_press", "+actionslot 2");
        self notifyonplayercommand("ob_down_release", "-actionslot 2");
        self notifyonplayercommand("ob_down_toggle", "third_person_toggle");
    }
    thread function_a5b4f879fa425057();
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb56a
// Size: 0x112
function function_a5b4f879fa425057() {
    self endon("disconnect");
    var_40123bf2077ce968 = 0;
    var_e8f400f6f31d7f6f = 500;
    var_a8c5a8705ebf33f5 = var_e8f400f6f31d7f6f / 1000;
    var_40ec201cab12ba90 = 1000;
    value = undefined;
    while (1) {
        if (var_40123bf2077ce968 == 0) {
            value = utility::waittill_any_return_3("ob_down_press", "ob_down_release", "ob_down_toggle");
        } else {
            value = utility::waittill_any_timeout_1(var_a8c5a8705ebf33f5, "ob_down_release");
        }
        if (!isalive(self) || !isdefined(value)) {
            continue;
        }
        if (isdefined(self.var_34f110a584482e9) && gettime() < self.var_34f110a584482e9 + var_40ec201cab12ba90) {
            var_40123bf2077ce968 = 0;
            continue;
        }
        var_2ba0b3b0f4a0e6be = 0;
        if (value == "ob_down_release") {
            var_40123bf2077ce968 = 0;
        } else if (value == "timeout" || value == "ob_down_toggle") {
            var_2ba0b3b0f4a0e6be = 1;
            var_40123bf2077ce968 = 0;
        } else if (var_40123bf2077ce968 == 0) {
            var_40123bf2077ce968 = gettime();
        }
        if (var_2ba0b3b0f4a0e6be) {
            function_7372fcc8bea11ae9();
        }
    }
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb683
// Size: 0x9c
function function_7372fcc8bea11ae9(override) {
    if (!isplayer(self)) {
        /#
            assertmsg("Can only toggle third person on players");
        #/
        return;
    }
    if (isdefined(self.var_8789029d90c5e2de)) {
        return;
    }
    if (isalive(self) && !self function_793f941d7dff15ed() && !istrue(self.var_bdeecf4a8259041c)) {
        isthirdperson = self GetCameraThirdPerson();
        if (isdefined(override)) {
            isthirdperson = !override;
        }
        self setcamerathirdperson(!isthirdperson);
        self setclientomnvar("ui_toggle_third_person", !isthirdperson);
        self setplayerdata("common", "mpProgression", "thirdPerson", !isthirdperson);
    }
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb726
// Size: 0x36
function function_4a39c5c1f9ea026f(entnum) {
    player = getentbynum(entnum);
    if (!isdefined(player) || !isplayer(player)) {
        return;
    }
    player function_7372fcc8bea11ae9();
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb763
// Size: 0x66
function function_288e19381da612c4() {
    if (!getdvarint(@"hash_2fe0283b419ff08a", 0) && !level flag("ob_infil_completed")) {
        return;
    }
    var_aa1caebf050b34cc = self getplayerdata("common", "mpProgression", "thirdPerson");
    if (!isdefined(var_aa1caebf050b34cc)) {
        return;
    }
    if (istrue(var_aa1caebf050b34cc)) {
        function_7372fcc8bea11ae9(1);
    } else {
        function_7372fcc8bea11ae9(0);
    }
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb7d0
// Size: 0xd1
function function_6beff7b631ab7e18(kiosk, player) {
    str_difficulty = namespace_f721fc7d0d2d0f47::function_4d8bb2d866771a10(kiosk.origin);
    switch (str_difficulty) {
    case #"hash_7bb2cd766703d463":
        kiosk.var_7940dcde72827af7 = loot::function_54b046aa3ba2678a("jup_ob_green");
        break;
    case #"hash_af83e47edfa8900a":
        kiosk.var_7940dcde72827af7 = loot::function_54b046aa3ba2678a("jup_ob_yellow");
        break;
    case #"hash_5343b465e56ec9a4":
        kiosk.var_7940dcde72827af7 = loot::function_54b046aa3ba2678a("jup_ob_orange");
        break;
    case #"hash_651f76c0ad6741ec":
        kiosk.var_7940dcde72827af7 = loot::function_54b046aa3ba2678a("jup_ob_red");
        break;
    }
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb8a8
// Size: 0x2bd
function function_c5e1b4bc550bbad6() {
    level endon("game_ended");
    if (!isdefined(level.var_c092c207acdfa48)) {
        return;
    }
    if (!isdefined(level.var_8241e0d86017df29)) {
        return;
    }
    var_74dade39e02d8fee = [];
    var_3c3122af5c02bd7 = utility::getstructarray("content_struct", "variantname");
    foreach (struct in var_3c3122af5c02bd7) {
        if (isdefined(struct.content_key) && struct.content_key == "perk_machine_choice_spawn") {
            var_74dade39e02d8fee = utility::array_add(var_74dade39e02d8fee, struct);
        }
    }
    var_74dade39e02d8fee = utility::array_randomize(var_74dade39e02d8fee);
    var_1c0f2cd5e36ddb62 = [];
    foreach (spawn_point in var_74dade39e02d8fee) {
        region = [[ level.var_c092c207acdfa48 ]](spawn_point.origin);
        difficulty = [[ level.var_8241e0d86017df29 ]](spawn_point.origin);
        if (isdefined(region) && isdefined(difficulty)) {
            if (difficulty != "difficulty_hard" && difficulty != "difficulty_darkaether") {
                jumpiffalse(!isdefined(spawn_point.script_noteworthy) || isdefined(spawn_point.script_noteworthy) && spawn_point.script_noteworthy != "force_spawn") LOC_000001df;
            } else {
            LOC_000001df:
                if (!isdefined(var_1c0f2cd5e36ddb62[region])) {
                    var_1c0f2cd5e36ddb62[region] = [];
                }
                var_1c0f2cd5e36ddb62[region] = utility::function_6d6af8144a5131f1(var_1c0f2cd5e36ddb62[region], spawn_point);
            }
        }
    }
    foreach (var_8310cfb9843fc5d7 in var_1c0f2cd5e36ddb62) {
        n_count = 0;
        foreach (spawn_point in var_8310cfb9843fc5d7) {
            spawn_point perk_machines::function_584ef0be51af00df(spawn_point);
            n_count++;
            /#
                if (getdvarint(@"hash_219f76f29e4d14ce", 0) == 1) {
                    level thread perk_machines::function_306940dddbeb1537(spawn_point);
                }
            #/
            if (getdvarint(@"hash_a43f94a671632470", 0) == 1) {
                continue;
            }
            if (n_count >= 1) {
                break;
            }
        }
    }
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbb6c
// Size: 0x3c
function function_3706f97e70f707f3(var_2d9552508615d396, tripwire) {
    if (isdefined(tripwire.var_e6013eac45290cab) && isdefined(tripwire.var_70587812595fd991)) {
        namespace_75b9b66caa533c31::function_aed7a5e07b895fa(var_2d9552508615d396, tripwire);
    }
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbbaf
// Size: 0x83
function function_85644bb2a5b463d0(origin) {
    region = namespace_f721fc7d0d2d0f47::function_688103a7b4041bf8(origin);
    if (isdefined(region)) {
        difficulty = namespace_f721fc7d0d2d0f47::function_4d8bb2d866771a10(origin);
        if (difficulty == "difficulty_easy") {
            return "ob_jup_items_zone_def_green";
        } else if (difficulty == "difficulty_normal") {
            return "ob_jup_items_zone_def_yellow";
        } else if (difficulty == "difficulty_hard") {
            return "ob_jup_items_zone_def_orange";
        } else if (difficulty == "difficulty_darkaether") {
            return "ob_jup_items_zone_def_red";
        }
    }
    return "ob_jup_items_zone_def_global";
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbc3a
// Size: 0x31
function function_baf75ba94ab12e1d() {
    if (getdvarint(@"hash_9a1a15edbe15ed6c", 0)) {
        return 1;
    }
    /#
        if (getdvarint(@"hash_f1d9adca8cbf293c", 0)) {
            return 1;
        }
    #/
    return 0;
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xbc73
// Size: 0x20d
function private function_30161d48bcb4f141(weaponindex, location, var_fb6bafb61d5c3d4a) {
    metadata = spawnstruct();
    metadata.keys = [];
    metadata.values = [];
    for (key = 3; key <= 5; key++) {
        metadata.keys[metadata.keys.size] = key;
        metadata.values[metadata.values.size] = 0;
    }
    weapon = namespace_736197e4d378b91b::function_2aeaf88105d3b617(weaponindex);
    if (isdefined(weapon)) {
        /#
            assert(isdefined(self.var_e763169cf4dfd7b2));
        #/
        /#
            assert(isdefined(self.var_e763169cf4dfd7b2.var_13517268a9932b89));
        #/
        /#
            assert(isdefined(self.var_e763169cf4dfd7b2.var_82449ed37b8b39ed));
        #/
        /#
            assert(isdefined(self.var_e763169cf4dfd7b2.var_197220004953dcf6));
        #/
        if (isdefined(self.var_e763169cf4dfd7b2.var_13517268a9932b89[weaponindex])) {
            metadata.values[0] = self.var_e763169cf4dfd7b2.var_13517268a9932b89[weaponindex];
        }
        if (isdefined(self.var_e763169cf4dfd7b2.var_82449ed37b8b39ed[weaponindex])) {
            metadata.values[1] = self.var_e763169cf4dfd7b2.var_82449ed37b8b39ed[weaponindex];
        }
        if (isdefined(self.var_e763169cf4dfd7b2.var_197220004953dcf6[weaponindex])) {
            metadata.values[2] = self.var_e763169cf4dfd7b2.var_197220004953dcf6[weaponindex];
        }
    }
    var_8488a6af29de20a = self function_644ed519cac9722b(location, var_fb6bafb61d5c3d4a);
    if (namespace_9571f642f38c8169::function_3f8c62126708afe6(var_8488a6af29de20a)) {
        namespace_9571f642f38c8169::function_8715433c6e64940b(metadata.keys, metadata.values, var_8488a6af29de20a);
    }
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xbe87
// Size: 0x3bc
function private function_85412e591c67b11f(player) {
    if (namespace_41bcc2f40ffd0e7f::function_9487b6b2ba44f9db(player)) {
        player function_30161d48bcb4f141(0, 1, 0);
        player function_30161d48bcb4f141(1, 1, 1);
        player namespace_9571f642f38c8169::function_a38bb104e7769055();
        var_27c3815667fcc5e8 = player zombie_perks::function_ad6e85c9533ac466();
        if (var_27c3815667fcc5e8.size > 0) {
            var_a0290f9306de93ea = namespace_49e179ec476603d6::function_2c836ad05e5f634c(var_27c3815667fcc5e8[0]);
        }
        if (isdefined(var_a0290f9306de93ea)) {
            components = [];
            foreach (perk in var_27c3815667fcc5e8) {
                lootid = namespace_49e179ec476603d6::function_2c836ad05e5f634c(perk);
                if (isdefined(lootid)) {
                    components[components.size] = lootid;
                }
            }
            player namespace_9571f642f38c8169::function_b1fcbec168284539(var_a0290f9306de93ea, 18, 9, 0, components);
        }
        if (istrue(player.var_28c033c3c5b37f1f) || isdefined(player.var_cfcc6e11258851f0) || isdefined(player.var_8902b4030fc972fc)) {
            var_efc8f786867b142a = namespace_49e179ec476603d6::function_2c836ad05e5f634c("jup_golden_armor_plate");
            if (isdefined(var_efc8f786867b142a)) {
                var_fe133b0dc812bc79 = [];
                if (istrue(player.var_28c033c3c5b37f1f)) {
                    lootid = namespace_49e179ec476603d6::function_2c836ad05e5f634c("jup_golden_armor_plate");
                    var_fe133b0dc812bc79[var_fe133b0dc812bc79.size] = lootid;
                }
                if (isdefined(player.var_cfcc6e11258851f0)) {
                    lootid = namespace_49e179ec476603d6::function_2c836ad05e5f634c("jup_dog_whistle");
                    var_fe133b0dc812bc79[var_fe133b0dc812bc79.size] = lootid;
                }
                if (istrue(player.var_8902b4030fc972fc)) {
                    lootid = namespace_49e179ec476603d6::function_2c836ad05e5f634c("jup_golden_ammo");
                    var_fe133b0dc812bc79[var_fe133b0dc812bc79.size] = lootid;
                }
                player namespace_9571f642f38c8169::function_b1fcbec168284539(var_efc8f786867b142a, 18, 9, 1, var_fe133b0dc812bc79);
                var_de69e37eee46c75e = self function_644ed519cac9722b(9, 1);
                if (namespace_9571f642f38c8169::function_3f8c62126708afe6(var_de69e37eee46c75e)) {
                    keys = [];
                    values = [];
                    if (isdefined(player.var_cfcc6e11258851f0)) {
                        keys[keys.size] = 7;
                        values[values.size] = isdefined(player.var_cfcc6e11258851f0.nameindex) ? 0 : player.var_cfcc6e11258851f0.nameindex;
                        var_ffb12bd85c915856 = 1;
                        if (isdefined(player.var_cfcc6e11258851f0.difficulty)) {
                            switch (player.var_cfcc6e11258851f0.difficulty) {
                            case #"hash_af83e47edfa8900a":
                                var_ffb12bd85c915856 = 2;
                                break;
                            case #"hash_5343b465e56ec9a4":
                                var_ffb12bd85c915856 = 3;
                                break;
                            case #"hash_651f76c0ad6741ec":
                                var_ffb12bd85c915856 = 4;
                                break;
                            }
                        }
                        keys[keys.size] = 8;
                        values[values.size] = var_ffb12bd85c915856;
                    }
                    if (keys.size > 0) {
                        namespace_9571f642f38c8169::function_8715433c6e64940b(keys, values, var_de69e37eee46c75e);
                    }
                }
            }
        }
        var_c012b162499f3db0 = namespace_c8f50c27f5dd5ed8::function_d66381667ff586f7();
        currency = var_c012b162499f3db0[1];
        var_4288c013f4ab2952 = var_c012b162499f3db0[0];
        if (isdefined(var_4288c013f4ab2952)) {
            var_7bf4dd1b5684c089 = namespace_49e179ec476603d6::function_6d15e119c2779a93(var_4288c013f4ab2952);
            if (isdefined(var_7bf4dd1b5684c089)) {
                components = [];
                player namespace_9571f642f38c8169::function_b1fcbec168284539(var_7bf4dd1b5684c089, 16, 1, 12, components);
                var_9d6fd4ce917d0ad5 = player function_644ed519cac9722b(1, 12);
                if (namespace_9571f642f38c8169::function_3f8c62126708afe6(var_9d6fd4ce917d0ad5)) {
                    player function_77eff0a02c92c9b7(var_9d6fd4ce917d0ad5.var_fb5fdfafc29f4513, currency);
                }
            }
        }
    } else {
        player function_7e4486576be9af3f(0, 1, 0);
        player function_7e4486576be9af3f(1, 1, 1);
        player namespace_9571f642f38c8169::function_a38bb104e7769055();
        player namespace_9571f642f38c8169::function_5a62e05c264fbe50(1, 12);
    }
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xc24a
// Size: 0x106
function private function_ab09ae14076429a4(weaponindex, location, var_fb6bafb61d5c3d4a) {
    var_8488a6af29de20a = self function_644ed519cac9722b(location, var_fb6bafb61d5c3d4a);
    if (namespace_9571f642f38c8169::function_3f8c62126708afe6(var_8488a6af29de20a)) {
        var_dc90dedcb800b720 = namespace_9571f642f38c8169::function_f6c6c8920a5333e7(3, var_8488a6af29de20a, 0);
        rarity = namespace_9571f642f38c8169::function_f6c6c8920a5333e7(4, var_8488a6af29de20a, 0);
        var_49acfea1433dc914 = namespace_9571f642f38c8169::function_f6c6c8920a5333e7(5, var_8488a6af29de20a, 0);
        weapon = namespace_736197e4d378b91b::function_2aeaf88105d3b617(weaponindex);
        if (isdefined(weapon)) {
            if (isdefined(rarity)) {
                rarity = int(rarity);
                namespace_736197e4d378b91b::function_3a0412b800f3331d(weapon, rarity);
            }
            if (isdefined(var_49acfea1433dc914)) {
                var_49acfea1433dc914 = int(var_49acfea1433dc914);
                if (var_49acfea1433dc914 > 0) {
                    ammomod = namespace_2e04133215e83a48::function_bd988da177969d52(var_49acfea1433dc914);
                    if (isdefined(ammomod) && ammomod != "") {
                        namespace_2e04133215e83a48::function_6c40f58b29a952a9(weapon, ammomod);
                    }
                }
            }
            if (isdefined(var_dc90dedcb800b720)) {
                var_dc90dedcb800b720 = int(var_dc90dedcb800b720);
                if (var_dc90dedcb800b720 > 0) {
                    pack_a_punch::pap_weapon(weapon, var_dc90dedcb800b720 - 1);
                    waitframe();
                }
            }
        }
    }
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xc357
// Size: 0xcf
function private function_7e4486576be9af3f(weaponindex, location, var_fb6bafb61d5c3d4a) {
    metadata = spawnstruct();
    metadata.keys = [];
    metadata.values = [];
    for (key = 3; key <= 5; key++) {
        metadata.keys[metadata.keys.size] = key;
        metadata.values[metadata.values.size] = 0;
    }
    var_8488a6af29de20a = self function_644ed519cac9722b(location, var_fb6bafb61d5c3d4a);
    if (namespace_9571f642f38c8169::function_3f8c62126708afe6(var_8488a6af29de20a)) {
        namespace_9571f642f38c8169::function_8715433c6e64940b(metadata.keys, metadata.values, var_8488a6af29de20a);
    }
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xc42d
// Size: 0x26a
function private function_a88315ac19af6ad7(var_de69e37eee46c75e) {
    if (!namespace_9571f642f38c8169::function_3f8c62126708afe6(var_de69e37eee46c75e) || !isdefined(var_de69e37eee46c75e.var_6cb812578f7d9ae7)) {
        return;
    }
    foreach (lootid in var_de69e37eee46c75e.var_6cb812578f7d9ae7) {
        if (!isdefined(lootid) || lootid == 0) {
            continue;
        }
        itembundle = namespace_49e179ec476603d6::function_f4a303d532b044a7(lootid);
        if (!isdefined(itembundle)) {
            continue;
        }
        item = spawnstruct();
        item.type = itembundle.scriptable;
        item.count = namespace_49e179ec476603d6::function_7209c8cd4b2e3afd(1);
        item.var_a6293f3144240b99 = 1;
        namespace_49e179ec476603d6::function_de489fa2ffdb7f2d(item, 0);
        if (itembundle.subtype == "dog_whistle" && isdefined(self.var_cfcc6e11258851f0)) {
            var_5aa41c708314f26d = namespace_9571f642f38c8169::function_f6c6c8920a5333e7(7, var_de69e37eee46c75e, 0);
            if (isstring(var_5aa41c708314f26d)) {
                self.var_cfcc6e11258851f0.nameindex = int(var_5aa41c708314f26d);
            }
            var_ffb12bd85c915856 = namespace_9571f642f38c8169::function_f6c6c8920a5333e7(8, var_de69e37eee46c75e, 0);
            if (isstring(var_ffb12bd85c915856)) {
                var_55ac804b4c2e80a3 = "difficulty_easy";
                var_cb36002629685317 = getdvarint(@"hash_bb677973b07d33f7", 7500);
                switch (var_ffb12bd85c915856) {
                case #"hash_311012bc01bd3d35":
                    var_55ac804b4c2e80a3 = "difficulty_normal";
                    var_cb36002629685317 = getdvarint(@"hash_bb677a73b07d362a", 18000);
                    break;
                case #"hash_311011bc01bd3ba2":
                    var_55ac804b4c2e80a3 = "difficulty_hard";
                    var_cb36002629685317 = getdvarint(@"hash_bb677b73b07d385d", 30000);
                    break;
                case #"hash_31100cbc01bd33c3":
                    var_55ac804b4c2e80a3 = "difficulty_darkaether";
                    var_cb36002629685317 = getdvarint(@"hash_bb677473b07d28f8", 45000);
                    break;
                }
                self.var_cfcc6e11258851f0 namespace_4df2ab39b0e96ec7::function_4a4fab5fd0b06d7b(var_55ac804b4c2e80a3);
                self.var_cfcc6e11258851f0 namespace_6205bc7c5e394598::function_dd21d67ede8ba22(var_cb36002629685317);
                self.var_cfcc6e11258851f0.health = self.var_cfcc6e11258851f0.maxhealth;
            }
        }
    }
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xc69e
// Size: 0x2ab
function private function_44635a34b0826a60() {
    self endon("disconnect");
    self endon("death");
    if (function_baf75ba94ab12e1d()) {
        function_ab09ae14076429a4(0, 1, 0);
        function_ab09ae14076429a4(1, 1, 1);
        var_de69e37eee46c75e = self function_644ed519cac9722b(9, 0);
        function_a88315ac19af6ad7(var_de69e37eee46c75e);
        var_69a6bc2605a89284 = self function_644ed519cac9722b(9, 1);
        function_a88315ac19af6ad7(var_69a6bc2605a89284);
        var_9d6fd4ce917d0ad5 = self function_644ed519cac9722b(1, 12);
        if (namespace_9571f642f38c8169::function_3f8c62126708afe6(var_9d6fd4ce917d0ad5)) {
            if (isdefined(var_9d6fd4ce917d0ad5.quantity)) {
                currency = int(var_9d6fd4ce917d0ad5.quantity);
                /#
                    assert(currency >= 0);
                #/
                currency::function_3036cef61495210f("essence", currency);
            }
        }
        if (utility::issharedfuncdefined("player", "getCurrentSuper")) {
            var_19163e14365d9264 = self [[ utility::getsharedfunc("player", "getCurrentSuper") ]]();
        }
        if (isdefined(var_19163e14365d9264) && istrue(level.allowsupers)) {
            if (utility::issharedfuncdefined("supers", "getSuperPointsNeeded") && utility::issharedfuncdefined("supers", "setSuperBasePoints")) {
                self [[ utility::getsharedfunc("supers", "setSuperBasePoints") ]](self [[ utility::getsharedfunc("supers", "getSuperPointsNeeded") ]]());
            }
        }
        var_4970ac49ea82ab16 = armor::function_600f6cf462e983f();
        var_c916fe6ea244527 = armor::function_47320a25b8ee003();
        var_9ecb8dace344e93 = var_c916fe6ea244527 - var_4970ac49ea82ab16;
        armor::function_9c6e9a6643b6c9a6(var_9ecb8dace344e93);
        var_bfe236624969d2f2 = namespace_f808ba0ae0debcf5::function_39b9fdb77f6046ba();
        quantity = var_bfe236624969d2f2[1];
        var_6850e7119da34c48 = var_bfe236624969d2f2[0];
        if (isdefined(var_6850e7119da34c48)) {
            var_70e1005a8a499911 = equipment::getequipmentmaxammo(var_6850e7119da34c48.ref);
            if (isdefined(var_70e1005a8a499911) && quantity < var_70e1005a8a499911) {
                equipment::setequipmentammo(var_6850e7119da34c48.ref, var_70e1005a8a499911);
            }
        }
        var_bfe237624969d525 = namespace_f808ba0ae0debcf5::function_bed0a54fd4a86617();
        quantity = var_bfe237624969d525[1];
        var_760d00a7a465b32f = var_bfe237624969d525[0];
        if (isdefined(var_760d00a7a465b32f)) {
            var_70e1005a8a499911 = equipment::getequipmentmaxammo(var_760d00a7a465b32f.ref);
            if (isdefined(var_70e1005a8a499911) && quantity < var_70e1005a8a499911) {
                equipment::setequipmentammo(var_760d00a7a465b32f.ref, var_70e1005a8a499911);
            }
        }
        namespace_9571f642f38c8169::function_a38bb104e7769055();
        namespace_9571f642f38c8169::function_5a62e05c264fbe50(1, 12);
    } else {
        function_7e4486576be9af3f(0, 1, 0);
        function_7e4486576be9af3f(1, 1, 1);
        namespace_9571f642f38c8169::function_a38bb104e7769055();
        namespace_9571f642f38c8169::function_5a62e05c264fbe50(1, 12);
    }
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc950
// Size: 0x2e2
function function_49a36aa578018249(player) {
    var_a9c2708c8f0c59e2 = namespace_41bcc2f40ffd0e7f::function_9487b6b2ba44f9db(player);
    if (var_a9c2708c8f0c59e2) {
        /#
            if (getdvarint(@"hash_f68809e89102fb57", 0)) {
                player.var_e763169cf4dfd7b2 = spawnstruct();
            }
        #/
        /#
            assert(isdefined(player.var_e763169cf4dfd7b2));
        #/
        player.var_e763169cf4dfd7b2.var_13517268a9932b89 = [];
        player.var_e763169cf4dfd7b2.var_82449ed37b8b39ed = [];
        player.var_e763169cf4dfd7b2.var_197220004953dcf6 = [];
    }
    weaponobj = player namespace_736197e4d378b91b::function_2aeaf88105d3b617(0);
    if (isdefined(weaponobj)) {
        if (var_a9c2708c8f0c59e2) {
            player.var_e763169cf4dfd7b2.var_13517268a9932b89[0] = player pack_a_punch::get_pap_level(weaponobj);
            player.var_e763169cf4dfd7b2.var_82449ed37b8b39ed[0] = player namespace_736197e4d378b91b::function_75e73212bbe447d9(weaponobj);
            ammomod = player namespace_2e04133215e83a48::get_ammo_mod_name(weaponobj);
            id = namespace_2e04133215e83a48::function_2373b67af9c1cfc0(ammomod);
            player.var_e763169cf4dfd7b2.var_197220004953dcf6[0] = id;
        }
        player pack_a_punch::function_8a514af6a4020(weaponobj);
    }
    weaponobj = player namespace_736197e4d378b91b::function_2aeaf88105d3b617(1);
    if (isdefined(weaponobj)) {
        if (var_a9c2708c8f0c59e2) {
            player.var_e763169cf4dfd7b2.var_13517268a9932b89[1] = player pack_a_punch::get_pap_level(weaponobj);
            player.var_e763169cf4dfd7b2.var_82449ed37b8b39ed[1] = player namespace_736197e4d378b91b::function_75e73212bbe447d9(weaponobj);
            ammomod = player namespace_2e04133215e83a48::get_ammo_mod_name(weaponobj);
            id = namespace_2e04133215e83a48::function_2373b67af9c1cfc0(ammomod);
            player.var_e763169cf4dfd7b2.var_197220004953dcf6[1] = id;
        }
        player pack_a_punch::function_8a514af6a4020(weaponobj);
    }
    var_bfe234624969ce8c = player namespace_736197e4d378b91b::function_61f99d560d896d24(2);
    components = var_bfe234624969ce8c[2];
    ammo = var_bfe234624969ce8c[1];
    var_8c6107cb770062ef = var_bfe234624969ce8c[0];
    var_20c658ecc13192f4 = namespace_49e179ec476603d6::function_6d15e119c2779a93(var_8c6107cb770062ef);
    if (isdefined(var_20c658ecc13192f4) && var_20c658ecc13192f4 != 0) {
        /#
            assertmsg("Player is attempting to exfil with a weapon in their backpack. Removing that weapon since this should not be possible in Outbreak.");
        #/
        player namespace_736197e4d378b91b::function_d5143d7900e7160a(2);
    }
    if (!var_a9c2708c8f0c59e2) {
        var_65b695f0c0d909ed = 0;
        while (var_65b695f0c0d909ed < 10) {
            lootid = function_d870b2c45335bd88(var_65b695f0c0d909ed);
            if (!isdefined(lootid) || lootid == 0) {
                goto LOC_000002d7;
            }
            itembundle = function_f4a303d532b044a7(lootid);
            if (!isdefined(itembundle)) {
                goto LOC_000002d7;
            }
            if (itembundle.type == "schematic") {
                namespace_fe9526a81c458d8f::function_ca3bbb1070436540(var_65b695f0c0d909ed, 0, 0);
            LOC_000002d7:
            }
        LOC_000002d7:
            var_65b695f0c0d909ed = var_65b695f0c0d909ed + 1;
        }
    }
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcc39
// Size: 0x47
function function_91d032246bb24684(ai) {
    if (isdefined(ai.aicategory) && ai.aicategory == "boss") {
        return 1;
    }
    if (level.players.size < 3) {
        return 0;
    }
    return 1;
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xcc88
// Size: 0x39
function private function_ca2f5eb96023632a(player) {
    if (isalive(player) && (istrue(player.inlaststand) || istrue(player.isjuggernaut))) {
        return 1;
    }
    return 0;
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xccc9
// Size: 0x3e
function function_bd3a035ddab0dcc9(instance, player, edgeindex, isinverted) {
    if (!isdefined(player)) {
        return 0;
    }
    if (istrue(player.isjuggernaut)) {
        return 0;
    }
    return 1;
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcd0f
// Size: 0x2d4
function function_19b0c4d24e6a74cb(var_3616a8769e5b83c8, player) {
    if (!isdefined(player.var_40ffb4cf856d7560)) {
        player.var_40ffb4cf856d7560 = [];
    }
    if (!isdefined(level.var_40ffb4cf856d7560)) {
        level.var_40ffb4cf856d7560 = [];
    }
    if (!isdefined(level.var_fda34f2021faf56a)) {
        level.var_fda34f2021faf56a = 0;
    }
    if (level.var_40ffb4cf856d7560.size >= getdvarint(@"hash_23e1288e1c70ccda", 24) && player.var_40ffb4cf856d7560.size < getdvarint(@"hash_dbd3f481dad9a0f9", 8)) {
        var_bbfe293f8b81d08f = undefined;
        foreach (key, ent in level.var_40ffb4cf856d7560) {
            if (!isdefined(ent)) {
                player.var_40ffb4cf856d7560[key] = undefined;
                level.var_40ffb4cf856d7560[key] = undefined;
            } else if (!isdefined(var_bbfe293f8b81d08f) || ent.spawntime < level.var_40ffb4cf856d7560[var_bbfe293f8b81d08f].spawntime) {
                var_bbfe293f8b81d08f = key;
            }
        }
        if (level.var_40ffb4cf856d7560.size >= getdvarint(@"hash_23e1288e1c70ccda", 24)) {
            level.var_40ffb4cf856d7560[var_bbfe293f8b81d08f] notify("entity_limit_destroy");
            level.var_40ffb4cf856d7560[var_bbfe293f8b81d08f] = undefined;
            player.var_40ffb4cf856d7560[var_bbfe293f8b81d08f] = undefined;
        }
    } else if (player.var_40ffb4cf856d7560.size >= getdvarint(@"hash_dbd3f481dad9a0f9", 8)) {
        var_bbfe293f8b81d08f = undefined;
        foreach (key, ent in player.var_40ffb4cf856d7560) {
            if (!isdefined(ent)) {
                player.var_40ffb4cf856d7560[key] = undefined;
                level.var_40ffb4cf856d7560[key] = undefined;
            } else if (!isdefined(var_bbfe293f8b81d08f) || ent.spawntime < player.var_40ffb4cf856d7560[var_bbfe293f8b81d08f].spawntime) {
                var_bbfe293f8b81d08f = key;
            }
        }
        if (player.var_40ffb4cf856d7560.size >= getdvarint(@"hash_dbd3f481dad9a0f9", 8)) {
            player.var_40ffb4cf856d7560[var_bbfe293f8b81d08f] notify("entity_limit_destroy");
            player.var_40ffb4cf856d7560[var_bbfe293f8b81d08f] = undefined;
            level.var_40ffb4cf856d7560[var_bbfe293f8b81d08f] = undefined;
        }
    }
    var_3616a8769e5b83c8.spawntime = gettime();
    player.var_40ffb4cf856d7560[level.var_fda34f2021faf56a] = var_3616a8769e5b83c8;
    level.var_40ffb4cf856d7560[level.var_fda34f2021faf56a] = var_3616a8769e5b83c8;
    level.var_fda34f2021faf56a++;
}

// Namespace ob/namespace_d1df78f2235ca173
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcfea
// Size: 0x7e
function function_d767ce1c0752ce44(respawnitems) {
    var_d1dd608bf22d3f99 = makeweapon("iw9_me_fists_mp");
    if (isdefined(respawnitems) && isdefined(respawnitems.weapons) && respawnitems.weapons.size == 1 && !issameweapon(respawnitems.weapons["primary"].weaponobj, var_d1dd608bf22d3f99, 1)) {
        class::respawnitems_saveweapon(var_d1dd608bf22d3f99, "secondary", respawnitems);
    }
}

