#using scripts\common\debug.gsc;
#using scripts\common\devgui.gsc;
#using scripts\common\utility.gsc;
#using scripts\engine\utility.gsc;
#using script_2d9d24f7c63ac143;
#using script_1de7f143ad1184d2;
#using scripts\mp\gametypes\br_pickups.gsc;
#using scripts\engine\scriptable.gsc;
#using script_5f7dbb7992c5c4cf;
#using scripts\cp_mp\utility\game_utility.gsc;
#using script_64acb6ce534155b7;
#using scripts\mp\utility\teams.gsc;
#using scripts\common\callbacks.gsc;
#using scripts\mp\gametypes\br_plunder.gsc;
#using script_14183df6f9af8737;
#using scripts\cp_mp\utility\weapon_utility.gsc;
#using scripts\mp\utility\points.gsc;
#using scripts\cp_mp\killstreaks\airdrop.gsc;
#using script_261e315c49e5e4ef;
#using scripts\mp\objidpoolmanager.gsc;
#using script_58f20490049af6ac;
#using script_5bab271917698dc4;
#using scripts\mp\gametypes\br_circle.gsc;
#using scripts\mp\gametypes\br_lootcache.gsc;

#namespace namespace_9727f922efe31d50;

// Namespace namespace_9727f922efe31d50 / namespace_f535fbda13ff584d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x602
// Size: 0x6b
function init() {
    quest = {#var_832bf806a8052591:&function_832bf806a8052591, #on_prematch_end:&on_prematch_end, #var_e85998f77c2a4f9b:&function_e85998f77c2a4f9b, #var_459989e09b9ec638:&function_459989e09b9ec638, #var_b5e4ce4265fcc787:&function_b5e4ce4265fcc787, #name:"cursed"};
    namespace_a6fd08b4fff3efc9::register(quest);
}

// Namespace namespace_9727f922efe31d50 / namespace_f535fbda13ff584d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x675
// Size: 0x36
function function_b5e4ce4265fcc787() {
    set_dvars();
    function_47883c99846943d0();
    function_d120b536d0d17e10();
    if (namespace_a6fd08b4fff3efc9::function_d07ae154834833b0("teleport_enabled")) {
        namespace_41030f3ba48eb7e8::init();
    }
    /#
        debug_init();
    #/
}

// Namespace namespace_9727f922efe31d50 / namespace_f535fbda13ff584d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6b3
// Size: 0x13
function function_459989e09b9ec638() {
    utility::add_fx("cursed_item_player", "vfx/iw9_br/equip/vfx_chest_super_zombie_torso_trail");
}

// Namespace namespace_9727f922efe31d50 / namespace_f535fbda13ff584d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6ce
// Size: 0x74
function function_e85998f77c2a4f9b() {
    foreach (instance in self.var_f3d09dde304b823a) {
        instance.item = instance spawn_item();
        instance.rewards = instance function_20b222942020715();
    }
}

// Namespace namespace_9727f922efe31d50 / namespace_f535fbda13ff584d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x74a
// Size: 0x2
function on_prematch_end() {
    
}

// Namespace namespace_9727f922efe31d50 / namespace_f535fbda13ff584d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x754
// Size: 0x5f
function function_832bf806a8052591() {
    foreach (var_e6e50c89ae141b0f in self.var_ddd60ec9d63871b4) {
        var_e6e50c89ae141b0f setscriptablepartstate("base", "healthy");
    }
}

// Namespace namespace_9727f922efe31d50 / namespace_f535fbda13ff584d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7bb
// Size: 0x66
function set_dvars() {
    namespace_a6fd08b4fff3efc9::function_a599409afd06b89b("kills_to_complete", 5);
    namespace_a6fd08b4fff3efc9::function_a599409afd06b89b("reset_on_drop", 0);
    namespace_a6fd08b4fff3efc9::function_a599409afd06b89b("teleport_enabled", 1);
    namespace_a6fd08b4fff3efc9::function_a599409afd06b89b("teleport_each_pickup", 1);
    namespace_a6fd08b4fff3efc9::function_a599409afd06b89b("drop_ww", 1);
    namespace_a6fd08b4fff3efc9::function_a599409afd06b89b("mark_cursed_player", 1);
    namespace_a6fd08b4fff3efc9::function_a599409afd06b89b("ww_name", "jup_pi_raygun_mp");
}

// Namespace namespace_9727f922efe31d50 / namespace_f535fbda13ff584d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x829
// Size: 0x109
function function_47883c99846943d0() {
    self.var_ddd60ec9d63871b4 = [];
    large = getentitylessscriptablearray("scriptable_fence_wood_planks_01_64_lm", "classname", (-11143.3, -3632.25, 1049.5), 500);
    small = getentitylessscriptablearray("scriptable_fence_wood_planks_01_32_lm", "classname", (-11143.3, -3632.25, 1049.5), 500);
    self.var_ddd60ec9d63871b4 = utility::array_combine(large, small);
    self.var_f3d09dde304b823a = [];
    self.var_2c8a1dfa6e4b5952 = utility::getstructarray("quest_cursed_spawn_loc", "targetname");
    if (self.var_2c8a1dfa6e4b5952.size > 0) {
        foreach (loc in self.var_2c8a1dfa6e4b5952) {
            self.var_f3d09dde304b823a[self.var_f3d09dde304b823a.size] = function_3b1a4e5d006d826e(loc);
        }
    }
}

// Namespace namespace_9727f922efe31d50 / namespace_f535fbda13ff584d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x93a
// Size: 0x69
function function_3b1a4e5d006d826e(loc) {
    instance = {#quest:self, #rewards:[], #complete:0, #var_1218b930529a08da:0, #var_4305c9c81a417ff:0, #var_b5c2bc759e130860:namespace_a6fd08b4fff3efc9::function_d07ae154834833b0("kills_to_complete"), #var_f64030e51a2e9db3:loc};
    return instance;
}

// Namespace namespace_9727f922efe31d50 / namespace_f535fbda13ff584d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9ac
// Size: 0x66
function function_d120b536d0d17e10() {
    utility::registersharedfunc(48842, "canQuickDrop", &function_ae7fdf79614c9f6f);
    utility::registersharedfunc(48842, "pickedUp", &function_1f7f65169228bd71);
    utility::registersharedfunc(48842, "dropOnDeath", &function_8cd3ce612122fbab);
    utility::registersharedfunc("sidequest_cursed", "supplyDropUsed", &function_3df74fa4218e45c);
    level scripts\common\callbacks::add("player_death", &on_player_killed);
}

// Namespace namespace_9727f922efe31d50 / namespace_f535fbda13ff584d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa1a
// Size: 0x9a
function spawn_item() {
    dropinfo = br_pickups::getitemdroporiginandangles(br_pickups::function_7b9f3966a7a42003(), self.var_f64030e51a2e9db3.origin, self.var_f64030e51a2e9db3.angles, undefined, undefined, undefined, undefined, undefined, self.var_f64030e51a2e9db3.origin);
    pickup = br_pickups::spawnpickup("brloot_jup_quest_cursed_item", dropinfo, 1);
    pickup.var_a6ec9df37a632660 = 1;
    pickup.criticalitem = 1;
    pickup.var_47a692a2105275dc = self;
    return pickup;
}

// Namespace namespace_9727f922efe31d50 / namespace_f535fbda13ff584d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xabd
// Size: 0xb3
function function_20b222942020715() {
    rewards = [];
    for (i = 0; i < 3; i++) {
        rewards[rewards.size] = scripts\mp\gametypes\br_plunder::getplundernamebyamount(ter_op(cointoss(), 50, 80));
    }
    rewards[rewards.size] = pickscriptablelootitem("weapon", 4, 4, "mp/loot/br/jup_sm_island_2/resurgence/lootset_cache_lege.csv");
    rewards[rewards.size] = namespace_6176022cc9d5b3f::function_53382489ff523151();
    rewards[rewards.size] = pickscriptablelootitem("killstreak", 0, 3, "mp/loot/br/jup_sm_island_2/resurgence/lootset_cache_base.csv");
    if (self.quest namespace_a6fd08b4fff3efc9::function_d07ae154834833b0("drop_ww")) {
        rewards[rewards.size] = scripts\cp_mp\utility\weapon_utility::function_eeaa22f0cd1ff845(self.quest namespace_a6fd08b4fff3efc9::function_d07ae154834833b0("ww_name"));
    }
    return rewards;
}

// Namespace namespace_9727f922efe31d50 / namespace_f535fbda13ff584d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb79
// Size: 0x1c7
function function_eab7b539afd6dd11() {
    level endon("game_ended");
    self endon("cursed_item_dropped");
    self endon("cursed_item_complete");
    self.var_e8ab9a0402079035 endon("death_or_disconnect");
    if (self.quest namespace_a6fd08b4fff3efc9::function_d07ae154834833b0("mark_cursed_player")) {
        if (!isdefined(self.objectiveiconid)) {
            namespace_c133516bfc1d803c::createquestobjicon("jup_ui_icon_quest_cursed_item", "active", self.var_e8ab9a0402079035.origin + (0, 0, 100));
            function_d76cc64b205084a3(self.objectiveiconid, 1);
        }
        foreach (player in level.players) {
            namespace_c133516bfc1d803c::showquestobjicontoplayer(player);
        }
        foreach (player in scripts\mp\utility\teams::getteamdata(self.var_e8ab9a0402079035.team, "players")) {
            namespace_c133516bfc1d803c::hidequestobjiconfromplayer(player);
        }
        thread function_fddcbf27c0f66fd5();
    }
    self.var_7fb2bc08be5395c9 = utility::spawn_tag_origin(self.var_e8ab9a0402079035 gettagorigin("j_spineupper"));
    self.var_7fb2bc08be5395c9 linkto(self.var_e8ab9a0402079035, "j_spineupper");
    self.var_7fb2bc08be5395c9 show();
    self.var_7fb2bc08be5395c9 forcenetfieldhighlod(1);
    waitframe();
    playfxontag(utility::getfx("cursed_item_player"), self.var_7fb2bc08be5395c9, "tag_origin");
}

// Namespace namespace_9727f922efe31d50 / namespace_f535fbda13ff584d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd48
// Size: 0x59
function function_fddcbf27c0f66fd5() {
    level endon("game_ended");
    self endon("cursed_item_dropped");
    self endon("cursed_item_complete");
    self.var_e8ab9a0402079035 endon("death_or_disconnect");
    while (true) {
        namespace_c133516bfc1d803c::movequestobjicon(self.var_e8ab9a0402079035.origin + (0, 0, 100));
        wait 10;
    }
}

// Namespace namespace_9727f922efe31d50 / namespace_f535fbda13ff584d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xda9
// Size: 0x5e
function function_8e0ee42aeeba8bae() {
    self.var_e8ab9a0402079035 thread scripts\mp\utility\points::doScoreEvent(#"hash_d85b6fe0576528c5");
    self.var_b5c2bc759e130860--;
    function_94dbf32b1cf86b34();
    if (!istrue(self.complete)) {
        namespace_e50e624d9af51c8c::function_e900e7e66383ad97(self.var_e8ab9a0402079035, self.var_55c80bae27e47104, self.var_b5c2bc759e130860, 1);
    }
}

// Namespace namespace_9727f922efe31d50 / namespace_f535fbda13ff584d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe0f
// Size: 0xed
function function_94dbf32b1cf86b34() {
    if (self.var_b5c2bc759e130860 == 0) {
        self.var_e8ab9a0402079035 thread scripts\mp\utility\points::doScoreEvent(#"hash_61e2de6118a7b8a4");
        self notify("cursed_item_complete");
        namespace_1eb3c4e0e28fac71::deletequestobjicon();
        self.objectiveiconid = undefined;
        stopfxontag(utility::getfx("cursed_item_player"), self.var_7fb2bc08be5395c9, "tag_origin");
        self.var_7fb2bc08be5395c9 delete();
        self.var_e8ab9a0402079035 setscriptablepartstate("cursed_item_fx", "curse_broken");
        self.complete = 1;
        self.var_e8ab9a0402079035 namespace_e50e624d9af51c8c::function_db1dd76061352e5b(self.var_55c80bae27e47104);
        thread function_51c00a1f35c303(self.var_e8ab9a0402079035);
        self.quest thread quest_complete(self.var_e8ab9a0402079035);
        self.var_4305c9c81a417ff = 0;
        self.var_e8ab9a0402079035 = undefined;
    }
}

// Namespace namespace_9727f922efe31d50 / namespace_f535fbda13ff584d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xf04
// Size: 0x4a
function quest_complete(player) {
    params = {#var_2c8bc596ef639a6e:teams::getteamdata(player.team, "players"), #is_successful:1};
    namespace_a6fd08b4fff3efc9::function_fe134565f2967d66(params);
}

// Namespace namespace_9727f922efe31d50 / namespace_f535fbda13ff584d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xf56
// Size: 0x22c
function function_51c00a1f35c303(player) {
    level endon("game_ended");
    wait 2;
    forward = anglestoforward(player.angles);
    var_402ac1375162359f = randomfloatrange(0, 360);
    offset = rotatepointaroundvector((0, 0, 1), forward, var_402ac1375162359f) + (0, 200, 0);
    drop_point = getclosestpointonnavmesh(player.origin + offset);
    self.crate = scripts\cp_mp\killstreaks\airdrop::dropcrate(undefined, player.team, "legendary_supply_drop", drop_point + (0, 0, 4096), (0, randomfloat(360), 0), drop_point, undefined, 1);
    assert(isdefined(self.crate));
    if (!utility::issharedfuncdefined("br_legendary_supply_drop", "legendary_supply_onCrateUse")) {
        utility::registersharedfunc("br_legendary_supply_drop", "legendary_supply_onCrateUse", &namespace_f51c41a139e03299::function_3241afdfec957cb9);
    }
    self.crate.source = "sidequest_cursed";
    self.crate.rewards = self.rewards;
    self.skipminimapicon = 1;
    id = scripts\mp\objidpoolmanager::requestobjectiveid(1);
    if (id > -1) {
        self.crate setscriptablepartstate("objective_map", "hidden");
        scripts\mp\objidpoolmanager::objective_add_objective(id, "current", self.crate.origin, "jup_ui_icon_quest_cursed_item");
        objective_removeallfrommask(id);
        objective_addteamtomask(id, player.team);
        objective_setbackground(id, 1);
        objective_onentity(id, self.crate);
        objective_setzoffset(id, 75);
        objective_setdescription(id, %MP_BR_INGAME/QUEST_CURSED_ITEM_REWARD);
        self.crate.scriptedobjid = id;
        thread function_661c0753eb356280(self.crate);
        if (!level.br_circle_disabled) {
            self.crate thread function_710d5f503b5060a1(drop_point);
        }
    }
}

// Namespace namespace_9727f922efe31d50 / namespace_f535fbda13ff584d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x118a
// Size: 0x8c
function function_661c0753eb356280(crate) {
    level endon("game_ended");
    id = crate.scriptedobjid;
    while (isdefined(crate)) {
        waitframe();
    }
    crate notify("sidequest_cursed_gas");
    if (isdefined(id)) {
        for (i = 0; i < level.objectiveidpool.reclaimed.size; i++) {
            if (id == level.objectiveidpool.reclaimed[i]) {
                return;
            }
        }
        scripts\mp\objidpoolmanager::returnobjectiveid(id);
    }
}

// Namespace namespace_9727f922efe31d50 / namespace_f535fbda13ff584d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x121e
// Size: 0x61
function function_710d5f503b5060a1(origin) {
    level endon("game_ended");
    self endon("sidequest_cursed_gas");
    crate_timeline = namespace_bbc79db4c3949a5c::function_60951b84c58915ab(origin);
    var_6cd08fe827af3392 = namespace_bbc79db4c3949a5c::function_7d8550b9a2c52852(crate_timeline);
    wait var_6cd08fe827af3392;
    if (isdefined(self.scriptedobjid)) {
        scripts\mp\objidpoolmanager::update_objective_state(self.scriptedobjid, "active");
    }
}

// Namespace namespace_9727f922efe31d50 / namespace_f535fbda13ff584d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1287
// Size: 0x74
function teleport_player() {
    timeuntilspawn = 3;
    var_b9ffce42c7dc0d13 = namespace_8bfdb6eb5a3df67a::getsafeoriginaroundpoint(self.origin, scripts\mp\gametypes\br_circle::getdangercircleradius(), timeuntilspawn, 0);
    if (isdefined(var_b9ffce42c7dc0d13)) {
        var_b9ffce42c7dc0d13 = getclosestpointonnavmesh(var_b9ffce42c7dc0d13);
    }
    if (!isdefined(var_b9ffce42c7dc0d13)) {
        var_b9ffce42c7dc0d13 = namespace_8bfdb6eb5a3df67a::playerGetRespawnPoint(0, timeuntilspawn);
    }
    self setscriptablepartstate("cursed_item_fx", "teleport_charge");
    thread namespace_41030f3ba48eb7e8::teleport_start(var_b9ffce42c7dc0d13, 1);
    thread namespace_41030f3ba48eb7e8::function_94aaf61453367a7c();
}

// Namespace namespace_9727f922efe31d50 / namespace_f535fbda13ff584d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1303
// Size: 0x111
function function_3df74fa4218e45c(player) {
    dropstruct = br_pickups::function_7b9f3966a7a42003();
    if (isdefined(self.rewards)) {
        foreach (item in self.rewards) {
            if (scripts\mp\gametypes\br_lootcache::canspawnitemname(item, isweapon(item))) {
                if (isstring(item)) {
                    raritynum = level.br_pickups.br_itemrarity[item];
                }
                legendary = 0;
                if (isdefined(raritynum) && raritynum == 4) {
                    legendary = 1;
                }
                pickup = scripts\mp\gametypes\br_lootcache::lootspawnitem(item, dropstruct, self.origin, self.angles, 0, legendary);
            }
        }
    }
    player thread scripts\mp\utility\points::doScoreEvent(#"hash_f396d39fee1a8054");
    player playsoundtoplayer("uin_loot_container_open_epic", player);
}

// Namespace namespace_9727f922efe31d50 / namespace_f535fbda13ff584d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x141c
// Size: 0x22b
function on_player_killed(var_c50e4bb09375ab52) {
    quest = namespace_a6fd08b4fff3efc9::function_3800f8d2947d87a6("cursed");
    foreach (quest_instance in quest.var_f3d09dde304b823a) {
        if (istrue(quest_instance.var_4305c9c81a417ff) && isdefined(quest_instance.var_e8ab9a0402079035)) {
            if (isdefined(var_c50e4bb09375ab52.attacker) && isdefined(var_c50e4bb09375ab52.victim) && quest_instance.var_e8ab9a0402079035 == var_c50e4bb09375ab52.attacker && var_c50e4bb09375ab52.attacker != var_c50e4bb09375ab52.victim) {
                quest_instance thread function_a0233f797c081c46(var_c50e4bb09375ab52.victim, quest_instance.var_e8ab9a0402079035);
                continue;
            }
            if (isdefined(var_c50e4bb09375ab52.victim) && quest_instance.var_e8ab9a0402079035 == var_c50e4bb09375ab52.victim) {
                stopfxontag(utility::getfx("cursed_item_player"), quest_instance.var_7fb2bc08be5395c9, "tag_origin");
                quest_instance.var_7fb2bc08be5395c9 delete();
                if (isdefined(quest_instance.wisps)) {
                    foreach (wisp in quest_instance.wisps) {
                        wisp delete();
                    }
                    quest_instance.wisps = [];
                }
                quest_instance.var_4305c9c81a417ff = 0;
                quest_instance.var_e8ab9a0402079035 = undefined;
                quest_instance notify("cursed_item_dropped");
                quest_instance namespace_1eb3c4e0e28fac71::deletequestobjicon();
                quest_instance.objectiveiconid = undefined;
                if (quest namespace_a6fd08b4fff3efc9::function_d07ae154834833b0("reset_on_drop")) {
                    quest_instance.var_b5c2bc759e130860 = quest namespace_a6fd08b4fff3efc9::function_d07ae154834833b0("kills_to_complete");
                }
            }
        }
    }
}

// Namespace namespace_9727f922efe31d50 / namespace_f535fbda13ff584d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x164f
// Size: 0xc
function function_ae7fdf79614c9f6f(player) {
    return false;
}

// Namespace namespace_9727f922efe31d50 / namespace_f535fbda13ff584d
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1664
// Size: 0xeb
function function_1f7f65169228bd71(item, player) {
    quest_instance = item.var_47a692a2105275dc;
    if (!isdefined(quest_instance)) {
        return;
    }
    quest_instance.var_4305c9c81a417ff = 1;
    quest_instance.var_e8ab9a0402079035 = player;
    quest_instance.var_55c80bae27e47104 = player getAvailableDMZBackpackIndex();
    namespace_e50e624d9af51c8c::function_11f48ae5b87b4525(player, quest_instance.var_55c80bae27e47104, 48842, quest_instance.var_b5c2bc759e130860);
    if (quest_instance.quest namespace_a6fd08b4fff3efc9::function_d07ae154834833b0("teleport_enabled")) {
        if (!istrue(quest_instance.var_1218b930529a08da)) {
            quest_instance.var_1218b930529a08da = 1;
            player teleport_player();
        } else if (quest_instance.quest namespace_a6fd08b4fff3efc9::function_d07ae154834833b0("teleport_each_pickup")) {
            player teleport_player();
        }
    }
    quest_instance thread function_eab7b539afd6dd11();
    return 0;
}

// Namespace namespace_9727f922efe31d50 / namespace_f535fbda13ff584d
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1758
// Size: 0xae
function function_8cd3ce612122fbab(var_d8c47259a865298f, player, var_8bf71322428779b4) {
    quest = namespace_a6fd08b4fff3efc9::function_3800f8d2947d87a6("cursed");
    foreach (instance in quest.var_f3d09dde304b823a) {
        if (isdefined(instance.var_e8ab9a0402079035) && instance.var_e8ab9a0402079035 == player) {
            var_d8c47259a865298f.var_47a692a2105275dc = instance;
            break;
        }
    }
}

// Namespace namespace_9727f922efe31d50 / namespace_f535fbda13ff584d
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x180e
// Size: 0x3b0
function function_a0233f797c081c46(var_47d4f7b24e660811, attacker) {
    level endon("game_ended");
    attacker endon("death_or_disconnect");
    if (!isdefined(self.wisps)) {
        self.wisps = [];
    }
    var_b5c58beb56ca2d34 = spawn("script_model", var_47d4f7b24e660811.origin);
    var_b5c58beb56ca2d34 setmodel("quest_jup_cursed_wisp_scriptable");
    var_b5c58beb56ca2d34 forcenetfieldhighlod(1);
    self.wisps[self.wisps.size] = var_b5c58beb56ca2d34;
    start_position = var_47d4f7b24e660811.origin + (0, 0, 100);
    end_position = attacker.origin + (0, 0, 10);
    var_b5c58beb56ca2d34 setscriptablepartstate("cursed_wisp", "created");
    var_b5c58beb56ca2d34 moveto(start_position, 1.5);
    wait 1.5;
    var_b5c58beb56ca2d34.angles = vectortoangles(end_position - start_position);
    var_3dd4d1307228765 = distance(start_position, end_position);
    var_e8356ef0252e2368 = var_3dd4d1307228765 / 10;
    speed = 100 * var_e8356ef0252e2368 + 250;
    speed += randomfloatrange(-1 * speed * 0.2 / 2, speed * 0.2 / 2);
    if (speed < 250) {
        speed = 250;
    }
    if (speed > 350) {
        speed = 350;
    }
    duration = var_3dd4d1307228765 / speed;
    var_c0ab1e665d342394 = gettime();
    var_de20130ba0323ce1 = var_c0ab1e665d342394;
    var_52f60b837e418508 = randomint(360);
    var_8be3eec04aead445 = randomfloatrange(3, 4);
    var_664c730f1dd2aa49 = randomintrange(50, 70);
    offset_z = 0;
    var_4da255dc2b713cb4 = start_position[2] - end_position[2];
    if (var_4da255dc2b713cb4 < 60) {
        var_ac03b17fc9cbce8d = randomintrange(40, 60) + var_4da255dc2b713cb4 / 2;
    } else if (var_4da255dc2b713cb4 < 120) {
        var_ac03b17fc9cbce8d = randomintrange(0, 40) + var_4da255dc2b713cb4 / 2;
    } else {
        var_ac03b17fc9cbce8d = randomintrange(-40, 0) + var_4da255dc2b713cb4 / 2;
    }
    lerp_value = 0;
    while (lerp_value < 1) {
        var_de20130ba0323ce1 = gettime();
        end_position = attacker.origin + (0, 0, 10);
        var_756271a8047d624 = var_52f60b837e418508 + var_8be3eec04aead445 * lerp_value * 180;
        var_639fd1c5a5ba7db9 = sin(lerp_value * 180) * var_664c730f1dd2aa49;
        var_5ca266b2a3a69863 = rotatepointaroundvector(anglestoforward(var_b5c58beb56ca2d34.angles), var_639fd1c5a5ba7db9 * anglestoright(var_b5c58beb56ca2d34.angles), var_756271a8047d624);
        v_z_offset = (0, 0, var_ac03b17fc9cbce8d * sin(lerp_value * 180 + sin(lerp_value * 180) / -1));
        target_position = vectorlerp(start_position, end_position, lerp_value) + v_z_offset + var_5ca266b2a3a69863;
        var_b5c58beb56ca2d34.origin = target_position;
        lerp_value = pow((var_de20130ba0323ce1 - var_c0ab1e665d342394) / 1000 / duration, 1.1);
        waitframe();
    }
    if (!istrue(self.complete)) {
        function_8e0ee42aeeba8bae();
    }
    var_b5c58beb56ca2d34 setscriptablepartstate("cursed_wisp", "off");
    if (!istrue(self.complete)) {
        attacker setscriptablepartstate("cursed_item_fx", "soul_consumed");
    }
    wait 2;
    self.wisps = utility::array_remove(self.wisps, var_b5c58beb56ca2d34);
    var_b5c58beb56ca2d34 delete();
}

/#

    // Namespace namespace_9727f922efe31d50 / namespace_f535fbda13ff584d
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1bc6
    // Size: 0xde
    function debug_init() {
        devgui::function_6e7290c8ee4f558b("<dev string:x1c>");
        devgui::function_a9a864379a098ad6("<dev string:x41>", "<dev string:x4f>", &function_8ceab4fddfa5e5ea);
        devgui::function_a9a864379a098ad6("<dev string:x6e>", "<dev string:x7f>", &function_d12cfb94fb1e29a5);
        devgui::function_a9a864379a098ad6("<dev string:xa1>", "<dev string:xb3>", &function_f92a2485d314b50b);
        devgui::function_a9a864379a098ad6("<dev string:xd6>", "<dev string:xe5>", &function_28455d21c0029079);
        devgui::function_a9a864379a098ad6("<dev string:x105>", "<dev string:x116>", &function_ba8b401af36a89ed);
        devgui::function_b23a59dfb4ca49a1("<dev string:x138>", "<dev string:x15a>", &function_7c780b4fa5300b49);
        devgui::function_b23a59dfb4ca49a1("<dev string:x17f>", "<dev string:x1a7>", &function_7c780b4fa5300b49);
        devgui::function_b23a59dfb4ca49a1("<dev string:x1cc>", "<dev string:x1f9>", &function_7c780b4fa5300b49);
        devgui::function_b23a59dfb4ca49a1("<dev string:x21e>", "<dev string:x248>", &function_7c780b4fa5300b49);
        devgui::function_fe953f000498048f();
    }

    // Namespace namespace_9727f922efe31d50 / namespace_f535fbda13ff584d
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1cac
    // Size: 0x9c
    function function_8ceab4fddfa5e5ea() {
        quest = namespace_a6fd08b4fff3efc9::function_3800f8d2947d87a6("<dev string:x26d>");
        loc = {#angles:level.player.angles, #origin:level.player.origin};
        instance = quest function_3b1a4e5d006d826e(loc);
        quest.var_f3d09dde304b823a[quest.var_f3d09dde304b823a.size] = instance;
        pickup_item = instance spawn_item();
    }

    // Namespace namespace_9727f922efe31d50 / namespace_f535fbda13ff584d
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1d50
    // Size: 0xf4
    function function_d12cfb94fb1e29a5() {
        quest = namespace_a6fd08b4fff3efc9::function_3800f8d2947d87a6("<dev string:x26d>");
        foreach (instance in quest.var_f3d09dde304b823a) {
            if (!isdefined(instance.var_e8ab9a0402079035) || !istrue(instance.var_4305c9c81a417ff)) {
                continue;
            }
            instance.var_e8ab9a0402079035 thread scripts\mp\utility\points::doScoreEvent(#"hash_d85b6fe0576528c5");
            instance.var_b5c2bc759e130860--;
            instance function_94dbf32b1cf86b34();
            if (!istrue(instance.complete)) {
                namespace_e50e624d9af51c8c::function_e900e7e66383ad97(instance.var_e8ab9a0402079035, instance.var_55c80bae27e47104, instance.var_b5c2bc759e130860, 1);
            }
        }
    }

    // Namespace namespace_9727f922efe31d50 / namespace_f535fbda13ff584d
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1e4c
    // Size: 0xae
    function function_f92a2485d314b50b() {
        quest = namespace_a6fd08b4fff3efc9::function_3800f8d2947d87a6("<dev string:x26d>");
        inst = undefined;
        foreach (instance in quest.var_f3d09dde304b823a) {
            if (!isdefined(instance.var_e8ab9a0402079035)) {
                continue;
            }
            inst = instance;
            inst.var_b5c2bc759e130860 = 0;
        }
        if (!isdefined(inst)) {
            iprintlnbold("<dev string:x277>");
            return;
        }
        inst function_94dbf32b1cf86b34();
    }

    // Namespace namespace_9727f922efe31d50 / namespace_f535fbda13ff584d
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1f02
    // Size: 0x263
    function function_28455d21c0029079() {
        quest = namespace_a6fd08b4fff3efc9::function_3800f8d2947d87a6("<dev string:x26d>");
        foreach (player in level.players) {
            player namespace_e50e624d9af51c8c::function_43f9da47b5084ce0("<dev string:x2b3>");
        }
        dropped_items = getentitylessscriptablearray("<dev string:x2b3>");
        if (dropped_items.size > 0) {
            foreach (item in dropped_items) {
                item freescriptable();
            }
        }
        if (isdefined(quest.var_ddd60ec9d63871b4) && quest.var_ddd60ec9d63871b4.size > 0) {
            quest.var_ddd60ec9d63871b4 = [];
            large = getentitylessscriptablearray("<dev string:x2d3>", "<dev string:x2fc>", (-11143.3, -3632.25, 1049.5), 500);
            small = getentitylessscriptablearray("<dev string:x309>", "<dev string:x2fc>", (-11143.3, -3632.25, 1049.5), 500);
            quest.var_ddd60ec9d63871b4 = utility::array_combine(large, small);
            foreach (var_e6e50c89ae141b0f in quest.var_ddd60ec9d63871b4) {
                var_e6e50c89ae141b0f setscriptablepartstate("<dev string:x332>", "<dev string:x33a>");
            }
        }
        quest.var_f3d09dde304b823a = [];
        if (quest.var_2c8a1dfa6e4b5952.size > 0) {
            foreach (loc in quest.var_2c8a1dfa6e4b5952) {
                quest.var_f3d09dde304b823a[quest.var_f3d09dde304b823a.size] = quest function_3b1a4e5d006d826e(loc);
            }
        }
        quest function_e85998f77c2a4f9b();
    }

    // Namespace namespace_9727f922efe31d50 / namespace_f535fbda13ff584d
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x216d
    // Size: 0x17
    function function_ba8b401af36a89ed() {
        level.players[0] teleport_player();
    }

    // Namespace namespace_9727f922efe31d50 / namespace_f535fbda13ff584d
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x218c
    // Size: 0x17a
    function function_7c780b4fa5300b49(params) {
        level notify("<dev string:x345>");
        level endon("<dev string:x345>");
        player = level.players[0];
        player_pos = player.origin;
        version = int(params[0]);
        for (i = 0; i < 100; i++) {
            switch (version) {
            case 0:
                var_b2660993a3a25d20 = player namespace_8bfdb6eb5a3df67a::playerGetRespawnPoint(0, 1.5);
                var_9cff48bc9572e186 = var_b2660993a3a25d20.origin;
                break;
            case 1:
                var_9cff48bc9572e186 = scripts\mp\gametypes\br_circle::getrandompointincurrentcircle(0.3, 0.8);
                break;
            case 2:
                var_9cff48bc9572e186 = scripts\mp\gametypes\br_circle::getrandompointinboundssafecircle(0.1, 0.8);
                break;
            case 3:
                var_9cff48bc9572e186 = namespace_8bfdb6eb5a3df67a::getsafeoriginaroundpoint(player_pos, scripts\mp\gametypes\br_circle::getdangercircleradius(), 3, 0);
                break;
            default:
                return;
            }
            if (!isdefined(var_9cff48bc9572e186)) {
                assertmsg("<dev string:x345>" + "<dev string:x36f>" + version);
                continue;
            }
            color = (randomfloat(1), randomfloat(1), randomfloat(1));
            debug::debug_line(player_pos, var_9cff48bc9572e186, color, 30, "<dev string:x345>");
        }
    }

#/
