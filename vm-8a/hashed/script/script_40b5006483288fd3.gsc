#using scripts\common\callbacks.gsc;
#using scripts\common\values.gsc;
#using script_3e2f8cc477d57433;
#using script_7b2517368c79e5bc;
#using script_443d99fe707f1d9f;
#using script_600b944a95c3a7bf;
#using scripts\engine\utility.gsc;
#using script_638d701d263ee1ed;
#using script_247745a526421ba7;
#using scripts\mp\gametypes\ob.gsc;
#using scripts\mp\teamrevive.gsc;
#using scripts\mp\objidpoolmanager.gsc;
#using script_1f97a44d1761c919;
#using scripts\mp\flags.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\mp\class.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\utility\lower_message.gsc;
#using script_2f11ea014b8bb8eb;
#using scripts\mp\outofbounds.gsc;
#using script_7f5e7a3cb514aca5;
#using script_2669878cf5a1b6bc;
#using scripts\mp\equipment.gsc;
#using script_639bf783929acf9b;
#using scripts\mp\utility\game.gsc;
#using script_8a9252a4a14729;
#using script_3691c0b107a6701c;
#using scripts\cp_mp\entityheadicons.gsc;
#using scripts\mp\deathicons.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\hud_message.gsc;

#namespace ob_pvpve;

// Namespace ob_pvpve / namespace_dc38f0ea48cd4743
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6a5
// Size: 0x4a
function main() {
    function_7a48f3c1e25d94ea();
    namespace_649c2fab0fd72b8b::init();
    scripts\mp\gametypes\ob::main();
    level.var_a77c94576da6cab0 = "powerup_list_jup_ob_pvpve";
    level.var_2f26ac0d970dddb0 = 0;
    level.var_5025186a3fc7fa4 = 1;
    initspawn();
    waittillframeend();
    thread initpostmain();
}

// Namespace ob_pvpve / namespace_dc38f0ea48cd4743
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6f7
// Size: 0x206
function initpostmain() {
    level.ob_pvpve = 1;
    level.var_a95cf198feabb6a = level.callbackplayerdamage;
    level.callbackplayerdamage = &callback_playerdamage;
    level.var_b0830df5265878d5 = getdvarint(@"hash_dd3a7048817057e3", 1);
    val::group_register("laststand_ob_pvpve_values", ["ascender_use", "crate_use", "gesture", "killstreaks", "melee", "offhand_primary_weapons", "offhand_secondary_weapons", "supers", "usability", "vehicle_use", "weapon", "fire", "weapon_pickup", "reload", "weapon_switch", "show_operator_pet"]);
    level.customlaststandactionset = "laststand_ob_pvpve_values";
    callback::remove("bleedout_tick", #"all");
    callback::add("bleedout_tick", &function_59bb85cf2b5af12f);
    callback::add("player_spawned", &on_player_spawned);
    callback::add("player_disconnect", &on_player_disconnect);
    callback::add("register_activities", &function_3b0edbbabf280e78);
    level._effect["vfx_player_eye_glow"] = loadfx("vfx/jup/ob/gameplay/zm_ai/vfx_zai_player_eye_glow.vfx");
    level._effect["vfx_player_chest_smk"] = loadfx("vfx/jup/ob/gameplay/zm_ai/vfx_zai_player_chest_smk.vfx");
    level.var_7d6f4cde2f1448f = getdvarint(@"hash_101ca4d31e01e1b4", 1);
    level.allowfauxdeath = 0;
    if (getdvarint(@"hash_3aa023d6eebd03fa", 0) == 1) {
        level.var_38ae0db9542b127c = &function_38ae0db9542b127c;
    }
    initsuper();
    initrespawn();
    if (getdvarint(@"hash_fc33c3ed0db21df1", 1) == 1) {
        level thread function_8bc4148d7acee203();
    }
    function_ea1e7eeb0d48ba61();
    level.var_6beff7b631ab7e18 = &function_6beff7b631ab7e18;
}

// Namespace ob_pvpve / namespace_dc38f0ea48cd4743
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x905
// Size: 0x6b
function initspawn() {
    level.var_529deb371b5eeb12 = getdvarint(@"hash_f42c93cfb94e6b70", 1);
    spawnlocationsuffix = getdvar(@"hash_2bd79e8b28a32bcb", "ne");
    level.var_126fea15d159e0ca = "ob/ob_pvpve/ob_pvpve_spawnpoints_" + spawnlocationsuffix + ".csv";
    if (istrue(level.var_529deb371b5eeb12)) {
        level.var_49839a7ef42e68d8 = function_feab0a1523a87a88();
    }
}

// Namespace ob_pvpve / namespace_dc38f0ea48cd4743
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x978
// Size: 0x7a
function initsuper() {
    level.var_b71c0a184363d6a2 = getdvarint(@"hash_252cdcbb5bc3ae70", 1) == 1;
    if (level.var_b71c0a184363d6a2) {
        level.var_c24e4f076c66bfb4 = 0;
        level.var_921200c3b5274d3e = 0;
        level.var_cb9af30290da6a03 = 1;
    } else {
        level.var_c24e4f076c66bfb4 = 1;
        level.var_921200c3b5274d3e = 1;
        level.var_cb9af30290da6a03 = 0;
    }
    level.var_8b5c3bda53460402 = &validateclass;
}

// Namespace ob_pvpve / namespace_dc38f0ea48cd4743
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9fa
// Size: 0xa5
function initrespawn() {
    level.var_b482b579a7b7f6f = getdvarint(@"hash_cc3db596630b78c7", 0) == 1;
    level.var_8868d59e008df32d = &function_8868d59e008df32d;
    level.modeonspawnplayer = &prespawnplayer;
    level callback::add("on_ob_laststand_player_killed", &function_e48bd997f13cb39f);
    registersharedfunc(#"ob_pvpve", #"hash_c69889de57e82c49", &function_50c0ea10b250b9e);
    if (getdvarint(@"hash_551606c97d23028c", 1) == 1) {
        scripts\mp\teamrevive::function_5343ecb486b66bf1("ob_pvpve", &onspawnrevivetrigger);
    }
    function_600cc18a5b7b64b0("mp/classtable_ob_pvpve.csv");
    level thread function_ee84b0a72897ee98();
}

// Namespace ob_pvpve / namespace_dc38f0ea48cd4743
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xaa7
// Size: 0x10
function function_ea1e7eeb0d48ba61() {
    level.var_127cc78420f659f8 = &function_127cc78420f659f8;
}

// Namespace ob_pvpve / namespace_dc38f0ea48cd4743
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xabf
// Size: 0x3
function function_127cc78420f659f8() {
    return false;
}

// Namespace ob_pvpve / namespace_dc38f0ea48cd4743
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xacb
// Size: 0x2b
function function_7a48f3c1e25d94ea() {
    level.var_5a57e4de82e72545 = getdvarint(@"hash_307fc239dc43be41", 0);
    callback::add("player_death", &on_player_death);
}

// Namespace ob_pvpve / namespace_dc38f0ea48cd4743
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xafe
// Size: 0x55
function function_600cc18a5b7b64b0(table) {
    level.var_15c03fdd665277c0 = [];
    var_7d958726e11b327 = tablelookupgetnumcols(table) - 1;
    for (i = 0; i < var_7d958726e11b327; i++) {
        level.var_15c03fdd665277c0[i] = function_aa8a954d66bf39b4(i, table);
    }
}

// Namespace ob_pvpve / namespace_dc38f0ea48cd4743
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xb5b
// Size: 0x7d
function private function_aa8a954d66bf39b4(classindex, table) {
    loadout["loadoutPrimary"] = tablelookup(table, 0, "loadoutPrimary", classindex + 1);
    loadout["loadoutSecondary"] = tablelookup(table, 0, "loadoutSecondary", classindex + 1);
    loadout["loadoutEquipmentPrimary"] = tablelookup(table, 0, "loadoutEquipmentPrimary", classindex + 1);
    loadout["loadoutEquipmentSecondary"] = tablelookup(table, 0, "loadoutEquipmentSecondary", classindex + 1);
    return loadout;
}

// Namespace ob_pvpve / namespace_dc38f0ea48cd4743
// Params 15, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbe1
// Size: 0x11f
function callback_playerdamage(einflictor, eattacker, idamage, idflags, smeansofdeath, fdistance, objweapon, vpoint, vdir, shitloc, timeoffset, modelindex, partname, var_b0fc59ff15058522, var_be4285b26ed99ab1) {
    if (istrue(level.ob_pvpve)) {
        var_29a8ba8c9dd43fd2 = 0;
        if (issharedfuncdefined("zombie", "get_pap_level") && isplayer(eattacker)) {
            var_29a8ba8c9dd43fd2 = eattacker function_f3bb4f4911a1beb2("zombie", "get_pap_level", objweapon);
            if (var_29a8ba8c9dd43fd2 >= 1) {
                var_87c56f9e23a55ac3 = getdvarfloat(hashcat(@"hash_cfa00926baa9b9a6", var_29a8ba8c9dd43fd2), 0.5);
                idamage *= var_87c56f9e23a55ac3;
            }
        }
    }
    [[ level.var_a95cf198feabb6a ]](einflictor, eattacker, idamage, idflags, smeansofdeath, fdistance, objweapon, vpoint, vdir, shitloc, timeoffset, modelindex, partname, var_b0fc59ff15058522, var_be4285b26ed99ab1);
}

// Namespace ob_pvpve / namespace_dc38f0ea48cd4743
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd08
// Size: 0xeb
function function_59bb85cf2b5af12f(params) {
    if (isdefined(params.progress) && istrue(level.var_520545ce455767b6)) {
        if (!self getbeingrevived()) {
            if (level.var_b0830df5265878d5) {
                healthprogress = self.health / level.laststandrevivehealth;
                params.progress = max(0, min(params.progress, healthprogress));
            }
            self.health = int(level.laststandrevivehealth * params.progress);
            if (isdefined(self.laststandreviveent) && isdefined(self.laststandreviveent.objidnum)) {
                scripts\mp\objidpoolmanager::objective_set_progress(self.laststandreviveent.objidnum, params.progress);
            }
        }
    }
}

// Namespace ob_pvpve / namespace_dc38f0ea48cd4743
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdfb
// Size: 0x32
function on_player_spawned(params) {
    thread function_d496bb74f129b113();
    if (getdvarint(@"hash_3aa023d6eebd03fa", 0) == 1) {
        level thread namespace_446fc987a980892f::function_aea00c3815b226da(self);
    }
}

// Namespace ob_pvpve / namespace_dc38f0ea48cd4743
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe35
// Size: 0x12
function on_player_disconnect(params) {
    function_5a6cae9be5731fa6();
}

// Namespace ob_pvpve / namespace_dc38f0ea48cd4743
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xe4f
// Size: 0x16
function private prespawnplayer(var_f0729562cde426a3) {
    self.var_26d22342913bacf6 = istrue(var_f0729562cde426a3);
}

// Namespace ob_pvpve / namespace_dc38f0ea48cd4743
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe6d
// Size: 0x208
function function_d496bb74f129b113() {
    self endon("death_or_disconnect");
    scripts\mp\flags::function_1240434f4201ac9d("prematch_done");
    while (true) {
        foreach (player in level.players) {
            if (!isdefined(player)) {
                continue;
            }
            if (!isdefined(self.var_2b3fffe79b36b023)) {
                self.var_2b3fffe79b36b023 = [];
            }
            if (self.team != player.team) {
                player_id = player getentitynumber();
                shouldshowfx = distancesquared(self.origin, player.origin) < 4000000 && isalive(player);
                var_641529ab835cfe52 = scripts\cp_mp\utility\player_utility::function_f8789f15330de751(player);
                if (!istrue(self.var_2b3fffe79b36b023[player_id]) && shouldshowfx) {
                    playfxontagforclients(getfx("vfx_player_eye_glow"), player, "tag_eye", self);
                    playfxontagforclients(getfx("vfx_player_chest_smk"), player, "j_spine4", self);
                    waitframe();
                    self.var_2b3fffe79b36b023[player_id] = 1;
                } else if (istrue(self.var_2b3fffe79b36b023[player_id]) && !shouldshowfx) {
                    stopfxontagforclients(getfx("vfx_player_eye_glow"), player, "tag_eye", self);
                    stopfxontagforclients(getfx("vfx_player_chest_smk"), player, "j_spine4", self);
                    waitframe();
                    self.var_2b3fffe79b36b023[player_id] = 0;
                }
                if (!istrue(player.var_d9b717fb47bcf883) && var_641529ab835cfe52) {
                    self.var_2b3fffe79b36b023[player_id] = 0;
                    player.var_d9b717fb47bcf883 = 1;
                    continue;
                }
                if (istrue(player.var_d9b717fb47bcf883) && !var_641529ab835cfe52) {
                    self.var_2b3fffe79b36b023[player_id] = 0;
                    player.var_d9b717fb47bcf883 = 0;
                }
            }
        }
        wait 1;
    }
}

// Namespace ob_pvpve / namespace_dc38f0ea48cd4743
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x107d
// Size: 0x52
function private function_8868d59e008df32d() {
    if (level.var_529deb371b5eeb12) {
        return (30485, 27248, 10000);
    }
    return (level.mapcorners[0].origin + level.mapcorners[1].origin) * 0.5;
}

// Namespace ob_pvpve / namespace_dc38f0ea48cd4743
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x10d7
// Size: 0x54
function private validateclass(struct) {
    if (level.var_b71c0a184363d6a2) {
        struct.loadoutfieldupgrade1 = "none";
        struct.var_4c4f03fa00925daf = 0;
        struct.loadoutfieldupgrade2 = "none";
        struct.var_2907f1614fe4e5f2 = 0;
    }
    return struct;
}

// Namespace ob_pvpve / namespace_dc38f0ea48cd4743
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1134
// Size: 0x2b
function private function_e48bd997f13cb39f(deathdata) {
    if (istrue(level.var_b482b579a7b7f6f)) {
        deathdata.victim thread function_a6a654c500d6b6c2();
    }
}

// Namespace ob_pvpve / namespace_dc38f0ea48cd4743
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1167
// Size: 0x19
function private function_ba180700e314d6d7() {
    if (istrue(level.var_cb9af30290da6a03)) {
        self.var_9632a7ee2ddfb1ed = undefined;
    }
}

// Namespace ob_pvpve / namespace_dc38f0ea48cd4743
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1188
// Size: 0x44
function private function_ddeeb266618960a1() {
    var_85a40249b07be68e = istrue(self.isjuggernaut) && isdefined(self.juggcontext);
    if (istrue(var_85a40249b07be68e)) {
        return;
    }
    respawnitems = scripts\mp\class::respawnitems_saveplayeritemstostruct();
    scripts\mp\class::respawnitems_assignrespawnitems(respawnitems);
}

// Namespace ob_pvpve / namespace_dc38f0ea48cd4743
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x11d4
// Size: 0xd
function private function_f4c8727cac33c176() {
    self.var_57c207fde9b78089 = 1;
}

// Namespace ob_pvpve / namespace_dc38f0ea48cd4743
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x11e9
// Size: 0x2e
function private on_player_death(params) {
    function_ba180700e314d6d7();
    function_21ea168d74224bc0();
    function_ddeeb266618960a1();
    function_f4c8727cac33c176();
    function_af0e816da6ba7671();
}

// Namespace ob_pvpve / namespace_dc38f0ea48cd4743
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x121f
// Size: 0x4b
function private function_fc07055217ad8488(quantity) {
    minquantity = getdvarint(@"hash_571365590d627eff", 2500);
    maxquantity = getdvarint(@"hash_632947d88cf01a55", 50000);
    return clamp(quantity, minquantity, maxquantity);
}

// Namespace ob_pvpve / namespace_dc38f0ea48cd4743
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1273
// Size: 0x11f
function private function_21ea168d74224bc0() {
    if (istrue(level.var_5a57e4de82e72545)) {
        return;
    }
    dropstruct = function_59a2e61d79065dca();
    function_2166e0fab7a3263("currency", dropstruct, undefined, &function_fc07055217ad8488);
    function_2166e0fab7a3263("weapon", dropstruct, 1);
    function_2166e0fab7a3263("weapon", dropstruct, 0);
    function_2166e0fab7a3263("lethal", dropstruct);
    function_2166e0fab7a3263("tactical", dropstruct);
    function_2166e0fab7a3263("killstreak", dropstruct);
    if (istrue(level.var_cb9af30290da6a03)) {
        function_2166e0fab7a3263("super", dropstruct);
    }
    function_2166e0fab7a3263("armor", dropstruct);
    function_2166e0fab7a3263("gasmask", dropstruct);
    function_2166e0fab7a3263("revive", dropstruct);
    function_2166e0fab7a3263("plate_carrier", dropstruct);
    backpacksize = function_1b35b10884bd8d67();
    for (i = 0; i < backpacksize; i++) {
        if (istrue(function_7192774bb894cced(i))) {
            continue;
        }
        function_4433fa5f0f02ffd8(dropstruct, i);
    }
    if (!level.var_7d6f4cde2f1448f) {
        function_2166e0fab7a3263("backpack", dropstruct);
    }
}

// Namespace ob_pvpve / namespace_dc38f0ea48cd4743
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x139a
// Size: 0x37
function private function_af0e816da6ba7671() {
    if (isdefined(self.region)) {
        var_cdce5f59f2ef9d3d = level.var_f756bf4293f67099[self.region];
    }
    self.var_d9020915455a4741 = var_cdce5f59f2ef9d3d;
}

// Namespace ob_pvpve / namespace_dc38f0ea48cd4743
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13d9
// Size: 0xdf
function function_a6a654c500d6b6c2() {
    level endon("game_ended");
    if (istrue(level.gameended)) {
        return;
    }
    self notify("ob_pvpve_wait_and_spawn");
    teamcount = scripts\mp\utility\teams::getteamdata(self.team, "teamCount");
    if (istrue(self.squadwiped) || teamcount == 1) {
        var_bca00499254fa395 = getdvarint(@"hash_15a9b52f8eb91211", 5);
    } else {
        var_bca00499254fa395 = getdvarint(@"hash_f3bede6d41ff6edd", 10);
    }
    scripts\mp\utility\lower_message::setlowermessageomnvar("waiting_to_spawn", int(gettime() + var_bca00499254fa395 * 1000));
    wait var_bca00499254fa395;
    thread adddeathicon();
    if (!isdefined(self.revivecount)) {
        self.revivecount = 1;
    } else {
        self.revivecount++;
    }
    self.var_57c207fde9b78089 = 0;
    respawnplayer();
}

// Namespace ob_pvpve / namespace_dc38f0ea48cd4743
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x14c0
// Size: 0x85
function private function_7192774bb894cced(itemindex) {
    lootid = function_d870b2c45335bd88(itemindex);
    if (!isdefined(lootid) || lootid <= 0) {
        return true;
    }
    bundlename = function_fc925a153c7fd55c(lootid);
    if (!isdefined(bundlename)) {
        return true;
    }
    itembundle = getscriptbundle("itemspawnentry:" + bundlename);
    if (!isdefined(itembundle)) {
        return true;
    }
    if (level.var_7d6f4cde2f1448f) {
        return (itembundle.subtype == "schematic");
    }
    return false;
}

// Namespace ob_pvpve / namespace_dc38f0ea48cd4743
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x154e
// Size: 0x6f
function respawnplayer() {
    if (istrue(self.liveragdoll)) {
        self.liveragdoll = 0;
        self setsolid(1);
        self function_6b4c8718bc36d1ef(0);
        self function_e4ccd01fb7ec7a6f(0);
        self function_d87e1768229d0e3e();
    }
    spawnpoint = setspawnpoint();
    var_7b717b4dbce0b62f = ter_op(isdefined(spawnpoint), spawnpoint, self.origin);
    namespace_b3fcba693d3adc37::function_ef6adc9492d03ef(var_7b717b4dbce0b62f);
}

// Namespace ob_pvpve / namespace_dc38f0ea48cd4743
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15c5
// Size: 0x1ca
function setspawnpoint() {
    randomdistance = randomintrange(7500, 20000);
    randomangle = randomint(360);
    var_773f52a7d94b7f69 = [];
    for (i = 1; i <= 32; i++) {
        pos = self.origin + anglestoforward((0, randomangle + 11.25 * i, 0)) * randomdistance;
        if (!scripts\mp\outofbounds::ispointinoutofbounds(pos) && function_bdf19384dd9c7829(pos)) {
            var_773f52a7d94b7f69[var_773f52a7d94b7f69.size] = pos;
        }
    }
    /#
        thread function_99cccfd31080bb65(var_773f52a7d94b7f69);
    #/
    if (var_773f52a7d94b7f69.size > 0) {
        return array_random(var_773f52a7d94b7f69);
    }
    var_2e7ac0673f9ee23f = [(-31536, 30148, 1500), (30752, 27476, 1515), (-31312, 4964, 1000), (38704, -5896, 2964), (-26336, -25180, 1748), (7492, -32964, 2000), (26040, -28664, 3504)];
    spawnlocation = undefined;
    var_2afbf36321eb0ca = undefined;
    foreach (location in var_2e7ac0673f9ee23f) {
        dis = distance2dsquared(location, self.origin);
        if (!isdefined(var_2afbf36321eb0ca) || dis < var_2afbf36321eb0ca) {
            var_2afbf36321eb0ca = dis;
            spawnlocation = location;
        }
    }
    return spawnlocation;
}

/#

    // Namespace ob_pvpve / namespace_dc38f0ea48cd4743
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x1798
    // Size: 0xc2
    function function_99cccfd31080bb65(var_773f52a7d94b7f69) {
        level endon("<dev string:x1c>");
        self endon("<dev string:x27>");
        lastdeathpos = self.origin;
        while (true) {
            waitframe();
            sphere(lastdeathpos, 7500, (1, 0, 0));
            sphere(lastdeathpos, 20000, (0, 1, 0));
            foreach (pos in var_773f52a7d94b7f69) {
                sphere(pos, 100, (0, 0, 1));
            }
        }
    }

#/

// Namespace ob_pvpve / namespace_dc38f0ea48cd4743
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1862
// Size: 0xd7
function function_bdf19384dd9c7829(pos) {
    if (level.aether_storm.radiation namespace_6d781a0248843409::function_1b4f63fa623de69a(pos)) {
        return false;
    }
    if (function_6c71c72547bb931(drop_to_ground(pos) + (0, 0, -50))) {
        return false;
    }
    posregion = namespace_4df2ab39b0e96ec7::get_region(pos);
    if (!isdefined(posregion)) {
        return true;
    }
    var_bf528e00efcf9f48 = level.var_f756bf4293f67099[posregion];
    if (isdefined(var_bf528e00efcf9f48) && isdefined(self.var_d9020915455a4741)) {
        switch (self.var_d9020915455a4741) {
        case #"hash_5343b465e56ec9a4": 
            return true;
        case #"hash_af83e47edfa8900a": 
            return (var_bf528e00efcf9f48 != "difficulty_hard");
        case #"hash_7bb2cd766703d463": 
            return (var_bf528e00efcf9f48 == "difficulty_easy");
        }
    }
    return true;
}

// Namespace ob_pvpve / namespace_dc38f0ea48cd4743
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1942
// Size: 0x1ea
function private function_50c0ea10b250b9e() {
    loadout_clearweapons();
    function_ffe562ebbdab55fc(0);
    function_ffe562ebbdab55fc(1);
    randomloadoutindex = randomint(level.var_15c03fdd665277c0.size);
    primaryweaponname = getdvar(@"hash_e37ee92c81bbd455", level.var_15c03fdd665277c0[randomloadoutindex]["loadoutPrimary"]);
    primaryweapon = namespace_e0ee43ef2dddadaa::buildweapon(primaryweaponname, [], "none", "none", -1);
    self giveweapon(primaryweapon);
    self.primaryweapon = getcompleteweaponname(primaryweapon);
    function_b5f358d46f69b20e(primaryweapon);
    secondaryweaponname = getdvar(@"hash_e5cc68d2496976d", level.var_15c03fdd665277c0[randomloadoutindex]["loadoutSecondary"]);
    secondaryweapon = namespace_e0ee43ef2dddadaa::buildweapon(secondaryweaponname, [], "none", "none", -1);
    self giveweapon(secondaryweapon);
    self.secondaryweapon = getcompleteweaponname(secondaryweapon);
    function_b5f358d46f69b20e(secondaryweapon);
    self switchtoweaponimmediate(primaryweapon);
    self setspawnweapon(self.primaryweapon);
    lethalequipmentname = level.var_15c03fdd665277c0[randomloadoutindex]["loadoutEquipmentPrimary"];
    tacticalequipmentname = level.var_15c03fdd665277c0[randomloadoutindex]["loadoutEquipmentSecondary"];
    foreach (equipment in [lethalequipmentname, tacticalequipmentname]) {
        if (equipment == "") {
            continue;
        }
        slot = scripts\mp\equipment::getdefaultslot(equipment);
        scripts\mp\equipment::giveequipment(equipment, slot);
    }
    namespace_7dfc6454a70f3f39::function_3036cef61495210f("essence", function_40e3265fda17eee5());
}

// Namespace ob_pvpve / namespace_dc38f0ea48cd4743
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b34
// Size: 0x2e
function function_ee84b0a72897ee98() {
    level endon("game_ended");
    scripts\mp\flags::function_1240434f4201ac9d("prematch_done");
    level.spawnarmorplates = getdvarint(@"hash_67a1e86099edda21", 1);
}

// Namespace ob_pvpve / namespace_dc38f0ea48cd4743
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b6a
// Size: 0x16d
function function_40e3265fda17eee5() {
    var_f204f93ba8719e05 = getdvarint(@"hash_f14298cc084f115b", -1);
    if (var_f204f93ba8719e05 >= 0) {
        return var_f204f93ba8719e05;
    }
    var_3398791abeb3018f = [0, 0, 0, 0, 0, 200, 400, 600, 800, 1000, 1400, 1800, 2200, 2600, 3000, 3400, 3800, 4200, 4600, 5000, 5500, 6000, 6500, 7000, 7500, 8000, 8500, 9000, 9500, 10000, 10500, 11000, 11500, 12000, 12500, 13000, 13500, 14000, 14500, 15000];
    i = int(floor(scripts\mp\utility\game::getminutespassed()));
    return ter_op(var_3398791abeb3018f.size > i, var_3398791abeb3018f[i], var_3398791abeb3018f[var_3398791abeb3018f.size - 1]);
}

// Namespace ob_pvpve / namespace_dc38f0ea48cd4743
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1ce0
// Size: 0x1cc
function private function_feab0a1523a87a88() {
    spawnpointcsv = level.var_126fea15d159e0ca;
    rownum = tablelookupgetnumrows(spawnpointcsv);
    spawnpointslist = [];
    for (rowindex = 0; rowindex < rownum; rowindex++) {
        originstring = tablelookupbyrow(spawnpointcsv, rowindex, 0);
        anglesstring = tablelookupbyrow(spawnpointcsv, rowindex, 1);
        scriptnoteworthy = tablelookupbyrow(spawnpointcsv, rowindex, 2);
        index = tablelookupbyrow(spawnpointcsv, rowindex, 3);
        if (!isdefined(originstring) || originstring == "" || !isdefined(anglesstring) || anglesstring == "" || !isdefined(scriptnoteworthy) || scriptnoteworthy == "" || !isdefined(index) || index == "") {
            assertmsg("getSpawnStartPointOverride(): Invalid row" + rowindex + " in file " + spawnpointcsv);
            continue;
        }
        var_b4d42a7ce0d49aaa = strtok(originstring, " ");
        var_d22f47766862a420 = strtok(anglesstring, " ");
        spawnpoint = spawnstruct();
        spawnpoint.index = int(index);
        spawnpoint.script_noteworthy = scriptnoteworthy;
        spawnpoint.origin = (float(var_b4d42a7ce0d49aaa[0]), float(var_b4d42a7ce0d49aaa[1]), float(var_b4d42a7ce0d49aaa[2]));
        spawnpoint.angles = (float(var_d22f47766862a420[0]), float(var_d22f47766862a420[1]), float(var_d22f47766862a420[2]));
        spawnpoint.target = "";
        spawnpointslist[spawnpointslist.size] = spawnpoint;
    }
    return spawnpointslist;
}

// Namespace ob_pvpve / namespace_dc38f0ea48cd4743
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1eb5
// Size: 0x32
function function_3b0edbbabf280e78(params) {
    if (!isdefined(level.var_aab4fba7a041b281)) {
        level.var_aab4fba7a041b281 = [];
    }
    namespace_4b05af9596de25bf::function_7582e8d13ed3c196(params);
    namespace_325330503813833a::function_b1568160c3017867(params);
}

// Namespace ob_pvpve / namespace_dc38f0ea48cd4743
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1eef
// Size: 0xd5
function adddeathicon() {
    self endon("disconnect");
    iconorigin = self.origin + (0, 0, 40);
    self notify("addDeathIcon");
    self endon("addDeathIcon");
    if (isdefined(self.lastdeathheadicon)) {
        scripts\cp_mp\entityheadicons::setheadicon_deleteicon(self.lastdeathheadicon);
        self.lastdeathheadicon = undefined;
    }
    self notify("removed_death_icon");
    image = "hud_icon_player_dead_" + self.var_3f78c6a0862f9e25 + 1;
    showto = scripts\mp\utility\teams::getteamdata(self.team, "players");
    self.lastdeathheadicon = scripts\cp_mp\entityheadicons::setheadicon_singleimage(showto, image, undefined, 1, 0, 200, undefined, undefined, 1, iconorigin, 1, "icon_regular");
    thread scripts\mp\deathicons::destroyslowly(20);
}

// Namespace ob_pvpve / namespace_dc38f0ea48cd4743
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1fcc
// Size: 0x71
function private function_5dc7e082b29eb26e() {
    deadplayer = self.victim;
    if (!isdefined(deadplayer)) {
        return;
    }
    level endon("game_end");
    deadplayer endon("disconnect");
    deadplayer endon("spawned");
    deadplayer endon("end_respawn");
    deadplayer endon("started_spawnPlayer");
    deadplayer waittill("ob_pvpve_wait_and_spawn");
    logstring("[recon_points] remove trigger for " + deadplayer.name);
    deadplayer scripts\mp\teamrevive::removetrigger(deadplayer.guid);
}

// Namespace ob_pvpve / namespace_dc38f0ea48cd4743
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2045
// Size: 0xa
function private onspawnrevivetrigger() {
    thread function_5dc7e082b29eb26e();
}

// Namespace ob_pvpve / namespace_dc38f0ea48cd4743
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2057
// Size: 0x22f
function function_8bc4148d7acee203() {
    level endon("game_ended");
    scripts\mp\flags::function_1240434f4201ac9d("prematch_done");
    level.var_32d6d39f3da920ca = [];
    var_b5ab6c23fefc22d4 = getdvarint(@"hash_c5128635aef807e6", 3000);
    var_91a2946f78dd1971 = getdvarint(@"hash_83cf2282d3e494fc", 1600);
    intensitymultiplier = getdvarfloat(@"hash_a5cdb74fe4b8ac17", 0.7);
    while (true) {
        foreach (player in level.players) {
            if (!isdefined(player)) {
                continue;
            }
            if (!scripts\mp\utility\player::isreallyalive(player)) {
                player function_5a6cae9be5731fa6();
                continue;
            }
            enemyteamnum = player function_eb0aa531d61fa07f(var_b5ab6c23fefc22d4);
            if (enemyteamnum > 0) {
                zoneindex = function_b439f805f07ff50(player.origin);
                subzone = function_2ee25a0fa15c04ce(player.origin);
                if (isdefined(player.currentzoneindex) && isdefined(player.var_f5bfeb5a0a08d17e)) {
                    if (isdefined(subzone) && player.currentzoneindex == zoneindex && player.var_f5bfeb5a0a08d17e == subzone.subzoneindex) {
                        continue;
                    } else {
                        player function_5a6cae9be5731fa6();
                    }
                }
                subzones = function_6aa08c3e29cd1452(player.origin, var_91a2946f78dd1971);
                var_4b823d93740fc9dd = int(round(subzones.size * (1 - pow(intensitymultiplier, enemyteamnum))));
                subzones = array_randomize(subzones);
                for (i = 0; i < var_4b823d93740fc9dd; i++) {
                    subzoneindex = subzones[i].subzoneindex;
                    player function_a8e1fec0a897a1be(zoneindex, subzoneindex);
                }
                continue;
            }
            player function_5a6cae9be5731fa6();
        }
        wait 1;
    }
}

// Namespace ob_pvpve / namespace_dc38f0ea48cd4743
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x228e
// Size: 0xc0
function function_eb0aa531d61fa07f(dist) {
    var_e965bce0774276b4 = getplayersinradius(self.origin, dist);
    enemyteams = [];
    enemyteamnum = 0;
    foreach (player in var_e965bce0774276b4) {
        if (player.team != self.team) {
            if (!istrue(enemyteams[player.team])) {
                enemyteams[player.team] = 1;
                enemyteamnum++;
            }
        }
    }
    return enemyteamnum;
}

// Namespace ob_pvpve / namespace_dc38f0ea48cd4743
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2357
// Size: 0x29
function function_38ae0db9542b127c(player, testplayer) {
    player scripts\mp\hud_message::showsplash("ob_pvpve_warn_enemy_nearby", undefined, undefined, undefined, undefined, "splash_list_jup_ob_pvpve");
}

// Namespace ob_pvpve / namespace_dc38f0ea48cd4743
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2388
// Size: 0x9f
function private function_a8e1fec0a897a1be(zoneindex, subzoneindex) {
    if (!isdefined(level.var_32d6d39f3da920ca[zoneindex])) {
        level.var_32d6d39f3da920ca[zoneindex] = [];
    }
    if (!isdefined(level.var_32d6d39f3da920ca[zoneindex][subzoneindex])) {
        level.var_32d6d39f3da920ca[zoneindex][subzoneindex] = [];
    }
    function_1d5039979534caef(zoneindex, subzoneindex, 0);
    playerid = self getentitynumber();
    level.var_32d6d39f3da920ca[zoneindex][subzoneindex] = function_6d6af8144a5131f1(level.var_32d6d39f3da920ca[zoneindex][subzoneindex], playerid);
    self.currentzoneindex = zoneindex;
    self.var_f5bfeb5a0a08d17e = subzoneindex;
}

// Namespace ob_pvpve / namespace_dc38f0ea48cd4743
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x242f
// Size: 0x14c
function private function_5a6cae9be5731fa6() {
    if (!isdefined(self.currentzoneindex) || !isdefined(self.var_f5bfeb5a0a08d17e)) {
        return;
    }
    playerid = self getentitynumber();
    foreach (zoneindex, var_2eff22ac5a0456f0 in level.var_32d6d39f3da920ca) {
        foreach (subzoneindex, var_707742a55c7a4d52 in var_2eff22ac5a0456f0) {
            shouldclear = 0;
            for (i = 0; i < var_707742a55c7a4d52.size; i++) {
                if (isdefined(var_707742a55c7a4d52[i]) && playerid == var_707742a55c7a4d52[i]) {
                    level.var_32d6d39f3da920ca[zoneindex][subzoneindex] = array_remove_index(var_707742a55c7a4d52, i);
                    shouldclear = 1;
                }
            }
            if (level.var_32d6d39f3da920ca[zoneindex][subzoneindex].size == 0 && shouldclear) {
                function_1d5039979534caef(zoneindex, subzoneindex, 1);
            }
        }
    }
    self.currentzoneindex = undefined;
    self.var_f5bfeb5a0a08d17e = undefined;
}

// Namespace ob_pvpve / namespace_dc38f0ea48cd4743
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2583
// Size: 0xd0
function function_6beff7b631ab7e18(kiosk, player) {
    str_difficulty = namespace_f721fc7d0d2d0f47::function_4d8bb2d866771a10(kiosk.origin);
    switch (str_difficulty) {
    case #"hash_7bb2cd766703d463": 
        kiosk.overrideindex = loot::function_54b046aa3ba2678a("jup_ob_pvpve_green");
        break;
    case #"hash_af83e47edfa8900a": 
        kiosk.overrideindex = loot::function_54b046aa3ba2678a("jup_ob_pvpve_yellow");
        break;
    case #"hash_5343b465e56ec9a4": 
        kiosk.overrideindex = loot::function_54b046aa3ba2678a("jup_ob_pvpve_orange");
        break;
    case #"hash_651f76c0ad6741ec": 
        kiosk.overrideindex = loot::function_54b046aa3ba2678a("jup_ob_pvpve_red");
        break;
    }
}

