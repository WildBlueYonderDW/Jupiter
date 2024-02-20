// mwiii decomp prototype
#using script_4c770a9a4ad7659c;
#using script_3b64eb40368c1450;
#using script_3e2f8cc477d57433;
#using script_7b2517368c79e5bc;
#using script_443d99fe707f1d9f;
#using script_600b944a95c3a7bf;
#using scripts\engine\utility.gsc;
#using script_638d701d263ee1ed;
#using script_247745a526421ba7;
#using script_70c2478fc6d8ef;
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

// Namespace ob_pvpve/namespace_dc38f0ea48cd4743
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6a5
// Size: 0x4b
function main() {
    function_7a48f3c1e25d94ea();
    namespace_649c2fab0fd72b8b::init();
    namespace_d1df78f2235ca173::main();
    level.var_a77c94576da6cab0 = "powerup_list_jup_ob_pvpve";
    level.var_2f26ac0d970dddb0 = 0;
    level.var_5025186a3fc7fa4 = 1;
    function_b8b6197e933f61ca();
    waittillframeend();
    thread initpostmain();
}

// Namespace ob_pvpve/namespace_dc38f0ea48cd4743
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6f7
// Size: 0x207
function initpostmain() {
    level.ob_pvpve = 1;
    level.var_a95cf198feabb6a = level.callbackplayerdamage;
    level.callbackplayerdamage = &callback_playerdamage;
    level.var_b0830df5265878d5 = getdvarint(@"hash_dd3a7048817057e3", 1);
    val::function_2d6e7e0b80767910("laststand_ob_pvpve_values", [0:"ascender_use", 1:"crate_use", 2:"gesture", 3:"killstreaks", 4:"melee", 5:"offhand_primary_weapons", 6:"offhand_secondary_weapons", 7:"supers", 8:"usability", 9:"vehicle_use", 10:"weapon", 11:"fire", 12:"weapon_pickup", 13:"reload", 14:"weapon_switch", 15:"show_operator_pet"]);
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
    function_c064aa3a5b8d8f92();
    function_7b49b147e0d292e5();
    if (getdvarint(@"hash_fc33c3ed0db21df1", 1) == 1) {
        level thread function_8bc4148d7acee203();
    }
    function_ea1e7eeb0d48ba61();
    level.var_6beff7b631ab7e18 = &function_6beff7b631ab7e18;
}

// Namespace ob_pvpve/namespace_dc38f0ea48cd4743
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x905
// Size: 0x6c
function function_b8b6197e933f61ca() {
    level.var_529deb371b5eeb12 = getdvarint(@"hash_f42c93cfb94e6b70", 1);
    var_f3ecbc2149b3379e = getdvar(@"hash_2bd79e8b28a32bcb", "ne");
    level.var_126fea15d159e0ca = "ob/ob_pvpve/ob_pvpve_spawnpoints_" + var_f3ecbc2149b3379e + ".csv";
    if (istrue(level.var_529deb371b5eeb12)) {
        level.var_49839a7ef42e68d8 = function_feab0a1523a87a88();
    }
}

// Namespace ob_pvpve/namespace_dc38f0ea48cd4743
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x978
// Size: 0x7b
function function_c064aa3a5b8d8f92() {
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
    level.var_8b5c3bda53460402 = &function_ca164a1eb0c4d321;
}

// Namespace ob_pvpve/namespace_dc38f0ea48cd4743
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9fa
// Size: 0xa6
function function_7b49b147e0d292e5() {
    level.var_b482b579a7b7f6f = getdvarint(@"hash_cc3db596630b78c7", 0) == 1;
    level.var_8868d59e008df32d = &function_8868d59e008df32d;
    level.modeonspawnplayer = &function_3f063047ea2b31b4;
    level callback::add("on_ob_laststand_player_killed", &function_e48bd997f13cb39f);
    registersharedfunc(#"ob_pvpve", #"hash_c69889de57e82c49", &function_50c0ea10b250b9e);
    if (getdvarint(@"hash_551606c97d23028c", 1) == 1) {
        namespace_7db13bdf599e41a6::function_5343ecb486b66bf1("ob_pvpve", &function_d23f4d7bfe21f9da);
    }
    function_600cc18a5b7b64b0("mp/classtable_ob_pvpve.csv");
    level thread function_ee84b0a72897ee98();
}

// Namespace ob_pvpve/namespace_dc38f0ea48cd4743
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xaa7
// Size: 0x11
function function_ea1e7eeb0d48ba61() {
    level.var_127cc78420f659f8 = &function_127cc78420f659f8;
}

// Namespace ob_pvpve/namespace_dc38f0ea48cd4743
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xabf
// Size: 0x4
function function_127cc78420f659f8() {
    return 0;
}

// Namespace ob_pvpve/namespace_dc38f0ea48cd4743
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xacb
// Size: 0x2c
function function_7a48f3c1e25d94ea() {
    level.var_5a57e4de82e72545 = getdvarint(@"hash_307fc239dc43be41", 0);
    callback::add("player_death", &on_player_death);
}

// Namespace ob_pvpve/namespace_dc38f0ea48cd4743
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xafe
// Size: 0x56
function function_600cc18a5b7b64b0(table) {
    level.var_15c03fdd665277c0 = [];
    var_7d958726e11b327 = tablelookupgetnumcols(table) - 1;
    for (i = 0; i < var_7d958726e11b327; i++) {
        level.var_15c03fdd665277c0[i] = function_aa8a954d66bf39b4(i, table);
    }
}

// Namespace ob_pvpve/namespace_dc38f0ea48cd4743
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xb5b
// Size: 0x7e
function private function_aa8a954d66bf39b4(classindex, table) {
    loadout["loadoutPrimary"] = tablelookup(table, 0, "loadoutPrimary", classindex + 1);
    loadout["loadoutSecondary"] = tablelookup(table, 0, "loadoutSecondary", classindex + 1);
    loadout["loadoutEquipmentPrimary"] = tablelookup(table, 0, "loadoutEquipmentPrimary", classindex + 1);
    loadout["loadoutEquipmentSecondary"] = tablelookup(table, 0, "loadoutEquipmentSecondary", classindex + 1);
    return loadout;
}

// Namespace ob_pvpve/namespace_dc38f0ea48cd4743
// Params 15, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbe1
// Size: 0x120
function callback_playerdamage(einflictor, eattacker, idamage, idflags, smeansofdeath, var_d7bc24cd73dfc712, objweapon, vpoint, vdir, shitloc, timeoffset, modelindex, partname, var_b0fc59ff15058522, var_be4285b26ed99ab1) {
    if (istrue(level.ob_pvpve)) {
        var_29a8ba8c9dd43fd2 = 0;
        if (issharedfuncdefined("zombie", "get_pap_level") && isplayer(eattacker)) {
            var_29a8ba8c9dd43fd2 = eattacker function_f3bb4f4911a1beb2("zombie", "get_pap_level", objweapon);
            if (var_29a8ba8c9dd43fd2 >= 1) {
                var_87c56f9e23a55ac3 = getdvarfloat(function_2ef675c13ca1c4af(@"hash_cfa00926baa9b9a6", var_29a8ba8c9dd43fd2), 0.5);
                idamage = idamage * var_87c56f9e23a55ac3;
            }
        }
    }
    [[ level.var_a95cf198feabb6a ]](einflictor, eattacker, idamage, idflags, smeansofdeath, var_d7bc24cd73dfc712, objweapon, vpoint, vdir, shitloc, timeoffset, modelindex, partname, var_b0fc59ff15058522, var_be4285b26ed99ab1);
}

// Namespace ob_pvpve/namespace_dc38f0ea48cd4743
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd08
// Size: 0xec
function function_59bb85cf2b5af12f(params) {
    if (isdefined(params.progress) && istrue(level.var_520545ce455767b6)) {
        if (!self getbeingrevived()) {
            if (level.var_b0830df5265878d5) {
                var_d776bd03289d5f1c = self.health / level.laststandrevivehealth;
                params.progress = max(0, min(params.progress, var_d776bd03289d5f1c));
            }
            self.health = int(level.laststandrevivehealth * params.progress);
            if (isdefined(self.laststandreviveent) && isdefined(self.laststandreviveent.objidnum)) {
                namespace_5a22b6f3a56f7e9b::objective_set_progress(self.laststandreviveent.objidnum, params.progress);
            }
        }
    }
}

// Namespace ob_pvpve/namespace_dc38f0ea48cd4743
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdfb
// Size: 0x33
function on_player_spawned(params) {
    thread function_d496bb74f129b113();
    if (getdvarint(@"hash_3aa023d6eebd03fa", 0) == 1) {
        level thread namespace_446fc987a980892f::function_aea00c3815b226da(self);
    }
}

// Namespace ob_pvpve/namespace_dc38f0ea48cd4743
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe35
// Size: 0x13
function on_player_disconnect(params) {
    function_5a6cae9be5731fa6();
}

// Namespace ob_pvpve/namespace_dc38f0ea48cd4743
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xe4f
// Size: 0x17
function private function_3f063047ea2b31b4(var_f0729562cde426a3) {
    self.var_26d22342913bacf6 = istrue(var_f0729562cde426a3);
}

// Namespace ob_pvpve/namespace_dc38f0ea48cd4743
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe6d
// Size: 0x209
function function_d496bb74f129b113() {
    self endon("death_or_disconnect");
    namespace_4b0406965e556711::function_1240434f4201ac9d("prematch_done");
    while (1) {
        foreach (player in level.players) {
            if (!isdefined(player)) {
                continue;
            }
            if (!isdefined(self.var_2b3fffe79b36b023)) {
                self.var_2b3fffe79b36b023 = [];
            }
            if (self.team != player.team) {
                player_id = player getentitynumber();
                var_1ed73842e8cb826d = distancesquared(self.origin, player.origin) < 4000000 && isalive(player);
                var_641529ab835cfe52 = namespace_f8065cafc523dba5::function_f8789f15330de751(player);
                if (!istrue(self.var_2b3fffe79b36b023[player_id]) && var_1ed73842e8cb826d) {
                    playfxontagforclients(getfx("vfx_player_eye_glow"), player, "tag_eye", self);
                    playfxontagforclients(getfx("vfx_player_chest_smk"), player, "j_spine4", self);
                    waitframe();
                    self.var_2b3fffe79b36b023[player_id] = 1;
                } else if (istrue(self.var_2b3fffe79b36b023[player_id]) && !var_1ed73842e8cb826d) {
                    stopfxontagforclients(getfx("vfx_player_eye_glow"), player, "tag_eye", self);
                    stopfxontagforclients(getfx("vfx_player_chest_smk"), player, "j_spine4", self);
                    waitframe();
                    self.var_2b3fffe79b36b023[player_id] = 0;
                }
                if (!istrue(player.var_d9b717fb47bcf883) && var_641529ab835cfe52) {
                    self.var_2b3fffe79b36b023[player_id] = 0;
                    player.var_d9b717fb47bcf883 = 1;
                } else if (istrue(player.var_d9b717fb47bcf883) && !var_641529ab835cfe52) {
                    self.var_2b3fffe79b36b023[player_id] = 0;
                    player.var_d9b717fb47bcf883 = 0;
                }
            }
        }
        wait(1);
    }
}

// Namespace ob_pvpve/namespace_dc38f0ea48cd4743
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x107d
// Size: 0x53
function private function_8868d59e008df32d() {
    if (level.var_529deb371b5eeb12) {
        return (30485, 27248, 10000);
    } else {
        return ((level.mapcorners[0].origin + level.mapcorners[1].origin) * 0.5);
    }
}

// Namespace ob_pvpve/namespace_dc38f0ea48cd4743
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x10d7
// Size: 0x55
function private function_ca164a1eb0c4d321(struct) {
    if (level.var_b71c0a184363d6a2) {
        struct.loadoutfieldupgrade1 = "none";
        struct.var_4c4f03fa00925daf = 0;
        struct.loadoutfieldupgrade2 = "none";
        struct.var_2907f1614fe4e5f2 = 0;
    }
    return struct;
}

// Namespace ob_pvpve/namespace_dc38f0ea48cd4743
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1134
// Size: 0x2c
function private function_e48bd997f13cb39f(var_642470e1abc1bbf9) {
    if (istrue(level.var_b482b579a7b7f6f)) {
        var_642470e1abc1bbf9.victim thread function_a6a654c500d6b6c2();
    }
}

// Namespace ob_pvpve/namespace_dc38f0ea48cd4743
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1167
// Size: 0x1a
function private function_ba180700e314d6d7() {
    if (istrue(level.var_cb9af30290da6a03)) {
        self.var_9632a7ee2ddfb1ed = undefined;
    }
}

// Namespace ob_pvpve/namespace_dc38f0ea48cd4743
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1188
// Size: 0x45
function private function_ddeeb266618960a1() {
    var_85a40249b07be68e = istrue(self.isjuggernaut) && isdefined(self.juggcontext);
    if (istrue(var_85a40249b07be68e)) {
        return;
    }
    respawnitems = namespace_d19129e4fa5d176::respawnitems_saveplayeritemstostruct();
    namespace_d19129e4fa5d176::respawnitems_assignrespawnitems(respawnitems);
}

// Namespace ob_pvpve/namespace_dc38f0ea48cd4743
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x11d4
// Size: 0xe
function private function_f4c8727cac33c176() {
    self.var_57c207fde9b78089 = 1;
}

// Namespace ob_pvpve/namespace_dc38f0ea48cd4743
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x11e9
// Size: 0x2f
function private on_player_death(params) {
    function_ba180700e314d6d7();
    function_21ea168d74224bc0();
    function_ddeeb266618960a1();
    function_f4c8727cac33c176();
    function_af0e816da6ba7671();
}

// Namespace ob_pvpve/namespace_dc38f0ea48cd4743
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x121f
// Size: 0x4c
function private function_fc07055217ad8488(quantity) {
    var_786be131413d643a = getdvarint(@"hash_571365590d627eff", 2500);
    var_ecb636502b5a97a8 = getdvarint(@"hash_632947d88cf01a55", 50000);
    return clamp(quantity, var_786be131413d643a, var_ecb636502b5a97a8);
}

// Namespace ob_pvpve/namespace_dc38f0ea48cd4743
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1273
// Size: 0x120
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
    backpackSize = function_1b35b10884bd8d67();
    for (i = 0; i < backpackSize; i++) {
        if (istrue(function_7192774bb894cced(i))) {
            continue;
        }
        function_4433fa5f0f02ffd8(dropstruct, i);
    }
    if (!level.var_7d6f4cde2f1448f) {
        function_2166e0fab7a3263("backpack", dropstruct);
    }
}

// Namespace ob_pvpve/namespace_dc38f0ea48cd4743
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x139a
// Size: 0x38
function private function_af0e816da6ba7671() {
    if (isdefined(self.region)) {
        var_cdce5f59f2ef9d3d = level.var_f756bf4293f67099[self.region];
    }
    self.var_d9020915455a4741 = var_cdce5f59f2ef9d3d;
}

// Namespace ob_pvpve/namespace_dc38f0ea48cd4743
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13d9
// Size: 0xe0
function function_a6a654c500d6b6c2() {
    level endon("game_ended");
    if (istrue(level.gameended)) {
        return;
    }
    self notify("ob_pvpve_wait_and_spawn");
    teamcount = namespace_54d20dd0dd79277f::getteamdata(self.team, "teamCount");
    if (istrue(self.squadwiped) || teamcount == 1) {
        var_bca00499254fa395 = getdvarint(@"hash_15a9b52f8eb91211", 5);
    } else {
        var_bca00499254fa395 = getdvarint(@"hash_f3bede6d41ff6edd", 10);
    }
    namespace_58fb4f2e73fd41a0::setlowermessageomnvar("waiting_to_spawn", int(gettime() + var_bca00499254fa395 * 1000));
    wait(var_bca00499254fa395);
    thread adddeathicon();
    if (!isdefined(self.revivecount)) {
        self.revivecount = 1;
    } else {
        self.revivecount++;
    }
    self.var_57c207fde9b78089 = 0;
    respawnplayer();
}

// Namespace ob_pvpve/namespace_dc38f0ea48cd4743
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x14c0
// Size: 0x86
function private function_7192774bb894cced(itemindex) {
    lootid = function_d870b2c45335bd88(itemindex);
    if (!isdefined(lootid) || lootid <= 0) {
        return 1;
    }
    bundlename = function_fc925a153c7fd55c(lootid);
    if (!isdefined(bundlename)) {
        return 1;
    }
    itembundle = getscriptbundle("itemspawnentry:" + bundlename);
    if (!isdefined(itembundle)) {
        return 1;
    }
    if (level.var_7d6f4cde2f1448f) {
        return (itembundle.subtype == "schematic");
    }
    return 0;
}

// Namespace ob_pvpve/namespace_dc38f0ea48cd4743
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x154e
// Size: 0x70
function respawnplayer() {
    if (istrue(self.liveRagdoll)) {
        self.liveRagdoll = 0;
        self setsolid(1);
        self function_6b4c8718bc36d1ef(0);
        self function_e4ccd01fb7ec7a6f(0);
        self function_d87e1768229d0e3e();
    }
    spawnpoint = setspawnpoint();
    var_7b717b4dbce0b62f = ter_op(isdefined(spawnpoint), spawnpoint, self.origin);
    namespace_b3fcba693d3adc37::function_ef6adc9492d03ef(var_7b717b4dbce0b62f);
}

// Namespace ob_pvpve/namespace_dc38f0ea48cd4743
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15c5
// Size: 0x1cb
function setspawnpoint() {
    var_27a1fdb88047b2d5 = randomintrange(7500, 20000);
    randomangle = randomint(360);
    var_773f52a7d94b7f69 = [];
    for (i = 1; i <= 32; i++) {
        pos = self.origin + anglestoforward((0, randomangle + 11.25 * i, 0)) * var_27a1fdb88047b2d5;
        if (!namespace_d9c77dc2a6fe29c6::ispointinoutofbounds(pos) && function_bdf19384dd9c7829(pos)) {
            var_773f52a7d94b7f69[var_773f52a7d94b7f69.size] = pos;
        }
    }
    /#
        thread function_99cccfd31080bb65(var_773f52a7d94b7f69);
    #/
    if (var_773f52a7d94b7f69.size > 0) {
        return function_7a2aaa4a09a4d250(var_773f52a7d94b7f69);
    }
    var_2e7ac0673f9ee23f = [0:(-31536, 30148, 1500), 1:(30752, 27476, 1515), 2:(-31312, 4964, 1000), 3:(38704, -5896, 2964), 4:(-26336, -25180, 1748), 5:(7492, -32964, 2000), 6:(26040, -28664, 3504)];
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

// Namespace ob_pvpve/namespace_dc38f0ea48cd4743
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1798
// Size: 0xc3
function function_99cccfd31080bb65(var_773f52a7d94b7f69) {
    /#
        level endon(".csv");
        self endon("death_or_disconnect");
        lastdeathpos = self.origin;
        while (1) {
            waitframe();
            sphere(lastdeathpos, 7500, (1, 0, 0));
            sphere(lastdeathpos, 20000, (0, 1, 0));
            foreach (pos in var_773f52a7d94b7f69) {
                sphere(pos, 100, (0, 0, 1));
            }
        }
    #/
}

// Namespace ob_pvpve/namespace_dc38f0ea48cd4743
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1862
// Size: 0xd8
function function_bdf19384dd9c7829(pos) {
    if (level.var_24b61da48c7bdf06.radiation namespace_6d781a0248843409::function_1b4f63fa623de69a(pos)) {
        return 0;
    }
    if (function_6c71c72547bb931(drop_to_ground(pos) + (0, 0, -50))) {
        return 0;
    }
    var_75eb22164feec35d = namespace_4df2ab39b0e96ec7::function_688103a7b4041bf8(pos);
    if (!isdefined(var_75eb22164feec35d)) {
        return 1;
    }
    var_bf528e00efcf9f48 = level.var_f756bf4293f67099[var_75eb22164feec35d];
    if (isdefined(var_bf528e00efcf9f48) && isdefined(self.var_d9020915455a4741)) {
        switch (self.var_d9020915455a4741) {
        case #"hash_5343b465e56ec9a4":
            return 1;
        case #"hash_af83e47edfa8900a":
            return (var_bf528e00efcf9f48 != "difficulty_hard");
        case #"hash_7bb2cd766703d463":
            return (var_bf528e00efcf9f48 == "difficulty_easy");
            break;
        }
    }
    return 1;
}

// Namespace ob_pvpve/namespace_dc38f0ea48cd4743
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1942
// Size: 0x1eb
function private function_50c0ea10b250b9e() {
    loadout_clearweapons();
    function_ffe562ebbdab55fc(0);
    function_ffe562ebbdab55fc(1);
    var_3c8d801d3dead146 = randomint(level.var_15c03fdd665277c0.size);
    primaryweaponname = getdvar(@"hash_e37ee92c81bbd455", level.var_15c03fdd665277c0[var_3c8d801d3dead146]["loadoutPrimary"]);
    primaryweapon = namespace_e0ee43ef2dddadaa::buildweapon(primaryweaponname, [], "none", "none", -1);
    self giveweapon(primaryweapon);
    self.primaryweapon = getcompleteweaponname(primaryweapon);
    function_b5f358d46f69b20e(primaryweapon);
    secondaryweaponname = getdvar(@"hash_e5cc68d2496976d", level.var_15c03fdd665277c0[var_3c8d801d3dead146]["loadoutSecondary"]);
    secondaryweapon = namespace_e0ee43ef2dddadaa::buildweapon(secondaryweaponname, [], "none", "none", -1);
    self giveweapon(secondaryweapon);
    self.secondaryweapon = getcompleteweaponname(secondaryweapon);
    function_b5f358d46f69b20e(secondaryweapon);
    self switchtoweaponimmediate(primaryweapon);
    self setspawnweapon(self.primaryweapon);
    var_145192ceef62d852 = level.var_15c03fdd665277c0[var_3c8d801d3dead146]["loadoutEquipmentPrimary"];
    var_97fbcdea08315d73 = level.var_15c03fdd665277c0[var_3c8d801d3dead146]["loadoutEquipmentSecondary"];
    foreach (equipment in [0:var_145192ceef62d852, 1:var_97fbcdea08315d73]) {
        if (equipment == "") {
            continue;
        }
        slot = namespace_1a507865f681850e::getdefaultslot(equipment);
        namespace_1a507865f681850e::giveequipment(equipment, slot);
    }
    namespace_7dfc6454a70f3f39::function_3036cef61495210f("essence", function_40e3265fda17eee5());
}

// Namespace ob_pvpve/namespace_dc38f0ea48cd4743
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b34
// Size: 0x2f
function function_ee84b0a72897ee98() {
    level endon("game_ended");
    namespace_4b0406965e556711::function_1240434f4201ac9d("prematch_done");
    level.spawnArmorPlates = getdvarint(@"hash_67a1e86099edda21", 1);
}

// Namespace ob_pvpve/namespace_dc38f0ea48cd4743
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b6a
// Size: 0x16e
function function_40e3265fda17eee5() {
    var_f204f93ba8719e05 = getdvarint(@"hash_f14298cc084f115b", -1);
    if (var_f204f93ba8719e05 >= 0) {
        return var_f204f93ba8719e05;
    }
    var_3398791abeb3018f = [0:0, 1:0, 2:0, 3:0, 4:0, 5:200, 6:400, 7:600, 8:800, 9:1000, 10:1400, 11:1800, 12:2200, 13:2600, 14:3000, 15:3400, 16:3800, 17:4200, 18:4600, 19:5000, 20:5500, 21:6000, 22:6500, 23:7000, 24:7500, 25:8000, 26:8500, 27:9000, 28:9500, 29:10000, 30:10500, 31:11000, 32:11500, 33:12000, 34:12500, 35:13000, 36:13500, 37:14000, 38:14500, 39:15000];
    i = int(floor(namespace_cd0b2d039510b38d::getminutespassed()));
    return ter_op(var_3398791abeb3018f.size > i, var_3398791abeb3018f[i], var_3398791abeb3018f[var_3398791abeb3018f.size - 1]);
}

// Namespace ob_pvpve/namespace_dc38f0ea48cd4743
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1ce0
// Size: 0x1cd
function private function_feab0a1523a87a88() {
    var_701a116fe9041dc2 = level.var_126fea15d159e0ca;
    rownum = tablelookupgetnumrows(var_701a116fe9041dc2);
    spawnpointslist = [];
    for (rowindex = 0; rowindex < rownum; rowindex++) {
        originstring = tablelookupbyrow(var_701a116fe9041dc2, rowindex, 0);
        var_bfb25c041446a110 = tablelookupbyrow(var_701a116fe9041dc2, rowindex, 1);
        scriptnoteworthy = tablelookupbyrow(var_701a116fe9041dc2, rowindex, 2);
        index = tablelookupbyrow(var_701a116fe9041dc2, rowindex, 3);
        if (!isdefined(originstring) || originstring == "" || !isdefined(var_bfb25c041446a110) || var_bfb25c041446a110 == "" || !isdefined(scriptnoteworthy) || scriptnoteworthy == "" || !isdefined(index) || index == "") {
            /#
                assertmsg("getSpawnStartPointOverride(): Invalid row" + rowindex + " in file " + var_701a116fe9041dc2);
            #/
        } else {
            var_b4d42a7ce0d49aaa = strtok(originstring, " ");
            var_d22f47766862a420 = strtok(var_bfb25c041446a110, " ");
            spawnpoint = spawnstruct();
            spawnpoint.index = int(index);
            spawnpoint.script_noteworthy = scriptnoteworthy;
            spawnpoint.origin = (float(var_b4d42a7ce0d49aaa[0]), float(var_b4d42a7ce0d49aaa[1]), float(var_b4d42a7ce0d49aaa[2]));
            spawnpoint.angles = (float(var_d22f47766862a420[0]), float(var_d22f47766862a420[1]), float(var_d22f47766862a420[2]));
            spawnpoint.target = "";
            spawnpointslist[spawnpointslist.size] = spawnpoint;
        }
    }
    return spawnpointslist;
}

// Namespace ob_pvpve/namespace_dc38f0ea48cd4743
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1eb5
// Size: 0x33
function function_3b0edbbabf280e78(params) {
    if (!isdefined(level.var_aab4fba7a041b281)) {
        level.var_aab4fba7a041b281 = [];
    }
    namespace_4b05af9596de25bf::function_7582e8d13ed3c196(params);
    namespace_325330503813833a::function_b1568160c3017867(params);
}

// Namespace ob_pvpve/namespace_dc38f0ea48cd4743
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1eef
// Size: 0xd6
function adddeathicon() {
    self endon("disconnect");
    var_7919c8f3a10feb86 = self.origin + (0, 0, 40);
    self notify("addDeathIcon");
    self endon("addDeathIcon");
    if (isdefined(self.lastdeathheadicon)) {
        namespace_7bdde15c3500a23f::setheadicon_deleteicon(self.lastdeathheadicon);
        self.lastdeathheadicon = undefined;
    }
    self notify("removed_death_icon");
    image = "hud_icon_player_dead_" + self.var_3f78c6a0862f9e25 + 1;
    showto = namespace_54d20dd0dd79277f::getteamdata(self.team, "players");
    self.lastdeathheadicon = namespace_7bdde15c3500a23f::setheadicon_singleimage(showto, image, undefined, 1, 0, 200, undefined, undefined, 1, var_7919c8f3a10feb86, 1, "icon_regular");
    thread namespace_b984803e2ef247a2::destroyslowly(20);
}

// Namespace ob_pvpve/namespace_dc38f0ea48cd4743
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1fcc
// Size: 0x72
function private function_5dc7e082b29eb26e() {
    var_f99d56bcb582a8ba = self.victim;
    if (!isdefined(var_f99d56bcb582a8ba)) {
        return;
    }
    level endon("game_end");
    var_f99d56bcb582a8ba endon("disconnect");
    var_f99d56bcb582a8ba endon("spawned");
    var_f99d56bcb582a8ba endon("end_respawn");
    var_f99d56bcb582a8ba endon("started_spawnPlayer");
    var_f99d56bcb582a8ba waittill("ob_pvpve_wait_and_spawn");
    logstring("[recon_points] remove trigger for " + var_f99d56bcb582a8ba.name);
    var_f99d56bcb582a8ba namespace_7db13bdf599e41a6::removetrigger(var_f99d56bcb582a8ba.guid);
}

// Namespace ob_pvpve/namespace_dc38f0ea48cd4743
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2045
// Size: 0xb
function private function_d23f4d7bfe21f9da() {
    thread function_5dc7e082b29eb26e();
}

// Namespace ob_pvpve/namespace_dc38f0ea48cd4743
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2057
// Size: 0x230
function function_8bc4148d7acee203() {
    level endon("game_ended");
    namespace_4b0406965e556711::function_1240434f4201ac9d("prematch_done");
    level.var_32d6d39f3da920ca = [];
    var_b5ab6c23fefc22d4 = getdvarint(@"hash_c5128635aef807e6", 3000);
    var_91a2946f78dd1971 = getdvarint(@"hash_83cf2282d3e494fc", 1600);
    var_c1accbe66e369c59 = getdvarfloat(@"hash_a5cdb74fe4b8ac17", 0.7);
    while (1) {
        foreach (player in level.players) {
            if (!isdefined(player)) {
                continue;
            }
            if (!namespace_7e17181d03156026::isreallyalive(player)) {
                player function_5a6cae9be5731fa6();
            } else {
                var_aee6fa51e4d0386 = player function_eb0aa531d61fa07f(var_b5ab6c23fefc22d4);
                if (var_aee6fa51e4d0386 > 0) {
                    zoneindex = function_b439f805f07ff50(player.origin);
                    var_9dd1fe3f989cb73b = function_2ee25a0fa15c04ce(player.origin);
                    if (isdefined(player.var_82a563006e80a15c) && isdefined(player.var_f5bfeb5a0a08d17e)) {
                        if (isdefined(var_9dd1fe3f989cb73b) && player.var_82a563006e80a15c == zoneindex && player.var_f5bfeb5a0a08d17e == var_9dd1fe3f989cb73b.var_6a8f12dbbc271cb1) {
                            continue;
                        } else {
                            player function_5a6cae9be5731fa6();
                        }
                    }
                    var_b1896ddca0a71358 = function_6aa08c3e29cd1452(player.origin, var_91a2946f78dd1971);
                    var_4b823d93740fc9dd = int(round(var_b1896ddca0a71358.size * (1 - pow(var_c1accbe66e369c59, var_aee6fa51e4d0386))));
                    var_b1896ddca0a71358 = array_randomize(var_b1896ddca0a71358);
                    for (i = 0; i < var_4b823d93740fc9dd; i++) {
                        var_6a8f12dbbc271cb1 = var_b1896ddca0a71358[i].var_6a8f12dbbc271cb1;
                        player function_a8e1fec0a897a1be(zoneindex, var_6a8f12dbbc271cb1);
                    }
                } else {
                    player function_5a6cae9be5731fa6();
                }
            }
        }
        wait(1);
    }
}

// Namespace ob_pvpve/namespace_dc38f0ea48cd4743
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x228e
// Size: 0xc1
function function_eb0aa531d61fa07f(dist) {
    var_e965bce0774276b4 = getplayersinradius(self.origin, dist);
    var_b0c33d224b825287 = [];
    var_aee6fa51e4d0386 = 0;
    foreach (player in var_e965bce0774276b4) {
        if (player.team != self.team) {
            if (!istrue(var_b0c33d224b825287[player.team])) {
                var_b0c33d224b825287[player.team] = 1;
                var_aee6fa51e4d0386++;
            }
        }
    }
    return var_aee6fa51e4d0386;
}

// Namespace ob_pvpve/namespace_dc38f0ea48cd4743
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2357
// Size: 0x2a
function function_38ae0db9542b127c(player, var_f7632b4589b2bed4) {
    player namespace_44abc05161e2e2cb::showsplash("ob_pvpve_warn_enemy_nearby", undefined, undefined, undefined, undefined, "splash_list_jup_ob_pvpve");
}

// Namespace ob_pvpve/namespace_dc38f0ea48cd4743
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2388
// Size: 0xa0
function private function_a8e1fec0a897a1be(zoneindex, var_6a8f12dbbc271cb1) {
    if (!isdefined(level.var_32d6d39f3da920ca[zoneindex])) {
        level.var_32d6d39f3da920ca[zoneindex] = [];
    }
    if (!isdefined(level.var_32d6d39f3da920ca[zoneindex][var_6a8f12dbbc271cb1])) {
        level.var_32d6d39f3da920ca[zoneindex][var_6a8f12dbbc271cb1] = [];
    }
    function_1d5039979534caef(zoneindex, var_6a8f12dbbc271cb1, 0);
    playerid = self getentitynumber();
    level.var_32d6d39f3da920ca[zoneindex][var_6a8f12dbbc271cb1] = function_6d6af8144a5131f1(level.var_32d6d39f3da920ca[zoneindex][var_6a8f12dbbc271cb1], playerid);
    self.var_82a563006e80a15c = zoneindex;
    self.var_f5bfeb5a0a08d17e = var_6a8f12dbbc271cb1;
}

// Namespace ob_pvpve/namespace_dc38f0ea48cd4743
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x242f
// Size: 0x14d
function private function_5a6cae9be5731fa6() {
    if (!isdefined(self.var_82a563006e80a15c) || !isdefined(self.var_f5bfeb5a0a08d17e)) {
        return;
    }
    playerid = self getentitynumber();
    foreach (zoneindex, var_2eff22ac5a0456f0 in level.var_32d6d39f3da920ca) {
        foreach (var_6a8f12dbbc271cb1, var_707742a55c7a4d52 in var_2eff22ac5a0456f0) {
            var_c4a7db4763eb0687 = 0;
            for (i = 0; i < var_707742a55c7a4d52.size; i++) {
                if (isdefined(var_707742a55c7a4d52[i]) && playerid == var_707742a55c7a4d52[i]) {
                    level.var_32d6d39f3da920ca[zoneindex][var_6a8f12dbbc271cb1] = array_remove_index(var_707742a55c7a4d52, i);
                    var_c4a7db4763eb0687 = 1;
                }
            }
            if (level.var_32d6d39f3da920ca[zoneindex][var_6a8f12dbbc271cb1].size == 0 && var_c4a7db4763eb0687) {
                function_1d5039979534caef(zoneindex, var_6a8f12dbbc271cb1, 1);
            }
        }
    }
    self.var_82a563006e80a15c = undefined;
    self.var_f5bfeb5a0a08d17e = undefined;
}

// Namespace ob_pvpve/namespace_dc38f0ea48cd4743
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2583
// Size: 0xd1
function function_6beff7b631ab7e18(kiosk, player) {
    str_difficulty = namespace_f721fc7d0d2d0f47::function_4d8bb2d866771a10(kiosk.origin);
    switch (str_difficulty) {
    case #"hash_7bb2cd766703d463":
        kiosk.var_7940dcde72827af7 = loot::function_54b046aa3ba2678a("jup_ob_pvpve_green");
        break;
    case #"hash_af83e47edfa8900a":
        kiosk.var_7940dcde72827af7 = loot::function_54b046aa3ba2678a("jup_ob_pvpve_yellow");
        break;
    case #"hash_5343b465e56ec9a4":
        kiosk.var_7940dcde72827af7 = loot::function_54b046aa3ba2678a("jup_ob_pvpve_orange");
        break;
    case #"hash_651f76c0ad6741ec":
        kiosk.var_7940dcde72827af7 = loot::function_54b046aa3ba2678a("jup_ob_pvpve_red");
        break;
    }
}

