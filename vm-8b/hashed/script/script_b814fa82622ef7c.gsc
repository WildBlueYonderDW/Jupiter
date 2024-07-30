#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_247745a526421ba7;
#using scripts\mp\weapons.gsc;
#using script_5762ac2f22202ba2;
#using scripts\common\values.gsc;
#using scripts\mp\equipment.gsc;
#using scripts\mp\equipment\support_box.gsc;

#namespace armor_box_mp;

// Namespace armor_box_mp / namespace_6513e350e0a28a8
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0x108
// Size: 0x18
function autoexec main() {
    registersharedfunc("armor_drop", "init", &init);
}

// Namespace armor_box_mp / namespace_6513e350e0a28a8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x128
// Size: 0x10
function init() {
    level.onarmorboxusedbyplayer = &onarmorboxusedbyplayer;
}

// Namespace armor_box_mp / namespace_6513e350e0a28a8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x140
// Size: 0x90
function onarmorboxusedbyplayer(player) {
    armoramount = getdvarint(@"hash_796878180a8e250", 4);
    if (isdefined(player.equipment) && !isdefined(player.equipment["health"])) {
        player.equipment["health"] = "equip_armorplate";
    }
    player scripts\mp\equipment::incrementequipmentslotammo("health", armoramount);
    player hudicontype("br_armor");
    scripts\mp\equipment\support_box::supportbox_playusesound(player);
    thread scripts\mp\equipment\support_box::supportbox_onplayeruseanim();
    return true;
}

